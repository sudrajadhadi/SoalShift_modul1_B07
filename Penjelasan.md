# Penjelasan Soal Shift 1

## Nomer 2

### a. Tentukan negara dengan penjualan (quantity) terbanyak pada tahun 2012

    awk -F ',' '{if($7=='2012') x[$1]+=$10} END {for(ans in x) {print ans}}' WA_Sales_Products_2012-14.csv | sort -nr | head -1

* progam akan mengaktifkan awk yang dipisahkan oleh spasi, kemudian dicari tahun 2012 dan mencatat semua data penjualan pada array dengan nama x, kemudian data tersebut akan di sortir dengan format descending, dan akan di ambil satu data teratas untuk ditampilkan pada layar
   
### b. Tentukan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin a

    awk -F ',' '{if($7=='2012' && $1=="United States") y[$4]+=$10} END {for(ans in y) {print p[ans],ans}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2,$3}'

* progam akan mengaktifkan awk yang dipisahkan oleh spasi, kemudian dicari tahun 2012 dan negara yang sama dengan hasil soal poin a,  hasil data yang dicari akan disimpan dalam array bernama y dan diurutkan secara descending, kemudian 3 data teratas akan ditampilkan pada layar
