#
# Personal aliases
#


#
# Admin
#

alias udvrld='sudo udevadm control --reload-rules && sudo udevadm trigger'


#
# Editors
#

alias vim='nvim'                         # redirect vim to nvim


#
# Mail, internet
#

alias mutt='neomutt -f ${HOME}/Mail/jeff.lance@mala.fr/inbox/'
alias neomutt='neomutt -f ${HOME}/Mail/jeff.lance@mala.fr/inbox/'


#
# Utilities
#

alias rs='rsync -Pavzl'                  # rsync shortcut
alias ls='lsd'                           # pretty ls
alias md='mkdir -p'                      # mkdir alias
alias open='xdg-open'                    # open files
alias t='tmux'                           # tmux
alias ta='t a -t'                        # tmux attach to a session
alias tls='t ls'                         # tmux list sessions
alias tn='t n -t'                        # tmux new session
alias xcolor='xcolor | xclip -i'         # xcolor
alias youtube-dl='youtube-dl -f best'    # youtube-dl best download


#
# Shortcuts
#

hash -d crs="${HOME}/Cours"              # cours
hash -d doc="${HOME}/Documents"          # documents
hash -d dot="${HOME}/dotfiles"           # dotfiles


#
# Environment
#

# interactive comments
setopt interactivecomments
bindkey '^R' history-incremental-search-backward
