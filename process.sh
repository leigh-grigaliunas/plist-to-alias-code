#!/bin/bash

#reads useful content into ENTITY and CONTENT variables 
read_dom () {
    local IFS=\>
    read -d \< ENTITY CONTENT
}

#sets counter for allocating CONTENT to the correct variable
count=1

#loops through each line in the file
while read_dom; do 
    if [[ $ENTITY = "string" ]]; then
		#if count is one CONTENT contains an alias
		if [ $count -eq 1 ];
		then
			alias=$CONTENT
			((count++))
		else
		#if count is 2 then CONTENT contains an aliasname
			aliasname=$CONTENT
			echo "alias $aliasname='$alias'"
			count=1
		fi
    fi
# < is the file being read in by the loop, > is where the output is redirected
done < subs.plist > aliases.txt
