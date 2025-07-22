# Dotfiles managed with ChezMoi

These configuration files (Z-shell, Tmux, Alacritty …) are managed with [chezmoi](https://www.chezmoi.io/).  Follow the steps below to bootstrap **any** new computer—Linux or macOS—in minutes.

---

## 1. Prerequisites

1. **Git** – to clone this repo.
2. **chezmoi** – the dotfile manager.

### Quick chezmoi install

| System | Command |
| ------ | ------- |
| macOS  | `brew install chezmoi` |
| Debian / Ubuntu | `sudo apt update && sudo apt install -y chezmoi` |
| Arch Linux | `sudo pacman -S chezmoi` |
| Anything else | `sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"` |

The script adds chezmoi to `~/.local/bin`; make sure that directory is on your `PATH`.

**Important**: Add `~/.local/bin` to your PATH if it's not already there:

```bash
# Add to your shell profile (~/.bashrc, ~/.zshrc, etc.)
export PATH="$HOME/.local/bin:$PATH"
```

---

## 2. First-time bootstrap on a new machine

```
# 1. Clone & apply in one step (replace URL with yours)
chezmoi init git@github.com:alptezbasaran/DotFiles.git --apply

# 2. Restart your shell or log out/in so that new configs load
```

What happens under the hood:

* **`run_once_install-oh-my-zsh.sh.tmpl`** – installs Oh-My-Zsh the very first time only.
* **`run_once_install-zsh-plugins.sh.tmpl`** – installs zsh-autosuggestions and zsh-syntax-highlighting plugins the very first time only.
* **`run_once_install-fonts.sh.tmpl`** – installs programming fonts (JetBrains Mono, Fira Code, Hack) the very first time only.
* **`run_onchange_install-cli.sh.tmpl`** – installs baseline CLI packages listed in `.chezmoidata/packages.yaml` using **brew / apt / pacman** depending on the OS.

---

## 3. Daily use / keeping configs up-to-date

```
# Pull latest changes from Git remote and re-apply locally
chezmoi update
```

Have you edited a file *directly* on your machine (outside the `~/.local/share/chezmoi` directory)?

```
# Adopt the change into chezmoi, review, then push
chezmoi add <path/to/file>
chezmoi diff        # inspect changes
chezmoi git commit -m "Describe change"
chezmoi git push
```

---

## 4. Customising package lists

Edit `.chezmoidata/packages.yaml` and add packages per OS family.  Next time you run `chezmoi apply` the **`run_onchange_install-cli`** script will install only new packages.

```yaml
cli:
  darwin:
    brew:
      - tmux
      - fd
  debian:
    apt:
      - tmux
      - fd-find
  arch:
    pacman:
      - tmux
      - fd
```

---

## 5. OS-specific notes

* **macOS** – Homebrew is required.  You can install it beforehand or allow the first chezmoi run to prompt you.
* **Debian / Ubuntu** – The script sets `DEBIAN_FRONTEND=noninteractive` so apt never stops for input.
* **Arch** – `pacman` is invoked with `--noconfirm --needed` to skip already-installed packages.

---

## 6. FAQ

**Q: I changed `~/.zshrc` and it was overwritten. Why?**  
A: Edit the tracked file in the chezmoi source directory (`$HOME/.local/share/chezmoi/dot_zshrc`) instead, then run `chezmoi apply`.

**Q: Something failed mid-bootstrap. How do I re-run?**  
A: Simply execute `chezmoi apply` again; all scripts are *idempotent*.

---

## 7. Reference commands

```
# Re-apply configs without pulling from remote
chezmoi apply

# Diff between local state and chezmoi source
chezmoi diff

# Edit a template in $EDITOR and apply immediately
chezmoi edit --apply dot_tmux.conf
```

---

Happy dotfile hacking! 🎉 