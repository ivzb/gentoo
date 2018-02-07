#!/bin/bash

read -p 'Specify value in range [0-100]: ' new_value

if [ $new_value -eq $new_value 2>/dev/null -a $new_value -ge 0 -a $new_value -le 100 ]
then # is an integer in range [0-100]
	min=0
	max=$(cat /sys/class/backlight/intel_backlight/max_brightness)

	let percentage=$((max*new_value/100))

	echo $percentage > /sys/class/backlight/intel_backlight/brightness
else 
	echo "invalid value, expected [0-100]"
fi
