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
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')


Plug 'mhinz/vim-startify', { 'branch': 'center' }     " Startscreen
Plug 'scrooloose/nerdtree'                            " File explorer
Plug 'junegunn/fzf.vim'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' } " Markdown
Plug 'tpope/vim-fugitive'                             " Git
Plug 'tpope/vim-surround'                             " Quotes, etc...
Plug 'ryanoasis/vim-devicons'                         " Icons
Plug 'tpope/vim-commentary'                           " Commenting
Plug 'amix/open_file_under_cursor.vim'                " open file
Plug 'ctrlpvim/ctrlp.vim'                             " Fzf, buffer
Plug 'dense-analysis/ale'                             " Linting
Plug 'ap/vim-css-color'                               " Color display
Plug 'vim-latex/vim-latex'                            " LaTeX support

" Distraction-free writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Tabline
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline', { 'as': 'buftabline' }

" Tmux
Plug 'edkolev/tmuxline.vim'
Plug 'benmills/vimux'

" Colorschemes
Plug 'kyoz/purify', { 'as': 'purify', 'rtp': 'vim' }
Plug 'flazz/vim-colorschemes'
Plug 'jcherven/jummidark.vim'
Plug 'arzg/vim-colors-xcode'
Plug 'nanotech/jellybeans.vim'
Plug 'jdsimcoe/abstract.vim'
Plug 'rainglow/vim'
Plug 'xero/sourcerer.vim', { 'as': 'sourcerer' }
Plug 'romainl/apprentice', { 'as': 'apprentice' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sainnhe/edge', { 'as': 'edge' }
Plug 'kyoto-shift/film-noir', { 'as': 'film-noir' }


" required !
filetype plugin indent on

" Initialize plugin system
call plug#end()
