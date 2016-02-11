#!/bin/zsh
# To run: curl https://raw.githubusercontent.com/ymln/dotfiles/master/install.sh | bash
git init --separate-git-dir=$HOME/.githome
git remote add origin git@github.com:ymln/dotfiles.git
git fetch
git checkout -t origin/master
rm .git

bash -c "`curl https://raw.githubusercontent.com/freshshell/fresh/master/install.sh`"
source .fresh/build/shell.sh
fresh

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim -c ':PlugInstall|qa'
