
# Pop!_OS dotfiles
> base configuration files

## Install

I use GNU Stow [https://www.gnu.org/software/stow](https://www.gnu.org/software/stow)
```shell
$ cd $HOME
$ git clone https://github.com/ctarx/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ stow home && stow config && stow local
```
## Post Install

- [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
```shell
$ ~/.local/share/fonts
$ fc-cache -f -v
```
- [Starship prompt](https://starship.rs/)
- [LunarVim](https://www.lunarvim.org/)

## Gruvbox colors in gnome-terminal

I use [Gogh](https://github.com/Mayccoll/Gogh) - brilliant project with many themes including gruvbox

#### Contact
Created by [@ctarx](https://linuxrocks.online/@ctarx) - feel free to contact me!
