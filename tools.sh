#!/usr/bin/sh

__f_in_env_path() {
    (
        paths=$PATH
        up=$(/bin/realpath "$1")
        while true; do
            path="${paths%%:*}"
            paths="${paths#*:}"
            p=$(/bin/realpath "$path")
            [ "$p" = "$up" ] && return 0
            [ "$path" = "$paths" ] && break
        done
        return 1
    )
}

__f_git_branch() {
    git branch 2>/dev/null | grep -iP '^\s*\*\s+(\w+|\(.*\))\s*$' | head -n1 | awk '{print $1$NF}' | sed 's|)$||'
}

__f_git_local_branchs() {
    git branch --sort=-committerdate 2>/dev/null | grep -iP '^\s*\w+\s*$' | xargs
}

__f_git_remote_branchs() {
    git branch -r --sort=-committerdate 2>/dev/null | grep -P '^\s*origin/[\S]+\s*$' | xargs
}

__f_tty_columns() {
    stty size | awk '{print $2}'
}

__f_work_directory() {
    pwd -L | sed "s|^${HOME}|~|"
}

__f_shell() {
    ps -p $$ | tail -n 1 | grep -oP '[a-z]+\s*$' 2>/dev/null
}

__f_divider() {
    seq "$1" | awk 'BEGIN{s=""} {s=" "s} END{print s}'
}

__f_nslookup() {
    ping -c 1 -w 0 "$1" | grep -P "\b$1\b" | grep -oP "(?<=\().*?(?=\))" | head -n1
}
