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

alias pacss='pacman -Ss'                       # search through package repositories
alias pacsi='pacman -Si'                       # display info about a package in the repositories
alias pacud='sudo pacman -Sy'                  # update & refresh local package db
alias pacug='sudo pacman -Syu'                 # sync with repositories before upgrading packages
alias pacin='sudo pacman -S'                   # install package from repositories
alias pacrm='sudo pacman -R'                   # remove package, keeping settings and depedencies
alias pacRm='sudo pacman -Rns'                 # remove package with its settings and depedencies
alias paclo='sudo pacman -Qdt'                 # list orphans
alias pacro='sudo pacman -Rs $(pacman -Qdt)'   # remove orphans
alias pacow='pacmon -Qo'                       # show which package own a file

#
#  pkgfile Operations
#

alias pasf  ='pkgfile'                    # search file in packages


