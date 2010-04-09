let g:slimux_enable_close_with_esc = 0 " else arrow keys close it

Shortcut (slimux) choose target pane
      \ nnoremap <silent> <Space>ox :SlimuxREPLConfigure<Return>

Shortcut (slimux) send buffer to target pane
      \ nnoremap <silent> <Space>Wx :SlimuxREPLSendBuffer<Return>

Shortcut (slimux) send line or selection to target pane
      \ nnoremap <silent> <Space>wx :SlimuxREPLSendLine<Return>
      \|vnoremap <silent> <Space>wx :SlimuxREPLSendSelection<Return>
