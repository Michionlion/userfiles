#!/bin/bash
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#
# This script should be symlinked to $HOME/.bashrc

export DOTNET_CLI_TELEMETRY_OPTOUT=true
export EDITOR=vim

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(rbenv init -)"

export FLUTTER_ROOT="/opt/flutter"
export PATH="$FLUTTER_ROOT/bin:$PATH"
export PATH="$HOME/.pub-cache/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

if command -v pipx 1>/dev/null 2>&1; then
  eval "$(register-python-argcomplete pipx)"
fi

if command -v hub 1>/dev/null 2>&1; then
  eval "$(hub alias -s)"
fi

export JAVA_HOME=$(java -XshowSettings:properties -version 2>&1 > /dev/null | grep 'java.home' | awk '{print $3}')

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$(yarn global bin):$PATH"

POWERLINE_VERSION="go"
source $HOME/.userfiles/bashrc

source $HOME/.vpn/control.sh

# configure Docker
export COMPOSE_DOCKER_CLI_BUILD=1

# configure keys/tokens
export TRMC_TOKEN="$(cat $HOME/.trmc-token)"
export OPENAI_API_KEY="$(cat $HOME/.gpt-token)"

alias trmc-git="git -c http.extraHeader='Authorization: Bearer $TRMC_TOKEN'"


[[ -s /opt/homebrew/etc/profile.d/autojump.sh ]] && source /opt/homebrew/etc/profile.d/autojump.sh

[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
export PATH="/opt/homebrew/opt/gradle@7/bin:$PATH"

# ---- BEGIN niera GENERATED SECTION ----
export PATH="$PATH:~/.niera/bin"
. ~/.niera/lib/niera-completion.sh
# ---- END niera GENERATED SECTION ----
