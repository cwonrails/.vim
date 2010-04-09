Shortcut diff obtain hunk from left window
      \ nnoremap <silent> <Space>i% :diffget //2<Bar>diffupdate<Return>

Shortcut diff obtain hunk from right window
      \ nnoremap <silent> <Space>a% :diffget //3<Bar>diffupdate<Return>

Shortcut diff against original version
      \ nnoremap <silent> <Space>r% :DiffOrig<Return>

Shortcut diff put hunk into left window
      \ nnoremap <silent> <Space>P% :diffput //2<Bar>diffupdate<Return>

Shortcut diff put hunk into right window
      \ nnoremap <silent> <Space>p% :diffput //3<Bar>diffupdate<Return>
