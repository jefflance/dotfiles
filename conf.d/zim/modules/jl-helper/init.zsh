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

alias ip='ip -c'                         # ip address
# alias ls='lsd'                           # pretty ls
alias md='mkdir -p'                      # mkdir alias
alias open='xdg-open'                    # open files
alias pips='pip_search'                  # pip search tool
alias rs='rsync -Pavzl'                  # rsync shortcut
alias t='tmux'                           # tmux
alias ta='t a -t'                        # tmux attach to a session
alias tls='t ls'                         # tmux list sessions
alias tvs='transcode-video --scan'       # tmux new session
alias tn='t n -t'                        # tmux new session
alias xcolor='xcolor | xclip -i'         # xcolor
alias yd='yt-dlp'                        # yt-dlp best download


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
