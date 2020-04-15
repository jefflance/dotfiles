# Finally, we do:

# gitignore function
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# completion for kitty
kitty + complete setup zsh | source /dev/stdin

# pass
compdef _pass workpass
zstyle ':completion::complete:workpass::' prefix "$HOME/Private/.password-store"
workpass() {
  PASSWORD_STORE_DIR=$HOME/Private/.password-store pass $@
}
