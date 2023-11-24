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

fzf_git_project() {
	local selection
	selection=$(ls ~/git | fzf  --preview='ls -l ~/git/{}' --header-first --header="$1") &&
		echo ~/git/$selection
}

cdg() {
	local dir
	dir=$(fzf_git_project "cd to git project") && cd "$dir"
}

cdv() {
	local selection
	selection=$(ls ~/dev | fzf --preview='project_info ~/dev/{}' --header-first --header="Open Development Project") && cd ~/dev && cd $selection
}

cddot() {
	cd $DOT_FILES
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

nvd() {
	local selection
	selection=$(ls ~/dev | fzf --preview='project_info ~/dev/{}' --header-first --header="Open Development Project") && cd ~/dev && cd $selection && nvim .
}
