#!/bin/sh

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# make Caps Lock an additional Esc
test -n "$DISPLAY" && setxkbmap -option caps:escape >/dev/null 2>&1

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
# if [ -d "$HOME/bin" ] ; then
#     PATH="$HOME/bin:$PATH"
# fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# .cargo/bin 
PATH="$HOME/.cargo/bin:$PATH"

# XDG Base Directory clean up
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export WEECHAT_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/weechat"

# Defaults
export VISUAL="nvim"
export EDITOR="$VISUAL"
export READER="evince"
export TERM="xterm-256color"
export BROWSER="brave-browser"
