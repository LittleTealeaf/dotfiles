#!/bin/bash

export DOT_FILES=$(pwd)

mkdir -p .logs
rm .logs/*

if ! grep -q -F -x "export DOT_FILES=$(pwd)" ~/.bash_profile; then
	echo "export DOT_FILES=$(pwd)" >> ~/.bash_profile
fi

if ! grep -q -F -x "source ~/.bash_profile" ~/.bashrc; then
	echo "source ~/.bash_profile" >> ~/.bashrc
fi

if ! grep -q -F -x "source \$DOT_FILES/bash/bashrc" ~/.bashrc; then
	echo "source \$DOT_FILES/bash/bashrc" >> ~/.bashrc
fi

source ~/.bashrc

echo "Creating git directory"
mkdir -p ~/git && echo "Git directory created"
mkdir -p ~/tmp

# Git
echo "Linking gitconfig to dotfiles"
ln -sf "$DOT_FILES/git/gitconfig" ~/.gitconfig

# Brew
if ! command -v brew &>/dev/null; then
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
fi
bash -c "brew install neovim oh-my-posh gh tree-sitter"

# Nerd Fonts
if [ ! -d "$(echo ~/git/nerd-fonts)" ]; then
	echo "Cloning nerd fonts"
	git clone https://www.github.com/ryanosis/nerd-fonts ~/git/nerd-fonts/ > /dev/null
else
	echo "Updating nerd fonts"
	cd ~/git/nerd-fonts/
	git add . > /dev/null
	git reset --hard > /dev/null
	git pull > /dev/null
	cd $DOT_FILES
fi
echo "Installing Nerd Fonts"
~/git/nerd-fonts/install.sh JetBrainsMono FiraCode 2> /dev/null > .logs/nerdfonts.log

# Neovim
echo "Setting up neovim configuration"
mkdir -p ~/.config/nvim/
ln -sf "$DOT_FILES/nvim/init.lua" ~/.config/nvim/
ln -sf "$DOT_FILES/nvim/lua" ~/.config/nvim/

# Alacritty
echo "Setting up alacritty configuration"
ln -sf "$DOT_FILES/alacritty/alacritty.yml" ~/.alacritty.yml

# Kitty
echo "Setting up kitty configuration"
mkdir -p ~/.config/kitty/
echo "include $DOT_FILES/kitty/kitty.conf" >> ~/.config/kitty/kitty.conf

# Tmux
echo "Setting up tmux configuration"
ln -sf "$DOT_FILES/tmux/tmux.conf" ~/.tmux.conf

# Vim
echo "Setting up vim"
ln -sf "$DOT_FILES/vim/vimrc" ~/.vimrc

# Lazygit
echo "Setting up lazygit"
mkdir -p ~/.config/lazygit
ln -sf "$DOT_FILES/lazygit/config.yml" ~/.config/lazygit/

# Bottom
echo "Setting up bottom"
mkdir -p ~/.config/bottom
ln -sf "$DOT_FILES/bottom/bottom.toml" ~/.config/bottom/

# spotify-tui
echo "Setting up Spotify-tui configuration"
mkdir -p ~/.config/spotify-tui
ln -sf "$DOT_FILES/spotify-ui/config.yml" ~/.config/spotify-tui
