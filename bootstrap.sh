#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "${SCRIPT_DIR}"

OS_NAME="$(uname -s)"

install_packages() {
  case "$OS_NAME" in
    Darwin)
      if ! command -v brew >/dev/null 2>&1; then
        echo "🏗  Installing Homebrew…"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      fi
      echo "📦  Installing Brew packages…"
      brew bundle --file Brewfile
      ;;
    Linux)
      if command -v apt >/dev/null 2>&1; then
        echo "📦  Installing apt packages…"
        sudo apt update
        xargs -a apt.txt sudo apt install -y
      fi
      ;;
  esac
}

echo "🛠  Bootstrapping dotfiles environment on $OS_NAME…"
install_packages

# Use the link mode from manage_dotfiles.sh to place symlinks
chmod +x ./manage_dotfiles.sh
./manage_dotfiles.sh link

echo "🎉  Bootstrap complete. Open a new terminal!" 