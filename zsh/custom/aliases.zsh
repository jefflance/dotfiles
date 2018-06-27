# .oh-my-zsh/custom/aliases.zsh
#
# 	Define some personnal aliases
#
# 03/03/2014
# Jeff LANCE <jeff.lance@mala.fr>
#

# Net commands
alias iptables="sudo iptables $1"
#alias netstat="sudo netstat $1"
alias ifconfig="sudo ifconfig $1"
alias ovpn="sudo openvpn $1"

# APT commands
alias ase="apt search $1"
alias ash="apt show $1"
# Replaced by ubuntu plugin
#alias ain="sudo apt install $1"
#alias arm="sudo apt remove $1"
#alias aar="sudo apt autoremove"
#alias aud="sudo apt update"
#alias aug="sudo apt upgrade"
#alias adg="aud && aug"
#alias alu="apt list --upgradable"

# Python
alias pup="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"
alias pbp="pip freeze > pip_installed_$(date +%d%m%yT%H%M%S).txti"
#alias pipsi="pipsi --home $WORKON_HOME --bin-dir ~/bin $1"

# Commands utlities
#alias rm="trash $1"
alias khardsyn="vdirsyncer -vdebug discover $1 && vdirsyncer -vdebug sync $1"
alias scan="clamscan -r $1"

# Edit config of zsh, vim, awesome
alias zshcfg="vim $HOME/.zshrc"
alias zshrld="source $HOME/.zshrc"
alias vimrc="vim $HOME/.vimrc"
alias awerc="emacs ~dot/awesome/.config/awesome/rc.lua"

# Suffixes
alias -s jpg='feh -dx'
alias -s png='feh -dx'
alias -s asy='asy2png'
#alias -s svg='firefox'

# Directories
hash -d crs="$HOME/Cours"
hash -d dev="$HOME/Développement"
hash -d dld="$HOME/Téléchargements"
hash -d doc="$HOME/Documents"
hash -d vid="$HOME/Videos"
hash -d dot="$HOME/dotfiles"

# Editors
alias ec="emacsclient -t"
alias emacs="emacsclient-oneframe.sh"