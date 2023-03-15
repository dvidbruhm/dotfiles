Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_theme = 'dracula'
let g:airline_powerline_fonts = 0

let g:airline_skip_empty_sections = 1
"let g:airline_section_z = '%3p%% %#__accent_bold#%{g:airline_symbols.linenr} %3l%#__restore__#:%3v'
let g:airline_section_z = "%3p%% \ue0a1:%3l :%3c"
