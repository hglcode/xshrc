#!/usr/bin/sh

# shellcheck disable=SC1090
# shellcheck disable=SC1091
[ -f ~/.xshrc/shrc.sh ] && . ~/.xshrc/shrc.sh

# Configure bash history
__sh_history ~/.bash_history
# Append history immediately instead of overwriting at session end
#sehopt -s histappend

# Share history between sessions in real-time
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Prevent duplicate entries
export HISTCONTROL=ignoreboth:erasedups # Ignores blank lines and duplicates

# Disable command substitution in history (optional)
#HISTCONTROL=ignorespace  # Prefix commands with space to exclude from history
