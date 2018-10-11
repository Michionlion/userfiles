#!/bin/bash
SCRIPT_PATH="$HOME/.userfiles"

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize
shopt -s globstar

# make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# default to go if $POWERLINE_VERSION is unset or empty
if [ -z "$POWERLINE_VERSION" ]; then
    export POWERLINE_VERSION="go"
fi
source $SCRIPT_PATH/powerline

if [ -x /usr/bin/dircolors ]; then
    # shellcheck disable=SC2015
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# color aliases
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# source aliases file in userfiles
# shellcheck source=/dev/null
source "$SCRIPT_PATH/aliases"

# source environment variables file in userfiles
# shellcheck source=/dev/null
# source "$SCRIPT_PATH/env_vars"

# add bin to path
export PATH="$PATH:$SCRIPT_PATH/bin"

# chase symlinks
set -o physical

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        # shellcheck source=/dev/null
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        # shellcheck source=/dev/null
        . /etc/bash_completion
    fi
fi

# stop mouse accel
if type xset &> /dev/null; then
    xset m 0 0
fi

# source functions file in userfiles
# shellcheck source=/dev/null
source "$SCRIPT_PATH/functions"


# set git-signing to be on at the start always
git-signing-on -q

# addon sourcing
export ENHANCD_HOOK_AFTER_CD="ls"
export ENHANCD_DISABLE_DOT=1
# shellcheck source=/dev/null
source "$SCRIPT_PATH/addons/enhancd/init.sh"
