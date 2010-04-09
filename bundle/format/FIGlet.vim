Shortcut! g@ decorate {motion} or selection as ASCII art using FIGlet

Shortcut comment as ASCII art using FIGlet
      \ nnoremap <silent> <Space>c@ V:call CommentUsingFIGlet()<Return>
      \|vnoremap <silent> <Space>c@ :<C-U>call CommentUsingFIGlet()<Return>

function! CommentUsingFIGlet() abort
  " run figlet and mark beginning of lines
  '<,'>FIGlet
  execute "normal! 0\<C-V>`]I.\<C-C>V`]"

  " comment-out the lines figlet'ed above
  execute "normal \<Plug>NERDCommenterComment"

  " remove the marks at beginning of lines
  execute "normal! f.\<C-V>`]f.x"
endfunction
