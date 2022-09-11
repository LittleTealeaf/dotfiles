#!/bin/sh
cd $(dirname $0)
git reset --hard
git pull origin main
