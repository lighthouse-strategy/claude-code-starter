---
name: env
description: 配置环境变量 — 创建 .env 文件模板，配置 .gitignore，生成环境变量文档
---

# 配置环境变量

帮用户规范地管理项目的环境变量，防止密钥泄露。

## 步骤

### 1. 扫描项目

自动扫描项目中所有代码文件，找出使用的环境变量：
- Python: `os.environ`、`os.getenv`
- Node.js: `process.env`
- 其他: `.env` 文件引用

列出所有发现的环境变量。

### 2. 生成 .env.example

创建 `.env.example` 文件，包含所有环境变量的模板：

```
# 数据库
DATABASE_URL=postgresql://user:password@localhost:5432/mydb

# API 密钥
STRIPE_SECRET_KEY=sk_test_xxx
STRIPE_PUBLISHABLE_KEY=pk_test_xxx

# 邮件
RESEND_API_KEY=re_xxx
```

每个变量都有注释说明用途，值使用示例格式（不是真实密钥）。

### 3. 检查 .gitignore

确保 `.gitignore` 包含：
- `.env`
- `.env.local`
- `.env.production`

如果不包含，自动添加。

### 4. 生成说明

在终端输出环境变量列表和获取方式：
> 项目需要以下环境变量：
> （列出每个变量、用途、在哪里获取）
>
> 已生成 .env.example 模板。复制为 .env 并填入你的值：
> `cp .env.example .env`
