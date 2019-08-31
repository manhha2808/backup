#!/bin/bash
shopt -s extglob
rm -r !("manhha.sh"|"idol.txt"|"function.sh")
RandomImg=$(shuf -i 1-20 -n 1)
GetLink_And_Download(){
	GetKeyWord=$(sed -n $i'p' < idol.txt)
	GetImageLink=$(wget --user-agent 'Mozilla/5.0' -qO - "https://www.google.com/search?q=$GetKeyWord\&tbm=isch" | sed 's/</\n</g' | grep '<img' | tail -"$RandomImg"| head -1 | sed 's/.*src="\([^"]*\)".*/\1/')
	wget "$GetImageLink" -O "$GetDay/$GetKeyWord.jpg"
}
Create_Directory(){
	GetToday=$(date +'%u')
	for ((i=1;i<=7;i++)){
		Distance=`expr "$i" - "$GetToday"`
		GetDay=$(date -d "$Distance day" +"%d-%m-%Y")
		mkdir $GetDay
		GetLink_And_Download
		}
}
Create_Directory
