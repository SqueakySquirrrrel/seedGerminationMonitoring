#!/usr/bin/bash
VAR=10
while [ $VAR -gt 0 ]; do
	#echo Value of VAR is: $VAR
	$(raspistill -o $VAR.jpg)
	$(git add --all)
	$(git commit -m "Image $VAR")
	$(git push)
	let VAR=VAR-1
	sleep 5s
done
