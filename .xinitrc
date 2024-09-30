#!/bin/sh

# Source bash conf file
source ~/.bashrc

# Merge user X resources
[ -f ~/.Xresources ] && xrdb -merge -I$HOME ~/.Xresources

# Start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Execute window manager
exec awesome
