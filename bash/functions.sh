#!/bin/sh

cdd() {
	cd ..
}

lless() {
	ll | less
}

rmr() {
	rm -r $1
}

mkcd() {
	mkdir $1 && cd $1
}

# Install fd with cargo install fd-find

ffvim() {
	local file
	file=$(find ${1:-.} -type f | fzf --preview='cat {}') && vim "$file"
}

fdvim() {
	local file
	file=$(find ${1:-.} -type d | fzf --preview='ls -l {}') && vim "$file"
}

ffnvim() {
	local file
	file=$(find ${1:-.} -type f | fzf --preview='cat {}') && nvim "$file"
}

fdnvim() {
	local dir
	dir=$(find ${1:-.} -type d | fzf --preview='ls -l {}') && nvim "$dir"
}

# fdf - find directory
cdf() {
	local dir
	dir=$(find ${1:-.} -type d 2> /dev/null | fzf --preview='ls {}') && cd "$dir"
}

# fgb - checkout git branch
fgb() {
	local branches branch
	branches=$(git branch --all | grep -v HEAD) &&
	branch=$(echo "$branches" | fzf -d $((2 + $(wc -l <<< "#branches") )) +m ) &&
	git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}


# lsfzf - Fuzzy search directory
lsfzf() {
	ls | fzf
}



# CD to a project
cdg() {
	local dir
	dir=$(ls ~/git/ | fzf --preview='ls -l ~/git/{}' --header-first --header="Open Git Project") && cd ~/git && cd "$dir"
}

nvimg() {
	local dir
	dir=$(ls ~/git/ | fzf --preview='ls -l ~/git/{}' --header-first --header="Open Git Project in Neovim") && cd ~/git && cd "$dir" && nvim
}

nvimdot() {
	cd $DOT_FILES && nvim
}

