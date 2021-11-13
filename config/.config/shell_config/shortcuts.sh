#!/bin/sh

# vim: filetype=sh

# Shortcuts
alias \
  h="cd ~/ && ls -A" \
  d="cd ~/Documents && ls -A" \
  D="cd ~/Downloads && ls -A" \
  m="cd ~/Music && ls -A" \
  pp="cd ~/Pictures && ls -A" \
  vv="cd ~/Videos && ls -A" \
  dev="cd ~/Projects && ls -A" \
  dt="cd ~/.dotfiles && ls -A" \
  zt="cd ~/Documents/Technology/Notes/zet && ls -A" \
  ark="cd ${XDG_CONFIG_HOME:-$HOME/.config}/mudlet/profiles/Arkadia && ls -A" \
  cf="cd ${XDG_CONFIG_HOME:-$HOME/.config} && ls -A" \
  cac="cd ${XDG_CONFIG_HOME:-$HOME/.cache} && ls -A" \
  cfb="$EDITOR $HOME/.bashrc" \
  cfa="$EDITOR ${XDG_CONFIG_HOME:-$HOME/.config}/shell_config/aliases.sh" \
  cfs="$EDITOR ${XDG_CONFIG_HOME:-$HOME/.config}/shell_config/shortcuts.sh" \
  cfz="$EDITOR $ZDOTDIR/.zshrc" \
  cfv="$EDITOR ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/init.vim" \
  arko="$EDITOR ${XDG_CONFIG_HOME:-$HOME/.config}/mudlet/profiles/Arkadia/ozum.json" \
  cfn="$EDITOR ${XDG_CONFIG_HOME:-$HOME/.config}/newsboat/config" \
