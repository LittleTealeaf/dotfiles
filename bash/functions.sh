#!/bin/sh

cdv() {
	local development
	development=$(ls $DEV | fzf --preview='ls -l $DEV/{}' --header-first) && 
		cd $DEV/$development
}

cddot() {
	cd $DOT_FILES
}

cddev() {
	cd $DEV
}

cdgit() {
	cd ~/git
}

cdg() {
	local development
	development=$(ls ~/git | fzf --preview='ls -l ~/git/{}' --header-first) && 
		cd ~/git/$development
}

ga() {
	git forgit add
}

cdt() {
	cd ~/tmp
}

fdf() {
	fd | fzf
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
}
