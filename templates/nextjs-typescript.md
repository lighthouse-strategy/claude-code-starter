# 项目规则

## 回复语言与风格

- 始终用中文回复
- 回答要简洁直接，不要废话
- 不要在回复中使用 emoji
- 先做事，再解释（如果需要的话）

## 项目基本信息

- 项目名称：{{project_name}}
- 技术栈：Next.js + TypeScript + Tailwind CSS
- 项目描述：{{project_description}}
- 源代码目录：src/ 或 app/
- 测试目录：__tests__/ 或与源码同目录的 .test.ts 文件
- 包管理器：pnpm
- Lint 命令：pnpm lint
- 测试命令：pnpm test
- 运行环境：{{environment}}

## 术语表

- （在这里添加你项目中容易混淆的术语）

## 思维方式

### 第一性原理
- 遇到问题时，从最根本的事实出发思考，不要照搬"别人都是这么做的"
- 每个技术决策都要问：为什么要这样做？有没有更简单的方式？

### KISS 原则
- 能用 10 行代码解决的，不要写 50 行
- 能用一个函数解决的，不要拆成三个类

## 代码规范

### TypeScript 风格
- 使用 camelCase 命名变量和函数
- 组件名用 PascalCase
- 常量用 UPPER_SNAKE_CASE
- 必须使用 TypeScript，不要写 .js 文件
- 优先用 interface 定义类型，type 用于联合类型和工具类型
- 避免 any — 用 unknown 或具体类型

### Next.js 规范
- App Router 优先（app/ 目录），不要用 Pages Router 除非项目已有
- Server Component 是默认，只在需要交互时加 'use client'
- 数据获取用 Server Component + fetch，不要客户端 useEffect 拉数据
- API 路由放在 app/api/ 下，用 Route Handlers
- 图片用 next/image，链接用 next/link
- 环境变量：服务端用 process.env，客户端用 NEXT_PUBLIC_ 前缀

### Tailwind CSS 规范
- 样式全部用 Tailwind class，不要写自定义 CSS（除非确实需要）
- 响应式：mobile-first（sm: md: lg:）
- 颜色用 Tailwind 调色板，不要硬编码 hex 值

### Commit Message 格式
- 格式：`type: 简短描述`
- type：feat / fix / docs / refactor / test / chore

### 分支策略
- 主分支：main
- 新功能：feature/xxx，修复：fix/xxx

## 铁律

### 铁律：不要提交敏感文件
- 绝对不要把 .env.local、API Key、密码提交到 git
- 确保 .gitignore 包含：.env*.local, node_modules/, .next/, out/

### 铁律：Push 前安全检查
- 扫描硬编码密钥，检查 NEXT_PUBLIC_ 变量没有泄露服务端密钥

### 铁律：禁止未经确认的破坏性操作
- 未经确认不要：rm -rf、force push、reset --hard

### 铁律：测试安全
- 不要在测试中调用生产 API
- 不要在后台静默运行完整测试套件

## 依赖管理

- 包管理器：pnpm（不用 npm 或 yarn）
- 添加依赖前先问我
- 安装后检查 pnpm-lock.yaml 变更是否合理
- 优先用 Next.js 内置功能，不要为小需求加大依赖

## 工作流程

### 改代码前先读代码
- 修改前先理解现有代码

### 编辑后先检查再提交
- `pnpm lint` 通过
- `pnpm build` 无错误（检查 TypeScript 类型）
- `pnpm test` 通过

### 日期和时间
- 提到日期前先运行 `date` 确认

## 不要做什么

- 不要在没读过代码的情况下建议修改
- 不要自作主张添加新依赖
- 不要写 .js 文件 — 统一用 .ts / .tsx
- 不要用 Pages Router — 用 App Router
- 不要在 Server Component 中加 'use client'（除非需要交互）
- 不要重复解释你做了什么

## 决策日志

- （在这里记录你的技术决策）

## 已知陷阱

- 'use client' 组件不能是 async — 数据获取移到 Server Component 或用 useSWR
- next/image 需要配置 remotePatterns 才能加载外部图片 — 在 next.config.ts 中设置
- Tailwind 动态类名（如 `bg-${color}-500`）不会被检测到 — 用完整类名或 safelist
- Server Actions 的参数会暴露在客户端 — 不要传敏感数据
- `pnpm install` 和 `npm install` 的 lockfile 不兼容 — 统一用 pnpm
