#!/bin/bash

read_dom () {
    local IFS=\>
    read -d \< ENTITY CONTENT
}

count=1

while read_dom; do
    if [[ $ENTITY = "string" ]]; then
		if [ $count -eq 1 ];
		then
			alias=$CONTENT
			((count++))
		else
			aliasname=$CONTENT
			echo "alias $aliasname='$alias'"
			count=1
		fi
    fi
done < subs.plist > aliases.txt

