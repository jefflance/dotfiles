" File              : functions.vim
" Author            : Jeff LANCE <email@jefflance.me>
" Date              : 15.04.2015
" Last Modified Date: 28.04.2020
" Last Modified By  : Jeff LANCE <email@jefflance.me>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  _____ _   _ _   _  ____ _____ ___ ___  _   _ ____
" |  ___| | | | \ | |/ ___|_   _|_ _/ _ \| \ | / ___|
" | |_  | | | |  \| | |     | |  | | | | |  \| \___ \
" |  _| | |_| | |\  | |___  | |  | | |_| | |\  |___) |
" |_|    \___/|_| \_|\____| |_| |___\___/|_| \_|____/
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction


" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

" Count buffers
function! CountBuf()
  let bufcount = 0
  for buf in getbufinfo()
    let bufcount += 1
  endfor
  return bufcount
endfunction

" Test if current buffer is netrw buffer
function! IsNetrw()
  if (getbufvar('%', '&filetype') == "netrw" || bufname('%') =~ 'NetrwTreeListing')
    return 1
  endif
  return 0
endfunction

" Test if current buffer is empty
function! IsEmptyBuf()
  if (bufname('%') == '') 
    return 1
  endif
  return 0
endfunction

" Close current buffer
" If empty return to Startify
function! BufClose()
  if (IsEmptyBuf() || IsNetrw())
    Startify
  else
    bwipeout
  endif
endfunction


