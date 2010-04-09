" make TODO keywords stand out
highlight! link Todo WarningMsg

" make spelling errors stand out
if !has('gui_running')
  highlight! link SpellBad   Pmenu
  highlight! link SpellCap   PmenuSbar
  highlight! link SpellLocal PmenuThumb
  highlight! link SpellRare  WildMenu
endif

" make comments stand out more
" highlight Comment ctermfg=102 guifg=#878787
" highlight Comment ctermfg=145 guifg=#afafaf
highlight Comment ctermfg=146 guifg=#afafdf

" unite.vim search candidate highlighting
highlight link uniteCandidateInputKeyword MoreMsg

" LimeLight support
let g:limelight_conceal_ctermfg = 241

" FZF support
let g:fzf_colors =
\ { 'fg':      ['fg', 'Pmenu'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Search'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Identifier'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Search'],
  \ 'info':    ['fg', 'Type'],
  \ 'prompt':  ['fg', 'Title'],
  \ 'pointer': ['fg', 'Constant'],
  \ 'marker':  ['fg', 'Special'],
  \ 'spinner': ['fg', 'Keyword'],
  \ 'header':  ['fg', 'Comment'] }
