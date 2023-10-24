#!/bin/sh
#/usr/bin/iptables -D INPUT -j DOS
#/usr/bin/iptables -D FORWARD -j DOS
/usr/bin/iptables -F DOS
/usr/bin/iptables -X DOS

#SYN Flood Attack
/usr/bin/iptables -F dos_syn_flood
/usr/bin/iptables -X dos_syn_flood

#UDP Flood Attack
/usr/bin/iptables -F dos_udp_flood
/usr/bin/iptables -X dos_udp_flood

#ICMP Flood Attack
/usr/bin/iptables -F dos_icmp_flood
/usr/bin/iptables -X dos_icmp_flood

#Smurf Attack
#/usr/bin/iptables -F dos_smurf
#/usr/bin/iptables -X dos_smurf

#Fraggle Attack
/usr/bin/iptables -F dos_fraggle
/usr/bin/iptables -X dos_fraggle

#Ping of Death Attack
/usr/bin/iptables -F dos_ping_of_death
/usr/bin/iptables -X dos_ping_of_death

#Xmas Tree attack
/usr/bin/iptables -F dos_xmas
/usr/bin/iptables -X dos_xmas

#Winnuke Attack
/usr/bin/iptables -F dos_winnuke
/usr/bin/iptables -X dos_winnuke

#TCP/UDP Echo/Chargen Attack
/usr/bin/iptables -F dos_Chargen
/usr/bin/iptables -X dos_Chargen

#Drop TCP packet without SYN
/usr/bin/iptables -D FORWARD -m state --state INVALID -j DROP
/usr/bin/iptables -D FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

#Disable Drop IP that want to port scan device
/usr/bin/iptables -F PORTSCANNING_BLOCK
