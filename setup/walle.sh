#!/bin/bash

echo "TODO: Install Hub (Git)"
echo "TODO: Install Mercurial"
echo "TODO: Install QuickTile"
echo "TODO: Install NeoVim"
echo "TODO: Install autojump"
echo "TODO: Install nvm"
echo "TODO: Install npm"
echo "TODO: Install Yarn"
echo "TODO: Install Pyenv"
echo "TODO: Install Python 3.9 with Pyenv"
echo "TODO: Install VSCode"
echo "TODO: Install sdkman"
echo "TODO: Install Java 11 and Gradle 7 with sdk"
echo "TODO: Install Google Chrome"
echo "TODO: Install Vagrant"
echo "TODO: Configure virtualbox's machine folder: vboxmanage setproperty machinefolder $HOME/.vms"


echo "TODO: Install niera to .niera: https://bitbucket.di2e.net/projects/DFNTC/repos/niera"


echo "Configuring .env..."
echo -e "export VAGRANT_MEMORY=8192\nexport VAGRANT_CODE_COUNT=6\n" > $HOME/.env

echo "Making symlinks..."
ln -s $HOME/.userfiles/hgrc $HOME/.hgrc
ln -s $HOME/.userfiles/gitconfig $HOME/.gitconfig
ln -s $HOME/.userfiles/fonts $HOME/.fonts
ln -s $HOME/.userfiles/machines/bashrc-walle.sh $HOME/.bashrc
ln -s $HOME/.userfiles/nvim-config $HOME/.config/nvim
