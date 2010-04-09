let NERDSpaceDelims = 1 " pad comment delimiters

Shortcut comment using alternate delimiters
      \ map <Space>ca <Plug>NERDCommenterAltDelims

Shortcut uncomment
      \ map <Space>cu <Plug>NERDCommenterUncomment

Shortcut comment, aligning both delimiters
      \ map <Space>cb <Plug>NERDCommenterAlignBoth

Shortcut comment, aligning left delimiter
      \ map <Space>cl <Plug>NERDCommenterAlignLeft

Shortcut append comment at end of line
      \ map <Space>cA <Plug>NERDCommenterAppend

Shortcut yank and then comment
      \ map <Space>cy <Plug>NERDCommenterYank

Shortcut comment, sexily
      \ map <Space>cs <Plug>NERDCommenterSexy

Shortcut invert comment markers
      \ map <Space>ci <Plug>NERDCommenterInvert

Shortcut comment from cursor to end of line
      \ map <Space>c$ <Plug>NERDCommenterToEOL

Shortcut comment, nesting
      \ map <Space>cn <Plug>NERDCommenterNested

Shortcut comment, minimally
      \ map <Space>cm <Plug>NERDCommenterMinimal

Shortcut toggle comment markers
      \ map <Space>ct <Plug>NERDCommenterToggle

Shortcut comment
      \ map <Space>cc <Plug>NERDCommenterComment

Shortcut duplicate before cursor and then comment
      \ map <Space>cP  <Plug>NERDCommenterYank`[P

Shortcut duplicate after cursor and then comment
      \ map <Space>cp  <Plug>NERDCommenterYank`]p
