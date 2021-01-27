#!/bin/bash

GTK_THEMES_DIR="$HOME/.themes"
  
if [[ ! -d "$GTK_THEMES_DIR" ]]; then
    mkdir -p "$GTK_THEMES_DIR"
fi

if [[ $(ls -A $GTK_THEMES_DIR) ]]; then
    git -C "$GTK_THEMES_DIR" pull
else
    git clone https://github.com/addy-dclxvi/gtk-theme-collections.git "$GTK_THEMES_DIR"
fi

