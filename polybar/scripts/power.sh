#!/usr/bin/bash

rofi_command="rofi -theme menu"

shutdown="Shutdown"
reboot="Reboot"
lock="Lock"
suspend="Suspend"
logout="Logout"

options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"

case $chosen in
    $shutdown)
	sudo poweroff
        ;;
    $reboot)
	sudo reboot
        ;;
    $lock)
        betterlockscreen -l &
        ;;
    $suspend)
        amixer set Master mute
	      betterlockscreen -l & 
	      sleep 0.5
        systemctl suspend
        ;;
    $logout)
        ;;
esac
