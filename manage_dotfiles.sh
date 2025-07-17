#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# Dotfiles Retriever & Restorer — cross-platform
# -----------------------------------------------------------------------------
#  • Syncs dotfiles   (retrieve → repo, restore ← repo, link ↔ symlinks)
#  • Works the same on macOS and Linux — one Alacritty config for all
#  • Provides an optional symlink mode so edits in $HOME are version-controlled
# -----------------------------------------------------------------------------
set -euo pipefail

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "${SCRIPT_DIR}"

OS_NAME="$(uname -s)"   # Linux → "Linux", macOS → "Darwin"

# -----------------------------------------------------------------------------
# Dotfile mapping
# -----------------------------------------------------------------------------

declare -A DOTFILES_COMMON=(
  ["shell/.zshrc"]="${HOME}/.zshrc"
  ["shell/.bashrc"]="${HOME}/.bashrc"
  ["git/.gitconfig"]="${HOME}/.gitconfig"
  ["tmux/.tmux.conf"]="${HOME}/.tmux.conf"
  ["prompt/alp.omp.json"]="${HOME}/alp.omp.json"
  ["alacritty/alacritty.toml"]="${HOME}/.config/alacritty/alacritty.toml"
  ["shell/zsh.d/macos.zsh"]="${HOME}/.zshrc.d/macos.zsh"
  ["shell/zsh.d/linux.zsh"]="${HOME}/.zshrc.d/linux.zsh"
)

# Platform-specific arrays left empty because the Alacritty config is now universal
declare -A DOTFILES_LINUX=()
declare -A DOTFILES_DARWIN=()

# Build final map ------------------------------------------------------------

declare -A DOTFILES=()
for k in "${!DOTFILES_COMMON[@]}"; do DOTFILES[$k]="${DOTFILES_COMMON[$k]}"; done
if [[ "$OS_NAME" == "Darwin" ]]; then
  for k in "${!DOTFILES_DARWIN[@]}"; do DOTFILES[$k]="${DOTFILES_DARWIN[$k]}"; done
else
  for k in "${!DOTFILES_LINUX[@]}"; do DOTFILES[$k]="${DOTFILES_LINUX[$k]}"; done
fi

# -----------------------------------------------------------------------------
print_usage() {
  cat <<EOF
Usage: $0 <command>
  retrieve   Copy dotfiles from \$HOME into the repository
  restore    Copy dotfiles from the repository back into \$HOME
  link       Create/refresh symlinks from \$HOME to the repo
  help       Show this help message
EOF
}

copy_file() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  cp -av "$src" "$dst"
}

# -----------------------------------------------------------------------------
# Symlink helper
# -----------------------------------------------------------------------------
create_symlink() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  ln -sfn "$src" "$dst"
}

cmd_retrieve() {
  echo "🔄  Retrieving dotfiles…"
  for repo_path in "${!DOTFILES[@]}"; do
    local src="${DOTFILES[$repo_path]}" dst="$SCRIPT_DIR/$repo_path"
    [[ -e "$src" ]] && copy_file "$src" "$dst" || echo "(skip) $src not found" >&2
  done
  echo "✅  Retrieve done. Commit your changes!"
}

cmd_restore() {
  echo "⬇️   Restoring dotfiles…"
  for repo_path in "${!DOTFILES[@]}"; do
    local src="$SCRIPT_DIR/$repo_path" dst="${DOTFILES[$repo_path]}"
    [[ -e "$src" ]] && copy_file "$src" "$dst" || echo "(skip) $src missing" >&2
  done

  echo "✅  Restore complete. Open a new shell to load configs."
}

# Symlink deployment ---------------------------------------------------------
cmd_link() {
  echo "🔗  Linking dotfiles…"
  for repo_path in "${!DOTFILES[@]}"; do
    local src="$SCRIPT_DIR/$repo_path" dst="${DOTFILES[$repo_path]}"
    [[ -e "$src" ]] && create_symlink "$src" "$dst" || echo "(skip) $src missing" >&2
  done
  echo "✅  Symlinks created. Reload your shell."
}

case "${1:-}" in
  retrieve) cmd_retrieve ;;
  restore)  cmd_restore  ;;
  link)     cmd_link     ;;
  help|-h|--help|"") print_usage ;;
  *) echo "Unknown command: $1" >&2; print_usage; exit 1 ;;
esac 