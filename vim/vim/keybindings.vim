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
" Disable highlights when you press <leader><cr>:
map <silent> <leader><cr> :noh<cr>

"
" Tabs
"
set hidden
nnoremap <silent> <C-w> :tabclose<cr>
nnoremap <silent> <C-t> :tabe<cr>
nnoremap <C-n> :tabnext<cr>
nnoremap <C-p> :tabprevious<cr>


"
" Functions
"

" Renaming
map <leader>rn :call RenameFile()<cr>

" Windows move
map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

"
" NERDTree
"
" Trigger configuration
map <f2> :NERDTreeToggle<CR>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>


"
" CtrlP
"
map <silent> <C-f> :CtrlPMixed<cr>

"
" Vimroom
"
nnoremap <silent> <leader>z :Goyo<cr>


"
" Vimux
"
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vz :VimuxZoomRunner<CR>
