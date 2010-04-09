" Restore cursor position after performing surround operations.
call operator#sandwich#set('all', 'all', 'cursor', 'keep')

" If you want to use vim-sandwich with vim-surround keymappings.
runtime macros/sandwich/keymap/surround.vim

Shortcut! S   surround {motion} or selection with specified delimiters
Shortcut! ys  yank {motion} and surround with specified delimiters
Shortcut! yS  yank line and surround with specified delimiters
Shortcut! ds  remove specified delimiters surrounding {motion}
Shortcut! dss remove automatic delimiters surrounding {motion}
Shortcut! cs  change specified delimiters surrounding {motion}
Shortcut! css change automatic delimiters surrounding {motion}

" Textobjects to select the nearest surrounded text automatically.
xmap iss <Plug>(textobj-sandwich-auto-i)
xmap ass <Plug>(textobj-sandwich-auto-a)
omap iss <Plug>(textobj-sandwich-auto-i)
omap ass <Plug>(textobj-sandwich-auto-a)

" Textobjects to select a text surrounded by same characters user input.
xmap im <Plug>(textobj-sandwich-literal-query-i)
xmap am <Plug>(textobj-sandwich-literal-query-a)
omap im <Plug>(textobj-sandwich-literal-query-i)
omap am <Plug>(textobj-sandwich-literal-query-a)
