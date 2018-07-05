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



#
# Aliases
#
alias cpa="copy_archive $1"
alias asy2png="convert_asy_to_png $1"
