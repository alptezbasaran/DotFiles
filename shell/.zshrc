# ~/.zshrc – improved and commented

# Oh-My-Zsh configuration path
export ZSH="$HOME/.oh-my-zsh"

# Theme selection: "robbyrussell" is clean and fast
ZSH_THEME="robbyrussell"

# Plugins (keep minimal for performance)
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  z
)

# Source Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# User-defined configuration

# Preferred editor (uncomment and adjust if desired)
# export EDITOR="nano"

# Compilation flags (uncomment if needed)
# export ARCHFLAGS="-arch x86_64"

# Useful Aliases
alias zshconfig="nano ~/.zshrc"
alias reloadzsh="source ~/.zshrc"

# >>> Micromamba/Conda Initialization >>>
if command -v micromamba >/dev/null 2>&1; then
    # Use micromamba if available (fast, standalone)
    eval "$(micromamba shell hook --shell zsh)"
elif command -v conda >/dev/null 2>&1; then
    # Fall back to Anaconda/Miniconda
    eval "$(conda shell.zsh hook)"
fi
# <<< Conda Initialization <<<

# macOS-specific tweaks ------------------------------------------------------

# Load per-OS overrides if present (~/.zshrc.d/<os>.zsh)
case "$OSTYPE" in
  darwin*) [[ -f "$HOME/.zshrc.d/macos.zsh" ]]  && source "$HOME/.zshrc.d/macos.zsh" ;;
  linux*)  [[ -f "$HOME/.zshrc.d/linux.zsh" ]] && source "$HOME/.zshrc.d/linux.zsh" ;;
esac

# Intel oneAPI initialization (compilers, MKL, MPI, SYCL)
[ -f "/opt/intel/oneapi/setvars.sh" ] && source "/opt/intel/oneapi/setvars.sh"

# Additional recommended environment optimizations

# Speed up pasting
DISABLE_MAGIC_FUNCTIONS="true"

# Faster prompt (disable auto-title if unnecessary)
DISABLE_AUTO_TITLE="true"

# Command auto-correction
ENABLE_CORRECTION="true"

# Improve completion visuals (optional)
COMPLETION_WAITING_DOTS="true"

# Reduce git prompt overhead in large repos
DISABLE_UNTRACKED_FILES_DIRTY="true"

# History timestamp (uncomment to activate)
# HIST_STAMPS="yyyy-mm-dd"

# Explicit language setting (optional)
# export LANG=en_US.UTF-8
