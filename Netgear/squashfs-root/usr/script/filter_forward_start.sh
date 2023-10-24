PROFILE_CFG=/userfs/profile.cfg
if [ -f $PROFILE_CFG ] ; then
    chmod 777 $PROFILE_CFG
    . $PROFILE_CFG
fi
iptables -t filter -N ipfilter_chain
iptables -t filter -N app_filter_chain
iptables -t filter -N url_filter_chain
if [ "$AYECOM_REMOTE_ACCESS_SUPPORT" != "" ] ;then
insmod /lib/modules/2.6.36/kernel/net/ipv4/netfilter/ipt_REDIRECT.ko
iptables -t mangle -N remote_chain
iptables -t mangle -A PREROUTING -p all -j remote_chain
iptables -t nat -N lan_dnat
iptables -t nat -A PREROUTING -p all -j lan_dnat
iptables -t nat -N remote_chain
iptables -t nat -A PREROUTING -p all -j remote_chain
iptables -t filter -N remote_chain
iptables -t filter -A INPUT -j remote_chain
fi
if [ "$AYECOM_DOS_PORTSCAN_SUPPORT" != "" ] ;then
/usr/bin/iptables -t filter -N DOS
/usr/bin/iptables -A INPUT -j DOS
/usr/bin/iptables -A DOS -j RETURN
#/usr/bin/iptables -I FORWARD -j DOS
/usr/bin/iptables -F DOS
fi
if [ "$TCSUPPORT_TIME_OF_DAY" != "" ] ;then
iptables -t filter -N parent_control_chain
fi
if [ "$TCSUPPORT_OBM_FW" != "" ] ;then
iptables -t filter -N FW_W2L
iptables -t filter -N FW_L2W
fi
iptables -t filter -A FORWARD -j ipfilter_chain
iptables -t filter -A FORWARD -p TCP -m multiport --dport http -j url_filter_chain
iptables -t filter -A FORWARD -p TCP -j app_filter_chain
iptables -t filter -A FORWARD -p UDP -j app_filter_chain
if [ "$TCSUPPORT_TIME_OF_DAY" != "" ] ;then
iptables -t filter -A FORWARD -p TCP -j parent_control_chain
iptables -t filter -A FORWARD -p UDP -j parent_control_chain
fi
if [ "$TCSUPPORT_OBM_FW" != "" ] ;then
iptables -t filter -A FORWARD -o br0 -j FW_W2L
iptables -t filter -A FORWARD -i br0 -j FW_L2W
fi
if [ "$AYECOM_DOS_PORTSCAN_SUPPORT" != "" ] ;then
iptables -t filter -N PORTSCANNING_BLOCK
iptables -t filter -A FORWARD -j PORTSCANNING_BLOCK
fi
if [ "$AYECOM_PORT_FORWARD_ENHANCE" != "" ] ;then
iptables -t filter -N fwd_port_forward
iptables -t filter -A FORWARD -j fwd_port_forward
iptables -t nat -N NAT_LOOPBACK
iptables -t nat -A POSTROUTING -p all -j NAT_LOOPBACK
fi
iptables -t filter -N dmz_forward
iptables -t filter -A FORWARD -j dmz_forward 
#krammer
iptables -t filter -N SPI_FW
iptables -t filter -N ACL
iptables -t filter -N FIREWALL
if [ "$TCSUPPORT_OBM_FW" != "" ] ;then
iptables -t filter -N FW_W2W
iptables -t filter -N FW_L2L
fi
if [ "$TCSUPPORT_MULTI_NAT" != "" ] ;then
iptables -t filter -N ADDRMAP_FORWARD
fi
if [ "$TCSUPPORT_DHCP_PORT_FLT" != "" ] ;then
iptables -t filter -N DHCP_PORT_FLT
fi
iptables -t filter -A INPUT -j SPI_FW
iptables -t filter -A INPUT -j ACL
if [ "$TCSUPPORT_DHCP_PORT_FLT" != "" ] ;then
iptables -t filter -A INPUT -j DHCP_PORT_FLT
fi
iptables -t filter -A INPUT -j FIREWALL
#create a new chain
if [ "$TCSUPPORT_PORT_TRIGGER" != "" ] ;then
iptables -t filter -N FORWARD_WAN
fi

if [ "$TCSUPPORT_MULTI_NAT" != "" ] ;then
iptables -t filter -I FORWARD 1 -j ADDRMAP_FORWARD
if [ "$TCSUPPORT_WAN_ETHER" != "" ] ;then
	pvc_num="0 1 2 3 4 5 6 7 8 9 10"
elif [ "$TCSUPPORT_WAN_PTM" != "" ] ;then
	pvc_num="0 1 2 3 4 5 6 7 8 9"
else
	pvc_num="0 1 2 3 4 5 6 7"
fi

for j in $pvc_num
do
	iptables -t filter -N ADDRMAP_FORWARD$j
done					
fi

iptables -t nat -N PRE_SERVICE
iptables -t nat -A PREROUTING -j PRE_SERVICE

if [ "$AYECOM_REMOTE_ACCESS_SUPPORT" != "" ] ;then
iptables -P INPUT DROP
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -i br+ -j ACCEPT
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
fi

