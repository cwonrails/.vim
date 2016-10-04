" Restore cursor position after performing surround operations.
call operator#sandwich#set('all', 'all', 'cursor', 'keep')

" Dvorak friendly shortcuts inspired by tpope/vim-surround default shortcuts:
" normal Vim users would not sacrifice their precious "h" key for these maps,
" but I can because I use the Dvorak keyboard layout where HJKL doesn't exist.
"
" These shortcuts are based on the "macros/sandwich/keymap/surround.vim" file:
" the main difference is that "h" is used instead "s" and "S" as the shortcut.
" You can think of "h" mnemonically as a "hug", instead of "s" for "surround".
"
" https://github.com/machakann/vim-sandwich/wiki/Introduce-vim-surround-keymappings
"
let g:sandwich_no_default_key_mappings = 1
let g:operator_sandwich_no_default_key_mappings = 1
let g:textobj_sandwich_no_default_key_mappings = 1

Shortcut! h   surround {motion} or selection with specified delimiters
Shortcut! yh  yank {motion} and surround with specified delimiters
Shortcut! yH  yank line and surround with specified delimiters
Shortcut! dh  remove specified delimiters surrounding {motion}
Shortcut! dH  remove automatic delimiters surrounding {motion}
Shortcut! ch  change specified delimiters surrounding {motion}
Shortcut! cH  change automatic delimiters surrounding {motion}

" Yank while hugging.
nmap yh <Plug>(operator-sandwich-add)
onoremap <SID>line :normal! ^vg_<CR>

nmap <silent> yH <Plug>(operator-sandwich-add)<SID>line
onoremap <SID>gul g_

" Delete hug.
nmap dh <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap dH <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

" Change hug.
nmap ch <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap cH <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

" Hug.
xmap h  <Plug>(operator-sandwich-add)
nmap h  <Plug>(operator-sandwich-add)

Shortcut vim's original `h` key
      \ noremap <C-\>h h

" Repeat hug.
runtime autoload/repeat.vim
if hasmapto('<Plug>(RepeatDot)')
  nmap . <Plug>(operator-sandwich-predot)<Plug>(RepeatDot)
else
  nmap . <Plug>(operator-sandwich-dot)
endif

" Textobjects to select the nearest surrounded text automatically.
xmap iH <Plug>(textobj-sandwich-auto-i)
xmap aH <Plug>(textobj-sandwich-auto-a)
omap iH <Plug>(textobj-sandwich-auto-i)
omap aH <Plug>(textobj-sandwich-auto-a)

" Textobjects to select a text surrounded by same characters user input.
xmap ih <Plug>(textobj-sandwich-literal-query-i)
xmap ah <Plug>(textobj-sandwich-literal-query-a)
omap ih <Plug>(textobj-sandwich-literal-query-i)
omap ah <Plug>(textobj-sandwich-literal-query-a)
