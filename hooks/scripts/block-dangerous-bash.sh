#!/bin/bash
# 拦截危险的 Bash 命令
# 用法: echo "$TOOL_INPUT" | block-dangerous-bash.sh

input=$(cat)

# 提取命令内容
cmd=$(echo "$input" | grep -oP '"command"\s*:\s*"[^"]*"' | head -1 | sed 's/"command"\s*:\s*"//;s/"$//')

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

# 检查 force push 到 main/master
if echo "$cmd" | grep -qE 'git push.*(--force|-f).*(main|master)'; then
    echo "BLOCKED: Force push to main/master is not allowed"
    exit 2
fi

exit 0
