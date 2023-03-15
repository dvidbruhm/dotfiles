Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

let g:fzf_layout = { 'up': '~90%', 'window': { 'width': 0.8, 'height': 0.8, 'yoffset':0.5, 'xoffset': 0.5 } }
let $FZF_DEFAULT_OPTS='--reverse --color border:#BD93F9' " Dracula nice purple
let g:fzf_action = {
\ 'enter': 'tab split',
\ 'ctrl-x': 'vsplit',
\ 'ctrl-z': 'split' }

" Add an AllFiles variation that ignores .gitignore files
command! -bang -nargs=? -complete=dir AllFiles
    \ call fzf#run(fzf#wrap('allfiles', fzf#vim#with_preview({ 'dir': '~/', 'sink': 'e', 'source': 'rg --files' }), <bang>0))

nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>F :AllFiles<CR>
nnoremap <silent> <leader>r :Rg<CR>
