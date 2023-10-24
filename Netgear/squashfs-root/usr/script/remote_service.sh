#!/bin/sh

sleep 3
PROFILE_CFG=/userfs/profile.cfg
TUNNEL=`/userfs/bin/tcapi get Wan_Common 6to4_tunnel`
TUNNEL_STAUTS=`/userfs/bin/tcapi get Wan_Common 6to4_tunnel_status`
if [ -f $PROFILE_CFG ] ; then
    . $PROFILE_CFG
fi
/userfs/bin/tcapi get WanInfo_Entry Update
/userfs/bin/tcapi get WanInfo_Entry IP
if [ $? != "N/A" ];then
	/userfs/bin/tcapi commit RemoteManager_Entry
	/userfs/bin/tcapi commit WanLanConflict_Entry
	
	if [ "$AYECOM_IPV6_6to4_TUNNEL_SUPPORT" != "" ] ;then
		if [ "$TUNNEL" = "1" ] && [ "$TUNNEL_STAUTS" = "ready" ] ;then
			/usr/script/ipv6to4_tunnel.sh start &
		elif [ "$TUNNEL" = "0" ] && [ "$TUNNEL_STAUTS" = "enabled" ] ;then
			/usr/script/ipv6to4_tunnel.sh stop &
		fi
	fi

	
fi

#Free dns hijack
/userfs/bin/tcapi set Dproxy_Entry dnshijack_flag  0
/usr/bin/killall -9 dnsmasq
/userfs/bin/dnsmasq

#Sync NTP again
/etc/ntp.sh

#Lanuch ayeresolv for resloving NETGEAR FW Server
/userfs/bin/ayeresolv &

#Download fileinfo.txt and check new firmware or language avaiable
/userfs/bin/tcapi get AutoUpgrade_Entry Download_fileinfo
