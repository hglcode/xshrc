#!/bin/sh

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

# docker
#export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# podman
export PODMAN_COMPOSE_PROVIDER=podman-compose

# local-ai
export ADDRESS=0.0.0.0:8888
#export API_KEY=
#export THREADS=$THREADS
export MODELS_PATH=/media/work/dev/ai/models
#export GALLERIES='[{"name":"localai", "url":"https://gh-proxy.com/https://raw.githubusercontent.com/mudler/LocalAI/main/index.yaml"}]'
export LOCALAI_BACKENDS_PATH=~/.localai/backends
export LOCALAI_BACKENDS_STORE=/media/work/dev/ai/projects/LocalAI/gallery

# huggingface
export HF_ENDPOINT=https://hf-mirror.com
export HF_HOME=/media/work/dev/ai/hf

# rust
#. "$HOME/.cargo/env"

# electron
export ELECTRON_MIRROR=https://npmmirror.com/mirrors/electron/


# android
export ANDROID_HOME=/media/work/.app/android
export ANDROID_SDK_ROOT=$ANDROID_HOME
# https://mirrors.tuna.tsinghua.edu.cn/android-sdk/
# https://mirrors.ustc.edu.cn/android/
export REPO_URL=https://mirrors.tuna.tsinghua.edu.cn/android-sdk/
export PATH=$ANDROID_SDK_ROOT/build-tools/latest:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platform-tools:$PATH

export EDITOR=/bin/vim
