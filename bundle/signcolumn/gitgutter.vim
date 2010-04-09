let g:gitgutter_map_keys = 0

omap ig <Plug>GitGutterTextObjectInnerPending
omap ag <Plug>GitGutterTextObjectOuterPending
xmap ig <Plug>GitGutterTextObjectInnerVisual
xmap ag <Plug>GitGutterTextObjectOuterVisual

Shortcut go to previous git hunk in buffer
      \ nmap [g <Plug>GitGutterPrevHunk

Shortcut go to next git hunk in buffer
      \ nmap ]g <Plug>GitGutterNextHunk

Shortcut git stage hunk at cursor
      \ nmap <Space>wg <Plug>GitGutterStageHunk

Shortcut git revert hunk at cursor
      \ nmap <Space>ug <Plug>GitGutterUndoHunk

Shortcut git preview hunk at cursor
      \ nmap <Space>pg <Plug>GitGutterPreviewHunk

Shortcut toggle git hunk signs
      \ nnoremap <silent> <Space>tg :GitGutterToggle<Return>

Shortcut toggle git hunk highlighting
      \ nnoremap <silent> <Space>tG :GitGutterLineHighlightsToggle<Return>
