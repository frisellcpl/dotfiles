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

function e() {
    emacs --file "$1" &
}
