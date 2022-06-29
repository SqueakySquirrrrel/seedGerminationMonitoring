#!/usr/bin/bash
VAR=10
while [ $VAR -gt 0 ]; do
	#echo Value of VAR is: $VAR	
	$(raspistill -o $VAR.jpg)
	$(git -C /home/pi/seedGerminationMonitoring add --all)
	$(git -C /home/pi/seedGerminationMonitoring commit -m "Image $VAR")
	$(git -C /home/pi/seedGerminationMonitoring push)
	let VAR=VAR-1
	sleep 5s
done
