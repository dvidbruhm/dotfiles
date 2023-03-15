Plug 'unblevable/quick-scope'
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

augroup qs_colors
  autocmd!
  autocmd ColorScheme dracula highlight QuickScopePrimary guifg='#50FA7B' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme dracula highlight QuickScopeSecondary guifg='#FF5555' gui=underline ctermfg=81 cterm=underline
augroup END
