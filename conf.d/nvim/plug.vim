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

" Dashboard
Plug 'glepnir/dashboard-nvim'

" DDC/DDU
Plug 'vim-denops/denops.vim'
Plug 'Shougo/ddc.vim'
Plug 'Shougo/ddu.vim'
Plug 'Shougo/ddc-ui-native'
Plug 'Shougo/ddc-source-around'
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'
Plug 'Shougo/pum.vim'

" Buffer exploration
Plug 'bagrat/vim-buffet', { 'as': 'buffet' }

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Nvim-notify
Plug 'rcarriga/nvim-notify'

" Noice
Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'

" Devicons
Plug 'kyazdani42/nvim-web-devicons'

" Ansible
Plug 'pearofducks/ansible-vim'

" Artify
Plug 'delphinus/artify.nvim'

" Diagram syntax
Plug 'zhaozg/vim-diagram'

" Editorconfig
Plug 'editorconfig/editorconfig-vim'

" Folding
Plug 'Konfekt/FastFold'

" Grammalecte
Plug 'dpelle/vim-Grammalecte'

" LanguageTool
Plug 'dpelle/vim-LanguageTool'

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
Plug 'connorholyday/vim-snazzy', { 'as': 'snazzy' }

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

" vim-wiki
Plug 'vimwiki/vimwiki'

" Required {{{
" -----

" required !
filetype plugin indent on

" Initialize plugin system
call plug#end()

" -----
"  }}}


" vim:ft=vim
