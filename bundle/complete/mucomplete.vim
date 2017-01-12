if has('nvim')
  let g:loaded_mucomplete = 1
  finish
endif

let g:mucomplete#enable_auto_at_startup = 1

set completeopt+=noinsert,noselect

let g:mucomplete#chains = {}
"default: let g:mucomplete#chains.default = ['file', 'omni', 'keyn', 'dict']
let g:mucomplete#chains.default = ['file', 'omni', 'keyn', 'dict', 'c-n']
"default: let g:mucomplete#chains.vim = ['file', 'cmd', 'keyn']
let g:mucomplete#chains.vim = ['file', 'cmd', 'keyn', 'c-n']
