#!/bin/sh

# shellcheck disable=SC1091
self=$(realpath "$0")
here=$(dirname "$self")
home=$(realpath "$HOME")
[ "$here" = "$home" ] || here=~/.xshrc
# shellcheck disable=SC1090
[ -f "$here/tools.sh" ] && . "$here/tools.sh"

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

# disable seccomp for manual
export MAN_DISABLE_SECCOMP=1

# docker
export DOCKER_BUILDKIT=1

paths=$(__f_get_app_paths) && [ -n "$paths" ] && export PATH="$paths:$PATH"
