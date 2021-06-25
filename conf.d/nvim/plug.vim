" File              : plug.vim
" Author            : Jeff LANCE <email@jefflance.me>
" Date              : 15.04.2015
" Last Modified Date: 03.03.2021
" Last Modified By  : Jeff LANCE <email@jefflance.me>

""""""""""""""""""""""""""""""""""""""""""""""""
" __     _____ __  __   ____  _    _   _  ____
" \ \   / /_ _|  \/  | |  _ \| |  | | | |/ ___|
"  \ \ / / | || |\/| | | |_) | |  | | | | |  _
"   \ V /  | || |  | | |  __/| |__| |_| | |_| |
"    \_/  |___|_|  |_| |_|   |_____\___/ \____|
"
""""""""""""""""""""""""""""""""""""""""""""""""

" General {{{
" -----

" Install vim-plug if we don't already have it
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ${MYVIMRC}
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source ${MYVIMRC}
\| endif

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" -----
"  }}}


" Plugins {{{
" -----

" Startup screen
Plug 'mhinz/vim-startify'

" Ansible
Plug 'pearofducks/ansible-vim'

" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Buffer exploration
Plug 'bagrat/vim-buffet', { 'as': 'buffet' }

" Editorconfig
Plug 'editorconfig/editorconfig-vim'

" Folding
Plug 'Konfekt/FastFold'

" Grammalecte
Plug 'dpelle/vim-Grammalecte'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Git integration
Plug 'tpope/vim-fugitive'

" Quoting, etc...
Plug 'tpope/vim-surround'

" Commenting shortcuts
Plug 'tpope/vim-commentary'

" Abolish
Plug 'tpope/vim-abolish'

" Colorization
Plug 'norcalli/nvim-colorizer.lua'

" Put an header in file
Plug 'alpertuna/vim-header'

" Latex support
Plug 'lervag/vimtex'

" Open file
Plug 'amix/open_file_under_cursor.vim'

" Linting
Plug 'dense-analysis/ale'

" Auto-close char feature
Plug 'Townk/vim-autoclose'

" Indexed search
Plug 'vim-scripts/IndexedSearch'

" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'

" Golden resizing
Plug 'roman/golden-ratio'

" Fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Distraction-free writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Shortcuts
Plug 'sunaku/vim-shortcut'

" Status line
Plug 'hardcoreplayers/spaceline.vim'

" Tmux
Plug 'edkolev/tmuxline.vim'
Plug 'benmills/vimux'

" Colorschemes
" Plug 'jdsimcoe/abstract.vim', { 'as': 'abstract' }
" Plug 'romainl/Apprentice', { 'as': 'apprentice' }
" Plug 'jdsimcoe/hyper.vim', { 'as': 'hyper' }
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'nanotech/jellybeans.vim', { 'as': 'jellybeans' }
" Plug 'hardcoreplayers/oceanic-material', { 'as': 'oceanic' }
" Plug 'xero/sourcerer.vim', { 'as': 'sourcerer' }
Plug 'connorholyday/vim-snazzy', { 'as': 'snazzy' }
" Plug 'jacoborus/tender.vim', { 'as': 'tender' }
" Plug 'dylanaraps/wal.vim'

" Customization
Plug 'ryanoasis/vim-devicons'

" Sudo workaround plugin
Plug 'lambdalisue/suda.vim'

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" REPL
Plug 'jpalardy/vim-slime'

" Jupyter notebook
Plug 'jupyter-vim/jupyter-vim'

" indentLine
Plug 'Yggdroot/indentLine'

" " Mermaid diagram
" Plug 'zhaozg/vim-diagram'

" Required {{{
" -----

" required !
filetype plugin indent on

" Initialize plugin system
call plug#end()

" -----
"  }}}


" vim:ft=vim
