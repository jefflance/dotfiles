" File              : keybindings.vim
" Author            : Jeff LANCE <email@jefflance.me>
" Date              : 15.04.2015
" Last Modified Date: 06.09.2021
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

" Disable highlights when you press <leader><cr>:
map <silent> <leader><cr> :noh<cr>

" Enable folding with the spacebar
nnoremap <space> za

" Source current file
map <leader>s :echom 'Source file' <bar> :so %<cr>

" Two semicolons to escape
map  <leader>; <Esc>
map! <leader>; <Esc>

" Open a current file with sudo
" map <silent> <leader>E :e suda://%<cr>

" Save a current file with sudo
" map <silent> <leader>W :w suda://%<cr>

" Comment the target of a motion
map <silent> <leader>/ :Commentary<cr>

" Indent line
map <silent> <C-]> >>
map <silent> <C-[> <<

" (Re|Un)do
map <silent> <C-u> uu

" Save as
map <C-s> :saveas<space>
" -----
"  }}}


" Buffers {{{
" -----

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(
		\ <q-args>,
		\ fzf#vim#with_preview(
		\	{'options': ['--layout=reverse', '--info=inline']}
		\ ),
	\ <bang>0
	\ )
map <C-w> :echom 'Close buffer' <bar> :call BufClose()<cr>
map <C-o> :e<space>
map <C-n> :DashboardNewFile<cr>
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
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

" -----
"  }}}


" Defx {{{
" -----

map <silent> <f3> :Defx<cr>

function! s:defx_toggle_tree() abort
    " Open current file, or toggle directory expand/collapse
    if defx#is_directory()
        return defx#do_action('open_or_close_tree')
    endif
    return defx#do_action('drop')
endfunction

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  " nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')
  nnoremap <silent><buffer><expr> <cr>
  \   defx#is_directory() ?
	\   defx#do_action('open_directory') :
	\   defx#do_action('multi', ['drop', 'quit'])
  nnoremap <silent><buffer><expr> c
  \   defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \   defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \   defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \   defx#do_action('open')
  nnoremap <silent><buffer><expr> E
  \   defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \   defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> o
  \   defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K
  \   defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \   defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \   defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \   defx#do_action('toggle_columns',
  \                  'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \   defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \   defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \   defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \   defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \   defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \   defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \   defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \   defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \   defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \   defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \   defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \   defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \   defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \   line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \   line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \   defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \   defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \   defx#do_action('change_vim_cwd')
endfunction

" -----
"  }}}


" FZF {{{
" -----

map <C-f> :DashboardFindFile<cr>

" -----
"  }}}


" Header {{{
" -----

map <f4> :AddHeader<cr>

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
map <leader>r :call RenameFile()<cr>

" Open file under cursor
map <leader>o :call GotoFile("")<cr>

" Surround
map <leader>' S'<cr>
map <leader>" S"<cr>
map <leader>[ S[<cr>
map <leader>{ S{<cr>

" " Rewrap paragraph using <S-q>
" map <silent> <S-q> {gq}<Bar>:echo "Rewrapped paragraph"<CR>

" Git
map <leader>Gs :Git status<cr>
map <leader>Ga :Git add
map <leader>Gc :Git commit
" -----
"  }}}


" vim:ft=vim
