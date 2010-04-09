" Define docsets to consider as related:
" filetype => list of docset name regexp
let g:dasht_filetype_docsets = {
      \ 'elixir': ['erlang'],
      \ 'html': ['css', 'js'],
      \ }

Shortcut (dasht) search related docsets at command prompt
      \ nnoremap <Leader>k :Dasht<Space>

Shortcut (dasht) search ALL the docsets at command prompt
      \ nnoremap <Leader><Leader>k :Dasht!<Space>

Shortcut (dasht) search related docsets for cursor word or selected text
      \ nnoremap <silent> <Leader>K :call Dasht([expand('<cWORD>'), expand('<cword>')])<Return>
      \|vnoremap <silent> <Leader>K y:<C-U>call Dasht(getreg(0))<Return>

Shortcut (dasht) search ALL the docsets for cursor word or selected text
      \ nnoremap <silent> <Leader><Leader>K :call Dasht([expand('<cWORD>'), expand('<cword>')], '!')<Return>
      \|vnoremap <silent> <Leader><Leader>K y:<C-U>call Dasht(getreg(0), '!')<Return>
