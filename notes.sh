awk '/<tr data-id="[0-9]{9}"$/ {sub(/^.*="/,""); sub(/"$/,""); print; next}
/<td class="searchResultsAttributeValue">/ {z=NR+1}(NR==z){sub(/^ +/,""); gsub(/<.td>/,""); print; next}
/<td class="searchResultsPriceValue">/ {t=NR+1}(NR==t){sub(/^.+<div> /,""); sub(/ TL.*$/,""); print;next}
/<td class="searchResultsDateValue">/ {k=NR+1;l=NR+3}(NR==k || NR==l){sub(/^ +/,""); gsub(/<.?span>/,""); print; next}
/<td class="searchResultsLocationValue">/ {m=NR+1}(NR==m){sub(/^ +/,""); sub(/<br.>/,"\n"); sub(/<.td>/,""); print; next}' $1 | awk -v FS="|" 'ORS=(NR%8 ? FS:RS){print}' > $2

# with address
awk '/^<tr data-id="[0-9]{9}"$/ {x=NR;y=x+8}(NR==x || NR==y){sub(/^.*="/,""); sub(/".*$/,""); gsub(/&#39;/,""); print; next}'
# with address

ls |  while read -r line; do sh sahibinden_awk_v4-adresless.sh $line $line.txt; done

cat *txt | sort | uniq -c | awk '{gsub(/^.{8}/,"")}1' | awk -F"|" '$1 ~ /[0-9]{9}/ {print}' > nihayet-dogru

wget --reject-regex 'arama|sozlesmeler|static|reklam|ilan|kategori' -A "kiralik-daire*" -r "https://www.sahibinden.com/kiralik-daire"

cat kiralik-daire* | sort | uniq -c | awk '{gsub(/^.{8}/,"")}1' | awk -F"|" '$1 ~ /[0-9]{9}/ {print}' | awk '{gsub(/\./,""); print}' | more
