#!/bin/bash

count=1

while read line; 
do 
	if [[ $line =~ .*string.* ]]; 
	then 
		tmp=${line#*>}   # remove prefix ending in "_"
		b=${tmp%<*} 
		if [ $count -eq 1 ];
		then
			alias=$b
			((count++))
		else
			aliasname=$b
			echo "alias $aliasname='$alias'" >> .shell_aliases
			count=1
		fi
	fi
done < subs.plist

