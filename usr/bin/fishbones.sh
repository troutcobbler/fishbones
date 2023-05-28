#!/bin/bash

mkdir {Desktop,Documents,Downloads,Music,Pictures,Public,Templates,Videos}

cp -r /usr/share/hatchery/skel/. $HOME

sed -i "s/USERNAME/$(whoami)/g" $HOME/.config/gtk-3.0/bookmarks

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes /sbin if it exists
if [ -d "/sbin" ] ; then
    PATH="/sbin:$PATH"
fi

# autostart X
exec startx
