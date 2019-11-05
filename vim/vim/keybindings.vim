"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  _  _________   ______ ___ _   _ ____ ___ _   _  ____ ____
" | |/ / ____\ \ / / __ )_ _| \ | |  _ \_ _| \ | |/ ___/ ___|
" | ' /|  _|  \ V /|  _ \| ||  \| | | | | ||  \| | |  _\___ \
" | . \| |___  | | | |_) | || |\  | |_| | || |\  | |_| |___) | 
" |_|\_\_____| |_| |____/___|_| \_|____/___|_| \_|\____|____/
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" Custom
"

"
" NERDTree
"
" Trigger configuration
map <f2> :NERDTreeToggle<CR>

"
" UltiSnips
"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"
" DMenu file opening
"
map <c-t> :call DmenuOpen("tabe")<CR>
map <c-f> :call DmenuOpen("e")<CR>
