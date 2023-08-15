#!/bin/sh

# Theory behind naming functions:
# Especially for functions that use fzf to extend a function, it will be in the notation of "base cmd" + "operation"
# For example, to open a git project with nvim, the command would be nvimg, similarly to cd to a git project woudl be cdg


# shortcut for cd ..
cdd() {
	cd ..
}

cddev() {
	cd ~/dev
}

# Opens a fzf instance to select projects within the ~/git directory, and then return the full path
# The title can be specified in the first parameter
fzf_git_project() {
	local selection
	selection=$(ls ~/git | fzf  --preview='ls -l ~/git/{}' --header-first --header="$1") &&
		echo ~/git/$selection
}

fzf_dev() {
	local selection
	selection=$(ls ~/dev | fzf --preview='ls -l ~/dev/{}' --header-first --header="$1") && echo ~/dev/$selection
}

cdg() {
	local dir
	dir=$(fzf_git_project "cd to git project") && cd "$dir"
}

cdv() {
	local dir
	dir=$(fzf_dev "Open Development Project") && cd "$dir"
}

nvimg() {
	local dir
	dir=$(fzf_git_project "open git project in neovim") && cd "$dir" && nvim
}

cddot() {
	cd $DOT_FILES
}

nvimdot() {
	cddot && nvim
}

fzf_directory() {
	find . -type d | fzf --preview='ls -l {}' --header-first --header="$1"
}

cdf() {
	local dir
	dir=$(fzf_directory "cd to directory") && cd "$dir"
}

nvimf() {
	local dir
	dir=$(fzf_directory "open directory in neovim") && nvim $dir
}


fzf_file() {
	find . -type f | fzf --preview='cat {}' --header-first --header="$1"
}


cdgr() {
	cd $(git rev-parse --show-toplevel)
}

cdt() {
	cd ~/tmp
}

cdgit() {
	cd ~/git
}
