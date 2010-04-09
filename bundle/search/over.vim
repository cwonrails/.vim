Shortcut interactive search and replace
      \ nnoremap <silent> <Space>& :OverCommandLine %S/<Return>
      \|vnoremap <silent> <Space>& :<C-U>OverCommandLine '<,'>S/<Return>

Shortcut interactive search and replace for word at cursor
      \ nnoremap <silent> <Space>* :execute 'OverCommandLine %S/' . expand('<cword>')<Return>
      \|vnoremap <silent> <Space>* :<C-U>execute "OverCommandLine '<,'>%S/" . expand('<cword>')<Return>
