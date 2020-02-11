"""""""""""""""""""""""""""""""""""""""""""""""
" __     _____ __  __   ____  _    _   _  ____
" \ \   / /_ _|  \/  | |  _ \| |  | | | |/ ___|
"  \ \ / / | || |\/| | | |_) | |  | | | | |  _
"   \ V /  | || |  | | |  __/| |__| |_| | |_| |
"    \_/  |___|_|  |_| |_|   |_____\___/ \____|
"
"""""""""""""""""""""""""""""""""""""""""""""""

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

Plug 'mhinz/vim-startify'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'flazz/vim-colorschemes'
Plug 'xero/sourcerer.vim', { 'as': 'sourcerer' }
Plug 'romainl/apprentice', { 'as': 'apprentice' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sainnhe/edge', { 'as': 'edge' }
Plug 'kyoto-shift/film-noir', { 'as': 'film-noir' }
Plug 'kyoz/purify', { 'as': 'purify', 'rtp': 'vim' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'decayofmind/vim-lightline-functions'
Plug 'ryanoasis/vim-devicons'

" required !
filetype plugin indent on

" Initialize plugin system
call plug#end()
