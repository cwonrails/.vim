" Reuse current window to show fzf menu
let g:fzf_layout = { 'window': 'enew' }

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x>k <plug>(fzf-complete-word)
imap <c-x>f <plug>(fzf-complete-path)
imap <c-x>j <plug>(fzf-complete-file-ag)
imap <c-x>l <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

Shortcut (fzf) go to file in directory
      \ nnoremap <silent> <Space>ef :Files<Return>

Shortcut (fzf) go to file in git repository
      \ nnoremap <silent> <Space>eg :GFiles<Return>

Shortcut (fzf) go to file in git status
      \ nnoremap <silent> <Space>eG :GFiles?<Return>

Shortcut (fzf) go to buffer
      \ nnoremap <silent> <Space>eb :Buffers<Return>

Shortcut (fzf) apply colorscheme
      \ nnoremap <silent> <Space>ec :Colors<Return>

Shortcut (fzf) go to line in any file in directory
      \ nnoremap <silent> <Space>e? :Ag<Return>

Shortcut (fzf) go to line in any buffer
      \ nnoremap <silent> <Space>eL :Lines<Return>

Shortcut (fzf) go to line in buffer
      \ nnoremap <silent> <Space>el :BLines<Return>

Shortcut (fzf) go to ctag in any buffer
      \ nnoremap <silent> <Space>e] :Tags<Return>

Shortcut (fzf) go to ctags in buffer
      \ nnoremap <silent> <Space>e[ :Tags<Return>

Shortcut (fzf) go to mark in buffer
      \ nnoremap <silent> <Space>em :Marks<Return>

Shortcut (fzf) go to window
      \ nnoremap <silent> <Space>ew :Window<Return>

Shortcut (fzf) go to file in filesystem
      \ nnoremap <Space>e\ :Locate<Space>

Shortcut (fzf) go to file from history
      \ nnoremap <silent> <Space>eF :History<Return>

Shortcut (fzf) repeat command from history
      \ nnoremap <silent> <Space>e; :History:<Return>

Shortcut (fzf) repeat search from history
      \ nnoremap <silent> <Space>e/ :History/<Return>

Shortcut (fzf) go to git commit
      \ nnoremap <silent> <Space>eK :Commits<Return>

Shortcut (fzf) go to git commit for buffer
      \ nnoremap <silent> <Space>ek :BCommits<Return>

Shortcut (fzf) run command
      \ nnoremap <silent> <Space>e: :Commands<Return>

Shortcut (fzf) run mapping
      \ nnoremap <silent> <Space>eM :Maps<Return>

Shortcut (fzf) show help topic
      \ nnoremap <silent> <Space>eh :Helptags<Return>

Shortcut (fzf) apply filetype to buffer
      \ nnoremap <silent> <Space>eB :Filetypes<Return>
