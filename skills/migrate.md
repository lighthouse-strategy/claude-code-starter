---
name: migrate
description: 当用户想转换数据格式、CSV 转 JSON、迁移数据库、导入导出数据时使用 -- 在不同格式和系统之间迁移数据
---

# 数据迁移

帮用户在不同数据格式之间转换，或从一个系统迁移数据到另一个系统。

## 步骤

### 0. 备份（强制）

在做任何迁移操作之前，必须先备份源数据：

- 文件：`cp source.csv source.csv.bak`
- 数据库：`pg_dump` / `mysqldump` / `sqlite3 db.sqlite .dump > backup.sql`
- 告知用户备份位置，确认后再继续

### 1. 确定迁移类型

根据用户需求，走对应的子路径：

**(a) 文件格式转换**（CSV/JSON/Excel/Parquet 互转）
- 推荐工具：pandas（Python 通用）、jq（JSON 处理）、csvkit（CSV 命令行工具）
- 关键：先用 `file` 或 `chardetect` 确认源文件编码

**(b) 数据库迁移**（MySQL -> PostgreSQL、SQLite -> PostgreSQL 等）
- 推荐工具：pgloader（MySQL/SQLite 到 PostgreSQL）、mysqldump + psql（手动）、Django/Alembic migrations（ORM 项目）
- 关键：先对比源和目标的 schema 差异（字段类型、索引、约束）

**(c) API 数据导入**（从外部 API 拉数据存到本地）
- 推荐：写 Python 脚本，包含分页处理 + rate limiting + 断点续传
- 关键：先调一页确认数据结构，再跑全量

### 2. 分析源数据

- 读取源数据，检查格式和结构
- 统计数据量（行数、字段数、文件大小）
- 发现潜在问题（编码、缺失值、格式不一致、重复数据）

### 3. Dry Run（试运行）

在正式迁移前，先用小样本测试：

> 试运行结果：从前 100 条数据中，成功转换 98 条，2 条有问题（原因：xxx）。
> 预计全量迁移 N 条记录，耗时约 X 分钟。
> 确认继续吗？

用户确认后再执行全量迁移。

### 4. 执行迁移 + 完整性校验

执行全量迁移，完成后做数据完整性检查：

- 行数对比：源 vs 目标
- 关键字段抽样对比（首行、末行、随机几行）
- 数值型字段的 sum/count 对比

> 迁移完成。源数据 N 条，目标 N 条，校验通过。
> 备份文件在：xxx，确认无误后可删除。

## 遇到问题

- **编码错误（UnicodeDecodeError / 乱码）？** 用 `chardetect file.csv` 检测实际编码，常见的是 GBK/GB2312 被当成 UTF-8 读取。pandas 用 `encoding='gbk'` 参数。
- **迁移中途失败了？** 检查错误日志，找到失败的行号。修复问题后从断点继续，不要从头重跑。API 导入建议记录已处理的 offset/page。
- **迁移后数据数量对不上？** 检查：(1) 是否有重复数据被去重，(2) 是否有空行/非法行被跳过，(3) 数据库是否有 unique 约束拒绝了重复记录。
- **数据库迁移后查询变慢？** 检查索引是否迁移过来了，大部分工具不会自动迁移索引，需要手动创建。
