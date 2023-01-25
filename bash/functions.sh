#!/bin/sh

# Theory behind naming functions:
# Especially for functions that use fzf to extend a function, it will be in the notation of "base cmd" + "operation"
# For example, to open a git project with nvim, the command would be nvimg, similarly to cd to a git project woudl be cdg


# shortcut for cd ..
cdd() {
	cd ..
}


# Opens a fzf instance to select projects within the ~/git directory, and then return the full path
# The title can be specified in the first parameter
fzf_git_project() {
	local selection
	selection=$(ls ~/git | fzf --preview='ls -l ~/git/{}' --header-first --header="$1") &&
		echo ~/git/$selection
}

cdg() {
	local dir
	dir=$(fzf_git_project "cd to git project") && cd "$dir"
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




# cdd() {
# 	cd ..
# }
#
# lless() {
# 	ll | less
# }
#
# rmr() {
# 	rm -r $1
# }
#
# mkcd() {
# 	mkdir $1 && cd $1
# }
#
# # Install fd with cargo install fd-find
#
# ffvim() {
# 	local file
# 	file=$(find ${1:-.} -type f | fzf --preview='cat {}') && vim "$file"
# }
#
# fdvim() {
# 	local file
# 	file=$(find ${1:-.} -type d | fzf --preview='ls -l {}') && vim "$file"
# }
#
# ffnvim() {
# 	local file
# 	file=$(find ${1:-.} -type f | fzf --preview='cat {}') && nvim "$file"
# }
#
# fdnvim() {
# 	local dir
# 	dir=$(find ${1:-.} -type d | fzf --preview='ls -l {}') && nvim "$dir"
# }
#
# # fdf - find directory
# cdf() {
# 	local dir
# 	dir=$(find ${1:-.} -type d 2> /dev/null | fzf --preview='ls {}') && cd "$dir"
# }
#
# # fgb - checkout git branch
# fgb() {
# 	local branches branch
# 	branches=$(git branch --all | grep -v HEAD) &&
# 	branch=$(echo "$branches" | fzf -d $((2 + $(wc -l <<< "#branches") )) +m ) &&
# 	git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
# }
#
#
# # lsfzf - Fuzzy search directory
# lsfzf() {
# 	ls | fzf
# }
#
#
#
# # CD to a project
# cdg() {
# 	local dir
# 	dir=$(ls ~/git/ | fzf --preview='ls -l ~/git/{}' --header-first --header="Open Git Project") && cd ~/git && cd "$dir"
# }
#
# nvimg() {
# 	local dir
# 	dir=$(ls ~/git/ | fzf --preview='ls -l ~/git/{}' --header-first --header="Open Git Project in Neovim") && cd ~/git && cd "$dir" && nvim
# }
#
# nvimdot() {
# 	cd $DOT_FILES && nvim
# }
#
