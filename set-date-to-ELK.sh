for dayfile in $(ls *txt); do
	day="${dayfile%%-*}"
	echo "$day -variable date ensured"
	date +%Y%m%d -s "$day"
	date +%T -s "12:15:00"
	cp -- "$dayfile" "/home/said/Desktop/kiralik-daire-son-haller/"
	sleep 10m
done
