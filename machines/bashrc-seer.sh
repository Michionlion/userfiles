# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#
# This script should be symlinked to $HOME/.bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

umask 002

export EDITOR=nvim

POWERLINE_VERSION="go"
source $HOME/.userfiles/bashrc

export TERM=xterm-256color
