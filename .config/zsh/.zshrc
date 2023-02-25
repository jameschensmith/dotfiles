# Documentation: https://zsh.org

# Source additional POSIX shell scripts.
for file in "$XDG_CONFIG_HOME"/shell/*.sh; do
	source "$file";
done

# Create required directories.
mkdir -p "$XDG_STATE_HOME/zsh" "$XDG_CACHE_HOME/zsh"

# Configure history.
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY

# Configure autocompletion.
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"
