#!/bin/bash

# TODO This file is deprecated. Use `create_symlinks.sh` instead

set -x #echo on

cp .tmux.conf ~/
cp own.sty ~/texmf/tex/latex/jonasOwn/

sh apply-vim.sh

# create link to i3 config
ln -si $PWD/.config/i3/config $HOME/.config/i3/config
