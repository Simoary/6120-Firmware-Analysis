SERVER=`/userfs/bin/tcapi get AutoUpgrade_Entry NETGEAR_SERVER_IP`
RESULT=/tmp/ping_netgear_status

/userfs/bin/tcapi set Dproxy_Entry dnshijack_flag 0
#Check Server connected.
/bin/ping -c 4 $SERVER > /tmp/ping_netgear

RES=`cat /tmp/ping_netgear | grep rec | cut -d ',' -f2 | cut -d " " -f2`
if [ "$RES" = "1" -o "$RES" = "2" -o "$RES" = "3" -o "$RES" = "4" ]; then
	echo "Ping $SERVER Success"
	echo 1 > $RESULT
else
	echo 0 > $RESULT
	exit 0
fi

