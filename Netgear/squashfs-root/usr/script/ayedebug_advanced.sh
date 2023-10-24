#!/bin/sh

USBPATH="/tmp/mnt/usb1_1"

while [ 1 ]; do
	if [ -e $USBPATH ]; then
		echo "USB Mounted. Start logging..."
		TIME=`/bin/date '+%Y%m%d%H%M'`
		echo $TIME
		cat /proc/kmsg > $USBPATH/log_$TIME &
	fi
	sleep 3600
	killall -9 cat
done

