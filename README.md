# Dotfiles Retriever & Restorer

A single Bash script (`manage_dotfiles.sh`) to **retrieve** (back-up) and **restore** (deploy) your dotfiles on both **macOS** and **Ubuntu/Linux**.  
Dotfiles are stored in tidy sub-folders inside the repository for easy syncing and version-control.

---

## 📋 Prerequisites

| Tool | Ubuntu / Debian | macOS (Homebrew) | Notes |
|------|-----------------|------------------|-------|
| **Bash ≥ 4** | `sudo apt install bash` (already Bash 5+ on recent Ubuntu) | `brew install bash` | Apple ships Bash 3.2 — run the script via the Homebrew path:<br>`/opt/homebrew/bin/bash manage_dotfiles.sh …` |
| **coreutils** (`cp`, `mkdir`, `uname`, etc.) | pre-installed | pre-installed | Used for copying and directory creation |
| **git** *(optional but recommended)* | `sudo apt install git` | `brew install git` | For version-controlling your dotfiles repo |

> **Tip (macOS):** After installing Homebrew Bash you can add it to `/etc/shells` and `chsh -s /opt/homebrew/bin/bash` if you’d like Bash 5+ to be your default shell.

---

## 📂 Managed Dotfiles

| Dotfile (in $HOME) | Folder inside repo |
|--------------------|--------------------|
| `.zshrc`           | `shell/`           |
| `.bashrc`          | `shell/`           |
| `.gitconfig`       | `git/`             |
| `.tmux.conf`       | `tmux/`            |
| `.config/alacritty/alacritty.toml` | `alacritty/` |
| `alp.omp.json`     | `prompt/`          |

_Update or extend this mapping by editing the `DOTFILES` associative array in the script._

---

## 🚀 Usage

```bash
# give the script execute permission once
chmod +x manage_dotfiles.sh

# back-up current configs from $HOME → repo
./manage_dotfiles.sh retrieve

# restore configs from repo → $HOME (fresh machine / clean install)
./manage_dotfiles.sh restore

# print help / usage info
./manage_dotfiles.sh help
