let g:conflict_marker_enable_mappings = 0

Shortcut resolve merge conflict by keeping their version
      \ nnoremap <silent> <Space>Ct :ConflictMarkerThemselves<Return>

Shortcut resolve merge conflict by keeping our version
      \ nnoremap <silent> <Space>Co :ConflictMarkerOurselves<Return>

Shortcut resolve merge conflict by keeping both versions
      \ nnoremap <silent> <Space>Cb :ConflictMarkerBoth<Return>

Shortcut resolve merge conflict by removing both versions
      \ nnoremap <silent> <Space>Cn :ConflictMarkerNone<Return>
