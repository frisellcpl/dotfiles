#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
PATH=$PATH:~/.gem/ruby/2.2.0/bin
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
