# Documentation: https://zsh.org

# Create required directory.
mkdir -p "$XDG_STATE_HOME/zsh"

# Configure history.
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
