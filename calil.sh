#!/bin/sh

settings(){
	aurinfo="https://aur.archlinux.org/rpc/?v=5&type=info"
	batch=50
	sleeptime=4
	tmpfile=/tmp/aurinfo.json
	tmpfile2=/tmp/official-packages.txt
}

init(){
	counter=0
	batchcounter=0
	url=$aurinfo
	total=`ls -I cleanup.sh | wc -l`
	deleted=0
	reserved=0
	pacman -Slq extra community core multilib > $tmpfile2
}

stats(){
	echo "$deleted/$total deleted, $reserved/$total reserved."
}

process(){
	wget "$url" -O $tmpfile -q
	results=`jq ".resultcount" $tmpfile`
	deleted=$((deleted+results))
	reserved=$((reserved+batch-results))
	for j in `seq 1 $results`
	do
		name=`jq ".results[$((j-1))].Name" $tmpfile | sed -e 's/^"//' -e 's/"$//'`
		echo "Found $name in AUR"
		rm -r $name
	done
	rm $tmpfile
	batchcounter=0
	url=$aurinfo
}

main(){
	cd `dirname $0`
	git reset --hard
	git pull

	settings
	init
	for i in $(ls -I `basename $0`)
	do
		if [ $(cat $tmpfile2 | grep -c "^$i$") -eq 1 ]
		then
			deleted=$((deleted+1))
			echo "Found $i in official repositories"
			rm -r $i
		else
			counter=$((counter+1))
			url+="&arg[]=${i//+/%2B}"
			if [ $batchcounter -eq $batch ] || [ $counter -eq $total ]
			then
				process
				stats
				sleep $sleeptime
			else
				batchcounter=$((batchcounter+1))
			fi
		fi
	done

	git add .
	git commit -m "[$(LANG=C date)] removed $deleted packages"
	git push
}
main
