#!/bin/bash

dirToWatch=~/Desktop
gitDir=~/.calendar

fswatch -0 $dirToWatch | while read -d "" event
do
	# this is to filter out the DS_Store files
	if [[ ! ${event: -9} =~ "."DS_Store$ ]]  
	then
		date=$(date "+%Y-%m-%d @ %H:%M:%S")
		echo ${event}
		cd $gitDir; 
			echo ${date} ${event} >> log.txt;
			git add *;
			git commit -am "autocommit on change `date "+%Y-%m-%d @ %H:%M:%S"`"; 
			git push
		echo ${event}
	fi
done