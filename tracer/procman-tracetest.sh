#!/bin/bash

# strace output:
# strace: Process 16776 attached
# [pid 16776] +++ killed by SIGTERM +++
# [pid 18266] +++ exited with 0 +++
# +++ exited with 0 +++ {for last remaining pid}

if [ -z "$*" ]
then
	echo "Syntax: $0 <program> [args...]" >&2
	exit 2
fi

if [ -t 1 ]
then
	cola="\x1b[36m"
	colk="\x1b[31m"
	colr="\x1b[0m"
else
	cola=""
	colk=""
	colr=""
fi

strace -e trace=fork -f $* 2>&1 | \
while read line
do
	echo $line | grep -q "attached"
	if [ $? = 0 ]
	then
		pid=`echo $line | cut -d " " -f 3`
		echo -e "$cola$pid$colr"
	fi
	echo $line | grep -q "killed"
	if [ $? != 0 ]
	then
		echo $line | grep -q "exited"
	fi
	if [ $? = 0 ]
	then
		pid=`echo $line | cut -d " " -f 2 | cut -d "]" -f 1`
		echo -e "$colk$pid$colr"
	fi
done
