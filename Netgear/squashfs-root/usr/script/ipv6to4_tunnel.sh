#!/bin/sh


WAN_DEFAULT_IPADDR=`/userfs/bin/tcapi get WanInfo_Entry IP`
STATIC_RELAY_TYPE=`/userfs/bin/tcapi get Wan_Common 6to4_relay_type`
STATIC_RELAY_IP=::`/userfs/bin/tcapi get Wan_Common 6to4_relay_ip`
RELAY_VIA_IP=::192.88.99.1
PARTS=`echo $WAN_DEFAULT_IPADDR | tr . ' '`
PREFIX48=`printf "2002:%02x%02x:%02x%02x" $PARTS`
STF_NET6="$PREFIX48":ffff
STF_IP6="$STF_NET6"::1


start() {
    echo "set 6to4 tunnel ..."
#    insmod /lib/modules/2.6.36/ipv6.ko
#    insmod /lib/modules/2.6.36/sit.ko
    if [ $STATIC_RELAY_IP != "0.0.0.0" ] && [ $STATIC_RELAY_TYPE = "1" ];then
        RELAY_VIA_IP=$STATIC_RELAY_IP
    fi
	if [ $WAN_DEFAULT_IPADDR != "N/A" ];then
		echo $PREFIX48
		echo $STF_IP6
		echo $RELAY_VIA_IP
		/usr/script/wan_stop.sh 1 0
		/usr/script/wan_stop.sh 10 1
		
		ip tunnel add tun6to4 mode sit remote any local $WAN_DEFAULT_IPADDR
		ip link set dev tun6to4 up
		ip -6 addr add $PREFIX48::1/48 dev tun6to4
		ip -6 addr add $STF_IP6/64 dev br0
#		ip -6 route add 2000::/3 via $RELAY_VIA_IP dev tun6to4
		ip -6 route add default via $RELAY_VIA_IP dev tun6to4
		echo 1 > /proc/sys/net/ipv6/conf/all/forwarding
		
		
		/userfs/bin/tcapi set Radvd_Entry PrefixIPv6 $STF_NET6::
		/userfs/bin/tcapi commit Radvd_Entry
		/userfs/bin/tcapi set Wan_Common 6to4_tunnel_status "enabled"
	fi
	

}

stop() {

    echo "remove 6to4 tunnel ..."
#    echo 0 > /proc/sys/net/ipv6/conf/all/forwarding
	ip tunnel del tun6to4
	ip -6 route del $STF_IP6/64 dev br0
	ifconfig br0 inet6 del $STF_IP6/64
	/userfs/bin/tcapi set Radvd_Entry PrefixIPv6 ""
	/userfs/bin/tcapi commit Radvd_Entry
	
	/userfs/bin/tcapi set Wan_Common 6to4_tunnel_status "ready"
#    RETVAL=$?
#    return $RETVAL
}


# See how we were called.
case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart|reload)
    stop
    start
    RETVAL=$?
    ;;
  *)
    echo $"Usage: $0 {start|stop|restart}"
    exit 1
esac

exit $RETVAL
