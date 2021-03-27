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

alias pasea='pamac search'                # search through apt software package
alias painf='pamac info'                  # show info about a package
alias pau='pamac update'                  # update packages database
alias paU='pamac upgrade'                 # upgrade packages
alias pain='pamac install'                # install package
alias parem='pamac remove'                # removes packages
alias pauU='pamud && pamug'
alias pareo='parem -o'                    # removes orphan packages


#
#  pkgfile Operations
#

alias pasf  ='pkgfile'                    # search file in packages


