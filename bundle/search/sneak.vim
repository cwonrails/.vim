let g:sneak#prompt = 'Sneak> '
let g:sneak#streak = 1
" let g:sneak#target_labels = 'aoeuidhtnspyfgcrl/;qjkxbmwvzAOEUIDHTNSPYFGCRL?:QJKXBMWVZ'
" let g:sneak#target_labels = 'aoeuidhtnspyfgcrlqjkxbmwvzAOEUIDHTNSPYFGCRLQJKXBMWVZ'
" let g:sneak#target_labels = "aoeuidhtns-',.pyfgcrl/;qjkxbmwvzAOEUIDHTNS_\"<>PYFGCRL?:QJKXBMWVZ"
let g:sneak#target_labels = "aoeuidhtns',.pyfgcrl/;qjkxbmwvzAOEUIDHTNS\"<>PYFGCRL?:QJKXBMWVZ"

Shortcut! s (sneak) go to {characters} in text after cursor
Shortcut! S (sneak) go to {characters} in text before cursor

Shortcut! - (sneak) repeat the most recent Sneak forward
nmap - <Plug>SneakNext
omap - <Plug>SneakNext
xmap - <Plug>SneakNext
noremap <C-\>- -

Shortcut! _ (sneak) repeat the most recent Sneak backward
nmap _ <Plug>SneakPrevious
omap _ <Plug>SneakPrevious
xmap _ <Plug>SneakPrevious
noremap <C-\>_ _

" replace 'f' with 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

" replace 't' with 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T
