# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#
# This script should be symlinked to $HOME/.bashrc

source "$HOME/.aliases"

export EDITOR=vim
#export PATH="$PATH:/opt/powerline"

source $HOME/.userfiles/bashrc

source $HOME/.vpn/control.sh

[[ -s /home/saejin/.autojump/etc/profile.d/autojump.sh ]] && source /home/saejin/.autojump/etc/profile.d/autojump.sh

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

source /opt/hub/etc/hub.bash_completion.sh
eval "$(hub alias -s)"

# added by travis gem
[ -f /home/saejin/.travis/travis.sh ] && source /home/saejin/.travis/travis.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/saejin/.sdkman"
[[ -s "/home/saejin/.sdkman/bin/sdkman-init.sh" ]] && source "/home/saejin/.sdkman/bin/sdkman-init.sh"

export PATH="$(yarn global bin):$PATH"
#eval "$(grunt --completion=bash)"

export VAGRANT_SSH_KEY=$HOME/.ssh/id_rsab
export CAS_MACHINE=LINUX
export TERM=xterm-256color
export GRADLE_USER_HOME=$GRADLE_HOME