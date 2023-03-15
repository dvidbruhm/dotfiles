Plug 'dracula/vim', { 'as': 'dracula' }

augroup DraculaOverrides
    autocmd!
"    autocmd ColorScheme dracula hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#204a87 gui=NONE
"    autocmd ColorScheme dracula hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#BD93F9  gui=NONE
    autocmd ColorScheme dracula hi Normal guibg=NONE ctermbg=NONE
    autocmd User PlugLoaded ++nested colorscheme dracula
augroup end
