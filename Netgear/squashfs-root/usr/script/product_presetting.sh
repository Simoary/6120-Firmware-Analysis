#!/bin/sh

if [ $# != 3 ] ; then
	echo "usage: $0 [ProductName] [Region] [Annex]"
	echo "example: $0 D3600 PE 0"
	echo "Purpose: Auto set HWID/Region/Annex/Wifi5gmode/Language and change Wireless securitry to OPEN"
	exit 0
fi

SYSCMD="/usr/bin/sys ayeInfo"
WRITE_LANGUAGE_CMD="/usr/script/netgear_write_language_table.sh"
TCAPI_CMD="/userfs/bin/tcapi"

echo Product Name: $1
echo Region 	 : $2
if [ $3 != 0 ] ; then
	echo Annex B
else
	echo Annex A
fi

#Set Region
$SYSCMD region $2
$WRITE_LANGUAGE_CMD $2

if [ $? -eq 0 ] ; then
echo "Write Language Table Successful."
else
echo "Write Language Table Fail! Please check your USB is plugged!"
exit 0
fi

#Set Annex
if [ $3 = 0 -o $3 = 1 ] ; then
$SYSCMD annex $3
else
echo Annex value \""$3"\" is invalid! Annex value range is [0-1], 0-Annex A, 1-Annex B
exit 0
fi

#Set HWID and Language according Product Name
if [ "$1" = "D3600" ] ; then
	$SYSCMD hwid NETG0000
	$SYSCMD wifi5gmode 0
elif [ "$1" = "D3610" ] ; then
	$SYSCMD hwid NETG0001
	$SYSCMD wifi5gmode 0
elif [ "$1" = "D6000" ] ; then
	$SYSCMD hwid NETG0100
	$SYSCMD wifi5gmode 1
elif [ "$1" = "D6010" ] ; then
	$SYSCMD hwid NETG0101	
	$SYSCMD wifi5gmode 1
else
	echo Product Name \"$1\" is invalid! Please check again.
	exit 0
fi

#Commit ayeInfo
$SYSCMD commit

#Set 2.4G/5G Wifi to unconfigure
$TCAPI_CMD set WLan_Entry0 WPSConfStatus 1
$TCAPI_CMD commit WLan_Entry
$TCAPI_CMD set WLan11ac_Entry0 WPSConfStatus 1
$TCAPI_CMD commit WLan11ac_Entry

#Set 2.4G Wifi security to OPEN
$TCAPI_CMD set WLan_Entry0 AuthMode OPEN
#Set 2.4G Channel to
$TCAPI_CMD set WLan_Common Channel 10
$TCAPI_CMD commit WLan_Entry

#Set 5G Wifi security to OPEN
$TCAPI_CMD set WLan11ac_Entry0 AuthMode OPEN
#Set 5G Channel to
$TCAPI_CMD set WLan11ac_Common Channel 44
$TCAPI_CMD commit WLan11ac_Entry

#Set 2.4G/5G Wifi to configure
$TCAPI_CMD set WLan_Entry0 WPSConfStatus 2
$TCAPI_CMD commit WLan_Entry
$TCAPI_CMD set WLan11ac_Entry0 WPSConfStatus 2
$TCAPI_CMD commit WLan11ac_Entry

#Enable telnet
$TCAPI_CMD set Utelnetd_Entry Active Yes
$TCAPI_CMD commit Utelnetd_Entry

#Disable vlan
$TCAPI_CMD set Vlanpt_Entry Active No
$TCAPI_CMD Vlanpt_Entry commit

#Successful message
echo "****Presetting successful****"

