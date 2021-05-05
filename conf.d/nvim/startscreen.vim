" File              : startscreen.vim
" Author            : Jeff LANCE <email@jefflance.me>
" Date              : 01.11.2020
" Last Modified Date: 03.03.2021
" Last Modified By  : Jeff LANCE <email@jefflance.me>

"""""""""""""""""""""""""""""""""""""""""""""""""
"
"  ____ _____  _    ____ _____ ___ _______   __
" / ___|_   _|/ \  |  _ \_   _|_ _|  ___\ \ / /
" \___ \ | | / _ \ | |_) || |  | || |_   \ V /
"  ___) || |/ ___ \|  _ < | |  | ||  _|   | |
" |____/ |_/_/   \_\_| \_\|_| |___|_|     |_|
"
"
""""""""""""""""""""""""""""""""""""""""""""""""

let g:startify_custom_header = 'startify#center(startify#fortune#cowsay())'

let g:startify_session_dir = '${HOME}/.config/nvim/session'

let g:startify_enable_special = 0

let g:startify_files_number = 10


function s:config_mail()
  return [
        \ { 'line': 'afew', 'cmd': 'edit ${HOME}/.config/afew/' },
        \ { 'line': 'astroid', 'cmd': 'edit ${HOME}/.config/astroid/' },
        \ { 'line': 'imapfilter', 'cmd': 'edit ${HOME}/.config/imapfilter' },
        \ { 'line': 'imapnotify', 'cmd': 'edit ${HOME}/.config/imapnotify' },
        \ { 'line': 'mbsync', 'cmd': 'edit ${HOME}/.mbsyncrc' },
        \ { 'line': 'msmtp', 'cmd': 'edit ${HOME}/.msmtprc' },
        \ { 'line': 'neomutt', 'cmd': 'edit ${HOME}/.config/neomutt' },
        \ { 'line': 'notmuch config', 'cmd': 'edit ${HOME}/.notmuch-config' },
        \ { 'line': 'notmuch dir', 'cmd': 'edit ${HOME}/Mail/.notmuch' },
        \ ]
endfunction

function s:config_openbox()
  return [
       \ { 'line': 'autostart.sh', 'cmd': 'edit ${HOME}/.config/openbox/autostart.sh' },
       \ { 'line': 'rc.xml', 'cmd': 'edit ${HOME}/.config/openbox/rc.xml' }
       \ ]
endfunction

function s:config_vim()
  return [
        \ { 'line': 'général', 'cmd': 'edit ${HOME}/.config/nvim/init.vim' },
        \ { 'line': 'fonctions', 'cmd': 'edit ${HOME}/.config/nvim/functions.vim' },
        \ { 'line': 'raccourcis clavier', 'cmd': 'edit ${HOME}/.config/nvim/keybindings.vim' },
        \ { 'line': 'plugings', 'cmd': 'edit ${HOME}/.config/nvim/plug.vim' },
        \ { 'line': "cet écran d'accueil", 'cmd': 'edit ${HOME}/.config/nvim/startscreen.vim' },
        \ ]
endfunction

let g:startify_lists = [
  \ { 'type': 'commands',  'header': ['FICHIER'] },
  \ { 'type': 'files',     'header': ['RÉCENTS']  },
  \ { 'type': function('s:config_vim'), 'header': ['VIM CONF:'] },
  \ { 'type': function('s:config_mail'), 'header': ['MAIL CONF:'] },
  \ { 'type': function('s:config_openbox'), 'header': ['OPENBOX CONF:'] },
  \ { 'type': 'bookmarks', 'header': ['SIGNETS'] },
  \ { 'type': 'sessions',  'header': ['SESSIONS'] },
  \ ]

let g:startify_bookmarks = [
  \ '~/.config/',
  \ '~/dotfiles/',
  \ '~/Projets/',
  \ '~/Projets/latex/latex-homework/',
  \ '~/.asy/'
  \ ]

let g:startify_commands = [
  \ ['Nouveau', 'enew'],
  \ ['Aide', 'help reference'],
  \ ]


" vim:ft=vim
