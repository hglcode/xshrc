#!/usr/bin/sh

echo "$-" | grep -qP '.*i.*' || exit 0
[ "$(tty)" = "/dev/tty1" ] && [ -z "$DISPLAY" ] && [ "$(id -u -n)" = "l" ] && startplasma-wayland 2>/dev/null && exit 0

# shellcheck disable=SC1091
# shellcheck disable=SC1090
[ -f ~/.xshrc/env.sh ] && . ~/.xshrc/env.sh
# shellcheck disable=SC1091
# shellcheck disable=SC1090
[ -f ~/.xshrc/tools.sh ] && . ~/.xshrc/tools.sh
# shellcheck disable=SC1091
# shellcheck disable=SC1090
[ -f ~/.xshrc/alias.sh ] && . ~/.xshrc/alias.sh

__sh_history() {
    unfunction __sh_history >/dev/null 2>&1 || unset __sh_history
    # History file location
    HISTFILE="$1"
    [ -n "$HISTFILE" ] || HISTFILE=~/.sh_history

    export HISTFILE
    # Number of history entries to save (persists after closing)
    export SAVEHIST=10000 # Total entries saved to HISTFILE
    export HISTSIZE=10000 # Entries available in the current session
}

__sh_conda_setup() {
    unfunction __sh_conda_setup >/dev/null 2>&1 || unset __sh_conda_setup
    sh=shell.$(__f_shell)
    home=~/.local/app/conda
    [ -d "$home" ] || return 1
    setup=$("$home/bin/conda" "$sh" hook 2>/dev/null) && [ -n "$setup" ] && eval "$setup" && return 0
    # shellcheck disable=SC1091
    [ -f "$home/etc/profile.d/conda.sh" ] && . "$home/etc/profile.d/conda.sh" && return 0
    __f_in_env_path "$home/bin" || export PATH="$home/bin:$PATH"
    return 0
}

__sh_gen_prompt() {
    (
        # shellcheck disable=SC2181
        [ $? = 0 ] && ch=$C_HOSTNAME || ch=$C_HOSTNAME_E
        sh=$(__f_shell)
        ur=$(whoami 2>/dev/null || id -un 2>/dev/null || echo unknown)
        hn=$HOSTNAME
        wd=$(__f_work_directory)
        cp=$(printf "%s" "$CONDA_PROMPT_MODIFIER" | xargs)
        glb=$(__f_git_local_branchs)
        grb=$(__f_git_remote_branchs)
        gb=$(__f_git_branch)

        #ps="$sh $ur@$hn $wd $cp $gb $glb $grb"
        ps="$sh $ur@$hn $wd $cp $gb"
        ps=$(echo "$ps" | xargs)
        pc=${#ps}
        cc=$(__f_tty_columns)
        ts=$glb
        glb=''
        while true; do
            t="${ts%% *}"
            ts="${ts#* }"
            nc=$((pc + ${#t} + 1))
            [ "$nc" -le "$cc" ] || break
            glb="$glb $t"
            pc=$nc
            [ "$t" = "$ts" ] && break
        done
        ts=$grb
        grb=''
        while true; do
            t="${ts%% *}"
            ts="${ts#* }"
            nc=$((pc + ${#t} + 1))
            [ "$nc" -le "$cc" ] || break
            grb="$grb $t"
            pc=$nc
            [ "$t" = "$ts" ] && break
        done

        c1=0 # $(((cc - pc) / 2))
        c2=$((cc - c1 - pc))
        d1=$C_DIVIDER$(__f_divider "$c1")
        d2=$C_DIVIDER$(__f_divider "$c2")

        sh="${C_DEFAULT}${C_UNDRLIN}$sh"
        ur="${C_USERNAME}${ur}"
        hn="${ch}${hn}"
        wd="${C_WORK_DIR}${wd}"

        [ -n "$cp" ] && cp="${C_DIVIDER} ${C_DEFAULT}${C_UNDRLIN}${cp}"
        [ -n "$gb" ] && gb="${C_DIVIDER} ${C_GIT_BRCH}${gb}"
        [ -n "$glb" ] && glb="${C_DIVIDER}${C_GIT_BRCH_L}${glb}"
        [ -n "$grb" ] && grb="${C_DIVIDER}${C_GIT_BRCH_R}${grb}"

        ps="$d1$sh $ur@$hn $wd$cp$gb$glb$grb$d2$C_DEFAULT"

        printf "%s\n=> " "$ps"
    )
}

__sh_get_app_paths() {
    (
        set -e
        home=$HOME/.local/app
        [ -d "$home" ] || home=$(dirname "$0")./local/app
        [ -d "$home" ] || return 1
        envs_cache="$home/.app_envs_$(date '+%Y%m%d').cache"
        [ -f "$envs_cache" ] && cat "$envs_cache" && return 0

        rm -f "$home/home/.app_envs_*.cache" >/dev/null 2>&1
        paths=''
        for d in "$home"/*; do
            [ -d "$d/bin" ] && d="$d/bin"
            __f_in_env_path "$d" || paths="$paths:$d"
        done
        [ -z "$paths" ] && return 1
        paths=$(echo "$paths" | cut -c2-)
        printf "%s" "$paths" | tee "$envs_cache" || rm -f "$envs_cache"
    )
}

__sh_conda_setup

C_UNDRLIN=$(printf '%b' '\e[4m')
C_DEFAULT=$(printf '%b' '\e[0m')
C_DIVIDER=$(printf '%b' '\e[4m\e[38;5;239m')
C_HOSTNAME=$(printf '%b' '\e[38;5;51m')
C_WORK_DIR=$(printf '%b' '\e[38;5;214m')
C_GIT_BRCH=$(printf '%b' '\e[38;5;201m')
C_GIT_BRCH_L=$(printf '%b' '\033[38;5;177m')
C_GIT_BRCH_R=$(printf '%b' '\033[38;5;147m')
C_USERNAME=$(printf '%b' '\e[38;5;51m')
C_HOSTNAME_E=$(printf '%b' '\e[38;5;196m')

HOSTNAME=$(hostname 2>/dev/null || cat /etc/hostname 2>/dev/null || echo unknown)
PATH="$(__sh_get_app_paths):$PATH"
PATH=$(echo "$PATH" | sed -r -e 's@^\s*[:]+|[:]+\s*$@@g' -e 's|[:]{2,}|:|g')

export PS1='$(__sh_gen_prompt)'
export PROMPT=$PS1
export C_UNDRLIN C_DIVIDER C_DEFAULT C_HOSTNAME C_WORK_DIR C_GIT_BRCH C_USERNAME C_HOSTNAME_E HOSTNAME
export PATH
