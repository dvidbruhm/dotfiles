# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/david/.oh-my-zsh"

#Change time command format
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S'

ZSH_THEME="robbyrussell"

plugins=(history-substring-search zsh-autosuggestions zsh-syntax-highlighting)

# Reassign ctrl-backspace to delete a word
bindkey "^h" backward-kill-word

alias rm='echo "Find another command to remove file that has a trash (e.g. trash-cli)."; false'

source $ZSH/oh-my-zsh.sh

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc
