# Zsh Productivity Cheatsheet

## Navigation (zoxide + aliases)
- **z foo** – Jump to directory containing "foo" anywhere.
- **za** – Add current directory to zoxide database.
- **zr** – Remove directory from zoxide database.
- **zq** – Query zoxide database.
- **.. / ... / ....** – Move up 1, 2, or 3 directories.
- **cd -** – Switch to previous directory.
- **~** – Go home.

## Listings (eza / exa)
- **ls** – Colorized list with icons.
- **ll** – Long format list.
- **la** – Long list including hidden.
- **lt** – Tree view.
- **lta** – Tree view including hidden.
- **ltg / llg** – Git-aware listing.

## History & Suggestions
- **↑ / ↓** – Search through history starting with current prefix.
- **zsh-autosuggestions** – Gray suggestions, press **→** to accept.

## Fuzzy Finder (fzf)
- **Ctrl+T** – Search files (preview via bat/eza).
- **Alt+C** – Search directories (preview tree).
- Previews: Directories show `eza --tree`, files show `bat`.
- **fd** integrated: Searches are faster, hidden files included, .git excluded.

### Key Functions for fzf
- **FZF_DEFAULT_COMMAND** – `fd --hidden --strip-cwd-prefix --exclude .git`
- **FZF_CTRL_T_OPTS** – Preview files and dirs.
- **FZF_ALT_C_OPTS** – Directory preview.

## Git Helpers

### fzf-git
- **fzf-git status** – Pick from changed files.
- **fzf-git branches** – Fuzzy branch checkout.
- **fzf-git commits** – View commits with previews.
- **fzf-git tags** – Select tags.

### forgit Commands
- **gco** – Checkout branch interactively.
- **gcf** – Checkout files interactively.
- **grh** – Reset HEAD interactively.
- **glo** – Interactive git log.
- **gd** – Interactive git diff.
- **gi** – Generate .gitignore interactively.

## Aliases
- **zshconfig** – Open ~/.zshrc in editor.
- **reloadzsh** – Reload Zsh config.
- **alias bat="batcat"** – Fallback for Debian/Ubuntu.
- **alias cd="z"** – Smart cd powered by zoxide.
- **frg** – Fuzzy ripgrep search (alias for fuzzy-rg, uses FZF styling).
- **fgg** – Fuzzy git grep search (alias for fuzzy-git-grep, uses FZF styling).

## Micromamba/Conda
- Initializes conda/mamba for package environments.
- Use **conda activate env** or **micromamba activate env**.

## Misc
- **sudo** plugin – Repeat last command with sudo by pressing **Esc-Enter**.
- **extract** plugin – Easy extraction of archives.
- **powerlevel10k** – Fast, info-rich prompt.
