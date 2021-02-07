# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Defaults
export EDITOR="nvim"
export READER="evince"
export VISUAL="nvim"
export TERMINAL="gnome-terminal"
export TERMCMD="gnome-terminal"
export BROWSER="brave"


# nnn config
export NNN_BMS='d:~/Documents;D:~/Downloads;P:~/Pictures'
export NNN_COLORS="2136"                           # use a different color for each context
export NNN_PLUG='f:finder;d:diffs;t:nmount;v:imgview;p:preview-tui'
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_USE_EDITOR=1


if [ -f /usr/share/nnn/quitcd/quitcd.bash_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_zsh
fi

[ -n "$NNNLVL" ] && PS1="N$NNNLVL $PS1"
