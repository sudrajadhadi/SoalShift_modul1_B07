#!/ bin/bash/

cd /home/xhazimix/Documents/sisop/prak1/soal1
unzip nature.zip

for file in "nature/"*
do
	base64 -d "$file" | xxd -r > $(basename "$file")
	echo "$file decrypted"
	mv $(basename "$file") nature
done
