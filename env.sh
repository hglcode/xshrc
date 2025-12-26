#!/usr/bin/sh

# data
export DATA_HOME=/media/data/data
export DATA_FUTURE_HOME=$DATA_HOME/future

# pnpm
export PNPM_HOME=~/.local/share/pnpm
export PATH="$PNPM_HOME:$PATH"

# go
export GO111MODULE=on
export GOPROXY=https://goproxy.cn
export GOPATH=/media/work/.app/go
export GOBIN=$GOPATH/bin
