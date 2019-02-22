# Penjelasan Soal Shift Modul 1

### Nomer 1
Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah dienkripsi oleh seseorang menggunakan bash script, file yang dimaksud adalah nature.zip. Karena terlalu mudah kalian memberikan syarat akan membuka seluruh file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat pada bulan Februari.

```Hint: Base64, Hexdump```

###### Jawab
Source code: [soal1.sh](https://github.com/sudrajadhadi/SoalShift_modul1_B07/blob/master/soal1.sh)

* *extract* nature.zip dan buka foldernya
* untuk *decode* file didalamnya dengan menggunakan `base64` seperti berikut
    ```bash
    base 64 -d [namafile] > [outputfile]
    ```
* karena masih dalam bentuk hexadesimal, maka kita gunakan `hexdump` untuk mengubahnya kembali menjadi file *binary*
    ```bash
    xxd -r [namafile] > [outputfile]
    ```
* dengan banyaknya jumlah file didalam nature.zip yang perlu kita *decode*, maka gunakan looping yang dijalanankan dengan script

    ```bash
    for file in "nature/"*
    do
	    base64 -d "$file" | xxd -r > $(basename "$file")
	    echo "$file decrypted"
	    mv $(basename "$file") nature
    done
    ```
    > Dengan *looping* seluruh file berada didalam nature.zip, kita decode satu persatu file tersebut menjadi file *binary*. Kemudian, file-file tersebut akan dipindah ke dalam folder nature.zip kembali atau *overwrite* file-file aslinya dengan nama yang sama.

* untuk menjalankan script ini pada pukul 14:14 pada tanggal 14 Februari (kondisi pertama) atau hari tersebut adalah hari jumat pada bulan Februari (kondisi kedua), gunakan `crontab -e`

    ```bash
    14 14 14 2 * /home/user/directory/namafile       #untuk kondisi pertama
    * * * 2 5 /home/user/directory/namafile          #untuk kondisi kedua
    ```

### Nomer 2
Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv. Laporan yang diminta berupa:
<ol type="a">
<li>Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012.
<li>Tentukan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin a.
<li>Tentukan tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line yang didapatkan pada soal poin b.
</ol>

###### Jawab
Source code: [soal2.sh](https://github.com/sudrajadhadi/SoalShift_modul1_B07/blob/master/soal2.sh)
<ol type="a">
<li>Negara dengan penjualan (quantity) terbanyak pada tahun 2012

* progam akan mengaktifkan awk yang dipisahkan oleh spasi
* mencari data dengan tahun 2012 dan mencatat semua data penjualan pada array dengan nama x
* data tersebut akan di sortir dengan format descending, dan akan di ambil satu data teratas untuk ditampilkan pada layar

    ```bash
    awk -F ',' '{if($7=='2012') x[$1]+=$10} END {for(ans in x) {print ans}}' WA_Sales_Products_2012-14.csv | sort -nr | head -1
    ```
   
<li>Tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin a

* progam akan mengaktifkan awk yang dipisahkan oleh spasi
* mencari data dengan tahun 2012 dan negara yang sama dengan hasil soal poin a
* hasil data yang dicari akan disimpan dalam array bernama y dan diurutkan secara descending
* 3 data teratas akan ditampilkan pada layar

    ```bash
    awk -F ',' '{if($7=='2012' && $1=="United States") y[$4]+=$10} END {for(ans in y) {print p[ans],ans}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2,$3}'
    ```

<li>Tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line yang didapatkan pada soal poin b.

* Untuk product line "Outdoor Protection"

    * Progam berfungsi sama seperti poin b, tetapi ada penambahan kondisi dimana progam tersebut akan mengecek apakah data tersebut sesuai dengan product line "Outdoor Protection"

        ```bash
        awk -F ',' '{if($7=='2012' && $1=="United States" && $4=="Outdoor Protection") a[$6]+=$10} END {for(ans in a) {print p[ans], ans}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2,$3,$4}'
        ```
    
* Untuk product line "Camping Equipment"

    * Progam berfungsi sama seperti poin b, tetapi ada penambahan kondisi dimana progam tersebut akan mengecek apakah data tersebut sesuai dengan product line "Camping Equipment"

        ```bash
        awk -F ',' '{if($7=='2012' && $1=="United States" && $4=="Camping Equipment") b[$6]+=$10} END {for(ans in b) {print p[ans], ans}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2,$3,$4}'
        ```
    
* Untuk product line "Personal Accessories"

    * Progam berfungsi sama seperti poin b, tetapi ada penambahan kondisi dimana progam tersebut akan mengecek apakah data tersebut sesuai dengan product line "Personal Accessories"

        ```bash
        awk -F ',' '{if($7=='2012' && $1=="United States" && $4=="Personal Accessories") c[$6]+=$10} END {for(ans in c) {print c[ans], ans}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR<=3 {print $2,$3,$4}'
        ``` 
</ol>

### Nomer 3

Buatlah sebuah script bash yang dapat menghasilkan password secara acak sebanyak 12 karakter yang terdapat huruf besar, huruf kecil, dan angka. Password acak tersebut disimpan pada file berekstensi .txt dengan ketentuan pemberian nama sebagai berikut:
<ol type="a">
<li>Jika tidak ditemukan file password1.txt maka password acak tersebut disimpan pada file bernama password1.txt
<li>Jika file password1.txt sudah ada maka password acak baru akan disimpan pada file bernama password2.txt dan begitu seterusnya.
<li>Urutan nama file tidak boleh ada yang terlewatkan meski filenya dihapus.
<li>Password yang dihasilkan tidak boleh sama.
</ol>

###### Jawab
Source code: [soal3.sh](https://github.com/sudrajadhadi/SoalShift_modul1_B07/blob/master/soal3.sh)

* untuk mengecek apakah file dengan nama password[angka].txt tersebut sudah ada atau belum dengan
    ```bash
    number=1
    suffix=1
    while test -e "password$suffix.txt"; do
        (( ++number ))
        suffix="$( printf -- '%d' "$number" )"
    done
    ```
    > Jika tidak ditemukan file dengan nama password[angka].txt, maka otomatis akan dibuat file tersebut sesuai dengan nilai *suffix*. Jika ditemukan, maka nilai *suffix* akan bertambah.
    
* untuk menghasilkan password acak sebanyak 12 karakter tersebut, gunakan `urandom`.
    ```bash
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w [banyak_karakter] | head -n 1
    ```
* buat file password terbut dengan `fname = password$suffix`
* simpan password tersebut ke dalam file yang sudah dibuat

    ```bash
    echo "[variabel penyimpan password]" [namafile]
    ```

### Nomer 5 

Buatlah sebuah script bash untuk menyimpan record dalam syslog yang memenuhi kriteria berikut:
<ol type="a">
<li>Tidak mengandung string “sudo”, tetapi mengandung string “cron”, serta buatlah pencarian stringnya tidak bersifat case sensitive, sehingga huruf kapital atau tidak, tidak menjadi masalah.
<li>Jumlah field (number of field) pada baris tersebut berjumlah kurang dari 13.
<li>Masukkan record tadi ke dalam file logs yang berada pada direktori /home/[user]/modul1.
<li>Jalankan script tadi setiap 6 menit dari menit ke 2 hingga 30, contoh 13:02, 13:08, 13:14, dst.
</ol>

###### Jawab
Source code: [soal5.sh](https://github.com/sudrajadhadi/SoalShift_modul1_B07/blob/master/soal5.sh)

* karena pencariannya bukan sudo tetapi cron, maka `!sudo && cron`
* pencarian string tidak bersifat sensitive menggunakan `tolower($0)` untuk membuat seluruh *string* tersebut menjadi *lowercase* 

    ```bash
    awk 'tolower($0) ~!/sudo/ && tolower($0) ~/cron/ {print $0;}'
    ```

* untuk menampilkan field kurang dari 13, gunakan

   ```bash
   awk 'NF < 13'
   ```

* untuk menjalankan script tersebut setiap 6 menit dari menit ke 2 hingga 30, contoh 13:02, 13:08, 13:14, dst. gunakan `crontab -e`

    ```bash
    2-30/6 * * * * /home/user/modul1/[namafile]
    ```
