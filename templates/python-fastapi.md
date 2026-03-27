# 项目规则

## 回复语言与风格

- 始终用中文回复
- 回答要简洁直接，不要废话
- 不要在回复中使用 emoji
- 先做事，再解释（如果需要的话）

## 项目基本信息

- 项目名称：{{project_name}}
- 技术栈：Python + FastAPI + SQLAlchemy + Pydantic
- 项目描述：{{project_description}}
- 源代码目录：src/ 或 app/
- 测试目录：tests/
- 包管理器：uv
- Lint 命令：ruff check .
- 测试命令：uv run python -m pytest tests/ --timeout=60 -x
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

### Python 风格
- 使用 snake_case 命名变量和函数
- 类名用 PascalCase
- 常量用 UPPER_SNAKE_CASE
- 类型注解：函数参数和返回值必须有类型注解
- 字符串：统一用双引号

### FastAPI 规范
- 路由函数用 async def
- 请求/响应模型用 Pydantic BaseModel
- 依赖注入用 Depends()
- 异常用 HTTPException，不要 raise 裸 Exception
- 路由分组用 APIRouter，不要全堆在 main.py

### Commit Message 格式
- 格式：`type: 简短描述`
- type：feat / fix / docs / refactor / test / chore
- 不要在 commit message 中包含敏感信息

### 分支策略
- 主分支：main
- 新功能：feature/xxx，修复：fix/xxx

## 铁律

### 铁律：不要提交敏感文件
- 绝对不要把 .env、API Key、密码、token 提交到 git
- 确保 .gitignore 包含：.env, *.pyc, __pycache__/, .venv/, .ruff_cache/

### 铁律：Push 前安全检查
- 每次 push 前扫描硬编码的密钥
- 发现问题必须先修复，再 push

### 铁律：禁止未经确认的破坏性操作
- 未经确认不要：rm -rf、force push、reset --hard、drop table

### 铁律：测试安全
- 测试始终加 --timeout=60 -x
- 不要在后台静默运行完整测试套件
- 测试中不要连接生产数据库

## 依赖管理

- 包管理器：uv（不用 pip）
- 添加依赖：`uv add package-name`
- 添加前先问我，说明为什么需要
- `uv sync` 会清除未声明的包 — 运行前后对比 `uv pip list`
- 锁文件 uv.lock 的变更要检查

## 工作流程

### 改代码前先读代码
- 修改前先理解现有代码，不要盲改

### 编辑后先检查再提交
- `ruff check .` 通过
- `uv run python -m pytest tests/ --timeout=60 -x` 通过
- 多文件改动时 self-review 一遍

### 日期和时间
- 提到日期前先运行 `date` 确认

## 不要做什么

- 不要在没读过代码的情况下建议修改
- 不要自作主张添加新依赖，先问我
- 不要在代码里写中文注释（除非我要求）
- 不要重复解释你做了什么
- 不要用 `python -m pytest` — 用 `uv run python -m pytest`
- 不要用 pip install — 用 uv add

## 决策日志

- （在这里记录你的技术决策）

## 已知陷阱

- `uv sync` 会删除未在 pyproject.toml 中声明的包 — 添加依赖后确认 pyproject.toml 已更新
- FastAPI 的 async 路由中不要用同步 I/O（会阻塞事件循环）— 用 asyncio 或 run_in_executor
- SQLAlchemy 2.0 语法和 1.x 不同 — 用 `select()` 不要用 `query()`
- Pydantic V2 的 `model_dump()` 替代了 V1 的 `.dict()` — 检查版本
- f-string 中嵌套引号容易出错 — 复杂字符串用三引号或变量拆分
