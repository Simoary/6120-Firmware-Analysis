#!/bin/sh
PROFILE_CFG=/userfs/profile.cfg
if [ -f $PROFILE_CFG ] ; then
    chmod 777 $PROFILE_CFG
    . $PROFILE_CFG
fi

if [ "$TCSUPPORT_MULTISERVICE_ON_WAN" != "" ] && [ "$TCSUPPORT_WAN_PTM" != "" -o "$TCSUPPORT_WAN_ETHER" != "" ]; then
	if [ $# != 4 ] ; then
		echo "usage: $0 [add/del] [PVC#] [Service ID#] [Rule#]"
		exit 0
	fi
else
	if [ $# != 3 ] ; then
		echo "usage: $0 [add/del] [PVC#] [Rule#]"
		exit 0
	fi
fi

if [ $1 = "add" ] ; then
        OPT=-I
elif [ $1 = "del" ] ; then
        OPT=-D
else
	if [ "$TCSUPPORT_MULTISERVICE_ON_WAN" != "" ] && [ "$TCSUPPORT_WAN_PTM" != "" -o "$TCSUPPORT_WAN_ETHER" != "" ]; then
		echo "usage: $0 [add/del] [PVC#] [Service ID#] [Rule#]"
	else	
		echo "usage: $0 [add/del] [PVC#] [Rule#]"
	fi	

    exit 0
fi

if [ "$TCSUPPORT_MULTISERVICE_ON_WAN" != "" ] && [ "$TCSUPPORT_WAN_PTM" != "" -o "$TCSUPPORT_WAN_ETHER" != "" ]; then
    if [ "$2" = "8" ] || [ "$2" = "9" ] || [ "$2" = "10" ]; then
		PVC="$2"_"$3"
		RULE=$4
	else
		PVC=$2
		RULE=$4
	fi	
else
	PVC=$2
	RULE=$3
fi

VS_CONF=/etc/nat_pvc$PVC/vserver$RULE
if [ -f $VS_CONF ] ; then
        chmod +x $VS_CONF
        . $VS_CONF
else
	exit 0
fi

EXT_SPORT=$STARTPORT
EXT_EPORT=$ENDPORT
INT_IP=$LOCALIP
if [ "$TCSUPPORT_VIRSVR_APPL_AND_PROT" != "" ] ;then
NPROTOCOL=$PROTOCOL
else
NPROTOCOL=ALL
fi
if [ "$TCSUPPORT_VIRSVR_LOCAL_PORT" != "" ] || [ "$TCSUPPORT_VIRSVR_APPL_AND_PROT" != "" ] ;then
INT_SPORT=$LOCAL_SPORT
INT_EPORT=$LOCAL_EPORT
fi

if [ "$AYECOM_PORT_FORWARD_ENHANCE" != "" ] ;then
	if [ "$PROTOCOL" != "" ] ; then
		NPROTOCOL=$PROTOCOL
	fi
	
	INT_SPORT=$LOCAL_SPORT
	INT_EPORT=$LOCAL_EPORT
fi

if [ "$AYECOM_PORT_FORWARD_ENHANCE" != "" ] ;then
	IPADDRESS=$LANIP_ADDRESS
	PREFIXIP=$PREFIX_IP
	
PORT_FORWARD_WANIP=/tmp/port_forward_wanip
	if [ -f $PORT_FORWARD_WANIP ] ; then
		chmod 777 $PORT_FORWARD_WANIP
		. $PORT_FORWARD_WANIP
	fi
fi

# get ipmode (Single or Multiple)
IPMODE_CONF=/etc/nat_pvc$PVC/ipmode
if [ -f $IPMODE_CONF ] ; then
        chmod +x $IPMODE_CONF
        . $IPMODE_CONF
fi
SERVER_IP="0.0.0.0"
if [ "$IPMODE" = "Multiple" ] ; then
	SERVERIP_CONF=/etc/nat_pvc$PVC/server_ip
	if [ -f $SERVERIP_CONF ] ; then
        	chmod +x $SERVERIP_CONF
        	. $SERVERIP_CONF
	fi
fi

# default wan_if
WAN_IF=nas$PVC
CONFFILE=/etc/isp$PVC.conf
if [ -f $CONFFILE ] ; then
        chmod +x $CONFFILE
        . $CONFFILE
fi
# PPPoE/PPPoA
if [ "$ISP" = "2" ] ; then
	if [ "$TCSUPPORT_MULTISERVICE_ON_WAN" != "" ] && [ "$TCSUPPORT_WAN_PTM" != "" -o "$TCSUPPORT_WAN_ETHER" != "" ]; then
	    if [ "$2" = "8" ] || [ "$2" = "9" ] || [ "$2" = "10" ]; then
			WAN_IF=ppp"$2""$3"
		else
			WAN_IF=ppp$2
		fi	
	else
        WAN_IF=ppp$PVC
	fi		
fi

if [ "$TCSUPPORT_BYPASS_TRIANGLE" != "" ] ;then
	FIREWALL_CONF=/etc/firewall.conf
	if [ -f $FIREWALL_CONF ] ; then
        chmod +x $FIREWALL_CONF
        . $FIREWALL_CONF
	fi

	LAN_CONF=/etc/lan.conf
	if [ -f $LAN_CONF ] ; then
        chmod +x $LAN_CONF
        . $LAN_CONF
	fi
	LAN_IP=$IP
fi


if [ "$SERVER_IP" = "0.0.0.0" ] ; then
	
	if [ "$AYECOM_PORT_FORWARD_ENHANCE" != "" ] ;then
		if [ "$NPROTOCOL" = "TCP" ] ;then
			if [ "$INT_SPORT" = "N/A" ] ;then
				iptables -t nat $OPT VS_PRE$PVC -i $WAN_IF -p tcp --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP
				iptables -t nat $OPT VS_PRE$PVC -i br0 -p tcp -d $WAN_IP --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP
			else    
                               if [ "$INT_SPORT" = "$EXT_SPORT" ] ; then
			           iptables -t nat $OPT VS_PRE$PVC -i $WAN_IF -p tcp --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP:$INT_SPORT-$INT_EPORT
					   iptables -t nat $OPT VS_PRE$PVC -i br0 -p tcp -d $WAN_IP --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP:$INT_SPORT-$INT_EPORT
                               else
			           iptables -t nat $OPT VS_PRE$PVC -i $WAN_IF -p tcp --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP:$INT_SPORT-$INT_EPORT --ex-start-port $EXT_SPORT
					   iptables -t nat $OPT VS_PRE$PVC -i br0 -p tcp -d $WAN_IP --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP:$INT_SPORT-$INT_EPORT --ex-start-port $EXT_SPORT
                               fi
				iptables -t filter $OPT fwd_port_forward -p tcp --dport $INT_SPORT:$INT_EPORT -j ACCEPT
			fi
				iptables -t nat $OPT NAT_LOOPBACK -p tcp -s $PREFIXIP -d $INT_IP --dport $EXT_SPORT:$EXT_EPORT -j SNAT --to-source $IPADDRESS
		elif [ "$NPROTOCOL" = "UDP" ] ;then
			if [ "$INT_SPORT" = "N/A" ] ;then
				iptables -t nat $OPT VS_PRE$PVC -i $WAN_IF -p udp --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP
				iptables -t nat $OPT VS_PRE$PVC -i br0 -p udp -d $WAN_IP --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP
			else
                               if [ "$INT_SPORT" = "$EXT_SPORT" ] ; then
				iptables -t nat $OPT VS_PRE$PVC -i $WAN_IF -p udp --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP:$INT_SPORT-$INT_EPORT
				iptables -t nat $OPT VS_PRE$PVC -i br0 -p udp -d $WAN_IP --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP:$INT_SPORT-$INT_EPORT
                               else
				iptables -t nat $OPT VS_PRE$PVC -i $WAN_IF -p udp --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP:$INT_SPORT-$INT_EPORT	--ex-start-port $EXT_SPORT
				iptables -t nat $OPT VS_PRE$PVC -i br0 -p udp -d $WAN_IP --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP:$INT_SPORT-$INT_EPORT	--ex-start-port $EXT_SPORT
                                fi
				iptables -t filter $OPT fwd_port_forward -p udp --dport $INT_SPORT:$INT_EPORT -j ACCEPT
			fi
				iptables -t nat $OPT NAT_LOOPBACK -p udp -s $PREFIXIP -d $INT_IP --dport $EXT_SPORT:$EXT_EPORT -j SNAT --to-source $IPADDRESS
		else
			if [ "$INT_SPORT" = "N/A" ] ;then
				iptables -t nat $OPT VS_PRE$PVC -i $WAN_IF -p tcp --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP
				iptables -t nat $OPT VS_PRE$PVC -i $WAN_IF -p udp --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP
				iptables -t nat $OPT VS_PRE$PVC -i br0 -p tcp -d $WAN_IP --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP
				iptables -t nat $OPT VS_PRE$PVC -i br0 -p udp -d $WAN_IP --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP
			else
                               if [ "$INT_SPORT" = "$EXT_SPORT" ] ; then
				iptables -t nat $OPT VS_PRE$PVC -i $WAN_IF -p tcp --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP:$INT_SPORT-$INT_EPORT
				iptables -t nat $OPT VS_PRE$PVC -i $WAN_IF -p udp --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP:$INT_SPORT-$INT_EPORT
				iptables -t nat $OPT VS_PRE$PVC -i br0 -p tcp -d $WAN_IP --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP:$INT_SPORT-$INT_EPORT
				iptables -t nat $OPT VS_PRE$PVC -i br0 -p udp -d $WAN_IP --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP:$INT_SPORT-$INT_EPORT
                              else
				iptables -t nat $OPT VS_PRE$PVC -i $WAN_IF -p tcp --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP:$INT_SPORT-$INT_EPORT --ex-start-port $EXT_SPORT
				iptables -t nat $OPT VS_PRE$PVC -i $WAN_IF -p udp --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP:$INT_SPORT-$INT_EPORT --ex-start-port $EXT_SPORT
				iptables -t nat $OPT VS_PRE$PVC -i br0 -p tcp -d $WAN_IP --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP:$INT_SPORT-$INT_EPORT --ex-start-port $EXT_SPORT
				iptables -t nat $OPT VS_PRE$PVC -i br0 -p udp -d $WAN_IP --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP:$INT_SPORT-$INT_EPORT	--ex-start-port $EXT_SPORT
                              fi
				iptables -t filter $OPT fwd_port_forward -p tcp --dport $INT_SPORT:$INT_EPORT -j ACCEPT
				iptables -t filter $OPT fwd_port_forward -p udp --dport $INT_SPORT:$INT_EPORT -j ACCEPT
			fi
				iptables -t nat $OPT NAT_LOOPBACK -p tcp -s $PREFIXIP -d $INT_IP --dport $EXT_SPORT:$EXT_EPORT -j SNAT --to-source $IPADDRESS
				iptables -t nat $OPT NAT_LOOPBACK -p udp -s $PREFIXIP -d $INT_IP --dport $EXT_SPORT:$EXT_EPORT -j SNAT --to-source $IPADDRESS
		fi
		
		if [ "$TCSUPPORT_BYPASS_TRIANGLE" != "" ] ;then

			if [ "$BypassTriRoute" = "1" -a  "$OPT" = "-I" ] || [ "$OPT" = "-D" ] ;then

				iptables -t nat $OPT VS_PRE$PVC -p udp -i br0 -d ! $LAN_IP --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP 2>/dev/null
				iptables -t nat $OPT VS_PRE$PVC -p tcp -i br0 -d ! $LAN_IP --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP 2>/dev/null
			fi
		fi
	else
	
		if [ "$NPROTOCOL" = "TCP" ] ;then
		
			iptables -t nat $OPT VS_PRE$PVC -p tcp --dport $EXT_SPORT:$EXT_EPORT -i $WAN_IF -j DNAT --to $INT_IP:$INT_SPORT-$INT_EPORT
		
		elif [ "$NPROTOCOL" = "UDP" ] ;then

			iptables -t nat $OPT VS_PRE$PVC -p udp --dport $EXT_SPORT:$EXT_EPORT -i $WAN_IF -j DNAT --to $INT_IP:$INT_SPORT-$INT_EPORT	
		else
			if [ "$TCSUPPORT_VIRSVR_LOCAL_PORT" != "" ] || [ "$TCSUPPORT_VIRSVR_APPL_AND_PROT" != "" ] ;then		
			iptables -t nat $OPT VS_PRE$PVC -p tcp --dport $EXT_SPORT:$EXT_EPORT -i $WAN_IF -j DNAT --to $INT_IP:$INT_SPORT-$INT_EPORT
			iptables -t nat $OPT VS_PRE$PVC -p udp --dport $EXT_SPORT:$EXT_EPORT -i $WAN_IF -j DNAT --to $INT_IP:$INT_SPORT-$INT_EPORT
			
			else
			
			iptables -t nat $OPT VS_PRE$PVC -p tcp --dport $EXT_SPORT:$EXT_EPORT -i $WAN_IF -j DNAT --to $INT_IP
			iptables -t nat $OPT VS_PRE$PVC -p udp --dport $EXT_SPORT:$EXT_EPORT -i $WAN_IF -j DNAT --to $INT_IP
			if [ "$TCSUPPORT_BYPASS_TRIANGLE" != "" ] ;then

			if [ "$BypassTriRoute" = "1" -a  "$OPT" = "-I" ] || [ "$OPT" = "-D" ] ;then

				iptables -t nat $OPT VS_PRE$PVC -p udp -i br0 -d ! $LAN_IP --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP 2>/dev/null
				iptables -t nat $OPT VS_PRE$PVC -p tcp -i br0 -d ! $LAN_IP --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP 2>/dev/null
			fi
			fi


			fi
		fi
	fi
	if [ "$TCSUPPORT_BYPASS_TRIANGLE" != "" ] ;then
		if [ "$BypassTriRoute" = "1" -a  "$OPT" = "-I" ] || [ "$OPT" = "-D" ] ;then
			iptables -t nat $OPT POSTROUTING -p tcp -d $INT_IP --dport $EXT_SPORT:$EXT_EPORT -j SNAT --to $LAN_IP 2>/dev/null
			iptables -t nat $OPT POSTROUTING -p udp -d $INT_IP --dport $EXT_SPORT:$EXT_EPORT -j SNAT --to $LAN_IP 2>/dev/null	
		 fi
	fi
	if [ "$TCSUPPORT_BYPASS_TRIANGLE" != "" ] ;then
		 if [ "$BypassTriRoute" = "0" ] ;then

			iptables -t nat -D VS_PRE$PVC -p udp -i br0 -d ! $LAN_IP --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP 2>/dev/null
			iptables -t nat -D VS_PRE$PVC -p tcp -i br0 -d ! $LAN_IP --dport $EXT_SPORT:$EXT_EPORT -j DNAT --to $INT_IP 2>/dev/null
			iptables -t nat -D POSTROUTING -p tcp -d $INT_IP --dport $EXT_SPORT:$EXT_EPORT -j SNAT --to $LAN_IP 2>/dev/null
			iptables -t nat -D POSTROUTING -p udp -d $INT_IP --dport $EXT_SPORT:$EXT_EPORT -j SNAT --to $LAN_IP 2>/dev/null
		 fi
		fi

else
iptables -t nat $OPT VS_PRE$PVC -p tcp --dport $EXT_SPORT:$EXT_EPORT -d $SERVER_IP -s 0/0  -j DNAT --to $INT_IP

iptables -t nat $OPT VS_PRE$PVC -p udp --dport $EXT_SPORT:$EXT_EPORT -d $SERVER_IP -s 0/0  -j DNAT --to $INT_IP

fi

