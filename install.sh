#!/bin/sh
(
    self=$(realpath "$0")
    here=$(dirname "$self")
    # shellcheck disable=SC1091
    . "$here/tools.sh"
    sh=$(__f_shell)
    case "$sh" in
    bash | zsh) ;;
    sh) echo '[ -f ~/.shrc ] && . ~/.shrc' >>~/.profile ;;
    *) echo "unsupported shell." && exit 1 ;;
    esac
    mkdir -pv ~/.xshrc/
    cp -rv "$here"/*.sh ~/.xshrc/
    echo "[ -f ~/.xshrc/${sh}rc.sh ] && . ~/.xshrc/${sh}rc.sh" >>~/".${sh}rc"
    echo "[ -f ~/.xshrc/${sh}rc.sh ] && . ~/.xshrc/${sh}rc.sh >> ~/.${sh}rc"
)
