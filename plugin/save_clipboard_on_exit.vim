if exists('g:save_clipboard_on_exit')
  finish
endif
let g:save_clipboard_on_exit = 1

if has('autocmd')
  augroup save_clipboard_on_exit
    autocmd VimLeave * call save_clipboard_on_exit#save()
  augroup END
endif

