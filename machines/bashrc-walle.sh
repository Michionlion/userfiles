#!/bin/bash
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#
# This script should be symlinked to $HOME/.bashrc

export DOTNET_CLI_TELEMETRY_OPTOUT=true
export EDITOR=vim

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

eval "$(hub alias -s)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$(yarn global bin):$PATH"
#eval "$(grunt --completion=bash)"

export VAGRANT_SSH_KEY=$HOME/.ssh/id_rsab
export CAS_MACHINE=LINUX
export TERM=xterm-256color

POWERLINE_VERSION="go"
source $HOME/.userfiles/bashrc

# stop mouse accel
if type xset &> /dev/null; then
    xset m 0 0 &> /dev/null
fi

source $HOME/.vpn/control.sh

[[ -s /usr/share/autojump/autojump.sh ]] && source /usr/share/autojump/autojump.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/saejin/.sdkman"
[[ -s "/home/saejin/.sdkman/bin/sdkman-init.sh" ]] && source "/home/saejin/.sdkman/bin/sdkman-init.sh"

# ---- BEGIN niera GENERATED SECTION ----
export PATH="$PATH:~/.niera/bin"
. ~/.niera/lib/niera-completion.sh
# ---- END niera GENERATED SECTION ----

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.bash ] && . ~/.config/tabtab/__tabtab.bash || true
