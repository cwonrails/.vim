runtime bundle/shortcut/shortcut/autoload/shortcut.vim
runtime bundle/shortcut/shortcut/plugin/shortcut.vim

Shortcut show shortcut menu and run chosen shortcut
      \ noremap <silent> <Space><Space> :Shortcuts<Return>

Shortcut fallback to shortcut menu on partial entry
      \ noremap <silent> <Space> :Shortcuts<Return>
