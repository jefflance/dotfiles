#
# Functions
#
function copy_archive {
  ext=".ori"

  ori_name="$1"
  new_name=${ori_name}.${ext}

  cp -a ${ori_nam} ${new_name}
}

function convert_asy_to_png {
  asy "$1"

  filename=$(basename -s .asy "$1")

  rsvg-convert "$filename.svg" -o $(echo "$filename.svg" | sed -e 's/svg$/png/')
}

function rns {
  nf=$(echo "$1" | tr ' ' '_')
  mv "$1" "$nf"
}

function conf {
  option="${1}"

  case ${option} in
    "awe")
      vim ~/.config/awesome/rc.lua
      ;;
    "qut")
      vim $HOME/.config/qutebrowser/config.py
      ;;
    "ran")
      vim $HOME/.config/ranger
      ;;
    "vim")
      vim $HOME/.vimrc
      ;;
    "zsh")
      vim $HOME/.zshrc
      ;;
    *)
      echo "$(basename $0): usage: awe(somewm) | qut(ebrowser) | ran(ger) | vim | zsh"
      ;;
  esac
}


#
# Aliases
#
alias cpa="copy_archive $1"
alias asy2png="convert_asy_to_png $1"
