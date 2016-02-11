#!/bin/zsh
# To run: bash -c `curl https://raw.githubusercontent.com/ymln/dotfiles/master/install.sh`
git init --separate-git-dir=$HOME/.githome
git remote add origin git@github.com:ymln/dotfiles.git
git fetch
git checkout -t origin/master
rm .git
bash -c "`curl -sL get.freshshell.com`"
fresh
mkdir -p .vim/{backup,swap,autoload}
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
