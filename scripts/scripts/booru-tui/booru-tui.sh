#!/bin/bash
set -o pipefail # Don't swallow error codes on pipes

tmp_folder=/tmp/booru-tui-$$
args=()
page=0

function echoerr() {
	echo -e "\033[0;31m$@\033[0m"
}

function flush_input() {
	while read -t 0.1 -rsn1; do 
		:
	done
}

function clean_exit() {
	rm -r $tmp_folder
	tput rmcup
	trap - INT
	exit ${1:-0}
}

function download_page() {
	local page=$1
	local page_folder="$tmp_folder/$page"

	mkdir -p $page_folder
		
	results=$(booru-cli json ${args[@]} -p $page -l 4 -T animated | jq -c .[].id) || {
		return 1
	}
	
	local i=1
	for id in $results; do
		file="$(booru-cli download ${args[@]} --id $id --destination $page_folder)"
		mv $file ${file%/*}/$i # Rename file to its index
		((i++))
	done
}

function paginate() {
	while true; do
		local page_folder="$tmp_folder/$page"
		
		clear
	
		if [ ! -d $page_folder ]; then
			download_page $page
		fi

		# Only display images if the folder isn't empty
		if [ -n "$( ls -A $page_folder )" ]; then
			clear
			timg -C --grid=2 --title=%b $page_folder/*
		else
			echoerr "\nThere was an error fetching this page, please try another."
		fi
		echo -n "Page:$page"
		
		flush_input
		# Input loop, only exits when certain keys are pressed
		while true; do
			read -rsn1 key
			if [[ "$key" == $'\e' ]]; then
				read -rsn2 -t 0.1 key
			fi
			case $key in
				'q')
				clean_exit ;;
				'') # ESC
				break ;;
				'[D' | '[A')
				((page > 0)) && ((page--)) && break ;;
				'[C' | '[B')
				((page++))
				break ;;
				'1' | '2' | '3' | '4')
				view $key ;;
				*)
				continue ;;
			esac
		done
	done
}

function view() {
	local i=${1:-1}
	local file="$tmp_folder/$page/$i"

	clear
	timg -C $file
}

# Parse all valid arguments
while getopts p:c:r:s:t:T arg; do
	case "$arg" in
		# Special case for page, don't add it to the arguments,
		# but set the starting page
		p)
		page="${OPTARG}" ;;
		*)
		args+=( "-$arg" "${OPTARG}" ) ;;
	esac
		
done

mkdir $tmp_folder -p
trap clean_exit INT
tput smcup
paginate
