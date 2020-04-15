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
map <leader>n :call RenameFile()<cr>


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
