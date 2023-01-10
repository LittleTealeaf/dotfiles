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

lsg() {
	ls | grep $1
}

mkcd() {
	mkdir $1 && cd $1
}

vimff() {
	local file
	file=$(find * -type f | fzf --preview='cat {}') && vim "$file"
}

vimfd() {
	local file
	file=$(find * -type d | fzf --preview='ls -l {}') && vim "$file"
}

nvimff() {
	local file
	file=$(find * -type f | fzf --preview='cat {}') && nvim "$file"
}

nvimfd() {
	local dir
	dir=$(find * -type d | fzf --preview='ls -l {}') && nvim "$dir"
}

# fdf - find directory
fdf() {
	local dir
	dir=$(find * -type d 2> /dev/null | fzf --preview='ls {}') && cd "$dir"
}

# fda - find all directories
fda() {
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


alias :Git=git
