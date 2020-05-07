" File              : plug.vim
" Author            : Jeff LANCE <email@jefflance.me>
" Date              : 15.04.2015
" Last Modified Date: 28.04.2020
" Last Modified By  : Jeff LANCE <email@jefflance.me>

""""""""""""""""""""""""""""""""""""""""""""""""
" __     _____ __  __   ____  _    _   _  ____
" \ \   / /_ _|  \/  | |  _ \| |  | | | |/ ___| 
"  \ \ / / | || |\/| | | |_) | |  | | | | |  _
"   \ V /  | || |  | | |  __/| |__| |_| | |_| |
"    \_/  |___|_|  |_| |_|   |_____\___/ \____|
"
""""""""""""""""""""""""""""""""""""""""""""""""

" Install vim-plug if we don't already have it
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ${MYVIMRC}
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Startup sceen
Plug 'mhinz/vim-startify'
" Deoplete
if using_neovim
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'kristijanhusak/defx-icons'
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'Shougo/defx.nvim'
  Plug 'kristijanhusak/defx-icons'
endif
" Buffer exploration
Plug 'ap/vim-buftabline', { 'as': 'buftabline' }
" Folding
Plug 'Konfekt/FastFold'
" Markdown
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" Git integration
Plug 'tpope/vim-fugitive'
" Quoting, etc...
Plug 'tpope/vim-surround'
" Commenting shortcuts
Plug 'tpope/vim-commentary'
" Show hex codes as colors
Plug 'chrisbra/Colorizer'
" Put an header in file
Plug 'alpertuna/vim-header'
" Latex support
Plug 'lervag/vimtex'
" Open file
Plug 'amix/open_file_under_cursor.vim'
" Python autocompletion
Plug 'deoplete-plugins/deoplete-jedi'
" Completion from other opened files
Plug 'Shougo/context_filetype.vim'
" Linting
Plug 'dense-analysis/ale'
" REPL for vim
Plug 'sillybun/vim-repl'
" Auto-close char feature
Plug 'Townk/vim-autoclose'
" Indexed search
Plug 'vim-scripts/IndexedSearch'
" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'
" Fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" Distraction-free writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" Status line
Plug 'itchyny/lightline.vim'
" Tmux
Plug 'edkolev/tmuxline.vim'
Plug 'benmills/vimux'
" Colorschemes
Plug 'nanotech/jellybeans.vim', { 'as': 'jellybeans' }
Plug 'jdsimcoe/abstract.vim', { 'as': 'abstract' }
Plug 'xero/sourcerer.vim', { 'as': 'sourcerer' }
" Customization
Plug 'ryanoasis/vim-devicons'


" required !
filetype plugin indent on

" Initialize plugin system
call plug#end()
