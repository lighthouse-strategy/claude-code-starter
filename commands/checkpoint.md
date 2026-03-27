---
description: "保存当前进度：创建一个描述性的 git commit 作为检查点"
---

创建一个进度检查点（git commit），保存当前的工作状态。

步骤：

1. 运行 `git status` 查看所有改动
2. 运行 `git diff --stat` 了解改动范围
3. 如果没有任何改动，告诉我「没有需要保存的改动」并结束
4. 分析所有改动的内容，生成一个准确的 commit message：
   - 格式：`type: 简短描述`
   - 必须反映实际改动内容，不要写「保存进度」这种空话
5. 展示 commit message 让我确认：
   > 准备提交以下改动：
   > - [改动文件列表和简述]
   >
   > Commit message: `feat: xxx`
   > 确认？
6. 确认后执行 `git add` 相关文件并 `git commit`

规则：
- 不要 `git add .` — 只添加有意义的改动
- 不要添加 .env 文件或其他敏感文件
- 不要自动 push — 只 commit
