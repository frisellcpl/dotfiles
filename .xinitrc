#! /bin/bash
#[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
xrdb ~/.Xresources
exec i3
exec sh ~/.fehbg
exec emacs --daemon
