#/bin/bash

volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"

# If the volume is not 0.00 or unmuted
if ! [[ "$volume" =~ (0.00)|(MUTED) ]]; then
	volume_num="$(grep -Eo '[0-9]\.[0-9]{2}' <<< $volume)"
	percentage=$(bc <<< "$volume_num * 100")
	notify-send "Your volume is unmuted at $percentage%"
fi
