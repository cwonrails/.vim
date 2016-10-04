let g:tmux_navigator_no_mappings = 1

" See http://sunaku.github.io/tmux-select-pane.html
nnoremap <silent> <A-d> :TmuxNavigatePrevious<Return>
nnoremap <silent> <A-h> :TmuxNavigateLeft<Return>
nnoremap <silent> <A-t> :TmuxNavigateUp<Return>
nnoremap <silent> <A-n> :TmuxNavigateDown<Return>
nnoremap <silent> <A-s> :TmuxNavigateRight<Return>

" allow same keybindings to navigate from insert mode
imap <A-d> <Esc><A-d>
imap <A-h> <Esc><A-h>
imap <A-t> <Esc><A-t>
imap <A-n> <Esc><A-n>
imap <A-s> <Esc><A-s>

" allow same keybindings to navigate from terminal mode
if has('nvim')
  tmap <A-d> <Esc><A-d>
  tmap <A-h> <Esc><A-h>
  tmap <A-t> <Esc><A-t>
  tmap <A-n> <Esc><A-n>
  tmap <A-s> <Esc><A-s>
endif
