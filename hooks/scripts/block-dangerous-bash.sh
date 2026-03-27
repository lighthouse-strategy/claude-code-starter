#!/bin/bash
# 拦截危险的 Bash 命令
# 用法: echo "$TOOL_INPUT" | block-dangerous-bash.sh

input=$(cat)

# 提取命令内容（兼容 macOS/Linux，不依赖 grep -P）
cmd=$(echo "$input" | sed -n 's/.*"command"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' | head -1)

# 如果提取不到，尝试直接用全文
if [ -z "$cmd" ]; then
    cmd="$input"
fi

# 检查危险模式
dangerous_patterns=(
    'rm -rf /'
    'rm -rf ~'
    'rm -rf \.'
    '> /dev/sda'
    'mkfs\.'
    'dd if='
    ':(){ :|:&};:'
)

for pattern in "${dangerous_patterns[@]}"; do
    if echo "$cmd" | grep -qiE "$pattern"; then
        echo "BLOCKED: Dangerous command detected: $pattern"
        exit 2
    fi
done

# 检查 force push 到 main/master（排除安全的 --force-with-lease）
if echo "$cmd" | grep -qE 'git push' && \
   echo "$cmd" | grep -qE '(--force|-f\b)' && \
   ! echo "$cmd" | grep -qE '\-\-force-with-lease' && \
   echo "$cmd" | grep -qE '(main|master)'; then
    echo "BLOCKED: Force push to main/master is not allowed (use --force-with-lease instead)"
    exit 2
fi

exit 0
