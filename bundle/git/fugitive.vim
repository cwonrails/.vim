if exists('*fugitive#statusline')
  set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
endif

" https://github.com/tpope/vim-fugitive/pull/90
autocmd QuickFixCmdPost *grep* cwindow

Shortcut git grep files in repository
      \ nnoremap <Space>/g :Ggrep ''<Left>

Shortcut git rename file
      \ nnoremap <silent> <Space>xg :call feedkeys(":Gmove %\t", 't')<Return>

Shortcut git rename file forcefully
      \ nnoremap <silent> <Space>Xg :call feedkeys(":Gmove! %\t", 't')<Return>

Shortcut git blame file
      \ nnoremap <silent> <Space>Lg :Gblame<Return>

Shortcut git commit changes
      \ nnoremap <silent> <Space>ag :Gcommit<Return>

Shortcut amend git commit
      \ nnoremap <silent> <Space>Ag :Gcommit --amend<Return>

Shortcut git diff file
      \ nnoremap <silent> <Space>%g :Gdiff<Return>

Shortcut git revert buffer
      \ nnoremap <silent> <Space>Eg :Gedit<Return>

Shortcut git revert file
      \ nnoremap <silent> <Space>rg :Gread<Return>

Shortcut git revert file forcefully
      \ nnoremap <silent> <Space>Rg :Gread!<Return>

Shortcut git status
      \ nnoremap <silent> <Space>`g :Gstatus<Return>

Shortcut git add all changes in buffer
      \ nnoremap <silent> <Space>Wg :Gwrite!<Return>

Shortcut git remove file
      \ nnoremap <silent> <Space>dg :Gremove<Bar>bdelete<Return>

Shortcut git remove file forcefully
      \ nnoremap <silent> <Space>Dg :Gremove!<Bar>bdelete<Return>
