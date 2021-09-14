prefix_url="https://www.sahibinden.com/kiralik-daire/"
city=$1
cnt_ilan=$2
cnt_pages=$((cnt_ilan/50))

echo "$prefix_url$city?pagingSize=50"
for ((i=1;i<=cnt_pages;i++))
do
paging=$((50*i))
echo "$prefix_url$city?pagingOffset=$paging&pagingSize=50"
done
