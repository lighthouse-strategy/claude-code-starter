---
description: "为已有项目自动生成 CLAUDE.md：扫描项目结构，智能推断配置"
---

为当前项目自动生成一份 CLAUDE.md。通过分析项目文件推断技术栈和配置。

步骤：

1. **扫描项目** — 检查以下文件推断技术栈：
   - package.json → Node.js / React / Next.js / Vue
   - pyproject.toml / requirements.txt → Python
   - go.mod → Go
   - Cargo.toml → Rust
   - pom.xml / build.gradle → Java
   - 检查 tsconfig.json 判断是否用 TypeScript
   - 检查 tailwind.config 判断是否用 Tailwind
   - 检查 .eslintrc / ruff.toml / .prettierrc 判断 lint 工具
   - 检查 pytest.ini / jest.config / vitest.config 判断测试框架

2. **推断配置** — 根据扫描结果自动填写：
   - 项目名称（从 package.json/pyproject.toml 或目录名）
   - 技术栈
   - 源代码目录（src/ / app/ / lib/）
   - 测试目录（tests/ / __tests__/ / test/）
   - 包管理器（检查 lockfile 类型）
   - Lint 命令（从配置文件推断）
   - 测试命令（从配置文件推断）

3. **选择模板** — 根据技术栈匹配最合适的模板：
   - Python + FastAPI → templates/python-fastapi.md
   - Next.js + TypeScript → templates/nextjs-typescript.md
   - 纯 HTML → templates/html-vanilla.md
   - 其他 → 通用 CLAUDE.md 模板

4. **生成并确认** — 用推断的信息填充模板，展示给用户：
   > 根据项目扫描，生成了以下 CLAUDE.md：
   > - 技术栈：[推断结果]
   > - 包管理器：[推断结果]
   > - Lint：[推断结果]
   >
   > 需要调整吗？确认后写入。

5. **写入文件** — 确认后保存为 CLAUDE.md

规则：
- 如果已有 CLAUDE.md，先问是否覆盖
- 推断不出的字段标为 {{placeholder}}，提示用户后续用 /setup 补充
- 不要编造项目没有的技术栈或工具
