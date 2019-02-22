#! /bin/bash/

#generate random characters
gen_pass=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1)

#passing password to .txt
name="password"
number=1
suffix=1
while test -e "$name$suffix.txt"; do
    (( ++number ))
    suffix="$( printf -- '%d' "$number" )"
done

fname="$name$suffix.txt"

echo "$gen_pass" > $fname
