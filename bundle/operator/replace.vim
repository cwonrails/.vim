Shortcut vim's original replace mode
      \ noremap <C-\>R R

Shortcut replace {motion} with register value
      \ nmap R <Plug>ReplaceOperator
      \|vmap R <Plug>ReplaceOperator

Shortcut replace line with register value
      \ nmap RR 0R$

Shortcut exchange {motion} with register value
      \ nmap <Leader>R <Plug>ExchangeOperator
      \|vmap <Leader>R <Plug>ExchangeOperator
