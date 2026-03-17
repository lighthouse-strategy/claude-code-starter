# Claude Code 新手模板

让 Claude Code 更懂你的项目。一套开箱即用的 CLAUDE.md 模板和 36 个实用 Skills。

## 使用方法

### 第一步：下载模板

在你的项目中打开 Claude Code，输入：

```
帮我从 https://github.com/lighthouse-strategy/claude-code-starter 下载 CLAUDE.md 到项目根目录，skills 文件夹下载到 .claude/skills/
```

### 第二步：配置项目信息

```
/setup
```

Claude 会逐步问你项目的基本信息，自动填写模板中的占位符。

### 第三步：安装推荐插件（可选）

```
/install-plugins
```

一键安装精选的社区插件，进一步增强 Claude Code 的能力。

## 模板包含什么

### CLAUDE.md -- 项目规则文件

| 区块 | 作用 |
|------|------|
| 回复语言与风格 | 让 Claude 用中文回复，保持简洁 |
| 项目基本信息 | 告诉 Claude 你的项目是什么 |
| 思维方式 | 第一性原理、KISS、80/20、费曼学习法 |
| 代码规范 | 统一命名、commit 格式、分支策略 |
| 安全铁律 | 防止泄露密钥、误删文件等危险操作 |
| 工作流程 | 确保先读代码再改、改完先测试再提交 |
| 不要做什么 | 明确禁止 Claude 的行为，避免帮倒忙 |
| 已知陷阱 | 记录项目的坑，Claude 不会再踩 |

### Skills -- 36 个实用技能

#### 从想法到上线

| 命令 | 作用 |
|------|------|
| `/starter` | 项目脚手架：从想法到能跑的代码，自动搭建项目 |
| `/blog` | 搭建博客：生成完整的个人博客网站，支持 Markdown |
| `/dashboard` | 搭建管理后台：数据表格 + 图表 + 侧边栏 |
| `/landing` | 生成落地页：输入产品信息，生成完整的响应式落地页 |
| `/component` | 生成组件：导航栏、表单、卡片、评论区等 12 种组件 |
| `/form` | 生成表单：带验证的联系表单、问卷、报名表 |
| `/deploy` | 部署上线：Vercel / Netlify / Cloudflare Pages，全程引导 |

#### 添加功能

| 命令 | 作用 |
|------|------|
| `/api` | 写 API：生成 RESTful 接口 + 验证 + 错误处理 |
| `/auth` | 登录功能：注册、登录、JWT、OAuth |
| `/database` | 连数据库：配置连接 + 数据模型 + 增删改查 |
| `/payment` | 支付功能：集成 Stripe 一次性付款和订阅 |
| `/email` | 邮件功能：注册验证、通知、营销邮件 |
| `/storage` | 文件上传：图片、文档的上传和存储 |

#### 日常开发

| 命令 | 作用 |
|------|------|
| `/explain` | 代码解释：用大白话解释任意代码的逻辑 |
| `/test` | 生成测试：自动生成测试用例，覆盖正常路径和边界情况 |
| `/refactor` | 代码重构：提升可读性和可维护性，不改变功能 |
| `/fix` | 快速修复：贴个报错信息，自动定位并修复 |
| `/debug` | 系统调试：科学方法排查复杂 bug，禁止猜测 |
| `/doc` | 生成文档：自动添加文档注释，风格与项目一致 |
| `/review` | 代码审查：安全性、可读性、潜在 bug 三维度检查 |
| `/commit` | 安全提交：lint 检查 + 敏感信息扫描 + 规范 commit message |

#### 优化完善

| 命令 | 作用 |
|------|------|
| `/seo` | SEO 优化：meta 标签 + sitemap + 结构化数据 |
| `/perf` | 性能优化：分析瓶颈，给出具体改进方案 |
| `/responsive` | 移动适配：修复手机显示问题，确保各尺寸正常 |
| `/a11y` | 无障碍：ARIA + 键盘导航 + 对比度修复 |

#### 内容生成

| 命令 | 作用 |
|------|------|
| `/copy` | 写文案：网站和产品的中英文文案 |
| `/readme` | 生成 README：专业的项目说明文档 |
| `/changelog` | 更新日志：从 Git 历史自动生成 CHANGELOG |

#### 工具脚本

| 命令 | 作用 |
|------|------|
| `/script` | 写脚本：文件批处理、数据转换、自动化任务 |
| `/migrate` | 数据迁移：格式转换、数据库迁移、API 数据导入 |
| `/env` | 环境变量：扫描项目，生成 .env 模板 + .gitignore + 文档 |
| `/gitsetup` | Git 配置：初始化 + .gitignore + GitHub 仓库 + 推送 |

#### 学习理解

| 命令 | 作用 |
|------|------|
| `/concept` | 概念解释：用大白话解释编程术语 |
| `/compare` | 技术选型：对比方案优劣，帮你做出选择 |

#### 环境配置

| 命令 | 作用 |
|------|------|
| `/setup` | 配置 CLAUDE.md：交互式填写项目信息 |
| `/install-plugins` | 一键安装推荐的社区插件 |

## 推荐插件

以下插件经过筛选，适合大部分开发者。通过 `/install-plugins` 一键安装，或手动安装：

### 开发增强

- **superpowers** -- 系统化调试、TDD、代码审查、计划制定等高级工作流
  ```
  claude plugin add @anthropic/superpowers
  ```

- **modern-python** -- 现代 Python 项目配置（uv + ruff + ty）
  ```
  claude plugin add @trailofbits/modern-python
  ```

### 安全相关

- **static-analysis** -- 静态分析工具（Semgrep + CodeQL 漏洞扫描）
  ```
  claude plugin add @trailofbits/static-analysis
  ```

- **differential-review** -- 安全导向的代码差异审查
  ```
  claude plugin add @trailofbits/differential-review
  ```

## 进阶用法

### 全局 CLAUDE.md

除了项目级的 CLAUDE.md，你还可以创建一个全局配置，让所有项目共享通用规则（比如「用中文回复」）：

```
帮我把这个 repo 的 global-CLAUDE.md 的内容保存到 ~/.claude/CLAUDE.md
```

### 已经有项目了？

如果你的项目已经有代码，也可以先让 Claude 自动生成一个基础版：

```
/init
```

然后再参考本模板补充你需要的规则。
