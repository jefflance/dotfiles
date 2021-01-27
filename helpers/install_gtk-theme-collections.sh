#!/bin/bash

GTK_THEMES_DIR="$HOME/.themes"
  
if [[ ! -d "$GTK_THEMES_DIR" ]]; then
    mkdir -p "$GTK_THEMES_DIR"
fi

if [[ ! -d "$GTK_THEMES_DIR/gtk-theme-collections" ]]; then
    git clone https://github.com/addy-dclxvi/gtk-theme-collections.git "$GTK_THEMES_DIR/gtk-theme-collections"
else
    git -C "$GTK_THEMES_DIR/gtk-theme-collections" pull
fi

