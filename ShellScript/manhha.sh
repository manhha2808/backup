#!/bin/bash

#Declare shell option extglob to execute remove command
shopt -s extglob

#Remove junk file
rm -rf !("manhha.sh"|"idol.txt"|"function.sh")

#Get today
GetToday=$(date +'%u')

#Declare random number from 1 to 15
RandomImg=$(shuf -i 0-15 -n 1)

#Create a loop to count all day of week
for ((i=1;i<=7;i++))
do

#Get day of the week
	Distance=`expr "$i" - "$GetToday"`
	GetDay=$(date -d "$Distance day" +"%d-%m-%Y")

#Create directory
	mkdir $GetDay

#Get name from idol.txt
	GetKeyWord=$(sed -n $i'p' < idol.txt)

#Get Image link download from google
    	GetImageLink=$(wget --user-agent 'Mozilla/5.0' -qO - "https://www.google.com/search?q=$GetKeyWord\&tbm=isch" | sed 's/</\n</g' | grep '<img' | tail -"$RandomImg"| head -1 | sed 's/.*src="\([^"]*\)".*/\1/')

#Download Image
	wget "$GetImageLink" -O "$GetDay/$GetKeyWord.jpg"
done
