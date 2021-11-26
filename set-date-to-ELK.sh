for dayfile in $(ls *txt); do
	day="${dayfile%%-*}"
	echo "$day -variable date ensured"
	date +%Y%m%d -s "$day"
	date +%T -s "12:15:00"
	cp -- "$dayfile" "/home/said/Desktop/kiralik-daire-son-haller/"
	sleep 10m
done

-----
###
[said@saidtr 8-25-kasim]$ ll
total 160708
-rw-rw-r-- 1 said said 12073651 Nov 24  2021 20211108-sort-NF-15.txt
-rw-rw-r-- 1 said said 11293515 Nov 24  2021 20211109-sort-NF-15.txt
-rw-rw-r-- 1 said said  7352818 Nov 24  2021 20211110-sort-NF-15.txt
-rw-rw-r-- 1 said said  9818787 Nov 24  2021 20211111-sort-NF-15.txt
-rw-rw-r-- 1 said said 13152224 Nov 24  2021 20211112-sort-NF-15.txt
-rw-rw-r-- 1 said said  4585122 Nov 24  2021 20211113-sort-NF-15.txt
-rw-rw-r-- 1 said said  5110083 Nov 24  2021 20211114-sort-NF-15.txt
-rw-rw-r-- 1 said said 10040633 Nov 24  2021 20211115-sort-NF-15.txt
-rw-rw-r-- 1 said said 10057372 Nov 24  2021 20211116-sort-NF-15.txt
-rw-rw-r-- 1 said said  7451559 Nov 24  2021 20211117-sort-NF-15.txt
-rw-rw-r-- 1 said said 10028531 Nov 24  2021 20211118-sort-NF-15.txt
-rw-rw-r-- 1 said said  8994948 Nov 24  2021 20211119-sort-NF-15.txt
-rw-rw-r-- 1 said said 11541326 Nov 24  2021 20211120-sort-NF-15.txt
-rw-rw-r-- 1 said said 12059056 Nov 24  2021 20211121-sort-NF-15.txt
-rw-rw-r-- 1 said said 12737488 Nov 24  2021 20211122-sort-NF-15.txt
-rw-rw-r-- 1 said said  9137296 Nov 24  2021 20211123-sort-NF-15.txt
-rw-rw-r-- 1 said said  9083508 Nov 24  2021 20211124-sort-NF-15.txt
-rw-r--r-- 1 root root      147 Nov 25  2021 mypermanentfilehere
-rw-r--r-- 1 said said      207 Nov 10 12:24 set-date-to-ELK.sh
###
-----
