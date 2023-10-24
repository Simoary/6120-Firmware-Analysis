#!/bin/sh

WAN_INTERFACE=`/userfs/bin/tcapi get WanInfo_Entry Interface`
DEBUG_LOG="/tmp/ayedebug.log"
DEBUG_PACKET="/tmp/ayedebug.pcap"

#Init
rm -f $DEBUG_LOG
rm -f $DEBUG_PACKET

#start tcpdump 
/userfs/bin/tcpdump -i $WAN_INTERFACE -w $DEBUG_PACKET &

echo "----Start Debug----" >> $DEBUG_LOG
echo "cat /proc/tc3162/adsl_stats" >> $DEBUG_LOG
/bin/cat /proc/tc3162/adsl_stats >> $DEBUG_LOG

echo "Interface is :" $WAN_INTERFACE >> $DEBUG_LOG
while [ "1" != "0" ]
do
	date >> $DEBUG_LOG
	cat /proc/meminfo >> $DEBUG_LOG 
	ps >> $DEBUG_LOG
	/bin/cat /proc/tc3162/adsl_stats >> $DEBUG_LOG
	ifconfig >> $DEBUG_LOG
	echo "[dmesg start]" >> $DEBUG_LOG
	dmesg >> $DEBUG_LOG
	echo "[dmesg end]" >> $DEBUG_LOG
	/usr/bin/w ad l n >> $DEBUG_LOG
	/usr/bin/w ad p >> $DEBUG_LOG
	echo -e "==================================================================================\n\n" >> $DEBUG_LOG
	sleep 10
done

