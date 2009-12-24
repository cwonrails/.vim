" TLDR: Use <C-C> instead of <Esc> to always unambiguously exit insert mode!
"
" Why?  Because Alt-key combos and the arrow keys are compound sequences that
" contain <Esc>: this prevents Vim from easily recognizing a single <Esc> key
" from an embedded <Esc> that occurs as part of Alt-key combos or arrow keys.
" However, that does not mean recognition is impossible; see `:help ttimeout`.
"
" This file emulates `:set noesckeys` so that Vim recognizes Alt-key combos
" and arrow keys in insert mode.  This is necessary because `:set noesckeys`
" makes arrow keys insert "ABCD" on new lines instead of moving the cursor.

" don't bother with the following workarounds if `:set noesckeys` is enabled
if !&esckeys
  finish
endif

" immediately exit insert mode when <Esc> is pressed; don't wait for keycodes
set ttimeout ttimeoutlen=0

" Sometimes, even the ttimeoutlen=0 above is not enough for fast typists who
" type normal mode command keys like `u` (to undo) after exiting from insert
" mode with <Esc>, only to find that (1) they are still in insert mode and (2)
" their buffer now contains an accented Latin character like `õ` (from <A-U>)
" so the following escape from insert mode and replay the key in normal mode:

" Alt + lowercase
inoremap ð <C-C>p
inoremap ù <C-C>y
inoremap æ <C-C>f
inoremap ã <C-C>c
inoremap ç <C-C>g
inoremap ò <C-C>r
inoremap ì <C-C>l
inoremap á <C-C>a
inoremap ï <C-C>o
inoremap å <C-C>e
inoremap õ <C-C>u
inoremap é <C-C>i
inoremap ä <C-C>d
inoremap è <C-C>h
inoremap ô <C-C>t
inoremap î <C-C>n
inoremap ó <C-C>s
inoremap ñ <C-C>q
inoremap ê <C-C>j
inoremap ë <C-C>k
inoremap ø <C-C>x
inoremap â <C-C>b
inoremap í <C-C>m
inoremap ÷ <C-C>w
inoremap ö <C-C>v
inoremap ú <C-C>z

" Alt + uppercase
inoremap Ð <C-C>P
inoremap Ù <C-C>Y
inoremap Æ <C-C>F
inoremap Ã <C-C>C
inoremap Ç <C-C>G
inoremap Ò <C-C>R
inoremap Ì <C-C>L
inoremap Á <C-C>A
inoremap Ï <C-C>O
inoremap Å <C-C>E
inoremap Õ <C-C>U
inoremap É <C-C>I
inoremap Ä <C-C>D
inoremap È <C-C>H
inoremap Ô <C-C>T
inoremap Î <C-C>N
inoremap Ó <C-C>S
inoremap Ñ <C-C>Q
inoremap Ê <C-C>J
inoremap Ë <C-C>K
inoremap Ø <C-C>X
inoremap Â <C-C>B
inoremap Í <C-C>M
inoremap × <C-C>W
inoremap Ö <C-C>V
inoremap Ú <C-C>Z

" The same problem applies when Alt-key combos or arrow keys are typed while
" recording macros, so we apply the above workaround while playing them back:

let s:last_played_register = system('grep "^\".@" ~/.viminfo 2>/dev/null')[1]

" Plays the given macro register as if it were recorded under `:set noesckeys`
" by treating all <Esc> keys in the macro as <C-C> keys to exit insert mode.
function! PlayMacroNoEscKeys(register)
  let l:register = a:register == '@' ? s:last_played_register : a:register
  let l:original = getreg(l:register)
  try
    call setreg(l:register, substitute(l:original, "\e", "\3", 'g'))
    execute 'normal!' v:count1 . '@' . l:register
    let s:last_played_register = l:register
  finally
    call setreg(l:register, l:original)
  endtry
endfunction

" map @{0-9a-z".=*+} to emulate `:set noesckeys` while playing macro registers
for s:register in [    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
      \ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
      \ 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
      \ '"', '.', '*', '+', '@' ] " @ isn't a register but it will map @@ here
  execute 'nnoremap <silent> @' . s:register ':<C-U>call'
        \ 'PlayMacroNoEscKeys("' . escape(s:register, '"') . '")<Return>'
endfor
