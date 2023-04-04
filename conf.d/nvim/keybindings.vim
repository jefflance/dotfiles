" File              : keybindings.vim
" Author            : Jeff LANCE <email@jefflance.me>
" Date              : 15.04.2015
" Last Modified Date: 22.07.2022
" Last Modified By  : Jeff LANCE <email@jefflance.me>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  _  _________   ______ ___ _   _ ____ ___ _   _  ____ ____
" | |/ / ____\ \ / / __ )_ _| \ | |  _ \_ _| \ | |/ ___/ ___|
" | ' /|  _|  \ V /|  _ \| ||  \| | | | | ||  \| | |  _\___ \
" | . \| |___  | | | |_) | || |\  | |_| | || |\  | |_| |___) |
" |_|\_\_____| |_| |____/___|_| \_|____/___|_| \_|\____|____/
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Custom {{{
" -----

" For COC
" verbose imap <tab>

" Disable highlights when you press <leader><cr>:
map <silent> <leader><cr> :noh<cr>

" Enable folding with the spacebar
nnoremap <space> za

" Source current file
map <leader>s :echom 'Source file' <bar> :so %<cr>

" Two semicolons to escape
map  <leader>; <Esc>
map! <leader>; <Esc>

" Comment the target of a motion
map <silent> <leader>/ :Commentary<cr>

" Indent line
map <silent> <C-]> >>
map <silent> <C-[> <<

" (Re|Un)do
" map <silent> <C-u> uu

" Save as
map <C-s> :saveas<space>
" -----
"  }}}


" Buffers {{{
" -----

command -bang CloseBuffer :call CloseBuffer()

map <Leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
map <Leader>fd <cmd>lua require('telescope.builtin').find_files({ cwd = '/home/jeff/dotfiles' })<cr>
map <Leader>fh <cmd>lua require('telescope.builtin').oldfiles()<cr>
map <Leader>cn :echom 'Nouveau fichier' <bar> :DashboardNewFile<cr>
map <C-o> :e<space>
map <C-w> :echom 'Fermeture fichier' <bar> :CloseBuffer!<cr>
map <A-PageDown> :bn<cr>
map <A-PageUp> :bp<cr>

" -----
"  }}}


" Windows {{{
" -----

map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

" -----
"  }}}


" Dashboard {{{
" -----

nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>

" -----
"  }}}


" -----
"  }}}


" Header {{{
" -----

map <f4> :AddHeader<cr>

" -----
"  }}}


" Markdown {{{
" -----

map <leader>mp :! pandoc "%" -o "%:r".pdf && zathura "%:r".pdf<cr>

" -----
"  }}}


" Vimroom {{{
" -----

nnoremap <silent> <leader>z :Goyo<cr>

" -----
"  }}}


" Vimux {{{
" -----

map <Leader>vp :VimuxPromptCommand<cr>
" map <Leader>vr :VimuxRunCommand<cr>
" map <Leader>vo :VimuxOpenRunner<cr>

" -----
"  }}}


" Functions {{{
" -----

" Renaming
map <leader>fr :call RenameFile()<cr>

" Open file under cursor
map <leader>foc :call GotoFile("")<cr>

" Surround
map <leader>' S'<cr>
map <leader>" S"<cr>
map <leader>[ S[<cr>
map <leader>{ S{<cr>
map <leader>( S(<cr>

" " Rewrap paragraph using <S-q>
" map <silent> <S-q> {gq}<Bar>:echo "Rewrapped paragraph"<CR>

" Git
map <leader>Gs :Git status<cr>
map <leader>Ga :Git add
map <leader>Gc :Git commit
" -----
"  }}}


" vim:ft=vim
