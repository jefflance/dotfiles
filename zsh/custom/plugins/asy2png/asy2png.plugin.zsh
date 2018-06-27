function asy2png {
  asy "$1"
  filename=$(basename -s .asy "$1")
  rsvg-convert "$filename.svg" -o $(echo "$filename.svg" | sed -e 's/svg$/png/')
}
