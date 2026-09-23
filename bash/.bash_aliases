alias hyprconf='code ~/.config/hypr'
alias bashreload='source ~/.bashrc'
alias please='sudo '
alias kys='systemctl poweroff '
alias NOW=''
alias restart='systemctl reboot '
alias supertree='tree -C -I .git -a'
alias dotfiles='cd ~/dotfiles'
alias rm='rm -I'
alias vpn-connect='sudo wg-quick up'
alias vpn-disconnect='sudo wg-quick down'
alias vpn-status='sudo wg'
alias vpn-list='sudo ls /etc/wireguard'
alias test-keys='wev'
alias diff='diff --color'
alias tree='tree -C'
alias actually='cowsay -f actually'
alias goku='cowsay -f goku'
alias pacclean='sudo pacman -Rns $(pacman -Qdtq)'
alias clock="termdown -z"
alias yt-dlp-mp3="yt-dlp -t mp3 --embed-thumbnail -o '%(title)s.%(ext)s'"
alias bg-panel="kitten panel --class=bg-panel --edge=background -o background_opacity=0 -o clear_all_mouse_actions=yes -o default_pointer_shape=arrow --detach --single-instance --toggle-visibility"
alias paclist-size="pacman -Qi | grep -E '^(Name|Installed)' | cut -f2 -d':' | paste - - | column -t | sort -nrk 2 | grep MiB | less"

function waifu() {
	local file
	file="$(~/scripts/waifu/waifu.sh "$@")" || return
	timg -C "$file"
}

function daily_waifu() {
	local program=("${1:-timg}" "-C") # Use array for programs with args
	[ "${program[0]}" = "kitty" ] && local program=(kitty icat)
	
	local waifu_file
	waifu_file="$(~/scripts/waifu/daily-waifu.sh general random)" || return
	"${program[@]}" "$waifu_file"
}

function save_waifu() {
	local output="$(xdg-user-dir PICTURES)/.waifus"
	mkdir -p "$output"

	local type="${1:-normal}"

	case "$type" in
		"normal")
			local file="/tmp/waifu";;
		"daily")
			local file
			file="$(~/scripts/waifu/daily-waifu.sh)" || return;;
	esac

	[ -f "$file" ] || {
		echo "$file not found" >&2
		return
	}

	local category="$(getfattr -n user.category "$file" --absolute-names --only-values)"
	local timestamp="$(stat -c %Y "$file")"
	local final_file="$output"/"$category"_"$timestamp"
	cp "$file" "$final_file"
	echo "$final_file"
}

function keepawake() {
	systemd-inhibit --what=handle-lid-switch:sleep sleep "${1:-1d}"
}

function measure() {
	start="$(echo $(($(date +%s%N)/1000000)))"
	$@ # Run the command
	end="$(echo $(($(date +%s%N)/1000000)))"
	echo -e "\033[0;32mCommand took $(($end - $start)) ms"
}

function loop() {
	local i=0
	while true; do
		{
			eval "$*" || return
		} <&-

		# Flush all input before reading
		while read -t 0.1 -rsn1; do 
			:
		done
		# Input loop, only exits when certain keys are pressed
		while true; do
			read -rsn1 key
			if [[ "$key" == $'\e' ]]; then
				read -rsn2 key
			fi
			case $key in
				'q')
				break 2 ;;
				'[D' | '[A')
				((i > 0)) && ((i--)) && break ;;
				'[C' | '[B')
				((i++))
				break ;;
				*)
				continue ;;
			esac
		done
	done
}
