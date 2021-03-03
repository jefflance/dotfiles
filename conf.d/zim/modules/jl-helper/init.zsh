#
# Personal aliases
#


#
# Editors
#

alias vim='nvim'                         # redirect vim to nvim 


#
# Utilities
#

alias md='mkdir -p'                      # mkdir alias
alias open='xdg-open'                    # open files
alias ls='lsd'                           # pretty ls
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
