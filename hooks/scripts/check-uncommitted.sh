#!/bin/bash
# 会话结束时检查未提交的改动
# 用于 Stop hook

if ! command -v git &>/dev/null; then
    exit 0
fi

if ! git rev-parse --is-inside-work-tree &>/dev/null 2>&1; then
    exit 0
fi

# 检查未提交的改动
changes=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')

if [ "$changes" -gt 0 ]; then
    echo "Reminder: $changes uncommitted change(s). Consider running /checkpoint."
fi

exit 0
