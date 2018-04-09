#!/bin/bash

# Author Milad As (Ravexina)

# Sources:
# http://shakespeare.mit.edu
# https://web.archive.org/web/20180315222148/http://shakespeare.mit.edu

cat list | while read i
do
	title=$(wget "$i" -O - 2> /dev/null | tee tmp | grep -Po "(?<=\<title\>).*(?=:)")
	title=$(echo $title | tr -d '/<>|:&')
	echo $title
	html2text tmp > "$title".txt
done

rm tmp
mkdir -p ./shakespeare-db
mv *.txt ./shakespeare-db
