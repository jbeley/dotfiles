# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files for examples


OS=`uname -s`
export LANG=C
if [ $OS = Linux ]; then
	alias ls='ls --color=auto'
	alias vi='vim -X'
	alias shred='shred -zu'
	alias grep='grep --color=auto'
	alias webshare='python -c "import SimpleHTTPServer;SimpleHTTPServer.test()"'
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
fi


if [ $OS = FreeBSD ]; then
	alias ls='gnuls --color=auto'
	alias vi='vim -X'
	stty erase2 ^H
fi
less=`which less`
if [  -n $less ]; then

	alias more='less'
	export PAGER=less
	export LESSCHARSET='latin1'
    if [ $OS == Darwin ];
    then
        eval $(/usr/local/bin/lesspipe.sh)
    elif [ $OS == Linux ]; then
        eval $(lesspipe)
    fi
	 export LESS='-i -w  -z-4 -g -M -X -F -R -P%t?f%f'
	export LESS_TERMCAP_mb=$'\E[01;31m'
	export LESS_TERMCAP_md=$'\E[01;37m'
	export LESS_TERMCAP_me=$'\E[0m'
	export LESS_TERMCAP_se=$'\E[0m'
	export LESS_TERMCAP_so=$'\E[01;44;33m'
	export LESS_TERMCAP_ue=$'\E[0m'
	export LESS_TERMCAP_us=$'\E[01;32m'
 #       PAGER="less -RXsie"
	export PAGER
fi


# set the number commands for bash to remember in the command history
HISTFILESIZE=1000000
# set the maximum number of lines to store in the bash history file
HISTSIZE=1000000
# set the format of the timestamps stored in  the bash history file
HISTTIMEFORMAT='%F %T '
# force bash to write to history file  upon returning to a prompt, this ensures bash logs commands even when the interactive shell session terminates
PROMPT_COMMAND='history -a'



export HISTCONTROL=ignoreboth
shopt -s cmdhist
shopt -s histappend
shopt -s dotglob
export MAIL_WARNING=on
shopt -s checkwinsize
shopt -s cdspell
umask 066
shopt -s cdable_vars
export RSYNC_RSH=ssh
export LC_ALL=en_US.UTF-8
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export DISTCC_HOSTS="localhost"
export HISTIGNORE="bg:cd:date:df:du:exit:fg:ll:ls:pwd:rehash:source:su:sudo:top:w"
export GDK_USE_XFT=1
export GNOME_WINDOW_MANAGER=metacity
export GTK2_RC_FILES=$HOME/.gtkrc-2.0
export GNUMERIC_ENABLE_XL_OVERWRITE=1
export OPERA_KEEP_BLOCKED_PLUGIN=1
complete -d cd
if [[  -z `tty` ]]; then
    true
else
    . ~/.bash_login
fi
