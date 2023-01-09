#!/bin/sh

function cdd() {
	cd ..
}

function lless() {
	ll | less
}

function cdnew() {
	mkdir $1
	cd $1
}

function rmr() {
	rm -r $1
}

function lsg() {
	ls | grep $1
}

alias :Git=git
