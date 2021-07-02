#!/usr/bin/env bash

ZIMDIR=${HOME}/.zim
ZIMFILES="zimrc zshenv zlogin zshrc"

echo "Creating directory"
[[ ! -d ${ZIMDIR} ]] && mkdir ${ZIMDIR}

echo "Getting Zim Framework"
curl -fsSL https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh -o ${ZIMDIR}/zimfw.zsh

echo "Treating links"
for FILE in ${ZIMFILES}
do
  [[ -L ~/.${FILE} ]] && unlink ~/.${FILE}
  ln -s ${PWD}/conf.d/zim/${FILE} ~/.${FILE}
done

echo "Making modules directory"
[[ ! -d ${ZIMDIR}/modules ]] && mkdir ${ZIMDIR}/modules

echo "Populating modules"
for MOD in conf.d/zim/modules/*
do
  DIR=$(basename ${MOD})
  [[ -L ${ZIMDIR}/modules/${DIR} ]] && unlink ${ZIMDIR}/modules/${DIR}
  ln -s ${PWD}/conf.d/zim/modules/${DIR} ${ZIMDIR}/modules/${DIR}
done

echo "Installing Zim Framework"
$(which zsh) ${ZIMDIR}/zimfw.zsh install

exit 0
