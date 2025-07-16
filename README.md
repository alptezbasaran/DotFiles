# Dotfiles Retriever & Restorer

A single Bash script (`manage_dotfiles.sh`) to **retrieve** (back‑up) and **restore** (deploy) your dotfiles on both **macOS** and **Ubuntu/Linux**.
Dotfiles are stored in tidy sub‑folders inside the repository for easy syncing and version‑control.

---

## 📋 Prerequisites

| Tool                                         | Ubuntu / Debian        | macOS (Homebrew)   | Notes                                      |
| -------------------------------------------- | ---------------------- | ------------------ | ------------------------------------------ |
| **coreutils** (`cp`, `mkdir`, `uname`, etc.) | pre‑installed          | pre‑installed      | Used for copying and directory creation    |
| **git** *(optional but recommended)*         | `sudo apt install git` | `brew install git` | For version‑controlling your dotfiles repo |

> **Tip (macOS):** After installing Homebrew Bash you can add it to `/etc/shells` and run `chsh -s /opt/homebrew/bin/bash` if you’d like Bash 5+ to be your default shell.

---

## 🛠️ Key Tools & Installation Guides

Need the shell, terminal, or multiplexer first? Here’s where to grab them.

| Tool          | Ubuntu / Debian                                                                                                                                                                  | macOS (Homebrew)         | Up‑stream Docs / Releases                                                                    |
| ------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------ | -------------------------------------------------------------------------------------------- |
| **Zsh**       | `sudo apt install zsh`                                                                                                                                                           | `brew install zsh`       | [https://zsh.sourceforge.io/](https://zsh.sourceforge.io/)                                   |
| **Alacritty** | `sudo add‑apt‑repository ppa:aslatter/ppa && sudo apt update && sudo apt install alacritty`<br/>*(or download AppImage from releases)*                                           | `brew install alacritty` | [https://github.com/alacritty/alacritty](https://github.com/alacritty/alacritty)             |
| **tmux**      | `sudo apt install tmux` *(stable)*<br/>or build the latest:<br/>`git clone https://github.com/tmux/tmux && cd tmux && sh autogen.sh && ./configure && make && sudo make install` | `brew install tmux`      | [https://github.com/tmux/tmux/wiki/Installing](https://github.com/tmux/tmux/wiki/Installing) |

Feel free to extend this table with any other tools you keep in your dotfiles (e.g. **starship**, **fzf**, **ripgrep**, **bat**, etc.).

---

## 📂 Managed Dotfiles

| Dotfile (in `$HOME`)               | Folder inside repo |
| ---------------------------------- | ------------------ |
| `.zshrc`                           | `shell/`           |
| `.bashrc`                          | `shell/`           |
| `.gitconfig`                       | `git/`             |
| `.tmux.conf`                       | `tmux/`            |
| `.config/alacritty/alacritty.toml` | `alacritty/`       |
| `alp.omp.json`                     | `prompt/`          |

*Update or extend this mapping by editing the `DOTFILES` associative array in the script.*

---

## 🚀 Usage

```bash
# give the script execute permission once
chmod +x manage_dotfiles.sh

# back‑up current configs from $HOME → repo
./manage_dotfiles.sh retrieve

# restore configs from repo → $HOME (fresh machine / clean install)
./manage_dotfiles.sh restore

# print help / usage info
./manage_dotfiles.sh help
```

---

Happy dot‑file‑managing! Keep your configs versioned and your machines in sync. 🎉
