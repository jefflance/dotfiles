" File              : init.vim
" Author            : Jeff LANCE <email@jefflance.me>
" Date              : 15.04.2015
" Last Modified Date: 04.03.2021
" Last Modified By  : Jeff LANCE <email@jefflance.me>

""""""""""""""""""""""""""""""""""""""""""""""
"
"  ____ _____ _   _ _____ ____      _    _
" / ___| ____| \ | | ____|  _ \    / \  | |
"| |  _|  _| |  \| |  _| | |_) |  / _ \ | |
"| |_| | |___| |\  | |___|  _ <  / ___ \| |___
" \____|_____|_| \_|_____|_| \_\/_/   \_\_____|
"
"
""""""""""""""""""""""""""""""""""""""""""""""""

" General {{{
" -----
set nocompatible              " be iMproved, required
filetype plugin indent on

set mouse=nv                 " Disable mouse in command-line mode
set report=0                 " Don't report on line changes
set errorbells               " Trigger bell on error
set visualbell               " Use visual bell instead of beeping
set hidden                   " hide buffers when abandoned instead of unload
set fileformats=unix,dos,mac " Use Unix as the standard file type
set magic                    " For regular expressions turn magic on
set path+=**                 " Directories to search when using gf and friends
set isfname-==               " Remove =, detects filename in var=/foo/bar
set virtualedit=block        " Position cursor anywhere in visual block
set synmaxcol=2500           " Don't syntax highlight long lines
set formatoptions+=1         " Don't break lines after a one-letter word
set formatoptions-=t         " Don't auto-wrap text
set formatoptions-=o         " Disable comment-continuation (normal 'o'/'O')

" file encoding
set encoding=utf8

" Syntax highlighting
syntax on
set synmaxcol=512
" -----
" }}}


" Vim Directories {{{
" -----
set nobackup
set nowritebackup
set undofile noswapfile
set directory=$DATA_PATH/swap//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set undodir=$DATA_PATH/undo//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set backupdir=$DATA_PATH/backup/,$DATA_PATH,~/tmp,/var/tmp,/tmp
set viewdir=$DATA_PATH/view/
" Use the coc-spell-checker to do this
" set spellfile=$VIM_PATH/spell/en.utf-8.add

" History saving
set history=2000

if ! has('win32') && ! has('win64')
	set shada=!,'300,<50,@100,s10,h
endif

augroup user_persistent_undo
	autocmd!
	au BufWritePre /tmp/*          setlocal noundofile
	au BufWritePre COMMIT_EDITMSG  setlocal noundofile
	au BufWritePre MERGE_MSG       setlocal noundofile
	au BufWritePre *.tmp           setlocal noundofile
	au BufWritePre *.bak           setlocal noundofile
augroup END

" If sudo, disable vim swap/backup/undo/shada/viminfo writing
if $SUDO_USER !=# '' && $USER !=# $SUDO_USER
		\ && $HOME !=# expand('~'.$USER)
		\ && $HOME ==# expand('~'.$SUDO_USER)

	set noswapfile
	set nobackup
	set noundofile
	set shada="NONE"
endif

" Secure sensitive information, disable backup files in temp directories
if exists('&backupskip')
	set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*
	set backupskip+=.vault.vim
endif

" Disable swap/undo/viminfo/shada files in temp directories or shm
augroup user_secure
	autocmd!
	silent! autocmd BufNewFile,BufReadPre
		\ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim
		\ setlocal noswapfile noundofile nobackup nowritebackup viminfo= shada=
augroup END
" -----
"  }}}


" Timing {{{
" ------
set timeout ttimeout
set timeoutlen=500   " Time out on mappings
set ttimeoutlen=10   " Time out on key codes
set updatetime=100   " Idle time to write swap and trigger CursorHold
set redrawtime=1500  " Time in milliseconds for stopping display redraw
" -----
"  }}}


" Behaviour {{{
" -----

" Set to auto read when a file is changed from the outside
set autoread

" Netrw
let g:netrw_fastbrowse=0

" Use system clipboard
set clipboard=unnamedplus

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ";"

" Fast saving
nmap <leader>w :w!<cr>

" Fast quitting without saving
nmap <leader>q :q!<cr>

" Fast quitting with saving if changes
nmap <leader>x :x<cr>

" " Allow saving of files as sudo when I forgot to start vim using sudo.
" ca w!! w !sudo tee > /dev/null %
" nmap <leader>W :w!!<cr>

" Auto change dir to current buffer dir
autocmd BufEnter * silent! lcd %:p:h

" Delete extra blank line at the end of file
" autocmd BufWritePre *.py normal m`:%s/\s\+$//e``

" -----
"  }}}



""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  ___ _   _ _____ _____ ____  _____ _    ____ _____
" |_ _| \ | |_   _| ____|  _ \|  ___/ \  / ___| ____|
"  | ||  \| | | | |  _| | |_) | |_ / _ \| |   |  _|
"  | || |\  | | | | |___|  _ <|  _/ ___ \ |___| |___
" |___|_| \_| |_| |_____|_| \_\_|/_/   \_\____|_____|
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" To use fancy symbols wherever possible,
let fancy_symbols_enabled = 1

" Font config
if has('gui')
  set guifont=RobotoMono\ Nerd\ Font\ Mono\ 12
endif

" Disable default status ruler
set noruler

" Keep at least 2 lines above/below
set scrolloff=2

" hide ~ tila
set fcs=eob:\

" Remove ugly vertical lines on window division
set fillchars+=vert:\

" vim tab title
set title
" Title length.
set titlelen=95
" Title string.
let &g:titlestring="
      \ %{expand('%:p:~:.')}%(%m%r%w%)
      \ %<\[%{fnamemodify(getcwd(), ':~')}\] - Neovim"

" Show line numbers
set number

" Line wrapping
set wrap

" Tab control
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=80
set autoindent
set smartindent
" python
au BufNewFile,BufRead *.py
  \ set tabstop=4
  \ set softtabstop=4
  \ set shiftwidth=4
  \ set textwidth=79
  \ set expandtab
  \ set autoindent
  \ set fileformat=unix
" js, html, css
au BufNewFile,BufRead *.js, *.html, *.css
  \ set noexpandtab
  \ set tabstop=2
  \ set softtabstop=2
  \ set shiftwidth=2
" Treat all .md files as markdown
au BufNewFile,BufRead *.md set filetype=markdown

" astroid format=flowed
au FileType mail setlocal tw=72
au FileType mail setlocal fo+=q
au FileType mail setlocal comments+=nb:>
" markdown
" Hide and format markdown elements like **bold**
au FileType markdown set conceallevel=2
" Set spell check to British English
au FileType markdown setlocal spell spelllang=fr_fr


" Let the cursor traverse to the previous or following line when at the or the
" end of a line
set whichwrap=b,s,<,>,[,]

" Search
set ignorecase " Ignore case when searching

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Spell checking
set spell
set spelllang=fr,en

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess=aFc

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif



"""""""""""""""""""""""""""""""""""""""""""
"  ____  _    _   _  ____ ___ _   _ ____
" |  _ \| |  | | | |/ ___|_ _| \ | / ___|
" | |_) | |  | | | | |  _ | ||  \| \___ \
" |  __/| |__| |_| | |_| || || |\  |___) |
" |_|   |_____\___/ \____|___|_| \_|____/
"
"""""""""""""""""""""""""""""""""""""""""""

" Installing the Plug plugin manager
source ${HOME}/.config/nvim/plug.vim

" Start startify if no arg
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter *
  \ if (argc() == 0 && !exists("s:std_in") && !has('gui'))
  \ | Startify
  \ | endif

" " needed so deoplete can auto select the first suggestion
" set completeopt+=noinsert
" " comment this line to enable autocompletion preview window
" " (displays documentation related to the selected completion option)
" " disabled by default because preview makes the window flicker
" set completeopt-=preview

" " autocompletion of files and commands behaves like shell
" " (complete only the common part, list the options that match)
" " set wildmode=list:longest



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  ____ _____  _  _____ _   _ ____  _     ___ _   _ _____
" / ___|_   _|/ \|_   _| | | / ___|| |   |_ _| \ | | ____|
" \___ \ | | / _ \ | | | | | \___ \| |    | ||  \| |  _|
"  ___) || |/ ___ \| | | |_| |___) | |___ | || |\  | |___
" |____/ |_/_/   \_\_|  \___/|____/|_____|___|_| \_|_____|
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set noshowmode
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   ____ ___  _     ___  ____  ____   ____ _   _ _____ __  __ _____
"  / ___/ _ \| |   / _ \|  _ \/ ___| / ___| | | | ____|  \/  | ____|
" | |  | | | | |  | | | | |_) \___ \| |   | |_| |  _| | |\/| |  _|
" | |__| |_| | |__| |_| |  _ < ___) | |___|  _  | |___| |  | | |___
"  \____\___/|_____\___/|_| \_\____/ \____|_| |_|_____|_|  |_|_____|
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" General {{{
" -----

let g:SnazzyTransparent = 1
let base16colorspace=256  " Access colors present in 256 colorspace"
if (has("termguicolors"))
  set termguicolors
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme snazzy

" Pseudo-transparency for completion menu and floating windows
if &termguicolors
	if exists('&pumblend')
		set pumblend=10
	endif
	if exists('&winblend')
		set winblend=10
	endif
endif

" -----
"  }}}


" Buffet {{{
" -----

function! g:BuffetSetCustomColors()
    hi! BuffetTab cterm=NONE ctermbg=NONE ctermfg=8 guibg=NONE guifg=#FFFFFF
    hi! BuffetBuffer cterm=NONE ctermbg=NONE ctermfg=8 guibg=NONE guifg=#FFFFFF
    hi! BuffetModBuffer cterm=NONE ctermbg=NONE ctermfg=8 guibg=NONE guifg=#FF0000
    hi! BuffetCurrentBuffer cterm=NONE ctermbg=NONE ctermfg=8 guibg=NONE guifg=#00FF00
    hi! BuffetModCurrentBuffer cterm=NONE ctermbg=NONE ctermfg=8 guibg=NONE guifg=#FF0000
  endfunction

  " -----
" }}}



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"        _             _                      _   _   _
"  _ __ | |_   _  __ _(_)_ __  ___   ___  ___| |_| |_(_)_ __   __ _ ___
" | '_ \| | | | |/ _` | | '_ \/ __| / __|/ _ \ __| __| | '_ \ / _` / __|
" | |_) | | |_| | (_| | | | | \__ \ \__ \  __/ |_| |_| | | | | (_| \__ \
" | .__/|_|\__,_|\__, |_|_| |_|___/ |___/\___|\__|\__|_|_| |_|\__, |___/
" |_|            |___/                                        |___/
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Buffet {{{
" -----

let g:buffet_always_show_tabline = 1
let g:buffet_powerline_separators = 1
let g:buffet_use_devicons = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_modified_icon = "+"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"

" -----
"  }}}



" COC {{{
" -----

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Disable warnings
let g:coc_disable_startup_warning = 1

" -----
"  }}}


" Colorizer {{{
" -----

let g:colorizer_auto_filetype='css,html,xml,py,js'

" -----
"  }}}



" Defx {{{
" -----

" Set appearance
call defx#custom#option(
  \ '_', {
  \   'winwidth': 40,
  \   'split': 'vertical',
  \   'direction': 'botright',
  \   'show_ignored_files': 0,
  \   'buffer_name': 'defxplorer',
  \   'toggle': 1,
  \   'columns': 'icon:indent:icons:filename',
  \   'resume': 1,
  \   }
  \ )

call defx#custom#column(
  \ 'icon', {
  \   'directory_icon': '▸',
  \   'opened_icon': '▾',
  \   }
  \ )

call defx#custom#column(
  \ 'mark', {
    \ 'readonly_icon': '✗',
	  \ 'selected_icon': '✓',
    \ }
  \ )

" -----
"  }}}


" Deoplete {{{
" -----

let g:deoplete#enable_at_startup = 0

" -----
"  }}}


" Editorconfig {{{
" -----

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
au FileType gitcommit let b:EditorConfig_disable = 1
au FileType conf let b:EditorConfig_disable = 1
au FileType cls let b:EditorConfig_disable = 1
au FileType md let b:EditorConfig_disable = 1
au FileType sty let b:EditorConfig_disable = 1
au FileType tex let b:EditorConfig_disable = 1

" -----
"  }}}


" FZF {{{
" -----

" This is the default extra key bindings
let g:fzf_action = {
  \ 'enter': 'e',
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit'
  \ }

" Preview window
let g:fzf_preview_window = 'right:60%'
if !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif

" -----
"  }}}


" Header {{{
" -----

let g:header_field_author = 'Jeff LANCE'
let g:header_field_author_email = 'email@jefflance.me'
let g:header_auto_add_header = 0

" -----
"  }}}


" IndentLine {{{
" -----

let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_enabled = 0

" -----
"  }}}


" Markdown {{{
" -----

let g:vim_markdown_conceal = 2
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_edit_url_in = 'tab'
let g:vim_markdown_follow_anchor = 1

" -----
"  }}}


" Markdown preview {{{
" -----

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 1

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'qutebrowser'

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" -----
"  }}}


" Neovim {{{
" -----

let g:python3_host_prog = '/usr/bin/python3'

" -----
"  }}}


" OCaml {{{
" -----

" merlin
let g:opamshare = substitute(system('opam var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" ocp-indent
set rtp^="/home/jeff/.opam/default/share/ocp-indent/vim"

" -----
"  }}}


" Slime {{{
" -----
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()

" -----
"  }}}


" Spaceline {{{
" -----

let g:spaceline_seperate_style = 'arrow-fade'
" let g:spaceline_colorscheme = ''

" -----
"  }}}


" Suda {{{
" -----

let g:suda#prompt = 'Mot de passe: '
let g:suda_smart_edit = 1

" -----
"  }}}


" Tmuxline {{{
" -----

let g:tmuxline_preset = {
  \'a'    : '#S',
  \'win'  : ['#I', '#W'],
  \'cwin' : ['#I', '#W', '#F'],
  \'y'    : ['%a', '%d', '%b', '%R'],
  \'z'    : '#H'
  \ }
let g:tmuxline_separators = {
  \ 'left' : '',
  \ 'left_alt': '>',
  \ 'right' : '',
  \ 'right_alt' : '',
  \ 'space' : ' '
  \ }
let g:tmuxline_theme = 'sourcerer'

" -----
"  }}}


" TMux navigator {{{
" -----

let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 2

" -----
"  }}}


" Vimroom {{{
" -----

let g:goyo_height = '100%'
let g:goyo_width = '90%'
let g:goyo_margin_top = 0
let g:goyo_margin_bottom = 0

" -----
"  }}}


" Vimtex {{{
" -----

let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = 'latex'

" -----
"  }}}



"""""""""""""""""""""""""""""""""""""""""""""""""
"  ____ _____  _    ____ _____ ___ _______   __
" / ___|_   _|/ \  |  _ \_   _|_ _|  ___\ \ / /
" \___ \ | | / _ \ | |_) || |  | || |_   \ V /
"  ___) || |/ ___ \|  _ < | |  | ||  _|   | |
" |____/ |_/_/   \_\_| \_\|_| |___|_|     |_|
"
"""""""""""""""""""""""""""""""""""""""""""""""""

" Load functions from file
source ${HOME}/.config/nvim/startscreen.vim



"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  _____ _   _ _   _  ____ _____ ___ ___  _   _ ____
" |  ___| | | | \ | |/ ___|_   _|_ _/ _ \| \ | / ___|
" | |_  | | | |  \| | |     | |  | | | | |  \| \___ \
" |  _| | |_| | |\  | |___  | |  | | |_| | |\  |___) |
" |_|    \___/|_| \_|\____| |_| |___\___/|_| \_|____/
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Load functions from file
source ${HOME}/.config/nvim/functions.vim
source ${HOME}/.config/nvim/coc.vim



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  _  _________   ______ ___ _   _ ____ ___ _   _  ____ ____
" | |/ / ____\ \ / / __ )_ _| \ | |  _ \_ _| \ | |/ ___/ ___|
" | ' /|  _|  \ V /|  _ \| ||  \| | | | | ||  \| | |  _\___ \
" | . \| |___  | | | |_) | || |\  | |_| | || |\  | |_| |___) |
" |_|\_\_____| |_| |____/___|_| \_|____/___|_| \_|\____|____/
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Load keybindings from file
source ${HOME}/.config/nvim/keybindings.vim


" vim:ft=vim
