#!/usr/bin/bash
VAR=5
$(echo "22" > /sys/class/gpio/export)
$(echo "out" > /sys/class/gpio/gpio22/direction)

while [ $VAR -gt 0 ]; do
	#echo Value of VAR is: $VAR	
	$(echo "1" > /sys/class/gpio/gpio22/value)
	sleep 1s
	$(raspistill -o $VAR.jpg)
	$(echo "0" > /sys/class/gpio/gpio22/value)
	$(git -C /home/pi/seedGerminationMonitoring add --all)
	$(git -C /home/pi/seedGerminationMonitoring commit -m "Testing")
	$(git -C /home/pi/seedGerminationMonitoring push)
	let VAR=VAR-1
	sleep 5s
done
