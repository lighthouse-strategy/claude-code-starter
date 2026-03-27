# Claude Code Starter Kit

让 Claude Code 更懂你的项目。开箱即用的 CLAUDE.md 模板、36 个 Skills、4 个 Agents、安全 Hooks。

## 安装

### 方式一：插件安装（推荐）

```bash
claude plugin add lighthouse-strategy/claude-code-starter
```

安装后 Skills、Agents、Hooks 自动生效。然后运行 `/setup` 配置项目信息。

### 方式二：一键脚本

```bash
curl -fsSL https://raw.githubusercontent.com/lighthouse-strategy/claude-code-starter/main/install.sh | bash
```

适合只想复制模板和 Skills 到项目目录的用户。

### 方式三：手动安装

在 Claude Code 中输入：

```
帮我从 https://github.com/lighthouse-strategy/claude-code-starter 下载 CLAUDE.md 到项目根目录，skills 文件夹下载到 .claude/skills/
```

## 包含什么

### CLAUDE.md -- 项目规则模板

| 区块 | 作用 |
|------|------|
| 回复语言与风格 | 让 Claude 用中文回复，保持简洁 |
| 项目基本信息 | 名称、技术栈、目录、命令、运行环境 |
| 术语表 | 防止 Claude 混淆项目中的专有名词 |
| 思维方式 | 第一性原理、KISS、80/20、费曼学习法 |
| 代码规范 | 统一命名、commit 格式、分支策略 |
| 铁律 | 不可违反：敏感信息、破坏性操作、测试安全 |
| 依赖管理 | 防止装错包、删错包 |
| 工作流程 | 先读代码再改、改完先测试再提交 |
| 不要做什么 | 明确禁止 Claude 的行为 |
| 决策日志 | 记录技术决策，避免反复讨论 |
| 已知陷阱 | 记录踩过的坑 |

### Skills -- 36 个实用技能

#### 从想法到上线

| 命令 | 作用 |
|------|------|
| `/starter` | 项目脚手架：从想法到能跑的代码 |
| `/blog` | 搭建博客：支持 Markdown、Hugo、Astro、GitHub Pages |
| `/dashboard` | 搭建管理后台：表格 + 图表 + 侧边栏 |
| `/landing` | 生成落地页：响应式，单文件 HTML |
| `/component` | 生成组件：导航栏、表单、卡片等 12 种 |
| `/form` | 生成表单：验证 + 多步骤向导 + 无障碍 |
| `/deploy` | 部署上线：Vercel / Netlify / Cloudflare Pages |

#### 添加功能

| 命令 | 作用 |
|------|------|
| `/api` | 写 API：RESTful 接口 + 验证 + 错误处理 |
| `/auth` | 登录功能：注册、JWT、OAuth |
| `/database` | 连数据库：配置 + 数据模型 + CRUD |
| `/payment` | 支付功能：Stripe / LemonSqueezy / Paddle |
| `/email` | 邮件功能：SPF/DKIM 配置 + 模板 + 防垃圾箱 |
| `/storage` | 文件上传：图片、文档的上传和存储 |

#### 日常开发

| 命令 | 作用 |
|------|------|
| `/explain` | 代码解释：用大白话解释代码逻辑 |
| `/test` | 生成测试：覆盖正常路径和边界情况 |
| `/refactor` | 代码重构：不改变功能，提升可维护性 |
| `/fix` | 快速修复：贴报错信息，自动定位修复 |
| `/debug` | 系统调试：科学方法排查，禁止猜测 |
| `/doc` | 生成文档：自动添加注释，风格一致 |
| `/code-review` | 代码审查：安全 + 正确性 + 可维护性 |
| `/commit` | 安全提交：lint + 敏感信息扫描 + 规范 message |

#### 优化完善

| 命令 | 作用 |
|------|------|
| `/seo` | SEO 优化：meta + sitemap + 结构化数据 |
| `/perf` | 性能优化：先测量基线，再优化，后验证 |
| `/responsive` | 移动适配：确保各尺寸正常 |
| `/a11y` | 无障碍：ARIA + 键盘导航 + 对比度 |

#### 内容生成

| 命令 | 作用 |
|------|------|
| `/copy` | 写文案：网站和产品的中英文文案 |
| `/readme-gen` | 生成 README：从代码中提取，不编造功能 |
| `/changelog` | 更新日志：从 Git 历史自动生成 |

#### 工具脚本

| 命令 | 作用 |
|------|------|
| `/script` | 写脚本：批处理、数据转换、自动化 |
| `/migrate` | 数据迁移：文件格式 / 数据库 / API 导入 |
| `/env` | 环境变量：扫描项目，生成 .env 模板 |
| `/gitsetup` | Git 配置：初始化 + .gitignore + GitHub |

#### 学习理解

| 命令 | 作用 |
|------|------|
| `/concept` | 概念解释：按你的水平用大白话讲 |
| `/compare` | 技术选型：对比优劣 + 迁移成本 + 决策记录 |

#### 环境配置

| 命令 | 作用 |
|------|------|
| `/setup` | 配置 CLAUDE.md：交互式填写项目信息 |
| `/install-plugins` | 安装推荐的社区插件 |

### Agents -- 4 个智能代理

| Agent | 作用 |
|-------|------|
| planner | 只读规划：分析需求、设计方案、拆解任务，绝不写代码 |
| reviewer | 代码审查：安全性 + 正确性 + 可维护性三维度检查 |
| test-writer | 测试生成：分析代码结构，生成覆盖全面的测试用例 |
| explainer | 代码分析：深入分析项目架构和代码逻辑，通俗解释 |

### Hooks -- 安全防护

| Hook | 触发时机 | 作用 |
|------|---------|------|
| 危险命令拦截 | 执行 Bash 前 | 拦截 rm -rf /、force push main 等危险操作 |
| 敏感信息检测 | 写入/编辑文件前 | 检测硬编码的 API Key、密码、token |
| Commit 格式检查 | Git commit 后 | 验证 commit message 是否符合 type: description 格式 |
| 会话结束提醒 | 对话结束时 | 提醒未提交的更改和未完成的 TODO |

## 全局规则

创建跨项目通用的规则（比如「始终用中文回复」）：

```bash
# 插件安装方式：全局规则自动包含在插件中

# 手动方式：复制 global-CLAUDE.md 到全局配置
cp global-CLAUDE.md ~/.claude/CLAUDE.md
```

## 推荐搭配插件

通过 `/install-plugins` 一键安装，或手动：

| 插件 | 安装命令 | 作用 |
|------|---------|------|
| superpowers | `claude plugin add @anthropic/superpowers` | TDD、调试、代码审查等高级工作流 |
| modern-python | `claude plugin add @trailofbits/modern-python` | 现代 Python 配置（uv + ruff） |
| static-analysis | `claude plugin add @trailofbits/static-analysis` | Semgrep + CodeQL 漏洞扫描 |
| tab-tracking | `claude plugin add lighthouse-strategy/claude-tab-tracking` | 对话记忆：自动记录决策和进度 |

## License

MIT
