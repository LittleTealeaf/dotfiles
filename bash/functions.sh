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
