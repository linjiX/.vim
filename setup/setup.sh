#!/bin/bash

[ -r /etc/lsb-release ] && source /etc/lsb-release
if [[ "$DISTRIB_CODENAME" != 'xenial' && "$DISTRIB_CODENAME" != 'focal' ]]; then
    echo 'Only support ubuntu 16.04 and 20.04'
    exit 1
fi

if [[ -f $HOME/.vimrc || -d $HOME/.vim ]]; then
    echo 'Please remove your ~/.vimrc and ~/.vim/ first'
    exit 1
fi

set -euo pipefail
set -x

if ! dpkg -s git curl software-properties-common 1>/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y \
        git \
        curl \
        software-properties-common
fi

git clone --depth=1 https://github.com/linjiX/.vim.git "$HOME/.vim"
pushd "$HOME/.vim/setup/" >/dev/null

#####################################
# Install Vim 8 && NeoVim && Nodejs #
#####################################

sudo apt-add-repository -y ppa:jonathonf/vim
sudo apt-add-repository -y ppa:neovim-ppa/unstable
# https://github.com/nodesource/distributions#debinstall
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
# sudo apt-get update
sudo apt-get install -y \
    vim \
    vim-scripts \
    vim-doc \
    vim-gtk \
    neovim \
    nodejs

if [ "$DISTRIB_CODENAME" == 'xenial' ]; then
    sudo apt-get install -y \
        autoconf \
        make \
        wget \
        libjansson-dev

    ./install_ctags.sh
    ./install_global.sh
    ./install_ripgrep.sh
else
    sudo apt-get install -y \
        universal-ctags \
        global \
        ripgrep
fi

#######################
# Install Vim Plugins #
#######################

vim

popd >/dev/null