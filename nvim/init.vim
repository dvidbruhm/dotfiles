" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:plugged_home = '~/.vim/plugged'
call plug#begin(g:plugged_home)

source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/doge.vim
source ~/.config/nvim/plugins/dracula.vim
source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/polyglot.vim
source ~/.config/nvim/plugins/quickscope.vim
source ~/.config/nvim/plugins/smoothie.vim
source ~/.config/nvim/plugins/fzf.vim
Plug 'linty-org/key-menu.nvim'
call plug#end()
doautocmd User PlugLoaded

source ~/.config/nvim/general.vim
