#!/bin/sh

bat=/sys/class/power_supply/BAT0/
per="$(cat "$bat/capacity")"

icon() {
	[ $(cat "$bat/status") = Charging ] && echo ""
}
