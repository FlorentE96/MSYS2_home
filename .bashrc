# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

##############
### Basics ###
##############

# Don't wait for job termination notification
set -o notify

# Enables UTF-8 in Putty.
# See http://www.earth.li/~huggie/blog/tech/mobile/putty-utf-8-trick.html
#echo -ne '\e%G\e[?47h\e%G\e[?47l'

# word erase with ctrl+backspace
stty werase '^_'

# -- PROMPT --
PS1="\[\033[38;5;226m\]⏰ \[\033[38;5;216m\]\[\e[1m\]\A\[$(tput sgr0)\]\[\033[38;5;226m\]\[\e\[0\] ★ \[\033[38;5;203m\]\u\[\033[38;5;226m\] ★ \[\033[38;5;43m\]\w\[\033[38;5;226m\] ★ \[\033[38;5;154m\]\[\e[3m\]\$TYPE\[$(tput sgr0)\]\[\e\[0\] \[\033[38;5;208m\]\n$\[$(tput sgr0)\] "
# Format : time * user * current_dir * TYPE \n $
# NOTE: the TYPE variable is printed when set (via 'export'). It allows me to differentiate my shells (ex: GIT, MAKE, PYTHON, MISC)

## -- HISTORY --
# don't put duplicate lines in the history or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace
# append to the history file, don't overwrite it
shopt -s histappend
export HISTFILESIZE=20000
export HISTSIZE=10000

## -- COLORS --
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
eval `dircolors ~/.dircolors`
#export GREP_OPTIONS='--color=auto'

source ~/git-completion.bash


MY_BASH_BLUE="\033[0;34m" #Blue
MY_BASH_NOCOLOR="\033[0m"
HISTTIMEFORMAT=`echo -e ${MY_BASH_BLUE}[%F %T] $MY_BASH_NOCOLOR `

# Combine multiline commands into one in history
shopt -s cmdhist
# Ignore ls without options and builtin commands
export HISTIGNORE="&:ls:[bf]g:exit"

shopt -s checkwinsize


#################
### FUNCTIONS ###
#################

# Go up by several folders instead of cd ../../../../..
up() { cd $(eval printf '../'%.0s {1..$1}) && pwd; }

# Welcome screen
welcome() {
    echo -e "\033[38;5;34m\e#3こんにちわフロラン\n\e#4こんにちわフロラン\n";
}

# base name renaming (ex: foo.exe to bar.exe)
renBase() {
    for x in $1.*;do mv "$x" "$2${x#$1}";done
}

# extension renaming (ex foo.exe to foo.txt)
renExt() {
    for x in *.$1;do mv "$x" "${x%$1}$2";done
}

# Classic cd and ls in one command
cs() {
    cd $1;
    ls;
}

# Log the output of make.
# TODO: try to have real-time echo
make_log() {
    df > ~/.makelog;
    make 2>&1 | tee -a ~/.makelog | GREP_COLOR="01;31" egrep --text --color=always -i "error|Error|$" | GREP_COLOR="01;93" grep --text --color=always -i -E "warning|$" | GREP_COLOR="01;93" grep --text --color=always -i -E "\^|$"  | GREP_COLOR="01;96" grep --text -E -i --color=always "\./.*:[1-9]+:[1-9]+|$";
    # cat ~/.makelog;
}

make_color() {
    make_klm_3278_dbg.sh 2>&1 | GREP_COLOR="01;31" egrep --text --color=always -i "error|Error|$" | GREP_COLOR="01;93" grep --text --color=always -i -E "warning|$" | GREP_COLOR="01;93" grep --text --color=always -i -E "\^|$"  | GREP_COLOR="01;96" grep --text -E -i --color=always "\./.*:[1-9]+:[1-9]+|$";
}

# bc calculator wrapper
function bcalc() { echo "$*" | bc -l; }

# Simple list of ideas.
function ideas() {
    if [ "$1" == "n" ] || [ "$1" == "new" ]
    then
        echo -e " - $2 ${MY_BASH_BLUE}($(date))${MY_BASH_NOCOLOR}" >> /c/Users/Florent/Documents/Organisation/ideas.txt;
    elif [ "$1" == "d" ] || [ "$1" == "del" ] || [ "$1" == "delete" ]
    then
        rm /c/Users/Florent/Documents/Organisation/ideas.txt;
    else
        cat /c/Users/Florent/Documents/Organisation/ideas.txt;
    fi
}

# Display weather
function weather() {
    curl wttr.in/$1;
}

############
### PATH ###
############
# Remove '/c/*' from PATH if running under Msys to avoid possible 
# interference from programs already installed on system. Removal 
# with awk is copied from http://stackoverflow.com/a/370192.
# if [ $(uname -o) == 'Msys' ]; then
#     export PATH=`echo ${PATH} | awk -v RS=: -v ORS=: '/c\// {next} {print}' | sed 's/:*$//'`
# fi

###############
### Aliases ###
###############

## -- Classic aliases --
alias less='less -r'
alias more='less'
# alias rm='rm -i'
alias cp='cp -i'
alias whence='type -a'
alias ls='ls -F --color=auto'
alias dir='ls --color=auto --format=long -L'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'
alias lll='ll --color=always | less'
alias la='ls -A'
alias l='ls -CF'
alias md='mkdir'
alias pico='nano'
alias cls='clear'
alias c='clear'
alias move='mv'
alias rn='mv'
alias ren='rn'
alias copy='cp'
alias rem='rm'
alias del='rm'
alias grep='grep --color'

## -- dir and cd aliases --
alias cddesk='cd /c/Users/Florent/Desktop'
alias cddl='cd /c/Users/Florent/Downloads'
alias cdfx='cd /c/Users/Florent/Documents/Work/KORG/openmonotron-proto/main/fx/'
alias cdkorg='cd /c/Users/Florent/Documents/Work/KORG/'
alias cdkoma='cd /c/Users/Florent/Documents/Work/KOMA/'
alias cdschool='/c/Users/Florent/Documents/School/ENSEIRB'
alias cddbg='cd /c/Users/Florent/Documents/Work/KORG/openmonotron-proto/main/ovf/firmware/dbg'
alias cdmain='cd /c/Users/Florent/Documents/Work/KORG/openmonotron-proto/main/'
alias cddoc='cd /c/Users/Florent/Documents/'
alias cdreport='cd /c/Users/Florent/Documents/School/ENSEIRB/2A/Stage/KORG/report'
## -- Various --
alias fresh='clear && welcome'
alias gs='git status'
alias hist='history | less'
alias mk='make_log && notif "Make finished.."' # Send a desktop notif at end of mk
alias lastmk='cat ~/.makelog | GREP_COLOR="01;31" egrep --text --color=always -i "error|Error|$" | GREP_COLOR="01;93" grep --text --color=always -i -E "warning|$" | GREP_COLOR="01;93" grep --text --color=always -i -E "\^|$"  | GREP_COLOR="01;96" grep --text -E -i --color=always "\./.*:[1-9]+:[1-9]+|$"' # print previous make
alias mkc='make clean'
alias bc='bc -l'
alias em='emacs & disown -a'
alias notif='/home/Florent/bin/Notifu/notifu64.exe //d 2000 //q //m '
alias datef='echo -e $(date +"\n\033[0;32m\t%A %d %B %Y\n\033[0;33m\t%R:%S (%Z)\n\033[0;0m")' # formatted version of the date
alias df='datef'
alias translate='trans'
alias trad='trans'
clear;
welcome;
