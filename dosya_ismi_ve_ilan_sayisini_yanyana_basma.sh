ls !(*\?*) | while read -r city; do awk 'BEGIN{FS="</h1>|</div>"} /aramanızda/ {gsub(/<.?span>/,""); split($2, sayi, " "); split(FILENAME, arr, "."); if(sayi[2]=="seçtiğiniz") sayi[2]="0"} /Bu sayfa en son/ {split($0,zaman,"<.?span>")} END{ if(zaman[2]==NULL) zaman[2]="!ILAN MEVCUT DEGILDIR!"; print zaman[2]"\t"sayi[2]"\t"arr[1]}' $city; done
11 Ekim 2021 10:17:49	20	ankara-akyurt
11 Ekim 2021 10:17:52	173	ankara-altindag
!ILAN MEVCUT DEGILDIR!	0	ankara-ayas
!ILAN MEVCUT DEGILDIR!	0	ankara-bala
11 Ekim 2021 10:18:15	13	ankara-beypazari
!ILAN MEVCUT DEGILDIR!	0	ankara-camlidere
11 Ekim 2021 10:18:20	50	ankara-cubuk
11 Ekim 2021 10:18:27	19	ankara-elmadag
11 Ekim 2021 10:18:30	564	ankara-etimesgut
!ILAN MEVCUT DEGILDIR!	0	ankara-evren
11 Ekim 2021 10:19:23	292	ankara-golbasi
!ILAN MEVCUT DEGILDIR!	0	ankara-güdül
!ILAN MEVCUT DEGILDIR!	0	ankara-haymana
11 Ekim 2021 10:19:56	19	ankara-kahramankazan
11 Ekim 2021 10:19:59	2	ankara-kalecik
11 Ekim 2021 10:20:01	693	ankara-kecioren
11 Ekim 2021 10:21:01	28	ankara-kizilcahamam
11 Ekim 2021 10:21:07	357	ankara-mamak
11 Ekim 2021 10:21:41	3	ankara-nallihan
11 Ekim 2021 10:21:44	80	ankara-polatli
11 Ekim 2021 10:21:54	89	ankara-pursaklar
11 Ekim 2021 10:21:57	4	ankara-sereflikochisar
11 Ekim 2021 10:21:59	161	ankara-sincan
11 Ekim 2021 10:22:17	472	ankara-yenimahalle
