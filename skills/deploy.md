---
name: deploy
description: 部署引导 — 根据项目类型引导用户完成网站部署上线的全过程
---

# 部署引导

帮用户把网站或应用部署上线，全程引导，不需要用户有运维经验。

## 步骤

### 1. 分析项目类型

查看项目结构，判断项目类型：
- 纯静态页面（HTML/CSS/JS）
- React / Vue / Next.js / Nuxt 等前端框架
- Python（Flask / FastAPI / Django）后端
- Node.js（Express / Nest）后端
- 全栈应用

### 2. 推荐部署方案

根据项目类型，推荐最简单的部署方式：

**纯静态 / 前端框架：**
> 推荐用 Vercel、Netlify 或 Cloudflare Pages，都免费：
> - Vercel — 对 Next.js 最友好
> - Netlify — 操作最简单
> - Cloudflare Pages — 速度最快，全球 CDN
>
> 步骤：把代码推到 GitHub → 用 GitHub 账号登录平台 → 导入仓库 → 点击部署
> 需要我帮你准备好代码吗？

**Python 后端：**
> 推荐用 Railway 或 Render：
> 1. 确保项目有 requirements.txt 或 pyproject.toml
> 2. 添加启动配置
> 3. 推到 GitHub 后连接部署平台

**Node.js 后端：**
> 推荐用 Vercel（如果是 Next.js）或 Railway：
> 1. 确保 package.json 有正确的 start 脚本
> 2. 推到 GitHub 后连接部署平台

**全栈应用：**
> 前后端分开部署通常更简单。前端用 Vercel，后端用 Railway。

### 3. 准备部署文件

根据选定的方案，帮用户准备必要的文件：

- **构建配置** — 确保 build 命令和输出目录正确
- **环境变量** — 扫描项目中所有 .env 变量，列出需要在部署平台配置的环境变量，提醒不要硬编码。用 /env 可以生成完整的环境变量文档
- **启动命令** — 确保部署平台知道怎么启动应用
- **.gitignore** — 确保敏感文件不会被推上去

### 4. 引导部署

一步一步引导用户完成部署，每一步等用户确认完成后再进入下一步。

遇到问题时帮用户排查，而不是直接跳过。

### 5. 验证上线

部署完成后：
> 部署成功！你的网站地址是 xxx。
> 建议检查一下：打开链接确认页面正常显示。
