#
# Debian Shortcuts and Aliases
#


#
# Common Operations
#

alias acs='apt-cache search'            # search through apt software package 
                                        # cache
alias aps='apt search'                  # search through packages list
alias acS='apt-cache show'              # show info about a package 
alias afs='apt-file search'             # search file in packages
alias ags='apt-get source'              # fetch source packages through apt-get
alias acp='apt-cache policy'            # displays priority of package sources
alias alp='apt-list-packages'           # list packages by size
alias aka='apt-key-add'                 # retrieve and add key to keyring
alias alu="apt list --upgradable"       # list upgradable packages


#
#  Superuser apt-get Operations
#

alias aga='sudo apt-get autoremove'     # autoremove unecessary packages
alias agu='sudo apt-get update'         # update packages database
alias agU='sudo apt-get upgrade'        # upgrade packages
alias agd='sudo apt-get dist-upgrade'   # upgrade dist
alias agc='sudo apt-get clean'          # clears out the local repository of 
                                        # retrieved package files except lock 
                                        # files
alias agi='sudo apt-get install'        # install package
alias agp='sudo apt-get purge'          # Removes packages along with 
                                        # configuration files
alias agr='sudo apt-get remove'         # Removes packages, keeps the 
                                        # configuration files
alias aguu='agu && agU'


#
# Superuser dpkg Operations
#

alias di='sudo dpkg -i'                 # install local .deb file
