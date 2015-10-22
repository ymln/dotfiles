#!/bin/zsh
git init --separate-git-dir=$HOME/.githome
git remote add origin git@github.com:ymln/dotfiles.git
git fetch
gh checkout -t origin/master
rm .git
bash -c "`curl -sL get.freshshell.com`"
mkdir -p ~/.vim/bundle/
cd ~/.vim/bundle/
git clone https://github.com/VundleVim/Vundle.vim.git vundle
