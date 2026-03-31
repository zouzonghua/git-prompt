#!/usr/bin/env bash
# ─────────────────────────────────────────────
# install.sh — git-prompt one-line installer
# Usage:
#   bash -c "$(curl -fsSL https://raw.githubusercontent.com/zouzonghua/git-prompt/main/install.sh)"
# ─────────────────────────────────────────────

set -e

REPO_URL="https://raw.githubusercontent.com/zouzonghua/git-prompt/main/git_prompt.sh"
SCRIPTS_DIR="$HOME/scripts"
INSTALL_PATH="$SCRIPTS_DIR/git_prompt.sh"
SOURCE_LINE="[ -f ~/scripts/git_prompt.sh ] && source ~/scripts/git_prompt.sh"

# ── 颜色输出 ──────────────────────────────────
_info()    { printf "\033[34m[info]\033[0m  %s\n" "$*"; }
_ok()      { printf "\033[32m[ok]\033[0m    %s\n" "$*"; }
_warn()    { printf "\033[33m[warn]\033[0m  %s\n" "$*"; }
_error()   { printf "\033[31m[error]\033[0m %s\n" "$*"; exit 1; }

# ── 检查依赖 ──────────────────────────────────
command -v git  &>/dev/null || _error "git is not installed"
command -v curl &>/dev/null || command -v wget &>/dev/null || _error "curl or wget is required"

# ── 创建 scripts 目录 ─────────────────────────
if [ ! -d "$SCRIPTS_DIR" ]; then
  mkdir -p "$SCRIPTS_DIR"
  _ok "Created $SCRIPTS_DIR"
else
  _info "$SCRIPTS_DIR already exists, skipping"
fi

# ── 下载 ──────────────────────────────────────
_info "Downloading git_prompt.sh to $INSTALL_PATH ..."

if command -v curl &>/dev/null; then
  curl -fsSL "$REPO_URL" -o "$INSTALL_PATH"
else
  wget -qO "$INSTALL_PATH" "$REPO_URL"
fi

_ok "Downloaded"

# ── 注入 rc 文件 ──────────────────────────────
_inject() {
  local rc="$1"
  [ -f "$rc" ] || return 0
  if grep -qF "$SOURCE_LINE" "$rc"; then
    _warn "Already sourced in $rc, skipping"
  else
    echo "" >> "$rc"
    echo "# git-prompt" >> "$rc"
    echo "$SOURCE_LINE" >> "$rc"
    _ok "Injected into $rc"
  fi
}

# 根据当前 shell 注入对应 rc
case "$SHELL" in
  */zsh)
    _inject "$HOME/.zshrc"
    ;;
  */bash)
    _inject "$HOME/.bashrc"
    _inject "$HOME/.bash_profile"
    ;;
  *)
    # 不确定 shell 时两个都注入
    _inject "$HOME/.zshrc"
    _inject "$HOME/.bashrc"
    ;;
esac

# ── 完成 ──────────────────────────────────────
echo ""
_ok "Installation complete!"
echo ""
echo "  Reload your shell to activate:"
echo ""
echo "    source ~/.zshrc   # zsh"
echo "    source ~/.bashrc  # bash"
echo ""
