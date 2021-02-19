" File              : startscreen.vim
" Author            : Jeff LANCE <email@jefflance.me>
" Date              : 01.11.2020
" Last Modified Date: 27.01.2021
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

let g:startify_session_dir = '${XDG_CONFIG_HOME}/nvim/session'

let g:startify_enable_special = 0

let g:startify_files_number = 10


function s:config_mail()
  return [
        \ { 'line': 'afew', 'cmd': 'edit ~/.config/afew/' },
        \ { 'line': 'astroid', 'cmd': 'edit ~/.config/astroid/' },
        \ { 'line': 'mbsync', 'cmd': 'edit ~/.mbsyncrc' },
        \ { 'line': 'notmuch config', 'cmd': 'edit ~/.notmuch-config' },
        \ { 'line': 'notmuch hooks', 'cmd': 'edit ~/Mail/.notmuch/hooks/' },
        \ ]
endfunction

function s:config_openbox()
  return [
       \ { 'line': 'autostart.sh', 'cmd': 'edit ~/.config/openbox/autostart.sh' },
       \ { 'line': 'rc.xml', 'cmd': 'edit ~/.config/openbox/rc.xml' }
       \ ]
endfunction

function s:config_vim()
  return [
        \ { 'line': 'général', 'cmd': 'edit ${XDG_CONFIG_HOME}/nvim/init.vim' },
        \ { 'line': 'fonctions', 'cmd': 'edit ${XDG_CONFIG_HOME}/nvim/functions.vim' },
        \ { 'line': 'raccourcis clavier', 'cmd': 'edit ${XDG_CONFIG_HOME}/nvim/keybindings.vim' },
        \ { 'line': 'plugings', 'cmd': 'edit ${XDG_CONFIG_HOME}/nvim/plug.vim' },
        \ { 'line': "cet écran d'accueil", 'cmd': 'edit ${XDG_CONFIG_HOME}/nvim/startscreen.vim' },
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
  \ '~/Dotfiles/',
  \ '~/Projets',
  \ '~/Projets/latex/latex-homework',
  \ '~/.asy'
  \ ]

let g:startify_commands = [
  \ ['Nouveau', 'enew'],
  \ ['Aide', 'help reference'],
  \ ]


" vim:ft=vim
