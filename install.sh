#!/bin/zsh
git init --separate-git-dir=$HOME/.githome
git remote add origin git@github.com:ymln/dotfiles.git
git fetch
git checkout -t origin/master
rm .git
bash -c "`curl -sL get.freshshell.com`"
mkdir -p .vim/bundle/
mkdir -p .vim/{backup,swap}
