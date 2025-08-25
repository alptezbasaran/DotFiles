# Keyboard Shortcuts Reference

A comprehensive guide to all keyboard shortcuts configured in your dotfiles setup.

## Table of Contents
- [Zsh Shell Shortcuts](#zsh-shell-shortcuts)
- [FZF (Fuzzy Finder) Shortcuts](#fzf-fuzzy-finder-shortcuts)
- [Git Integration Shortcuts](#git-integration-shortcuts)
- [Search & Navigation Shortcuts](#search--navigation-shortcuts)
- [Tmux Shortcuts](#tmux-shortcuts)
- [Alacritty Terminal Shortcuts](#alacritty-terminal-shortcuts)
- [History Navigation](#history-navigation)
- [Text Navigation](#text-navigation)

---

## Zsh Shell Shortcuts

### Basic Navigation
| Shortcut | Action |
|----------|--------|
| `Ctrl+A` | Move cursor to beginning of line |
| `Ctrl+E` | Move cursor to end of line |
| `Ctrl+B` | Move cursor backward one character |
| `Ctrl+F` | Move cursor forward one character |
| `Ctrl+D` | Delete character under cursor (or list completions) |
| `Ctrl+G` | Send break (cancel current operation) |

### History Navigation
| Shortcut | Action |
|----------|--------|
| `↑` | Search history backward (starts with current prefix) |
| `↓` | Search history forward (starts with current prefix) |
| `Ctrl+R` | Search command history interactively (FZF) |

### Custom Search Functions
| Shortcut | Action |
|----------|--------|
| `Ctrl+F` | Interactive ripgrep search (ZLE widget, prompts for query) |
| `Alt+F` | Interactive git grep search (ZLE widget, prompts for query) |

---

## FZF (Fuzzy Finder) Shortcuts

### File & Directory Search
| Shortcut | Action |
|----------|--------|
| `Ctrl+T` | Fuzzy find files (with preview) |
| `Alt+C` | Fuzzy find directories (with tree preview) |
| `Tab` | Fuzzy completion for any command |

### History Search
| Shortcut | Action |
|----------|--------|
| `Ctrl+R` | Fuzzy search command history |

---

## Git Integration Shortcuts

### FZF-Git Integration
| Shortcut | Action |
|----------|--------|
| `Ctrl+G` then `b` | Fuzzy find and checkout branches |
| `Ctrl+G` then `f` | Fuzzy find git files |
| `Ctrl+G` then `h` | Fuzzy find git hashes |
| `Ctrl+G` then `l` | Fuzzy find git reflogs |
| `Ctrl+G` then `r` | Fuzzy find git remotes |
| `Ctrl+G` then `s` | Fuzzy find git stashes |
| `Ctrl+G` then `t` | Fuzzy find git tags |
| `Ctrl+G` then `w` | Fuzzy find git worktrees |
| `Ctrl+G` then `?` | Show all fzf-git bindings |

### Forgit Commands (if installed)
| Command | Action |
|---------|--------|
| `gco` | Interactive branch checkout |
| `gcf` | Interactive file checkout |
| `grh` | Interactive HEAD reset |
| `glo` | Interactive git log |
| `gd` | Interactive git diff |
| `gi` | Interactive .gitignore generation |

---

## Search & Navigation Shortcuts

### Ripgrep Search
| Command | Action |
|---------|--------|
| `frg <query>` | Search all files with ripgrep + FZF (uses FZF styling) |
| `fuzzy-rg <query>` | Same as above (full function name) |

### Git Grep Search
| Command | Action |
|---------|--------|
| `fgg <query>` | Search git-tracked files with git grep + FZF (uses FZF styling) |
| `fuzzy-git-grep <query>` | Same as above (full function name) |

---

## Tmux Shortcuts

### Session Management
| Shortcut | Action |
|----------|--------|
| `Ctrl+A` | Tmux prefix (changed from default Ctrl+B) |
| `Ctrl+A` then `Ctrl+A` | Send prefix to application |

### Window Management
| Shortcut | Action |
|----------|--------|
| `Ctrl+A` then `c` | Create new window |
| `Ctrl+A` then `n` | Next window |
| `Ctrl+A` then `p` | Previous window |
| `Ctrl+A` then `0-9` | Switch to window number |
| `Ctrl+A` then `w` | List windows |
| `Ctrl+A` then `,` | Rename current window |
| `Ctrl+A` then `&` | Kill current window |

### Pane Management
| Shortcut | Action |
|----------|--------|
| `Ctrl+A` then `%` | Split pane vertically |
| `Ctrl+A` then `"` | Split pane horizontally |
| `Ctrl+A` then `h` | Select left pane |
| `Ctrl+A` then `j` | Select down pane |
| `Ctrl+A` then `k` | Select up pane |
| `Ctrl+A` then `l` | Select right pane |
| `Ctrl+A` then `Tab` | Switch to last used pane |
| `Ctrl+A` then `x` | Kill current pane |
| `Ctrl+A` then `z` | Toggle pane zoom |

### Copy Mode
| Shortcut | Action |
|----------|--------|
| `PageUp` | Enter copy mode and scroll up |
| `Ctrl+A` then `[` | Enter copy mode |
| `Home` | Move cursor to top of history (in copy mode) |
| `End` | Exit copy mode |
| `q` | Exit copy mode |

### Other Tmux Shortcuts
| Shortcut | Action |
|----------|--------|
| `Ctrl+A` then `r` | Reload tmux configuration |
| `Ctrl+A` then `y` | Toggle synchronized input across panes |
| `Ctrl+A` then `d` | Detach from session |

---

## Alacritty Terminal Shortcuts

### Text Navigation
| Shortcut | Action |
|----------|--------|
| `Alt+Left` | Move cursor backward by word |
| `Alt+Right` | Move cursor forward by word |
| `Ctrl+Backspace` | Delete word backward |

### Clipboard Operations
| Shortcut | Action |
|----------|--------|
| `Ctrl+V` | Paste from clipboard |
| `Ctrl+Shift+V` | Disabled (prevents conflicts) |
| `Shift+Insert` | Disabled (prevents conflicts) |

---

## History Navigation

### Zsh History Search
| Shortcut | Action |
|----------|--------|
| `↑` | Search history backward (starts with current prefix) |
| `↓` | Search history forward (starts with current prefix) |
| `Ctrl+R` | Interactive history search with FZF |

### History Configuration
- **History Size**: 999 commands
- **Save History**: 1000 commands
- **History File**: `~/.zhistory`
- **History Timestamps**: `yyyy-mm-dd` format

---

## Text Navigation

### Word Navigation
| Shortcut | Action |
|----------|--------|
| `Alt+Left` | Move backward by word |
| `Alt+Right` | Move forward by word |
| `Ctrl+Backspace` | Delete word backward |

### Line Navigation
| Shortcut | Action |
|----------|--------|
| `Ctrl+A` | Beginning of line |
| `Ctrl+E` | End of line |
| `Ctrl+B` | Backward one character |
| `Ctrl+F` | Forward one character |

---

## Useful Aliases

### Navigation
| Alias | Command |
|-------|---------|
| `..` | `cd ..` |
| `...` | `cd ../..` |
| `....` | `cd ../../..` |
| `.....` | `cd ../../../..` |
| `~` | `cd ~` |
| `-` | `cd -` |

### File Listing (eza/exa)
| Alias | Command |
|-------|---------|
| `ls` | `eza --icons=always` |
| `ll` | `eza -l` |
| `la` | `eza -la` |
| `lt` | `eza --tree` |
| `lta` | `eza --tree -a` |
| `ltg` | `eza --tree --git-ignore` |
| `llg` | `eza -l --git` |

### Zoxide (Smart CD)
| Alias | Command |
|-------|---------|
| `cd` | `z` (smart directory jumping) |
| `za` | `zoxide add` |
| `zr` | `zoxide remove` |
| `zq` | `zoxide query` |

### Search
| Alias | Command |
|-------|---------|
| `frg` | `fuzzy-rg` |
| `fgg` | `fuzzy-git-grep` |

### Configuration
| Alias | Command |
|-------|---------|
| `zshconfig` | `nano ~/.zshrc` |
| `reloadzsh` | `source ~/.zshrc` |

---

## Plugin Shortcuts

### Oh-My-Zsh Plugins
- **git**: Git aliases and functions
- **zsh-autosuggestions**: Gray suggestions (press `→` to accept)
- **zsh-syntax-highlighting**: Syntax highlighting
- **fzf**: Fuzzy finder integration
- **sudo**: Press `Esc` then `Enter` to add sudo to last command
- **extract**: Easy archive extraction

### Powerlevel10k
- Fast, feature-rich prompt
- Git status integration
- Customizable segments

---

## Tips & Tricks

1. **FZF Integration**: All searches use FZF with beautiful previews (styling handled by FZF)
2. **Smart CD**: Use `z <directory>` to jump to frequently used directories
3. **History Search**: Use `↑`/`↓` for prefix-based history search
4. **Git Workflow**: Use `Ctrl+G` followed by various keys for git operations
5. **Tmux Sessions**: Automatically attach to existing tmux session or create new one
6. **File Previews**: FZF shows file contents with syntax highlighting via `bat` (with fallback to `cat`)
7. **ZLE Widgets**: Interactive search uses proper ZLE widgets for better integration
8. **Alias Safety**: Search aliases (`frg`/`fgg`) don't conflict with system binaries

## Technical Notes

### ZLE Widgets
The interactive search functions use ZLE (Zsh Line Editor) widgets for better integration:
- `fzf-rg-widget`: Handles Ctrl+F for ripgrep search
- `fzf-git-grep-widget`: Handles Alt+F for git grep search
- Both widgets properly handle the command line state and redisplay

### Ripgrep Integration
- Uses `rg` with `--column --line-number --no-heading --smart-case` flags
- Lets FZF handle all styling and preview configuration
- Opens results in your default editor (`$EDITOR`) at the specific line
- Fallback to `cat` if `bat` preview fails

---

*Generated from your dotfiles configuration. Last updated: $(date)*
