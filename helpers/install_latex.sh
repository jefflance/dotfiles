#!/bin/bash

TEXMF=texmf/tex/latex
  
if [[ $(uname -s) = Darwin ]]; then
    MYTEXMF="$HOME/Library/$TEXMF"
elif [[ $(uname -s) = Linux ]]; then
    MYTEXMF="$HOME/$TEXMF"
fi

mkdir -p "$MYTEXMF"

if [[ ! -d "$MYTEXMF/latex-homework" ]]; then
    git clone https://src.jefflance.me/jeff/latex-homework.git "$MYTEXMF/latex-homework"
else
    git -C "$MYTEXMF/latex-homework" pull --no-rebase
fi

if [[ ! -d "$MYTEXMF/latex-beamer-themes" ]]; then
    git clone https://src.jefflance.me/jeff/latex-beamer-themes.git "$MYTEXMF/latex-beamer-themes"
else
    git -C "$MYTEXMF/latex-beamer-themes" pull --no-rebase
fi

if [[ ! -d "$MYTEXMF/emerald" ]]; then
    git clone https://src.jefflance.me/jeff/emerald.git "$MYTEXMF/emerald"
else
    git -C "$MYTEXMF/emerald" pull --no-rebase
fi

if [[ ! -d "$HOME/.asy" ]]; then
    git clone https://src.jefflance.me/jeff/asymptote-config.git "$HOME/.asy"
else
    git -C "$HOME/.asy" pull --no-rebase
fi

texhash "$MYTEXMF"

exit 0
