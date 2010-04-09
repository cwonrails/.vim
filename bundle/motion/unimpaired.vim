"-----------------------------------------------------------------------------
" NEXT AND PREVIOUS                               *unimpaired-next*
"-----------------------------------------------------------------------------

Shortcut! [a       go to previous argument
Shortcut! ]a       go to next     argument
Shortcut! [A       go to first    argument
Shortcut! ]A       go to last     argument
Shortcut! [b       go to previous buffer
Shortcut! ]b       go to next     buffer
Shortcut! [B       go to first    buffer
Shortcut! ]B       go to last     buffer
Shortcut! [l       go to previous location
Shortcut! ]l       go to next     location
Shortcut! [L       go to first    location
Shortcut! ]L       go to last     location
Shortcut! [<C-L>   go to previous file with locations
Shortcut! ]<C-L>   go to next     file with locations
Shortcut! [q       go to previous quickfix
Shortcut! ]q       go to next     quickfix
Shortcut! [Q       go to first    quickfix
Shortcut! ]Q       go to last     quickfix
Shortcut! [<C-Q>   go to previous file with quickfixes
Shortcut! ]<C-Q>   go to next     file with quickfixes
Shortcut! [t       go to previous ctag
Shortcut! ]t       go to next     ctag
Shortcut! [T       go to first    ctag
Shortcut! ]T       go to last     ctag

Shortcut! [f       go to previous file in current file's directory
Shortcut! ]f       go to next     file in current file's directory

Shortcut! [n       go to previous conflict marker or diff/patch hunk
Shortcut! ]n       go to next     conflict marker or diff/patch hunk

"-----------------------------------------------------------------------------
" LINE OPERATIONS                                 *unimpaired-lines*
"-----------------------------------------------------------------------------

Shortcut! [<Space> Add [count] blank lines above the cursor.
Shortcut! ]<Space> Add [count] blank lines below the cursor.

Shortcut! [e       Exchange current line with [count] lines above it.
Shortcut! ]e       Exchange current line with [count] lines below it.

"-----------------------------------------------------------------------------
" OPTION TOGGLING                                 *unimpaired-toggling*
"-----------------------------------------------------------------------------

function! s:describe_option_shortcuts(key, description) abort
  execute 'Shortcut! [o'. a:key 'enable'  a:description
  execute 'Shortcut! ]o'. a:key 'disable' a:description
  execute 'Shortcut! co'. a:key 'toggle'  a:description
endfunction

call s:describe_option_shortcuts('b', "assuming light background")
call s:describe_option_shortcuts('c', "highlighting cursor's line")
call s:describe_option_shortcuts('d', "diffing with current buffer")
call s:describe_option_shortcuts('h', "highlighting search results")
call s:describe_option_shortcuts('i', "ignoring case sensitivity")
call s:describe_option_shortcuts('l', "listing nonprintable characters")
call s:describe_option_shortcuts('n', "absolute line numbering")
call s:describe_option_shortcuts('r', "relative line numbering")
call s:describe_option_shortcuts('s', "checking for misspelled words")
call s:describe_option_shortcuts('u', "highlighting cursor's column")
call s:describe_option_shortcuts('v', "constraining cursor to line")
call s:describe_option_shortcuts('w', "wrapping very long lines")
call s:describe_option_shortcuts('x', "highlighting cursor's position")

"-----------------------------------------------------------------------------
" PASTING                                         *unimpaired-pasting*
"-----------------------------------------------------------------------------

Shortcut! >p       Paste after  cursor, linewise, increasing indent.
Shortcut! >P       Paste before cursor, linewise, increasing indent.
Shortcut! <p       Paste after  cursor, linewise, decreasing indent.
Shortcut! <P       Paste before cursor, linewise, decreasing indent.
Shortcut! =p       Paste after  cursor, linewise, reindenting.
Shortcut! =P       Paste before cursor, linewise, reindenting.

Shortcut! [p       Paste after  cursor, linewise.
Shortcut! ]p       Paste before cursor, linewise.

Shortcut! yo       Paste after  cursor, linewise, using set 'paste'.
Shortcut! yO       Paste before cursor, linewise, using set 'paste'.

"-----------------------------------------------------------------------------
" ENCODING AND DECODING                           *unimpaired-encoding*
"-----------------------------------------------------------------------------

Shortcut! [x       XML escape.
Shortcut! ]x       XML unescape.
Shortcut! [xx      XML escape current line.
Shortcut! ]xx      XML unescape current line.

Shortcut! [u       URL escape.
Shortcut! ]u       URL unescape.
Shortcut! [uu      URL escape current line.
Shortcut! ]uu      URL unescape current line.

Shortcut! [y       String escape.
Shortcut! ]y       String unescape.
Shortcut! [yy      String escape current line.
Shortcut! ]yy      String unescape current line.
