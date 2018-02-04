#!/bin/zsh
# Install curl, zsh, git, ssh, cmake, neovim, base-devel/build-essential, openssh
# Add SSH key to github
# Run curl https://raw.githubusercontent.com/ymln/dotfiles/master/install.sh | zsh

set -e

cd

git init --separate-git-dir=$HOME/.githome
git remote add origin git@github.com:ymln/dotfiles.git
git fetch
git checkout -t origin/master
rm .git

git clone https://github.com/freshshell/fresh ~/.fresh/source/freshshell/fresh
# TODO
pushd ~/.fresh/source/freshshell/fresh && git checkout pre && popd
~/.fresh/source/freshshell/fresh/bin/fresh

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim -c ':PlugInstall|qa'
