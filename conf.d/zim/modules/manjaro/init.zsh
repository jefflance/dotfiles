#!/bin/zsh
# File              : init.zsh
# Author            : Jeff LANCE <email@jefflance.me>
# Date              : 03.03.2021
# Last Modified Date: 27.06.2021
# Last Modified By  : Jeff LANCE <email@jefflance.me>
#
# Manjaro Shortcuts and Aliases
#


#
# pamac Operations
#

alias pamss='pamac search'                # search through package repositories
alias pamsi='pamac info'                  # show info about a package
alias pamud='pamac update'                # update packages database
alias pamug='pamac upgrade'               # upgrade packages
alias pamin='pamac install'               # install package
alias pamrm='pamac remove'                # remove package
alias pamdg='pamud && pamug'
alias pamro='pamrm -o'                    # remove orphan packages


#
# pacman Operations
#

alias pacss='pacman -Ss'                       # search through package repositories
alias pacsi='pacman -Si'                       # display info about a package in the repositories
alias pacud='sudo pacman -Sy'                  # update & refresh local package db
alias pacug='sudo pacman -Syu'                 # sync with repositories before upgrading packages
alias pacin='sudo pacman -Syu'                 # update and install package from repositories
alias pacrm='sudo pacman -R'                   # remove package, keeping settings and depedencies
alias pacRm='sudo pacman -Rns'                 # remove package with its settings and depedencies
alias paclo='sudo pacman -Qdt'                 # list orphans
alias pacro='sudo pacman -Rs $(pacman -Qdt)'   # remove orphans
alias pacow='pacman -Qo'                       # show which package own a file

#
#  pkgfile Operations
#

alias pasf='pkgfile'    # search file in packages


