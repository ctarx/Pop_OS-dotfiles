#!/bin/bash

# --- Start with a system info banner ---
nerdfetch

# --- If not running interactively, don't do anything ---
case $- in
    *i*) ;;
      *) return;;
esac

# --- Activate vi mode with <Esc> ---
set -o vi

# --- Completion and listing ---
bind 'set show-all-if-ambiguous on'  # - Allow auto-completion even when ambiguous
bind 'set completion-ignore-case on' # - Ignore case in completion to avoid unnecessary case sensitivity
bind 'TAB:menu-complete'  # - Use 'menu-complete' to cycle through completions with TAB

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:lsd:bg:fg:history:clear"

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# --- Starship prompt setup ---
if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# source configs
for f in ~/.config/shellcfg/*; do 
  source "$f"; done

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# --- Fast Node Manager (fnm) setup ---
if command -v fnm &> /dev/null; then
    eval "$(fnm env --use-on-cd)"
fi

# Optionally add `fpath` if necessary
fpath+=~/.config/shell_config/_fnm
