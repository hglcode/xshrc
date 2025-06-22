#!/bin/sh

# data
export DATA_HOME=~/.data/data
export DATA_FUTURE_HOME=$DATA_HOME/future

# pnpm
export PNPM_HOME=~/.local/share/pnpm
export PATH="$PNPM_HOME:$PATH"

# go
export GO111MODULE=on
export GOPROXY=https://goproxy.cn
export GOPATH=~/.local/app/go

# ruby
export PATH=~/bin:"$PATH"

# fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
