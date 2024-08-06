#
# _     _____ ___  _   _ _____
#| |   | ____/ _ \| \ | |__  /
#| |   |  _|| | | |  \| | / /
#| |___| |__| |_| | |\  |/ /_
#|_____|_____\___/|_| \_/____|
#
#
# Base tutorial on best way to store dotfiles in a bare git repo: https://www.atlassian.com/git/tutorials/dotfiles
# Inspired largely by Distrotube's dotfile project: https://gitlab.com/dwt1/dotfiles
# Also inspired by Chris Titus Tech mybash project:  https://github.com/ChrisTitusTech/mybash

#######################################################
# SOURCED ALIASES and SCRIPTS
#######################################################

#launch fastfetch
fastfetch --config $HOME/.config/fastfetch/config_compact.json

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

### EXPORT
#export PAGER=most                                 # easy to read pager with scrolling
export TERM="xterm-256color"                      # getting proper colors
export HISTCONTROL=ignoredups:erasedups           # no duplicate entries
export EDITOR=vim
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### PROMPT
# This is commented out if using starship prompt
# PS1='[\u@\h \W]\$ '

### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi

if [ -d "/var/lib/flatpak/exports/bin/" ] ;
  then PATH="/var/lib/flatpak/exports/bin/:$PATH"
fi

### CHANGE TITLE OF TERMINALS

case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*|terminator*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
  screen*|tmux*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac

### SHOPT
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize # checks term size when bash regains control

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

### COUNTDOWN
cdown () {
    N=$1
  while [[ $((--N)) -gt  0 ]]
    do
        echo "$N" |  figlet -c | lolcat &&  sleep 1
    done
}

# Goes up a specified number of directories  (i.e. up 4)
up() {
	local d=""
	limit=$1
	for ((i = 1; i <= limit; i++)); do
		d=$d/..
	done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}

# Change directory aliases
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#################
###GIT ALIASES###
#################

# bare git repo alias for managing my dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/git_projects/_dotfiles --work-tree=$HOME"

#add updated and save
gcom() {
    git add .
    git commit -m "$1"
    }
gcomd() {
    dotfiles add -u
    dotfiles commit -m "$1"
    }
lazyg() {
    git add .
    git commit -m "$1"
    git push
  }
#informational commit history:
alias gloga="git log --graph --color --decorate --oneline"


#replace rm with trashcli
alias rm='trash -v'
#replace ls with lsd
alias ls='lsd'

# Replace bat with cat on Fedora as batcat is not available. Also set batcat as pager
if command -v lsb_release >/dev/null; then
	DISTRIBUTION=$(lsb_release -si)

	if [ "$DISTRIBUTION" = "Fedora" ]; then
		alias cat='bat'
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  else
		alias cat='batcat'
   	export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
  fi
fi
#fix manpager formatting
export MANROFFOPT="-c"

# more common aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

#other useful aliases
alias topmem='ps -eo pmem,pid,pcpu,comm= | sort -k1 -n -r | head -n 25'
alias topcpu='ps -eo pcpu,pid,pmem,comm= | sort -k1 -n -r | head -n 25'
#termbin
alias tb="nc termbin.com 9999"

#local network SSH
alias ssh-pihole='ssh leo@pihole.nilva.local'
alias ssh-retropie='ssh leo@retropie.nilva.local'
alias ssh-pve1='ssh leo@pve1.nilva.local'
alias ssh-powerspec='ssh leo@powerspec.nilva.local'

#start cmus console music player with visualization
alias start-music="terminator --layout=music"

#convert apt to nala
apt() { 
  command nala "$@"
}
sudo() {
  if [ "$1" = "apt" ]; then
    shift
    command sudo nala "$@"
  else
    command sudo "$@"
  fi
}


# Install Starship - curl -sS https://starship.rs/install.sh | sh

eval "$(starship init bash)"
