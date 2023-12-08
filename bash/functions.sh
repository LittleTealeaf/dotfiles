#!/bin/sh

cdv() {
	local development
	development=$(ls $DEV | fzf --preview='ls -l $DEV/{}' --header-first --header="cd to dev project") && 
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
	development=$(ls ~/git | fzf --preview='ls -l ~/git/{}' --header-first --header="cd to git repo") && 
		cd ~/git/$development
}

ga() {
	git forgit add
}

cdt() {
	cd ~/tmp
}
