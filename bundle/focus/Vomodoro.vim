let g:Pomo_ToDoTodayFilePath = expand('~/TODO')
let g:Pomo_ArchiveFilePath = expand('~/DONE')

Shortcut show pomodoro to-do's
      \ nnoremap <silent> <Space>td :PomodoroToDoToday<Return>

Shortcut go to pomodoro archive
      \ nnoremap <silent> <Space>tD :PomodoroOpenArchive<Return>
