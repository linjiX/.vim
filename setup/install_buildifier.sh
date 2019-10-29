#!/bin/bash

# https://github.com/bazelbuild/buildtools/tree/master/buildifier

set -e
set -v

if ! command -v go 1>/dev/null 2>&1; then
    sudo add-apt-repository -y ppa:longsleep/golang-backports
    sudo apt-get update
    sudo apt-get install -y golang-go
fi

GOPATH="$(mktemp -d)"
export GOPATH
go get github.com/bazelbuild/buildtools/buildifier
sudo mv "$GOPATH/bin/buildifier" /usr/local/bin
