---
name: payment
description: 当用户想加支付、收款、集成 Stripe、做订阅付费时使用 — 集成 Stripe 支付，支持一次性和订阅
---

# 添加支付功能

帮用户集成 Stripe 支付，实现在线收款。

## 步骤

### 1. 了解需求

**问题 1：支付类型**
> 你需要什么类型的支付？
> - 一次性付款（买商品、买服务）
> - 订阅/会员（按月/按年收费）
> - 两者都要

**问题 2：定价**
> 价格是多少？如果是订阅，月费和年费分别是多少？

### 2. 配置 Stripe

- **安装 Stripe SDK**
- **配置环境变量** — STRIPE_SECRET_KEY 和 STRIPE_PUBLISHABLE_KEY
- 提示用户去 stripe.com 注册账号，获取测试模式的 API Key

### 3. 生成支付代码

**后端：**
- 创建 Checkout Session 接口
- Webhook 处理（支付成功、订阅变更）
- 验证 Webhook 签名

**前端：**
- 定价页面（价格卡片 + 购买按钮）
- 跳转到 Stripe Checkout
- 支付成功/取消页面

**订阅（如果需要）：**
- 创建 Stripe Product 和 Price
- 订阅管理（升级、降级、取消）
- 用户的订阅状态查询

### 4. 测试

使用 Stripe 测试卡号（4242 4242 4242 4242）完成一次测试支付。

> 支付功能已集成。使用测试模式验证正常。
> 上线前记得在 Stripe 后台切换到生产模式，替换 API Key。
