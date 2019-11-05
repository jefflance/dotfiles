"""""""""""""""""""""""""""""""""""""""""""
"  ____   ____ ____  ___ ____ _____ ____  
" / ___| / ___|  _ \|_ _|  _ \_   _/ ___| 
" \___ \| |   | |_) || || |_) || | \___ \ 
"  ___) | |___|  _ < | ||  __/ | |  ___) |
:" |____/ \____|_| \_\___|_|    |_| |____/ 
"
"""""""""""""""""""""""""""""""""""""""""""
"
" File opening scripts using DMenu
"
" Strip the newline from the end of a string
function! Chomp(str)
  return substitute(a:str, '\n$', '', '')
endfunction

" Find a file and pass it to cmd
function! DmenuOpen(cmd)
  let fname = Chomp(system("git ls-files | dmenu -i -l 20 -p " . a:cmd))
  if empty(fname)
    return
  endif
  execute a:cmd . " " . fname
endfunction



