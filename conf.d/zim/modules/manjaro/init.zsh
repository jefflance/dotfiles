#!/bin/zsh
# File              : init.zsh
# Author            : Jeff LANCE <email@jefflance.me>
# Date              : 03.03.2021
# Last Modified Date: 03.03.2021
# Last Modified By  : Jeff LANCE <email@jefflance.me>
#
# Manjaro Shortcuts and Aliases
#


#
# pamac Operations
#

alias pasea='pamac search'                # search through package repositories
alias painf='pamac info'                  # show info about a package
alias pau='pamac update'                  # update packages database
alias paU='pamac upgrade'                 # upgrade packages
alias pain='pamac install'                # install package
alias parem='pamac remove'                # remove package
alias pauU='pamud && pamug'
alias pareo='parem -o'                    # remove orphan packages


#
# pacman Operations
#

alias pacss='sudo pacman -Ss'                  # search through package repositories
alias pacud='sudo pacman -Syu'                 # update system (and install package)
alias pacin='sudo pacman -S'                   # install package
alias pacrm='sudo pacman -R'                   # remove package
alias paclo='sudo pacman -Qdt'                 # list orphans
alias pacro='sudo pacman -Rs $(pacman -Qdt)'   # remove orphans


#
#  pkgfile Operations
#

alias pasf  ='pkgfile'                    # search file in packages


