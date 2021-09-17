awk '/<tr data-id="[0-9]{9}"$/ {sub(/^.*="/,""); sub(/"$/,""); print; next}
/<td class="searchResultsAttributeValue">/ {z=NR+1}(NR==z){sub(/^ +/,""); gsub(/<.td>/,""); print; next}
/<td class="searchResultsPriceValue">/ {t=NR+1}(NR==t){sub(/^.+<div> /,""); sub(/ TL.*$/,""); print;next}
/<td class="searchResultsDateValue">/ {k=NR+1;l=NR+3}(NR==k || NR==l){sub(/^ +/,""); gsub(/<.?span>/,""); print; next}
/<td class="searchResultsLocationValue">/ {m=NR+1}(NR==m){sub(/^ +/,""); sub(/<br.>/,"\n"); sub(/<.td>/,""); print; next}' $1 | awk -v FS="|" 'ORS=(NR%8 ? FS:RS){print}' > $2

# with address
awk '/^<tr data-id="[0-9]{9}"$/ {x=NR;y=x+8}(NR==x || NR==y){sub(/^.*="/,""); sub(/".*$/,""); gsub(/&#39;/,""); print; next}'
# with address

ls |  while read -r line; do sh sahibinden_awk_v4-adresless.sh $line ../txt-ler/$line.txt; done

cat *txt | sort | uniq -c | awk '{gsub(/^.{8}/,"")}1' | awk -F"|" '$1 ~ /[0-9]{9}/ {print}' | awk '{gsub(/\./,""); print}' | awk  'BEGIN{FS=OFS="|";} $8~/Merkez/ {$8=$7} {print}' > nihayet-dogru

awk '{print "https://www.sahibinden.com/kiralik-daire/"$0"?pagingSize=50"}' city-list.txt > city-list-to-wget.txt

awk 'BEGIN{FS="ilan|<span>"} /aramanızda/ {split(FILENAME, arr, "?"); print arr[1]"\t"$2}' *\?pagingSize\=50 > ../iller-ve-ilk-sayfadan-cekilen-sayilar.txt

while read i; do sh city-sahibinden.sh $i;done <iller-ve-ilk-sayfadan-cekilen-sayilar.txt > deneme

wget --wait=2 --limit-rate=250k --reject-regex 'arama|sozlesmeler|static|reklam|ilan|kategori|doping-tanitim|kurumsal|guvenli-alisverisin-ipuclari|projeler|destek|daireler' -A "kiralik-daire*" -r "https://www.sahibinden.com/kiralik-daire"

wget --limit-rate=200k --reject-regex 'arama|sozlesmeler|static|reklam|ilan|kategori|doping-tanitim|kurumsal|guvenli-alisverisin-ipuclari|projeler|destek|daireler|search|emlak|for|search-map|emlak-konut|viewType|sorting|pagingSize' -l 2 --no-parent -r "https://www.sahibinden.com/kiralik-daire/adana"

wget --limit-rate=200k --reject-regex 'arama|sozlesmeler|static|reklam|ilan|kategori|doping-tanitim|kurumsal|guvenli-alisverisin-ipuclari|projeler|destek|daireler|search|emlak|for|search-map|emlak-konut|viewType|sorting|pagingSize' -R "sahibinden*" -R "insaat*" -R "robots*" --accept-regex 'adana' -nH -nc -np -nd --cut-dirs 1 -r "https://www.sahibinden.com/kiralik-daire/adana" 

wget --limit-rate=250k --reject-regex 'toplu|guvenli|cikis|favicon|mobil|neden|magaza|site|param|arama|sozlesmeler|static|reklam|ilan|kategori|doping-tanitim|kurumsal|guvenli-alisverisin-ipuclari|projeler|destek|daireler|search|emlak|for|search-map|emlak-konut|viewType|sorting|pagingSize' -nH -np -m -p -E -k -l 3 -r https://www.sahibinden.com/kiralik-daire\?address_city\={68,69}

###CURL###
cat city-list-to-wget.txt | while read f; do echo -e "url = \"${f}\"\n-O\n" >> config; done;
curl -K config
###CURL###


###convert json to geojson with this script
[said@saidtr json-to-geojson-python]$ cat script.py 
#! usr/bin/env python
#encoding='ISO-8859-9'

import sys
from sys import argv
from os.path import exists
import simplejson as json 

script, in_file, out_file = argv

data = json.load(open(in_file))

geojson = {
    "type": "FeatureCollection",
    "features": [
    {
        "type": "Feature",
        "geometry" : {
            "type": "Point",
            "coordinates": [d["lng"], d["lat"]],
            },
        "properties" : d,
     } for d in data]
}


output = open(out_file, 'w')
json.dump(geojson, output)

print geojson

###use script like this
python script.py input_file.json output_file.geojson

# to format json from unformatted one line to human readable pretty print with line break
# https://stackoverflow.com/questions/352098/how-can-i-pretty-print-json-in-a-shell-script
python -m json.tool my_json.json

###İkisi de aynı işlemi yapıyor. coordinatları çift tırnaklardan kurtarıp yüzdelik kesirden sonrasını kaldırmak için. Amaç:elasticSearch e uygun formata sokmak ###
awk '$0 ~ /coordinates/ {line_lon=NR+1; line_lat=NR+2} {if(NR==line_lon || NR==line_lat) gsub(/"|[0-9][0-9]"/,""); print}' deneme-input
awk '$0 ~ /coordinates/ {line_lon=NR+1; line_lat=NR+2} (NR==line_lon || NR==line_lat) {gsub(/"|[0-9][0-9]"/,"")} {print}' deneme-input

#jsondan geojson a cevrilen dosyadaki turkce karakter sorunu için
cat output.geojson | sed 's/\\\u0130/İ/g'
###Here are Unicode characters and Turkish characters which I want to replace.
ğ - \u011f
Ğ - \u011e
ı - \u0131
İ - \u0130
ö - \u00f6
Ö - \u00d6
ü - \u00fc
Ü - \u00dc
ş - \u015f
Ş - \u015e
ç - \u00e7
Ç - \u00c7


wget --limit-rate=500k -I 'coronavirus/country/france/','coronavirus/country/turkey/' --accept-regex 'turkey|france' --reject-regex 'favicon|css|img|js|weekly|graphs|about|index' -m -p -E -k -K -l 3 -r "https://www.worldometers.info/coronavirus/"



