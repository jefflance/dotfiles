#
# Functions
#
function apt-key_add {
  key="$1"

  wget -q -O - "$key" | sudo apt-key add -
}



#
# Aliases
#
alias aptka="apt-key_add $1"
