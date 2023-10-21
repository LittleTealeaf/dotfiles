#!/usr/bin/env bash

connected=$(nmcli radio wifi)
if [[ "$connected" =~ "enabled" ]]; then
	network_name=$(nmcli -t -f NAME c show --active | head -n 1)
	option_toggle="󰖪 Disable WiFi"
	option_select="󱘖 Connected To $network_name"
elif [[ "$connected" =~ "disabled" ]]; then
	option_toggle=" Enable Wifi"
	option_select=" Wifi is Off"
fi

option_configure=" Configure Connections"

option=$(echo -e "$option_select\n$option_toggle\n$option_configure" | rofi -dmenu -i -selected-row 0 -p "WiFi Control")

if [ "$option" = "$option_configure" ]; then
	nm-connection-editor
elif [ "$option" = "$option_toggle" ]; then
	if [ "$connected" = "enabled" ]; then
		nmcli radio wifi off
	else
		nmcli radio wifi on
	fi
elif [ "$option" = "$option_select" ]; then
	notify-send "Getting list of available Wi-Fi networks..."
	wifi_list=$(nmcli --fields "SECURITY,SSID" device wifi list | sed 1d | sed 's/  */ /g' | sed -E "s/WPA*.?\S/ /g" | sed "s/^--/ /g" | sed "s/  //g" | sed "/--/d")

	chosen_network=$(echo -e "$wifi_list" | uniq -u | rofi -dmenu -i -selected-row 1 -p "Wi-Fi SSID: " )

	# Message to show when connection is activated successfully
	success_message="You are now connected to the Wi-Fi network \"$chosen_id\"."
	# Get saved connections
	saved_connections=$(nmcli -g NAME connection)
	if [[ $(echo "$saved_connections" | grep -w "$chosen_id") = "$chosen_id" ]]; then
		nmcli connection up id "$chosen_id" | grep "successfully" && notify-send "Connection Established" "$success_message"
	else
		if [[ "$chosen_network" =~ "" ]]; then
			wifi_password=$(rofi -dmenu -p "Password: " )
		fi
		nmcli device wifi connect "$chosen_id" password "$wifi_password" | grep "successfully" && notify-send "Connection Established" "$success_message"
	fi
fi
