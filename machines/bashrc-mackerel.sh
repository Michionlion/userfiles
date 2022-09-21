#!/bin/bash
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#
# This script should be symlinked to $HOME/.bashrc

export DOTNET_CLI_TELEMETRY_OPTOUT=true
export EDITOR=vim

eval "$(/opt/homebrew/bin/brew shellenv)"

source "$HOME/.aliases"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

if command -v hub 1>/dev/null 2>&1; then
  eval "$(hub alias -s)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$(yarn global bin):$PATH"

POWERLINE_VERSION="go"
source $HOME/.userfiles/bashrc

source $HOME/.vpn/control.sh

# configure Docker
export COMPOSE_DOCKER_CLI_BUILD=1

[[ -s /opt/homebrew/etc/profile.d/autojump.sh ]] && source /opt/homebrew/etc/profile.d/autojump.sh

[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# ---- BEGIN niera GENERATED SECTION ----
export PATH="$PATH:~/.niera/bin"
. ~/.niera/lib/niera-completion.sh
# ---- END niera GENERATED SECTION ----
