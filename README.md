# .vim
My customized vim configuration
![](preview.png)

## Install Vim 8.1

    sudo add-apt-repository ppa:jonathonf/vim
    sudo apt-get update
    sudo apt-get install -y vim

## Install dependencies

    sudo apt-get update
    sudo apt-get install -y \
            vim-scripts \
            vim-doc \
            vim-gtk \
            python3-dev \
            silversearcher-ag

Install Nodejs and yarn (for COC)

    curl -sL install-node.now.sh/lts | sudo bash

## Get my Vim configuration
If you have your own .vimrc file in home directory, please remove or rename it to trigger this configuration.

    cd ~
    git clone --depth=1 https://github.com/linjiX/.vim.git

## Init Vim and install all plugins
May take a long time ...

    vim --noplugin

## Install Language Server
refer to <https://github.com/neoclide/coc.nvim/wiki/Language-servers#supported-features>

For C family language, Language Server "ccls" is the best choice for now

refer to <https://github.com/MaskRay/ccls/wiki/Build>

For Ubuntu 16.04, refer to [INSTALL_CCLS.md](setup/INSTALL_CCLS.md)

## Install other useful tools

    cd setup
    ./install_ctags.sh
    ./install_global.sh
    ./install_ripgrep.sh

## Fonts
Vim may meet some display issues in your machine. The reason is your terminal font doesn't support powerline character.

Here is a recommended font: <https://github.com/crvdgc/Consolas-with-Yahei>

Install and enable it in your terminal.

---
#### Select a colorscheme for yourself, then enjoy your Vim!

---

## How to update

    cd ~/.vim
    git pull
    vim ~/.vim/vimrc.plug
    :PlugUpdate
    :CocUpdateSync
    :qa

