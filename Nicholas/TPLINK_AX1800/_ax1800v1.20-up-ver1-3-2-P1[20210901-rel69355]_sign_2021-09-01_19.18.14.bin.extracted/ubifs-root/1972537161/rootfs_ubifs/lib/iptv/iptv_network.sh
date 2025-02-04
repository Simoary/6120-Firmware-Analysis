# Copyright (C) 2011-2014 TP-LINK

. /lib/iptv/iptv_func.sh
iptv_load_network()
{
    config_load network
}

iptv_lan_set_ifname()
{
    # $1 virtual network interfaces set
    lua /lib/iptv/iptv_config.lua set network lan ifname "$1"
}

iptv_set_bridge_type()
{
    # $1 lan/wan
    lua /lib/iptv/iptv_config.lua set network $1 type bridge
}

iptv_set_unbridge_type()
{
    # $1 lan/wan
    lua /lib/iptv/iptv_config.lua set network $1 type ""
}

iptv_wanv6_set_ifname()
{
    # $1 the value of ifname
    lua /lib/iptv/iptv_config.lua set network wanv6 ifname "$1"
    lua /lib/iptv/iptv_config.lua set protocol staticv6 ifname "$1"
    lua /lib/iptv/iptv_config.lua set protocol dhcpv6 ifname "$1"
    lua /lib/iptv/iptv_config.lua set protocol pppoev6 ifname "$1"
    lua /lib/iptv/iptv_config.lua set protocol 6to4 ifname "$1"
    lua /lib/iptv/iptv_config.lua set protocol dslite ifname "$1"
    lua /lib/iptv/iptv_config.lua set protocol v6plus ifname "$1"
}

iptv_set_rely_iface()
{
    lua /lib/iptv/iptv_config.lua set network "$1" rely_interface "$2"
}

iptv_del_rely_iface()
{
    uci delete network."$1".rely_interface
}

iptv_pppshare_set_ifname()
{
    # config for pppshare when wan ifname is changed
    local share_support=`lua /lib/iptv/iptv_config.lua get_share_support`
    [ "$share_support" == "yes" ] && {
        lua /lib/iptv/iptv_config.lua set protocol internet ifname "$1"
        lua /lib/iptv/iptv_config.lua set protocol wan ifname "$1"
    }
}

iptv_internet_set_ifname()
{
    # $1 the value of ifname
    lua /lib/iptv/iptv_config.lua set network internet ifname "$1"
}

iptv_wan_set_ifname()
{
    # If wan, lan interfaces are based on the same device, we need to sync the 
    # wan device name before setting the wan interface ifname.
    local lan_ifname=`lua /lib/iptv/iptv_config.lua get_lan_ifname`
    local wan_ifname=`lua /lib/iptv/iptv_config.lua get_wan_ifname`
    local lan_dev=${lan_ifname%%.*}
    local wan_dev=${wan_ifname%%.*}

    #if [ "${lan_dev}" = "${wan_dev}"]; then
	lua /lib/iptv/iptv_config.lua set network device name "$1"
    #fi
    lua /lib/iptv/iptv_config.lua set network wan ifname "$1"
}

iptv_set_device_attr()
{
    lua /lib/iptv/iptv_config.lua set network device $1 "$2"
}

iptv_igmp_snooping_set()
{
    lua /lib/iptv/iptv_config.lua set network $1 igmp_snooping "$2"
}

iptv_rm_iface_from_netifd()
{
    ubus call network.interface.wan remove
    config_get wanv6 "wanv6" "proto"
    [ -n "$wanv6" ] && {
        ubus call network.interface.wanv6 remove
    }
}
iptv_disconnect_ifs()
{
    ifaces=`ubus -S list 'network.interface.*'`
    disconn_ifs="internet wan wanv6"
    for iface in $disconn_ifs; do
        [ "$ifaces" != "${ifaces/$iface}" ] && {
            ubus call network.interface."$iface" disconnect 1>/dev/null 2>&1
            sleep 1
        }
    done
}
