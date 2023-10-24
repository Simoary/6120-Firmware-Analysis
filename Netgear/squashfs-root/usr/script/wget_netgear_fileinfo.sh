if [ $# != 2 ] ; then
        echo "usage: $0 [ProductName] [Region]"
        exit 0
fi

ProductName=$1
REGION=$2
SERVER=`/userfs/bin/tcapi get AutoUpgrade_Entry NETGEAR_FW_SERVER_IP`
FILEINFO=fileinfo.txt
STRINGTABLEDAT=stringtable.dat
WGETRESULT=/tmp/wget_netgear_status

#Check Server connected.
/bin/ping -c 3 $SERVER > /tmp/ping_netgear

RES=`cat /tmp/ping_netgear | grep rec | cut -d ',' -f2 | cut -d " " -f2`
if [ "$RES" = "1" -o "$RES" = "2" -o "$RES" = "3" ]; then
	echo "Ping $SERVER Success"
else
	echo 0 > $WGETRESULT
	exit 0
fi

/bin/rm -f /tmp/$FILEINFO
/usr/bin/wget ftp://$SERVER/$ProductName/$REGION/$FILEINFO -P /tmp/

if [ $? -eq 0 ] ; then
	/usr/bin/wget ftp://$SERVER/$ProductName/$REGION/$STRINGTABLEDAT -P /tmp/
	echo 1 > $WGETRESULT
	/userfs/bin/tcapi get AutoUpgrade_Entry WgetResult 
else
	echo 0 > $WGETRESULT
fi

