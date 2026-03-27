---
name: install-plugins
description: 当用户想安装插件、增强 Claude Code 功能、配置开发环境时使用 -- 按需安装社区插件
---

# 安装 Claude Code 插件

帮用户发现并安装适合自己的 Claude Code 社区插件。

## 步骤

### 1. 查看可用插件

先搜索当前可用的插件列表：

```bash
claude plugins list
```

如果命令不可用，用 `claude plugin search <关键词>` 按需搜索。

### 2. 按类别推荐

根据用户的技术栈和需求，从以下类别中推荐：

**通用推荐（适合所有用户）**
- context7 -- 自动获取最新库文档，避免使用过时 API
  安装：`claude plugin add context7/context7`

**效率工具**
- claude-tab-tracking -- 对话记忆：自动记录每次对话的决策和进度，新窗口 /recall 恢复上下文
  安装：`claude plugin add lighthouse-strategy/claude-tab-tracking`

**Python 开发**
- modern-python -- 现代 Python 项目配置（uv + ruff + ty）
  安装：`claude plugin add trailofbits/modern-python`

**安全相关**
- static-analysis -- 静态分析工具（Semgrep + CodeQL）
  安装：`claude plugin add trailofbits/static-analysis`
- differential-review -- 安全导向的代码差异审查
  安装：`claude plugin add trailofbits/differential-review`

**前端开发**
- 搜索适合用户框架的插件：`claude plugin search <框架名>`

> 你的技术栈是什么？我帮你推荐最相关的插件。
> 也可以说"全部安装"或选择具体类别。

### 3. 安装 + 验证

每安装一个插件后，立即验证：

```bash
claude plugin add <plugin-name>
claude plugins list  # 确认出现在已安装列表中
```

安装成功后告知用户。如果某个安装失败，记录错误，继续安装其他的，最后汇总。

### 4. 安装完成

> 安装完成。已成功安装：xxx。
> 部分插件需要重启 Claude Code 后生效。
> 运行 `claude plugins list` 可随时查看已安装的插件。

## 遇到问题

- **安装失败（网络错误）？** 检查网络连接，重试一次。如果是 GitHub 仓库不存在，用 `claude plugin search` 确认插件名是否正确。
- **插件之间冲突？** 如果安装后某个功能异常，用 `claude plugin remove <name>` 卸载最近安装的插件，逐个排查。
- **想卸载插件？** 运行 `claude plugin remove <plugin-name>`，然后重启 Claude Code。
- **插件列表过时？** 插件生态在快速发展，定期运行 `claude plugin search` 搜索新插件。本技能的推荐列表仅供参考，以实际搜索结果为准。
