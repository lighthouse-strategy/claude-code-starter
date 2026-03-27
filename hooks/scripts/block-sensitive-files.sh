#!/bin/bash
# 拦截对敏感文件的写入操作
# 用法: echo "$TOOL_INPUT" | block-sensitive-files.sh

input=$(cat)

# 提取文件路径
filepath=$(echo "$input" | grep -oP '"file_path"\s*:\s*"[^"]*"' | head -1 | sed 's/"file_path"\s*:\s*"//;s/"$//')

if [ -z "$filepath" ]; then
    exit 0
fi

# 获取文件名
filename=$(basename "$filepath")

# 检查敏感文件名
sensitive_patterns=(
    '^\.env$'
    '^\.env\.local$'
    '^\.env\.production$'
    '^credentials'
    '^secrets?\.'
    '\.pem$'
    '\.key$'
    '^id_rsa'
    '^id_ed25519'
)

for pattern in "${sensitive_patterns[@]}"; do
    if echo "$filename" | grep -qiE "$pattern"; then
        echo "BLOCKED: Writing to sensitive file: $filename"
        exit 2
    fi
done

exit 0
