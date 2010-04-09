" allow virtual editing in visual block mode
set virtualedit+=block

" visually select most recently pasted text
nnoremap gV `[v`]

" emulate nearest search selection in old Vim
if v:version < 704
  nnoremap gn //e<Return>v??<Return>
  nnoremap gN ??e<Return>v??<Return>
endif

Shortcut visually select buffer
      \ nnoremap <Space>vb m'ggVG

