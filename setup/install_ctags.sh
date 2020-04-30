#!/bin/bash

# https://github.com/universal-ctags/ctags

set -euo pipefail
set -x

###########################
# Install Universal Ctags #
###########################

if ! dpkg -s autoconf git make libjansson-dev 1>/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y \
        autoconf \
        git \
        make \
        libjansson-dev
fi

readonly TMPDIR="$(mktemp -d /tmp/install_ctags.XXXX)"
pushd "$TMPDIR" >/dev/null
git clone --depth=1 https://github.com/universal-ctags/ctags.git
pushd ctags >/dev/null

./autogen.sh
./configure
make -j "$(nproc)"
sudo make install

popd >/dev/null
popd >/dev/null
