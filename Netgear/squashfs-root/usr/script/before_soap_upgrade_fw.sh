/usr/bin/killall -9 tr69 ; 
/usr/bin/killall -9 netscan ; 
/usr/bin/killall -9 radvd ; 
/usr/bin/killall -9 pppd ; 
/usr/bin/killall -9 dhcp6s ; 
/usr/bin/killall -9 dnsmasq ; 
/usr/bin/killall -9 wpa_supplicant ; 
/usr/bin/killall -9 udhcpd ; 
/usr/bin/killall -9 usb_auto_mount ; 
/usr/bin/killall -9 inetd

/bin/rm -rf /tmp/ayeInfo.bin
/bin/rm -rf /tmp/checksize.bin cwmp info* 

CMD_RM_ETCPATH="/bin/rm -rf /tmp/etc"
$CMD_RM_ETCPATH/8021xaction.sh 
$CMD_RM_ETCPATH/802_1X AppFilter.sh 
$CMD_RM_ETCPATH/UrlFilter.sh 
$CMD_RM_ETCPATH/Wireless 
$CMD_RM_ETCPATH/dproxy.conf 
$CMD_RM_ETCPATH/bftpd.conf 
$CMD_RM_ETCPATH/ethertypes 
$CMD_RM_ETCPATH/isp* 
$CMD_RM_ETCPATH/nat* 
$CMD_RM_ETCPATH/protocols 
$CMD_RM_ETCPATH/services 
$CMD_RM_ETCPATH/snmpd.conf.tmp 
$CMD_RM_ETCPATH/usb*
$CMD_RM_ETCPATH/xml 
$CMD_RM_ETCPATH/ppp

echo "3" > /proc/sys/vm/drop_caches
