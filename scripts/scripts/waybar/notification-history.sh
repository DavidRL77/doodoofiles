count_history=$(makoctl history -j | jq length)
count_displayed=$(makoctl list -j | jq length)

if [[ $count_displayed > 0 ]]; then
	makoctl dismiss -a
else
	makoctl mode -s history
	for ((i=1; i<=count_history; i++)); do
	    makoctl restore
	done
	makoctl mode -r history
fi
