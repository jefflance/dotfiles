" File              : keybindings.vim
" Author            : Jeff LANCE <email@jefflance.me>
" Date              : 15.04.2015
" Last Modified Date: 24.06.2020
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
imap ;; <Esc>

" Open a current file with sudo
map <silent> <leader>E :e suda://%<cr>

" Save a current file with sudo
map <silent> <leader>W :w suda://%<cr>

" Comment the target of a motion
map <silent> <leader>/ :Commentary<cr>

" Indent line
map <silent> <C-]> >>
map <silent> <C-[> <<

" (Re|Un)do
map <silent> <C-u> uu

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
map <C-o> :e
map <C-n> :Startify<cr>
map <C-PageDown> :bn<cr>
map <C-PageUp> :bp<cr>

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


" Tabs {{{
" -----

"map <leader>tn :tabnew<cr> <bar> :Startify<cr>
"map <leader>tc :tabclose<cr>
"map <C-]> :tabnext<cr>
"map <C-[> :tabprev<cr>

" -----
"  }}}


" COC {{{
" -----

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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

map <C-f> :Files<cr>

" -----
"  }}}


" Header {{{
" -----

map <f4> :AddHeader<cr>

" -----
"  }}}


"" REPL {{{
"" -----
"
"nnoremap <leader>rp :REPLToggle<Cr>
"autocmd Filetype python nnoremap <F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
"autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
"autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>
"
"" -----
""  }}}


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

map <leader>' ciw''<esc>P
map <leader>" c""<esc>P
map <leader>[ c[]<esc>P
map <leader>{ c{}<esc>P

" Rewrap paragraph using <S-q>
map <silent> <S-q> {gq}<Bar>:echo "Rewrapped paragraph"<CR>

" -----
"  }}}
