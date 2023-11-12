#!/bin/sh
case "$1" in
start)
	insmod /lib/modules/si2c.ko
	[ "$?" = "0" ] && mknod /dev/si2c c 89 0 
	tmpmonitor
	;;
stop)
	rmmod si2c
	;;
*)
	echo "Usage: $0 {start|stop}"
	;;
esac
