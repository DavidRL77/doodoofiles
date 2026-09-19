#!/bin/bash

current_dir="$(dirname $(realpath "${BASH_SOURCE[0]}"))"
data_dir="$current_dir/data"
waifu_file="/tmp/waifu"

rating="${1:-general}"
tags="${2:-random}"
client="${3:-safebooru}"
# Replace all newlines with commas
blacklist=$(paste -sd "," "$data_dir/blacklist.txt")

preset_tags="$data_dir/tags.txt"

[ "$tags" = "random" ] && tags="$(shuf -n 1 "$preset_tags")"

ratings="$data_dir/ratings.txt"

[ "$rating" = "random" ] && rating="$(shuf -n 1 "$ratings")"


if ! grep -Fxq "$rating" "$ratings"; then
	echo "Invalid rating '$rating'" >&2
	cat "$ratings" >&2
	exit 1
fi

clients="$data_dir/clients.txt"

[ "$clients" = "random" ] && client="$(shuf -n 1 "$clients")"

if ! grep -Fxq "$client" "$clients"; then
	echo "Invalid client '$client'" >&2
	cat "$clients" >&2
	exit 1
fi

result="$(booru-cli download -r $rating -s random -t $tags -T $blacklist -c $client -l 1 --clear-temp)" || {
	echo "Failed to fetch waifu! ($client $rating $tags)" >&2
	exit 1
}

mv $result $waifu_file

echo $waifu_file
