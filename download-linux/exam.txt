#!bin/bash
# remove unuse files.
rm -r */
today=$(date +%u)
random_id_image=$((RANDOM%19+1))

get_link () {
    html_page_idol="wget --user-agent 'Mozilla/5.0'  -qO - "www.google.be/search?q=$idol_names\&tbm=isch""
    link_idol=$($html_page_idol | sed 's/</\n</g' |  grep '<img' | tail -"$random_id_image"| head -1 | sed 's/.*src="\([^"]*\)".*/\1/')
}

download_idol_images () {

    for((i=1;i<=7;i++))
    do
        let difference_day=$i-$today
	day_of_week=$(date -d "+$difference_day days" +%d-%m-%Y)
	while read idol_names;
        do
                get_link
		#Starting download images
		wget -P $day_of_week $link_idol
        done < <(tail -n "+$i" idol.txt| head -n1)
    done
}

download_idol_images




