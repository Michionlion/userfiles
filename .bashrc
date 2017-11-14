#if not running interactively, don't do anything
[ -z "$PS1" ] && return


# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u:\W\$ '
fi

unset color_prompt force_color_prompt

 # If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# some more ls aliases
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias ls='ls --color=auto'

alias gpl='git pull'
alias gpu='git push'
alias gaa='git add -A'
alias ga='git add'
alias gcm='git commit -m "updates"'
alias gtc='git commit -m '
alias cb='cd ..'
alias cd..='cd ..'
alias jjar='java -jar'
alias build=". ./build"
#alias run=". ./run"
alias open='xdg-open'
alias tarc='tar -czvf'
alias resource='source ~/.bashrc'
alias chcur='stat -c "%a %n"';

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

function trash() {
	for var in "$@"; do
		if [[ "$var" != -* ]]; then
			if [[ "$var" != *tmp* ]]; then
				echo Moving "$var" to the trash!;
				mv "$var" ~/.trash;
			else
				\rm "$var"
			fi
		fi
	done
}

function clear-trash() {
	for ff in ~/.trash/*; do
		\rm "$ff" -rf
	done
}

alias rm='trash';

function mkalias () {
	alias "$*";
	echo alias "$*" >> ~/.bash_aliases
	echo "Made alias $ for *";
}
function cnl() { \cd "$@" && \ls --color=auto; }
alias cd='cnl'

function resetwifi() {
	sudo modprobe -r ath9k;
	echo Disabled WIFI;
	sudo modprobe ath9k;
	echo Enabled WIFI;
}

function lint() {
	if [ "$#" -gt 0 ]; then
		for path in "$@"; do
			filename=$(basename "$1")
			ext=$([[ "$filename" = *.* ]] && echo ".${filename##*.}" || echo '')
			case "$path" in
			*.py)
				echo "Using autopep8 for $path"
				autopep8 -i "$path"
				;;
			*)
				echo "Unable to find linter for $ext files"
				;;
			esac
		done
	else
		echo "Usage: lint <file(s)>";
	fi
}


alias acp='update';
alias gcp='update';
function update() {
	if [ "$1" == "force" ]; then
		git add -A;
		git status;
		if [[ -z "$2" ]]; then
			git commit -m "updates";
		else
			git commit -m "$2";
		fi
		git push;
		return;
	fi

	git status;
	read -p 'Add? (y/n): ' ans;
	if [ "$ans" == "y" -o -z "${ans// }" ]; then
		git add -A;
		git status;
	fi
	read -p 'Commit? (y/n) ' ans;
	if [ "$ans" == "y" -o -z "${ans// }" ]; then
		if [ "$#" -gt 0 ]; then
			git commit -m "$1";
		else
			read -p 'Message: ' ans
			if [[ -z "${ans// }" ]]; then
				git commit -m "updates";
			else
				git commit -m "$ans";
			fi
		fi
	fi
	
	read -p 'Push? (y/n) ' ans;
	if [ "$ans" == "y" -o -z "${ans// }" ]; then
		git push;
	fi
}

function gvc() {
	OVN=$(cat version);
	let "OVN++";
	echo $OVN > version;
	echo Committing with version $OVN...;
	git add version;
	desc="Commit with v$OVN, message: $1";
	git commit -m "$desc";
	echo ---- v$OVN commit finished! ----;
}

char() {
	printf \\$(printf '%03o' $1);
	echo;
}

ascii() {
	printf '%d' "'$1";
	echo;
}

odt-to-pdf() {
	newname="$(basename "$1" .odt).pdf";
	pandoc "$1" -f odt -t latex -s -o  "newname";
	evince "newname";
	mv "$1" ".$1";
}

alias asci='ascii';
alias ensure='~/bin/ensure $PWD';
export BASHRC="USERFILE BASHRC LOADED";
alias leak-test='valgrind --leak-check=full --show-leak-kinds=all'
