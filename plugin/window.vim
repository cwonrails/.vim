set splitright " focus new window after vertical splitting
set splitbelow " focus new window after horizontal splitting

Shortcut focus next window
      \ nnoremap <Space>nw <C-W>w

Shortcut focus previous window
      \ nnoremap <Space>Nw <C-W>W

Shortcut split window above
      \ nnoremap <silent> <Space>Ow :aboveleft split<Return>

Shortcut split window below
      \ nnoremap <silent> <Space>ow :belowright split<Return>

Shortcut split window left
      \ nnoremap <silent> <Space>iw :aboveleft vsplit<Return>

Shortcut split window right
      \ nnoremap <silent> <Space>aw :belowright vsplit<Return>

Shortcut close window
      \ nnoremap <silent> <Space>dw :close<Return>

Shortcut close other windows
      \ nnoremap <silent> <Space>Dw :only<Return>

Shortcut minimum window size
      \ nnoremap <silent> <Space><S :resize 1<Bar>vertical resize 1<Return>

Shortcut maximum window size
      \ nnoremap <silent> <Space>>S :resize<Bar>vertical resize<Return>
      \|nnoremap <silent> <Leader>1 :resize<Bar>vertical resize<Return>

" max out before equalizing to accomodate changes in screen resolution
Shortcut equal window sizes
      \ nnoremap <silent> <Space>=w :resize<Bar>vertical resize<Bar>wincmd =<Return>
      \|nnoremap <silent> <Leader>0 :resize<Bar>vertical resize<Bar>wincmd =<Return>

Shortcut minimum window height
      \ nnoremap <silent> <Space><H :resize 1<Return>

Shortcut minimum window width
      \ nnoremap <silent> <Space><W :vertical resize 1<Return>

Shortcut decrease window size
      \ nnoremap <silent> <Space><s :resize -1<Bar>vertical resize -1<Return>

Shortcut decrease window height
      \ nnoremap <silent> <Space><h :resize -1<Return>

Shortcut decrease window width
      \ nnoremap <silent> <Space><w :vertical resize -1<Return>

Shortcut increase window size
      \ nnoremap <silent> <Space>>s :resize +1<Bar>vertical resize +1<Return>

Shortcut increase window height
      \ nnoremap <silent> <Space>>h :resize +1<Return>

Shortcut increase window width
      \ nnoremap <silent> <Space>>w :vertical resize +1<Return>

Shortcut maximum window height
      \ nnoremap <silent> <Space>>H :resize<Return>

Shortcut maximum window width
      \ nnoremap <silent> <Space>>W :vertical resize<Return>
