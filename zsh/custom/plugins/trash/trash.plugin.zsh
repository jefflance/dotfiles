function trash {
  if [[ -z "$1" ]]; then
    trash-list
  else
    trash-put "$@"
  fi
}
