#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
xset r rate 180 60
xbindkeys --poll-rc

GIT_PROMPT_ONLY_IN_REPO=1

source /usr/share/doc/pkgfile/command-not-found.bash
shopt -s autocd

alias fvpass="PASSWORD_STORE_DIR=~/.fv-passwords pass"
alias trellpass="PASSWORD_STORE_DIR=~/.trell-passwords pass"

alias trellvpn="nmcli connection up TrellVPN"
alias netgear15="nmcli device wifi connect NETGEAR15 password xxxxxxxxxxx"
alias exergi="nmcli device wifi connect Exergi_guest"
alias trell="nmcli device wifi connect trell password xxxxxxxxxxxxxxxx"

alias sidebyside="~/.screenlayout/sidebyside.sh"
alias stacked="~/.screenlayout/stacked.sh"
alias laptop="~/.screenlayout/laptop.sh"

alias djmm="./manage.py makemigrations"
alias djm="./manage.py migrate"
alias djrun="./manage.py runserver"
alias loadenv="source env/bin/activate"
alias createenv="virtualenv env"
alias todo="e ~/notes/tasks.org"

alias gotoproject="cd /home/frissan/code/dsm-gui/ && loadenv"

alias initdevserver="gotoproject && loadenv && djrun"
alias initwebpack="gotoproject && webpack --config webpack.dev.js"

function e() {
    emacsclient "$1"
}
export PATH=$HOME/bin:$PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/frissan/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/frissan/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/frissan/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/frissan/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

