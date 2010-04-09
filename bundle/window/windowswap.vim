let g:windowswap_map_keys = 0

Shortcut yank window
      \ nnoremap <silent> <Space>yw :call WindowSwap#MarkWindowSwap()<Return>

Shortcut paste window
      \ nnoremap <silent> <Space>pw :call WindowSwap#DoWindowSwap()<Return>
