" Deoplete doesn't work in standard Vim!
" We will use NeoComplete there instead.
if !has('nvim')
  let g:loaded_deoplete = 1
  finish
endif

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Use smartcase.
let g:deoplete#enable_smart_case = 1

" Less waiting.
let g:deoplete#auto_complete_delay = 50

" Collect keywords from buffers of any filetype.
let g:deoplete#buffer#require_same_filetype = 0

" <Tab>: completion.
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-N>" :
      \ "\<Tab>"

" <C-H>, <BS>: close popup and delete backword char.
inoremap <expr><C-H> deoplete#mappings#smart_close_popup()."\<C-H>"
inoremap <expr><BS>  deoplete#mappings#smart_close_popup()."\<C-H>"
