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

# fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

export KWIN_DRM_FREESYNC=1

## 禁用Mesa的异步渲染（新Mesa偶发兼容问题）
#export MESA_NO_ASYNC=1
## 强制AMDGPU使用统一内存模型
#export AMD_VULKAN_ICD=RADV
#export KWIN_DRM_NO_MODIFIERS=1
## 限制KWin渲染线程数，避免资源竞争
#export KWIN_OPENGL_USE_SINGLE_THREADED_CONTEXT=1
## 禁用不必要的OpenGL扩展
#export LIBGL_NO_DRAWARRAYS_INSTANCED=1
#
#export MESA_NO_OPENGL=1
#export KWIN_FORCE_VULKAN=1
#export QT_QPA_PLATFORM=wayland
