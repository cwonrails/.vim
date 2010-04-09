let test#strategy = 'dispatch'

Shortcut run test under cursor
      \ nnoremap <silent> <Space>!n :TestNearest<Return>

Shortcut run all tests in file
      \ nnoremap <silent> <Space>!f :TestFile<Return>

Shortcut run all tests in suite
      \ nnoremap <silent> <Space>!F :TestSuite<Return>

Shortcut repeat recent test run
      \ nnoremap <silent> <Space>!! :TestLast<Return>

Shortcut edit recently ran test
      \ nnoremap <silent> <Space>!v :TestVisit<Return>
