#!/bin/sh

settings(){
	aurinfo="https://aur.archlinux.org/rpc/?v=5&type=info"
	batch=50
	sleeptime=4
	tmpfile=/tmp/aurinfo.json
}

init(){
	counter=0
	batchcounter=0
	url=$aurinfo
	total=`ls -I cleanup.sh | wc -l`
	deleted=0
	reserved=0
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
	for i in `ls -I cleanup.sh`
	do
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
	done

	git add .
	git commit -m "[$(LANG=C date)]auto update"
	git push
}
main
