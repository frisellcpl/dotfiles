#! /bin/bash
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
exec i3
exec sh ~/.fehbg
