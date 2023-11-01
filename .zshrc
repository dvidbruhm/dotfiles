# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Add poetry path
export PATH=/home/david/Applications/poetry/bin:$PATH

# Add azure-cli to path
export PATH=/home/david/Applications/azure-functions-cli/:$PATH

# Add flutter path
export PATH=/home/david/Applications/flutter/bin/:$PATH

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

alias work='kitty --session ~/.config/kitty/work.session --detach; exit'
alias perso='kitty --session ~/.config/kitty/personal.session --detach; exit'

source $ZSH/oh-my-zsh.sh
setopt completealiases


autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/david/Applications/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/david/Applications/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/david/Applications/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/david/Applications/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$RUN"
