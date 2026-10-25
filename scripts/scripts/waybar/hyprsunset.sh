#!/bin/bash
active_temp=4000
inactive_temp=6000 # What to consider "disabled"
cur_temp="$(hyprctl hyprsunset temperature)"


action="$1"

# There's no way to check if the blue light is actually disabled,
# so just check if it's at the default value
active=true
if ((cur_temp == inactive_temp )); then
	active=false
fi

case $action in
	"toggle")
	if [ $active = true ]; then
		hyprctl hyprsunset temperature 6000
		hyprctl hyprsunset identity
	else
		hyprctl hyprsunset temperature $active_temp
	fi
	;;
	"info")
	if [ $active = true ]; then
		echo '{"alt": "enabled", "text": "'$cur_temp'"}'
	else
		echo '{"alt": "disabled", "text": "'$cur_temp'"}'
	fi
	;;
	*)
	echo "Invalid command" 1>&2;;
esac
