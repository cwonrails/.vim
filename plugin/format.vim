set smarttab         " <Tab> indents with &shiftwidth
set autoindent       " automatically indent new lines
set formatoptions+=c " automatically wrap comment lines
set formatoptions+=n " automatically indent numbered lists
set formatoptions+=o " continue comment marker in new lines
set formatoptions+=j " delete comment character when joining
set textwidth=78     " hard-wrap long lines as you type them
set tabstop=8        " render TABs using this many spaces
set expandtab        " insert spaces when TAB is pressed
set softtabstop=2    " ... this many spaces
set shiftwidth=2     " indentation amount for < and > commands
set nrformats-=octal " no octal numbering for <C-A> and <C-X>

nnoremap Q gqip
vnoremap Q gq
onoremap Q gq

Shortcut indent with tabs in buffer
      \ nnoremap <silent> <Space>h<Tab> :call Shortcut_format_indent_tabs()<Return>

Shortcut indent with spaces in buffer
      \ nnoremap <silent> <Space>h<Space> :call Shortcut_format_indent_spaces()<Return>

Shortcut format as markdown title heading <h1>
      \ noremap <silent> <Space>h1 :call Shortcut_format_markdown_title()<Return>

Shortcut format as markdown section heading <h2>
      \ noremap <silent> <Space>h2 :call Shortcut_format_markdown_section()<Return>

Shortcut format as markdown table heading <th>
      \ noremap <silent> <Space>ht :call Shortcut_format_markdown_table_header()<Return>

Shortcut format as markdown fenced code block
      \ nnoremap <silent> <Space>hc V:<C-U>call Shortcut_format_markdown_fenced_code_block()<Return>
      \|vnoremap <silent> <Space>hc :<C-U>call Shortcut_format_markdown_fenced_code_block()<Return>

Shortcut format as separator, appending using equal signs
      \ nnoremap <silent> <Space>h= :call Shortcut_format_separator_using_equal_sign()<Return>

Shortcut format as separator, appending minus signs
      \ nnoremap <silent> <Space>h- :call Shortcut_format_separator_using_minus_sign()<Return>

Shortcut format as separator, repeating last character
      \ nnoremap <silent> <Space>h. :call Shortcut_format_separator_repeat_to_eol()<Return>

Shortcut toggle multi-line syntax at cursor
      \ nnoremap <silent> <Space>ha :ArgWrap<Return>

Shortcut cycle alternate syntax at cursor
      \ nnoremap <silent> <Space>hs :Switch<Return>

Shortcut format function call, adding parentheses
      \ nnoremap <silent> <Space>h) :call Shortcut_format_delimiters_add_funcall_parens(0)<Return>
      \|vnoremap <silent> <Space>h) :<C-U>call Shortcut_format_delimiters_add_funcall_parens(1)<Return>

Shortcut format function call, removing parentheses
      \ noremap <silent> <Space>h( :call Shortcut_format_delimiters_drop_funcall_parens()<Return>

Shortcut convert double to single quotes at cursor
      \ nnoremap <silent> <Space>h' :call Shortcut_format_quotes_double_to_single()<Return>

Shortcut convert single to double quotes at cursor
      \ nnoremap <silent> <Space>h" :call Shortcut_format_quotes_single_to_double()<Return>

Shortcut format ruby quotes to symbol at cursor
      \ nnoremap <silent> <Space>h: :call Shortcut_format_ruby_quotes_to_symbol()<Return>

Shortcut format ruby symbol to quotes at cursor
      \ nnoremap <silent> <Space>h; :call Shortcut_format_ruby_symbol_to_quotes()<Return>

Shortcut format elixir function call to pipeline at cursor
      \ nnoremap <silent> <Space>hP :call Shortcut_format_elixir_funcall_to_pipeline()<Return>

Shortcut format elixir pipeline to function call at cursor
      \ nnoremap <silent> <Space>hp :call Shortcut_format_elixir_pipeline_to_funcall()<Return>

Shortcut format elixir pipeline from multi to single-line at cursor
      \ nnoremap <silent> <Space>hJ :call Shortcut_format_elixir_join_pipeline(0)<Return>
      \|vnoremap <silent> <Space>hJ :<C-U>call Shortcut_format_elixir_join_pipeline(1)<Return>

Shortcut format elixir pipeline from single to multi-line at cursor
      \ nnoremap <silent> <Space>hj :call Shortcut_format_elixir_split_pipeline(0)<Return>
      \|vnoremap <silent> <Space>hj :<C-U>call Shortcut_format_elixir_split_pipeline(1)<Return>

" automatically adjust indentation style based on the buffer we are editing
autocmd BufReadPost * call s:DetectIndentationStyle()
function! s:DetectIndentationStyle()
  if search('^\t\+ *\S', 'ncw')
    call Shortcut_format_indent_tabs()
  else
    call Shortcut_format_indent_spaces()
  endif
endfunction

function! Shortcut_format_indent_tabs() abort
  setlocal noexpandtab softtabstop=8 shiftwidth=8
endfunction

function! Shortcut_format_indent_spaces() abort
  setlocal expandtab softtabstop=2 shiftwidth=2
endfunction

" format current line as a top-level heading in Markdown
" yyp:s/^\s*//<Return>Vr===:.+g/^\s*=\+\s*/d
function! Shortcut_format_markdown_title() abort
  let cursor = winsaveview()

  " duplicate current line into new separator line
  normal! yyp

  " strip leading whitespace from separator line
  s/^\s*//

  " make all characters "=" in separator line
  normal! Vr=

  " indent separator line to line up with title
  normal! ==

  " delete any previously existing separator line
  .+g/^\s*=\+\s*/d

  call winrestview(cursor)
endfunction

" format current line as a second-level heading in Markdown
" yyp:s/^\s*//<Return>Vr-==:.+g/^\s*-\+\s*/d
function! Shortcut_format_markdown_section() abort
  let cursor = winsaveview()

  " duplicate current line into new separator line
  normal! yyp

  " strip leading whitespace from separator line
  s/^\s*//

  " make all characters "-" in separator line
  normal! Vr-

  " indent separator line to line up with title
  normal! ==

  " delete any previously existing separator line
  .+g/^\s*-\+\s*/d

  call winrestview(cursor)
endfunction

" format current line as table/body separator in Markdown (uses `z marker)
function! Shortcut_format_markdown_table_header() abort
  let cursor = winsaveview()

  " duplicate current line into new separator line
  normal! yyp

  " strip leading whitespace from separator line
  left

  " make all characters "-" and "|" in separator line
  s/[^|]/-/g
  s/-|/ |/g
  s/|-/| /g

  " indent separator line to line up with title
  normal! ==

  " delete any previously existing separator line
  .+g/^\s*[|-]\+\s*/d

  call winrestview(cursor)
endfunction

" format selected Markdown indented code block into a fenced code block
" 2<']o<Esc>3i`<Esc>yy<C-O>PA
function! Shortcut_format_markdown_fenced_code_block() abort
  " remove markdown's 4-space indent for code blocks
  silent! '<,'>s/^ \{4}//

  " add a fence at bottom of code block
  normal! '>o
  normal! 3i`

  " add a fence at top of code block
  normal! yy'<P

  " enter insert mode to specify code block language
  startinsert!
endfunction

" insert or update section separator at end of current line
function! Shortcut_format_separator_using_equal_sign() abort
  normal! A=
  call Shortcut_format_separator_repeat_to_eol()
endfunction

" insert or update section separator at end of current line
function! Shortcut_format_separator_using_minus_sign() abort
  normal! A-
  call Shortcut_format_separator_repeat_to_eol()
endfunction

" repeat last character to the maximum width of current line
function! Shortcut_format_separator_repeat_to_eol() abort
  let last_search_register=@/
  try
    execute 's/.$/'. repeat('&', &textwidth+1) .'/'
    execute 's/\%>'. &textwidth .'v.//g'
  finally
    let @/=last_search_register
  endtry
endfunction

let s:insert_surround = "\<Plug>(operator-sandwich-add)"
let s:change_surround = "\<Plug>(operator-sandwich-replace)\<Plug>(operator-sandwich-release-count)\<Plug>(textobj-sandwich-query-a)"
let s:delete_surround = "\<Plug>(operator-sandwich-delete)\<Plug>(operator-sandwich-release-count)\<Plug>(textobj-sandwich-query-a)"

" surround function call arguments with parentheses
function! Shortcut_format_delimiters_add_funcall_parens(visual) abort
  let cursor = winsaveview()

  if !a:visual
    " select WORD under cursor
    normal! viW

    " extend back to any comma
    normal! o
    call search('[^(]\s\+\zs[^,]\+,', 'bcz')
  endif

  " surround the visual selection with parentheses
  execute 'normal '. s:insert_surround .'('

  call winrestview(cursor)
endfunction

" remove parentheses around function call arguments
function! Shortcut_format_delimiters_drop_funcall_parens() abort
  let cursor = winsaveview()
  execute 'normal '. s:delete_surround .'('
  execute 'normal! i '
  call winrestview(cursor)
endfunction

" convert from double quotes to single quotes
function! Shortcut_format_quotes_double_to_single() abort
  let cursor = winsaveview()
  execute 'normal '. s:change_surround ."\"'"
  call winrestview(cursor)
endfunction

" convert from single quotes to double quotes
function! Shortcut_format_quotes_single_to_double() abort
  let cursor = winsaveview()
  execute 'normal '. s:change_surround ."'\""
  call winrestview(cursor)
endfunction

" convert from single quotes to Ruby symbol notation
function! Shortcut_format_ruby_quotes_to_symbol() abort
  let cursor = winsaveview()
  execute 'normal '. s:delete_surround ."'"
  normal! i:
  call winrestview(cursor)
endfunction

" convert from Ruby symbol notation to single quotes
function! Shortcut_format_ruby_symbol_to_quotes() abort
  let cursor = winsaveview()
  normal! F:xve
  execute 'normal '. s:insert_surround ."'"
  call winrestview(cursor)
endfunction

" extract Elixir function call argument into a pipeline
function! Shortcut_format_elixir_funcall_to_pipeline() abort
  let cursor = winsaveview()

  " go to beginning of argument list
  normal! %

  " extract the very first argument
  " https://github.com/wellle/targets.vim
  normal daa

  " pipeline it into the function call
  execute "normal! BPa |> "

  " delete any comma that came with it
  normal! Bge
  execute 'silent! s/\%' . col('.') . 'c,\s*/ /'

  " delete leftover empty parentheses
  execute 'silent! s/\%>' . col('.') . 'c(\s*)//'

  call winrestview(cursor)
endfunction

" convert Elixir pipeline into a function call argument
function! Shortcut_format_elixir_pipeline_to_funcall() abort
  let cursor = winsaveview()

  " find nearest pipeline operator
  if search('|>', 'c', line('.')) || search('|>', 'cb', line('.'))
    " delete the pipeline operator
    normal! dw

    " delete space before operator
    normal! geldw

    " extract the pipeline stage
    if search('|>\s*', 'bse', line('.'))
      normal! ld`'
    else
      normal! d^
    endif

    " look for next pipeline stage
    if search('|>', 'c', line('.'))
      normal! ge
    else
      normal! E
    endif

    " create a brand new argument list
    normal! a()
    normal! P

    " merge with existing argument list
    if search(')(', 'be', line('.'))
      " extract new argument list
      normal! da)

      " prepend before old list
      call search(')', 'cb', line('.'))
      normal! %P

      " combine new & old lists
      normal! df(

      " add comma after new list
      if !search('\%' . col('.') .'c)', 'cn', line('.'))
        execute 'normal! i, '
      endif
    endif
  endif

  call winrestview(cursor)
endfunction

" join Elixir pipeline stages from multiple lines into a single line
function! Shortcut_format_elixir_join_pipeline(visual) abort
  let cursor = winsaveview()

  " operate on current paragraph by default
  if !a:visual
    normal! vip
  endif

  " join lines broken on pipeline operators
  silent! '<,'>s/\s*\n\s*\ze|>/ /
  normal! :

  call winrestview(cursor)
endfunction

" split Elixir pipeline from a single line into multiple stage lines
function! Shortcut_format_elixir_split_pipeline(visual) abort
  let cursor = winsaveview()

  " operate on current paragraph by default
  if !a:visual
    normal! vip
  endif

  " break pipeline operators onto new lines
  silent! '<,'>s/\ze|>/\r/g
  normal! =

  call winrestview(cursor)
endfunction
