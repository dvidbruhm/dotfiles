" Add true colors
if (has('termguicolors'))
  set termguicolors
endif

""" BASIC STYLING
syntax enable
set background=dark

" Split delimitations colors and style
set fillchars+=vert:\▏
hi VertSplit gui=None
hi StatusLineNC gui=underline
hi StatusLine gui=underline,standout

" Tab line style
hi TabLineFill gui=None guifg=None guibg=None cterm=None ctermfg=None ctermbg=None
hi TabLineSel gui=reverse cterm=reverse
hi TabLine gui=None guifg=None guibg=None cterm=None ctermfg=None ctermbg=None
hi Title gui=None guifg=None guibg=None cterm=None ctermfg=None ctermbg=None

" Error highlighting color:
"highlight Error cterm=None ctermbg=DarkRed ctermfg=None

" Line number color
"highlight LineNr cterm=None ctermfg=blue ctermbg=None


""" GENERAL CONFIGS

" Set tabs to 4 spaces
set ts=4 sw=4
set expandtab

" Set mouse navigation
set mouse=a

" Set scroll distance to bottom/top
set scrolloff=8
set sidescrolloff=8

" Set line numbering
set number

" Set all yank and paste to copy/paste to normal 
" clipboard (same as ctrl-c/ctrl-v)
set clipboard=unnamedplus

""" Set persisent undo (can undo even after closing file)
""" and put files created for undos under "undodir/" in nvim's
""" config path
let vimDir = '$HOME/.config/nvim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif




""" YAML
" Enable yaml 2 width tab
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2




""" HOTKEYS

" Set tab and shift-tab to indent/unindent in visual mode
vmap <Tab> >gv
vmap <S-Tab> <gv

" Set shift-up/down to move half a screen
" Don't set when using vim-smoothie
"nnoremap <S-Up> <C-u>
"nnoremap <S-Down> <C-d>

" Remap leader key to space
nnoremap <SPACE> <Nop>
map <Space> <Leader>

" Go to file in new tab
nnoremap gf <C-W>gf

" Reload config
nnoremap <silent> <Leader><Leader> :source $MYVIMRC<cr>

""" FILE EXPLORER
" Settings for the default nvim file explorer
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 10
map , :Lexplore<CR>

" Clear diagnostic column background
hi SignColumn ctermbg=None
hi clear SignColumn
