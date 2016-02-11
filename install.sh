#!/bin/zsh
# Install zsh, git, ssh, base-devel/build-essential
# Add SSH key to github
# Run curl https://raw.githubusercontent.com/ymln/dotfiles/master/install.sh | zsh

set -e

git init --separate-git-dir=$HOME/.githome
git remote add origin git@github.com:ymln/dotfiles.git
git fetch
git checkout -t origin/master
rm .git

git clone https://github.com/freshshell/fresh ~/.fresh/source/freshshell/fresh
~/.fresh/source/freshshell/fresh/bin/fresh

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim -c ':PlugInstall|qa'
