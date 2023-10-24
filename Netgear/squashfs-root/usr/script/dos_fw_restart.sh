#!/bin/sh
#/usr/bin/iptables -N DOS
#/usr/bin/iptables -I INPUT -j DOS
#/usr/bin/iptables -A DOS -j RETURN
#/usr/bin/iptables -I FORWARD -j DOS
#/usr/bin/iptables -F DOS

#SYN Flood Attack
/usr/bin/iptables -F dos_syn_flood
/usr/bin/iptables -A DOS -p tcp --tcp-flags SYN,RST,ACK SYN -j dos_syn_flood
/usr/bin/iptables -A dos_syn_flood -m limit --limit 150/s --limit-burst 300 -j RETURN
/usr/bin/iptables -A dos_syn_flood -j DROP

#UDP Flood Attack
/usr/bin/iptables -F dos_udp_flood
/usr/bin/iptables -A DOS -p udp -j dos_udp_flood
/usr/bin/iptables -A dos_udp_flood -m limit --limit 100/s --limit-burst 300 -j RETURN
/usr/bin/iptables -A dos_udp_flood -j DROP

#ICMP Flood Attack
/usr/bin/iptables -F dos_icmp_flood
/usr/bin/iptables -A DOS -p icmp -j dos_icmp_flood
/usr/bin/iptables -A dos_icmp_flood -m limit --limit 10/s --limit-burst 1000 -j RETURN
/usr/bin/iptables -A dos_icmp_flood -j DROP

#Smurf Attack
#/usr/bin/iptables -N dos_smurf
#/usr/bin/iptables -F dos_smurf
#/usr/bin/iptables -A DOS -p icmp -j dos_smurf
#/usr/bin/iptables -A DOS -p icmp -m icmp --icmp-type address-mask-request -j dos_smurf
#/usr/bin/iptables -A DOS -p icmp -m icmp --icmp-type timestamp-request -j dos_smurf
#/usr/bin/iptables -A DOS -p icmp -m icmp -m limit --limit 1/s -j ACCEPT
#/usr/bin/iptables -A dos_smurf -j DROP

#Fraggle Attack
/usr/bin/iptables -F dos_fraggle
/usr/bin/iptables -A DOS -p udp -m pkttype --pkt-type broadcast -j dos_fraggle
/usr/bin/iptables -A DOS -p udp -m limit --limit 1/s -j ACCEPT
/usr/bin/iptables -A dos_fraggle -j DROP

#Ping of Death Attack
/usr/bin/iptables -F dos_ping_of_death
/usr/bin/iptables -A DOS -p icmp --icmp-type echo-request -j dos_ping_of_death
/usr/bin/iptables -A dos_ping_of_death -m limit --limit 150/s --limit-burst 300 -j ACCEPT
/usr/bin/iptables -A dos_ping_of_death -j DROP

#Xmas Tree attack
/usr/bin/iptables -F dos_xmas
/usr/bin/iptables -A DOS -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG,PSH -j dos_xmas
/usr/bin/iptables -A dos_xmas -j DROP

#Winnuke Attack
/usr/bin/iptables -F dos_winnuke
/usr/bin/iptables -A DOS -p tcp --tcp-flags ALL URG -j dos_winnuke
/usr/bin/iptables -A dos_winnuke -j DROP

#TCP/UDP Echo/Chargen Attack
/usr/bin/iptables -F dos_Chargen
/usr/bin/iptables -A DOS -j dos_Chargen
/usr/bin/iptables -A dos_Chargen -p udp --dport 7 -j DROP
/usr/bin/iptables -A dos_Chargen -p udp --dport 19 -j DROP

#Drop TCP packet without SYN
/usr/bin/iptables -A FORWARD -m state --state INVALID -j DROP
/usr/bin/iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

#Get device WAN IP and link status
WAN_IF=`/userfs/bin/tcapi get WanInfo_Entry Interface`

echo "restart"$WAN_IF > /tmp/josh

#Drop IP that want to port scan device
/usr/bin/iptables -F PORTSCANNING_BLOCK
/usr/bin/iptables -A PORTSCANNING_BLOCK -p tcp --tcp-flags SYN,RST,ACK SYN -i $WAN_IF -m state --state NEW -m recent --rcheck --seconds 10 --hitcount 20 --name POSTSCAN_LOG --rsource -j DROP
/usr/bin/iptables -A PORTSCANNING_BLOCK -p tcp --tcp-flags SYN,RST,ACK SYN -i $WAN_IF -m state --state NEW -m recent --set --name POSTSCAN_LOG --rsource
