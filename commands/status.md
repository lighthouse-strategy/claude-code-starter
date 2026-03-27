---
description: "查看项目当前状态：git 状态、未完成的 TODO、最近改动"
---

检查项目当前状态，汇总以下信息并用中文输出：

1. **Git 状态** — 运行 `git status`，报告：当前分支、未提交的改动数量、是否有未推送的 commit
2. **最近改动** — 运行 `git log --oneline -5`，列出最近 5 次提交
3. **TODO 项** — 在项目代码中搜索 TODO、FIXME、HACK 注释，列出找到的条目（文件:行号 + 内容）
4. **依赖状态** — 检查是否有 lockfile（package-lock.json / uv.lock / pnpm-lock.yaml），确认依赖是否已安装

用简洁的格式输出，不要啰嗦。如果某项没有内容（比如没有 TODO），跳过不提。
