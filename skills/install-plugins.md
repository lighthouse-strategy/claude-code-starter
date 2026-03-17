---
name: install-plugins
description: 安装推荐插件 — 一键安装精选的 Claude Code 社区插件，增强开发体验
---

# 安装推荐插件

帮用户快速安装经过筛选的高质量 Claude Code 插件。

## 步骤

### 1. 展示推荐插件列表

向用户展示以下插件列表，让他们选择要安装哪些：

```
以下是推荐安装的 Claude Code 插件：

== 开发增强 ==
1. superpowers — 系统化调试、TDD、代码审查、计划制定等高级工作流
   安装命令：claude plugin add @anthropic/superpowers

2. modern-python — 现代 Python 项目配置（uv + ruff + ty）
   安装命令：claude plugin add @trailofbits/modern-python

== 安全相关 ==
3. static-analysis — 静态分析工具（Semgrep + CodeQL）
   安装命令：claude plugin add @trailofbits/static-analysis

4. differential-review — 安全导向的代码差异审查
   安装命令：claude plugin add @trailofbits/differential-review

你想安装哪些？可以说"全部"或选择编号（比如"1和2"）。
```

### 2. 执行安装

根据用户选择，依次运行安装命令。

每安装完一个，确认安装成功后再安装下一个。

如果某个安装失败，记录错误信息，继续安装其他的，最后汇总报告。

### 3. 安装完成

展示安装结果：
> 安装完成。已成功安装：xxx。
> 重启 Claude Code 后生效。
