#!/bin/bash
# Claude Code Starter Kit -- 一键安装脚本
# 用法: curl -fsSL https://raw.githubusercontent.com/lighthouse-strategy/claude-code-starter/main/install.sh | bash

set -e

REPO="lighthouse-strategy/claude-code-starter"
BRANCH="main"
BASE_URL="https://raw.githubusercontent.com/$REPO/$BRANCH"

# 颜色
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info() { echo -e "${GREEN}[INFO]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

# 检查依赖
command -v curl >/dev/null 2>&1 || error "需要 curl，请先安装"
command -v git >/dev/null 2>&1 || error "需要 git，请先安装"

echo ""
echo "  Claude Code Starter Kit"
echo "  ======================="
echo ""

# 检查是否在项目目录
if [ ! -d ".git" ]; then
    warn "当前目录不是 git 仓库"
    read -p "  继续安装到当前目录? (y/n) " -n 1 -r
    echo
    [[ ! $REPLY =~ ^[Yy]$ ]] && exit 0
fi

# 检查已有 CLAUDE.md
if [ -f "CLAUDE.md" ]; then
    warn "已存在 CLAUDE.md"
    read -p "  覆盖? (y=覆盖 / n=跳过 / b=备份后覆盖) " -n 1 -r
    echo
    case $REPLY in
        b|B) cp CLAUDE.md CLAUDE.md.bak && info "已备份到 CLAUDE.md.bak" ;;
        y|Y) ;;
        *) info "跳过 CLAUDE.md" ; SKIP_CLAUDE_MD=1 ;;
    esac
fi

# 下载 CLAUDE.md
if [ -z "$SKIP_CLAUDE_MD" ]; then
    info "下载 CLAUDE.md 模板..."
    curl -fsSL "$BASE_URL/CLAUDE.md" -o CLAUDE.md
    info "CLAUDE.md 已保存"
fi

# 下载 skills
info "下载 37 个 Skills..."
SKILLS=(
    a11y api auth blog changelog code-review commit compare
    component concept copy dashboard-admin database debug deploy doc
    email env explain fix form gitsetup install-plugins landing
    learn migrate payment perf readme-gen refactor responsive script
    seo setup starter storage test
)

mkdir -p .claude/skills
SKILL_COUNT=0
for skill in "${SKILLS[@]}"; do
    curl -fsSL "$BASE_URL/skills/$skill/SKILL.md" -o ".claude/skills/$skill.md" 2>/dev/null
    if [ $? -eq 0 ]; then
        SKILL_COUNT=$((SKILL_COUNT + 1))
    fi
done
info "已下载 $SKILL_COUNT 个 Skills 到 .claude/skills/"

# 下载 global-CLAUDE.md（可选）
echo ""
read -p "  安装全局规则到 ~/.claude/CLAUDE.md? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    mkdir -p ~/.claude
    if [ -f ~/.claude/CLAUDE.md ]; then
        warn "已存在 ~/.claude/CLAUDE.md，跳过（避免覆盖你的全局配置）"
    else
        curl -fsSL "$BASE_URL/global-CLAUDE.md" -o ~/.claude/CLAUDE.md
        info "全局规则已保存到 ~/.claude/CLAUDE.md"
    fi
fi

# 完成
echo ""
echo -e "${GREEN}安装完成!${NC}"
echo ""
echo "  下一步:"
echo "  1. 打开 Claude Code"
echo "  2. 输入 /setup 配置项目信息"
echo "  3. 输入 /install-plugins 安装推荐插件（可选）"
echo ""
echo "  文档: https://github.com/$REPO"
echo ""
