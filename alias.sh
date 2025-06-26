#!/usr/bin/sh

np=$(nproc)
lnp=$((np + 1))
wnp=$((np * 3))

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias lsd='ls -Ad */'
alias lsf='ls -fA'
alias lsblk='lsblk -o NAME,FSTYPE,RO,SIZE,LABEL,MOUNTPOINTS'

alias cls='clear'
alias du='du -ahd1'
alias df='df -h'
# shellcheck disable=SC2139
alias dl="aria2c -c -x16 -j$wnp"
alias grep='grep --color=auto'
alias ping='ping -c 3'
# shellcheck disable=SC2139
alias xz="xz -T$wnp"
# shellcheck disable=SC2139
alias 7z="7zz -mmt$wnp"
# shellcheck disable=SC2139
alias make="make -j$np -l$lnp"

alias rm='trash-put'
alias laptop='ssh laptop'

alias nslookup=__f_nslookup
alias wifi='echo 0 | sudo -S systemctl restart hostapd.service'
