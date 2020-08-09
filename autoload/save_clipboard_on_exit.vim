function! save_clipboard_on_exit#save() abort
  if exists('$WAYLAND_DISPLAYD')
    return
  endif
  if !exists('$DISPLAY') || !has('clipboard')
    return
  endif

  if executable('xsel')
    if &clipboard =~# '\<unnamed\>'
      call system("xsel -i --clipboard", getreg('*'))
    endif
    if &clipboard =~# '\<unnamedplus\>'
      call system("xsel -i --primary", getreg('+'))
    endif
  elseif executable('xclip')
    if &clipboard =~# '\<unnamed\>'
      call system("xclip -i -selection clipboard", getreg('*'))
    endif
    if &clipboard =~# '\<unnamedplus\>'
      call system("xclip -i -selection primary", getreg('+'))
    endif
  endif
endfunction

