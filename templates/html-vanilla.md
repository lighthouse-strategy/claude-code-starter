# 项目规则

## 回复语言与风格

- 始终用中文回复
- 回答要简洁直接，不要废话
- 不要在回复中使用 emoji
- 先做事，再解释（如果需要的话）

## 项目基本信息

- 项目名称：{{project_name}}
- 技术栈：HTML + CSS + JavaScript（原生，无框架）
- 项目描述：{{project_description}}
- 源代码目录：./（根目录）
- 测试目录：暂无
- 包管理器：暂无
- Lint 命令：暂无
- 测试命令：暂无
- 运行环境：浏览器直接打开 / Live Server

## 术语表

- （在这里添加你项目中容易混淆的术语）

## 思维方式

### 第一性原理
- 遇到问题时，从最根本的事实出发思考
- 能用原生实现的，不要引入框架

### KISS 原则
- 保持简单，一个 HTML 文件能解决就不要拆成多个
- 不需要构建工具、不需要 node_modules

### 80/20 法则
- 先让页面能看、能用，再优化细节

## 代码规范

### HTML
- 语义化标签：用 header/nav/main/section/footer，不要全是 div
- 所有页面必须有 lang="zh-CN"、charset="UTF-8"、viewport meta
- 图片必须有 alt 属性

### CSS
- 优先写在 `<style>` 标签中（单页面项目）
- 多页面项目用独立 .css 文件
- 使用 CSS 变量管理颜色和间距：`:root { --primary: #xxx; }`
- Mobile-first：默认样式为移动端，用 @media (min-width:) 适配桌面
- 类名用 kebab-case（如 .nav-link, .card-title）

### JavaScript
- 优先写在 `<script>` 标签中（单页面项目）
- 不要用 var — 用 const 和 let
- DOM 操作用 querySelector / addEventListener
- 不要引入 jQuery — 原生 API 已经够用
- 异步操作用 fetch + async/await

### Commit Message 格式
- 格式：`type: 简短描述`
- type：feat / fix / docs / refactor / chore

## 铁律

### 铁律：不要提交敏感文件
- 不要把 API Key 硬编码在 HTML/JS 中
- 如果需要 API Key，用注释标注让用户自己填

### 铁律：禁止未经确认的破坏性操作
- 未经确认不要：rm -rf、force push、删除用户的 HTML 文件

## 工作流程

### 改代码前先读代码
- 修改前先理解现有页面结构

### 编辑后用浏览器验证
- 改完后提醒用户用浏览器打开检查
- 检查移动端效果（Chrome DevTools 模拟）

### 保持简单
- 不要引入构建工具（Webpack、Vite 等）
- 不要引入 CSS 框架（除非用户要求）
- 不要引入 JavaScript 框架
- CDN 引入第三方库可以接受（如 Chart.js、marked.js）

## 不要做什么

- 不要创建 package.json — 这是无框架项目
- 不要引入 npm 依赖
- 不要把简单页面拆成 React 组件
- 不要用 TypeScript — 原生 JS 即可
- 不要重复解释你做了什么

## 决策日志

- （在这里记录你的技术决策）

## 已知陷阱

- 本地打开 HTML 文件时 fetch 会报 CORS 错误 — 用 Live Server 或 `python -m http.server`
- CSS 动画在移动端可能卡顿 — 只用 transform 和 opacity，避免改 width/height
- 外部字体加载慢会导致文字闪烁 — 加 font-display: swap
- 图片过大会拖慢页面 — 压缩到 200KB 以下，大图用 loading="lazy"
