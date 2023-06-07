# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Add poetry path
export PATH=/home/david/Applications/poetry/bin:$PATH

# Add local bin path
export PATH=/home/david/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/david/.oh-my-zsh"

#Change time command format
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S'

ZSH_THEME="robbyrussell"

plugins=(history-substring-search zsh-autosuggestions zsh-syntax-highlighting poetry)

# Reassign ctrl-backspace to delete a word
bindkey "^h" backward-kill-word

alias rm='echo "Find another command to remove file that has a trash (e.g. trash-cli)."; false'
alias todo='rusty-todo --todo-dir /home/david/Projects/axceta/todo/'
todo ls

source $ZSH/oh-my-zsh.sh


autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
