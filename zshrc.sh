#!/bin/sh

# shellcheck disable=SC1091
# shellcheck disable=SC1090
[ -f ~/.xshrc/shrc.sh ] && . ~/.xshrc/shrc.sh

__init_ohmyzsh() {
    unfunction __init_ohmyzsh
    [ -d "$HOME/.oh-my-zsh" ] || return 1
    # shellcheck disable=SC3030
    # shellcheck disable=SC2034
    plugins=(git pip zsh-autosuggestions zsh-syntax-highlighting docker docker-compose)

    # shellcheck disable=SC2034
    ENABLE_CORRECTION="true"
    # shellcheck disable=SC2034
    DISABLE_AUTO_TITLE="true"
    # shellcheck disable=SC2034
    CASE_SENSITIVE="true"
    ZSH="$HOME/.oh-my-zsh"
    # shellcheck disable=SC1091
    [ -f "$ZSH/oh-my-zsh.sh" ] && . "$ZSH/oh-my-zsh.sh" || return 1
    export ZSH
    export C_UNDRLIN="%{$C_UNDRLIN%}"
    export C_DIVIDER="%{$C_DIVIDER%}"
    export C_DEFAULT="%{$C_DEFAULT%}"
    export C_HOSTNAME="%{$C_HOSTNAME%}"
    export C_WORK_DIR="%{$C_WORK_DIR%}"
    export C_GIT_BRCH="%{$C_GIT_BRCH%}"
    export C_GIT_BRCH_L="%{$C_GIT_BRCH_L%}"
    export C_GIT_BRCH_R="%{$C_GIT_BRCH_R%}"
    export C_USERNAME="%{$C_USERNAME%}"
    export C_HOSTNAME_E="%{$C_HOSTNAME_E%}"
    return 0
}

__zsh_bindkey() {
    unfunction __zsh_bindkey
    # shellcheck disable=SC1001
    stty intr \^x
    bindkey -e
    bindkey '\e[1;5A' forward-history
    bindkey '\e[1;5B' backward-history
    bindkey '\e[1;5C' forward-word
    bindkey '\e[1;5D' backward-word
}

__zsh_history() {
    unfunction __zsh_history
    __sh_history ~/.zsh_history
    # Prevent duplicate entries
    setopt HIST_IGNORE_ALL_DUPS
    setopt HIST_SAVE_NO_DUPS

    # Append to history immediately instead of waiting for session end
    setopt INC_APPEND_HISTORY

    # Don't clobber existing history entry if duplicate
    setopt HIST_LEX_WORDS

    # Share history between sessions
    #setopt SHARE_HISTORY

    # Remove blank lines and commands with only spaces
    setopt HIST_REDUCE_BLANKS
}

__init_ohmyzsh
__zsh_bindkey
__zsh_history
