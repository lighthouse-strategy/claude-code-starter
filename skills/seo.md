---
name: seo
description: 当用户想优化 SEO、提升搜索排名、添加 meta 标签、生成 sitemap 时使用 — 检查并优化搜索引擎表现
---

# 优化 SEO

帮用户检查并优化网站的搜索引擎可见性。

## 步骤

### 1. 扫描现状

读取项目中的所有 HTML 页面和模板，检查以下项目：

- **Title 标签** — 是否存在、是否唯一、长度是否合适（50-60 字符）
- **Meta Description** — 是否存在、长度是否合适（150-160 字符）
- **Open Graph 标签** — og:title、og:description、og:image
- **Heading 结构** — 是否有 H1、层级是否合理
- **图片 Alt 文本** — 是否所有图片都有 alt 属性
- **链接** — 是否有死链、锚文本是否有意义
- **Viewport** — 是否有 viewport meta 标签

### 2. 输出检查报告

```
## SEO 检查报告

### 需要修复
- [文件:行号] 问题描述

### 建议优化
- [文件:行号] 优化建议

### 已经做好的
- 列出通过的检查项
```

### 3. 自动修复

询问用户后执行修复：
- 补全缺失的 meta 标签
- 添加 alt 文本
- 生成 sitemap.xml
- 生成 robots.txt
- 添加结构化数据（JSON-LD）

### 4. 完成

> SEO 优化完成。修复了 N 个问题，新增了 sitemap 和 robots.txt。
> 部署后可以去 Google Search Console 提交 sitemap。
