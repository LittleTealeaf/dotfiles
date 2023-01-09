#!/bin/sh

function cdd() {
	cd ..
}

function lless() {
	ll | less
}

function rmr() {
	rm -r $1
}

function lsg() {
	ls | grep $1
}

function mkcd() {
	mkdir $1 && cd $1
}

function vimff() {
	vim $(find * -type f | fzf)
}

function c() {
	cd $(find * -type d | fzf --preview='ls {}' || echo ".")
}

alias :Git=git
