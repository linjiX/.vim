#!/bin/bash

# https://www.gnu.org/software/global/

set -e
set -v

######################
# Install GNU Global #
######################

VERSION="6.6.3"
TARFILE=global-$VERSION.tar.gz
DIR=global-$VERSION

if ! dpkg -s autoconf wget make bison flex gperf libtool-bin libncurses5-dev texinfo \
    1>/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y \
        autoconf \
        wget \
        make \
        bison \
        flex \
        gperf \
        libtool-bin \
        libncurses5-dev \
        texinfo
fi

TMPDIR="$(mktemp -d /tmp/install_global.XXXX)"
pushd "$TMPDIR" >/dev/null
wget http://tamacom.com/global/$TARFILE
tar -xf $TARFILE
pushd $DIR >/dev/null

sh reconf.sh
./configure
make -j
sudo make install

popd >/dev/null
popd >/dev/null
