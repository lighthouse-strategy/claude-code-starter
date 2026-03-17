---
name: gitsetup
description: 配置 Git 仓库 — 初始化 Git、配置 .gitignore、创建 GitHub 仓库并推送
---

# 配置 Git 仓库

帮用户从零配置 Git，一直到推送到 GitHub。

## 步骤

### 1. 检查当前状态

检查项目是否已经初始化 Git：
- 已初始化 → 跳到第 3 步
- 未初始化 → 从第 2 步开始

### 2. 初始化 Git

- 运行 `git init`
- 创建初始分支 `main`

### 3. 生成 .gitignore

根据检测到的技术栈生成 .gitignore：

- **通用** — .DS_Store、.env、node_modules、__pycache__、*.log
- **前端** — dist、build、.next、.nuxt
- **Python** — venv、.venv、*.pyc、.pytest_cache
- **IDE** — .vscode、.idea

如果已有 .gitignore，检查是否有遗漏并补充。

### 4. 创建 GitHub 仓库（可选）

> 要创建 GitHub 仓库并推送吗？

如果用户同意：
- 用 `gh repo create` 创建私有仓库
- 设置 remote
- 初始提交并推送

注意：默认创建**私有**仓库。如果用户想要公开，需要明确确认。

### 5. 完成

> Git 配置完成。
> （展示仓库地址，如果创建了 GitHub 仓库）
> 用 /commit 提交代码，用 /deploy 部署上线。
