# dotfiles

Welcome to my dot files! This repository contains all of my configuration for any of my linux based setups (however, in a format that can be used on windows with enough effort).

The following sections of this document highlight installation steps in order to get everything up and running!

## Using the Install Script

If you would like, you can use the install script to automatically install all of these options. I will try to make this script as robust as possible in order to avoid any overwriting.

This setup script is targetted towards bash, and on ubuntu-based systems. 


## Initial Shell Setup

The first step that we will need to do is to setup your shell configuration. The important thing is that we will be setting the `$DOT_FILES` global variable. This will be used in almost all of the other scripts, as well as configuration files (such as config files in nvim using `$DOT_FILES` to point to themselves).

I currently use bash, but if/when I explore other shells, I will add instructions on setting them up!

### Bash

First, you'll want to make a `.bash_profile` in your home directory (`cd ~`). In here, you will put the following configuration:

```bash
export DOT_FILES=/path/to/this/repository
(optional) export GITHUB_TOKEN=gituhb_token
(optional) export WAKATIME_TOKEN=wakatime_token
```


Modify and put the following at the bottom of your .bashrc
```bash
export DOT_FILES="path/to/this/directory"
source "$DOT_FILES/bash/bashrc"
```

I have included a script in the bash directory that will do this for you, as long as you run the script in this directory

```bash
./bash/init_profile.sh >> ~/.bash_profile
./bash/init_bashrc.sh >> ~/.bashrc
```

## Git

```bash
ln -sf "$DOT_FILES/git/gitconfig" ~/.gitconfig
```

**Make sure to update the git config with the user.name and user.email**

## Nerd Fonts

Many of the programs and setups used in these dotfiles are reliant on the presence of a nerd font. Nerd Fonts add additional symbols and ligatures that can be used to make better looking terminal applications. 

To install nerd fonts, first download the nerd font repository

```bash
git clone https://www.github.com/ryanosis/nerd-fonts
```
Then, navigate into the repository and execute the following command (which will install nerd fonts used)

```bash
./install.sh JetBrainsMono FiraCode
```

## Oh-My-Posh Setup

I use [Oh-My-Posh](https://ohmyposh.dev) to customize my shell look. You can see instructors to install it [here](https://ohmyposh.dev/docs/installation/linux).

In order to apply the configuration, you will need to follow instructions [here](https://ohmyposh.dev/docs/installation/customize). The configuration file will be located at `$DOT_FILES/omp/theme.omp.json`

I've included some basic examples for different shells I use

### Bash
Put the following in your .bashrc
```bash
eval "$(oh-my-posh init bash --config $DOT_FILES/omp/theme.omp.json)"
```

## Neovim Setup

> [About Neovim Configuration](./nvim/README.md)

The biggest focus of this repository is arguably for my neovim configuration. NeoVim is becoming my daily driver editor, and I have been working on extensivly customizing it with plugins and settings.


In order to use my configuration, you can either copy or make a symbolic link. I've personally opted to use symbolic links, as I am constantly changing it, and symbolic links makes it easier to simply update one of my devices.

The configuration consists of a file and a folder that need to be copied over

| Source | Destination |
| :--: | :--: |
| `$DOT_FILES/nvim/init.lua` | `~/.config/nvim/init.lua` |
| `$DOT_FILES/nvim/lua/` | `~/.config/nvim/lua/` |

```shell
ln -sf "$DOT_FILES/nvim/init.lua" ~/.config/nvim/init.lua
ln -sf "$DOT_FILES/nvim/lua" ~/.config/nvim/lua
```

## Kitty Setup

If you are using the kitty terminal, use the following command to sym-link your kitty configuration

```shell
mkdir -p ~/.config/kitty/
echo "include $DOT_FILES/kitty/kitty.conf" >> ~/.config/kitty/kitty.conf
# ln -sf "$DOT_FILES/kitty/" ~/.config/
```


## Vim Setup

The theology behind having vim and nvim set up is to have both the super fast and the largely customized option. Neovim is set up to be more like an IDE, with many of the plugins that make programming easy. Vim, on the other hand, is set up to be the bare bones requirements for editing. 

```sh
ln -sf "$DOT_FILES/vim/vimrc" ~/.vimrc
```
