# Finally, we do:

# gitignore function
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# completion for kitty
kitty + complete setup zsh | source /dev/stdin
