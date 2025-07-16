#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# manage_dotfiles.sh – retrieve / restore dotfiles across macOS and Linux
# -----------------------------------------------------------------------------
# Prerequisites
#   • Bash ≥ 4 (macOS users: `brew install bash` and invoke via /
#     opt/homebrew/bin/bash or /usr/local/bin/bash)
#   • Standard coreutils: cp, mkdir, uname, etc. (already present on Ubuntu/macOS)
# -----------------------------------------------------------------------------

set -euo pipefail

# Ensure required Bash version -------------------------------------------------
if (( BASH_VERSINFO[0] < 4 )); then
  echo "❌  This script requires Bash 4 or newer. Upgrade Bash (e.g. 'brew install bash')"
  echo "    and run: /usr/local/bin/bash $0 [command]" >&2
  exit 1
fi

# Map of dotfiles → repo sub-directory ----------------------------------------
declare -A DOTFILES=(
  [".zshrc"]="shell"
  [".bashrc"]="shell"
  [".gitconfig"]="git"
  [".tmux.conf"]="tmux"
  [".config/alacritty/alacritty.toml"]="alacritty"
  ["alp.omp.json"]="prompt"
)

REPO_DIR=$(pwd)

print_help() {
  cat <<EOF
Usage: ./manage_dotfiles.sh <command>

Commands
  retrieve   Back up dotfiles from \$HOME ➜ repo (creates sub-folders as needed)
  restore    Deploy dotfiles from repo ➜ \$HOME (creates parent dirs as needed)
  help       Show this help message

Prerequisites
  • Bash 4+  – macOS ships Bash 3.2; install a newer version with Homebrew:
      brew install bash
    then run the script with the full path, e.g. /opt/homebrew/bin/bash manage_dotfiles.sh
  • Coreutils – cp, mkdir, uname (already present on Ubuntu & macOS)

Example
  ./manage_dotfiles.sh retrieve   # snapshot current configs into repo
  ./manage_dotfiles.sh restore    # restore configs onto a fresh machine
EOF
}

retrieve_dotfiles() {
  echo "📥 Retrieving dotfiles into repository…"
  for file in "${!DOTFILES[@]}"; do
    local src="$HOME/$file"
    local dst_dir="$REPO_DIR/${DOTFILES[$file]}"
    mkdir -p "$dst_dir"
    if [[ -f "$src" ]]; then
      cp "$src" "$dst_dir/$(basename "$file")"
      echo "  ✔ $src ➜ $dst_dir"
    else
      echo "  ⚠ Missing: $src (skipped)"
    fi
  done
  echo "✅ Retrieval complete."
}

restore_dotfiles() {
  echo "📤 Restoring dotfiles to system…"
  for file in "${!DOTFILES[@]}"; do
    local src="$REPO_DIR/${DOTFILES[$file]}/$(basename "$file")"
    local dst="$HOME/$file"
    mkdir -p "$(dirname "$dst")"
    if [[ -f "$src" ]]; then
      cp "$src" "$dst"
      echo "  ✔ $src ➜ $dst"
    else
      echo "  ⚠ Repo copy missing: $src (skipped)"
    fi
  done
  echo "✅ Restoration complete."
}

case "${1:-}" in
  retrieve) retrieve_dotfiles ;;
  restore)  restore_dotfiles  ;;
  help|--help|-h|"") print_help ;;
  *) echo "Unknown command: $1" >&2; print_help; exit 1 ;;
esac
