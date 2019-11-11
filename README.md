# .vim

![preview image](preview.png)

## Clone Vim configuration

    git clone --depth=1 https://github.com/linjiX/.vim.git ~/.vim

## Installation (Ubuntu 16.04)

    ~/.vim/setup/install_vim.sh

It will take a long time, make sure your network is unblocked and be patient.

## Neovim support

Neovim depends on the Python enviroment and plugin 'defx' requires Python 3.6.1+  
So please make sure you have Python 3.6.1+ enviroment  
Then run below commands

```bash
pip3 install neovim
nvim -c UpdateRemotePlugins -c sleep 1m -c quit
```

## Fonts

Vim may meet some display issues in your machine.  
The reason is your terminal font doesn't support powerline or nerd-fonts.  
Here is a recommended font: <https://github.com/linjiX/Consolas-with-Yahei>

    # For Ubuntu 16.04
    mkdir -p ~/.local/share/fonts
    git clone --depth=1 https://github.com/linjiX/Consolas-with-Yahei.git
    cp Consolas-with-Yahei/ttf/* ~/.local/share/fonts/

Then enable it in your terminal.

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

## Language Support

#### Git

    pip3 install gitlint

#### Bash (Ubuntu 16.04)

    npm install --global bash-language-server
    ./setup/install_shfmt.sh
    snap install shellcheck

#### Python

    pip3 install yapf isort ipython pylint flake8

#### C/C++ (Ubuntu 16.04)

    pip3 install cpplint
    ./setup/install_clang_format.sh
    ./setup/install_cppcheck.sh
    ./setup/install_ccls.sh

#### Bazel (Ubuntu 16.04)

    ./setup/install_bazel.sh
    ./setup/install_buildifier.sh

#### Json

    pip3 install demjson
    npm install --global prettier

#### Markdown

    npm install --global prettier

#### Cmake

    pip3 install cmake_format cmakelint

#### Dockerfile

    npm install --global dockerfile-language-server-nodejs
    ./setup/install_hadolint.sh

#### VimScript

    pip3 install vim-vint
