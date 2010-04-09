Shortcut close tab
      \ nnoremap <silent> <Space>dt :tabclose<Return>

Shortcut close other tabs
      \ nnoremap <silent> <Space>Dt :tabonly<Return>

Shortcut go to first tab
      \ nnoremap <silent> <Space>gt :tabfirst<Return>

Shortcut go to next tab
      \ nnoremap <silent> <Space>nt :tabnext<Return>

Shortcut go to previous tab
      \ nnoremap <silent> <Space>Nt :tabprevious<Return>

Shortcut go to last tab
      \ nnoremap <silent> <Space>Gt :tablast<Return>

Shortcut move tab to first place
      \ nnoremap <silent> <Space>^t :tabmove 0<Return>

Shortcut move tab to last place
      \ nnoremap <silent> <Space>$t :tabmove $<Return>

Shortcut move tab left
      \ nnoremap <silent> <Space><t :tabmove -1<Return>

Shortcut move tab right
      \ nnoremap <silent> <Space>>t :tabmove +1<Return>

Shortcut insert new tab in first place
      \ nnoremap <silent> <Space>It :0tabnew<Return>

Shortcut append new tab in last place
      \ nnoremap <silent> <Space>At :$tabnew<Return>

Shortcut insert new tab
      \ nnoremap <silent> <Space>it :-tabnew<Return>

Shortcut append new tab
      \ nnoremap <silent> <Space>at :tabnew<Return>

for i in range(1,9)
  execute 'Shortcut go to tab number '. i .' '
        \ 'nnoremap <silent> <Space>'. i .' :tabfirst<Bar>'. i .'tabnext<Return>'
endfor
