#!/bin/sh
(
    rewrite_rc() {
        cx=$1
        rc=$2
        re=$(echo "$cx" | xargs | sed 's|\[|\\[|g' | sed 's|\]|\\]|g' | sed -r 's|\s+|\\s+|g' | sed -r 's|\.|\\.|g' | awk '{print "^\\s*"$0"\\s*$"}')
        grep -qP "$re" "$rc" >/dev/null 2>&1 || echo "$cx" >>"$rc"
    }
    self=$(realpath "$0")
    here=$(dirname "$self")
    # shellcheck disable=SC1091
    . "$here/tools.sh"

    [ "$(realpath ~/.xshrc)" != "$here" ] && mkdir -pv ~/.xshrc/ && cp -rv "$here"/*.sh ~/.xshrc/
    sh=$(__f_shell)
    rewrite_rc "[ -f ~/.xshrc/${sh}rc.sh ] && . ~/.xshrc/${sh}rc.sh" ~/".${sh}rc"
    echo "[ -f ~/.xshrc/${sh}rc.sh ] && . ~/.xshrc/${sh}rc.sh >> ~/.${sh}rc"

    case "$sh" in
    bash | zsh) ;;
    sh) mv -v ~/".${sh}rc" ~/.profile ;;
    *) echo "unsupported shell." && exit 1 ;;
    esac
)
