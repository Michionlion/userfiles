# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH";
fi
xset m 0 0
#set background
#export BACKGROUND=$(ls ~/.userfiles/.wallpapers/* | shuf -n1);
#gsettings set org.gnome.desktop.background picture-uri "file://$BACKGROUND";
