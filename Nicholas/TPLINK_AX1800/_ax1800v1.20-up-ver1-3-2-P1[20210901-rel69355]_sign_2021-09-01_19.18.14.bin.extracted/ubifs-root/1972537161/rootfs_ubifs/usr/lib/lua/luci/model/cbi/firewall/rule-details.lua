LuaQ               �     H@  "� A   ��  b� �   ��  �� �    �   HA "� G��� �� ����B    �� ���B Ȃ � H "� A� �C b ��  [ ��� � �� D���BD����B �����D� A� @���� �C�����A� @��� � M@�  �� �B  ���� ������ ���B # � ����C�E����A� @��� � �B   ����A� @���C � �  � ���F �� H� "� �   ���� A� � b� ��C �D�� @��F��ȃ  a    bC�FC��� �  �AH� � b� ���ɑ��ɒ@��� �
 bC�@C�� ��
 � H�
 " bC  FK��
 D A� �� b� �� �� � b�  ��F��C � bC F���  bC F��C � bC F���  bC F��C � bC aC  �A��FK��
  A� �D b b�  ���I��ПāРFK��  A� �D b b�  ���I��ңA� �� b� �A��A� @��@�@C���   �bC FK��
 � A� �� b b�  ���I��ԣA� �� b� �A��A� @��@�@C���   �bC FK��
 � A� �� b� �� � � b�  ���I��AգA� �� b� �A��FK��
 � A� �� b b�  ���I��֟āРFK��
 D A� �� b b�  ����֣A� @��@�@C��  �bC FK��
  A� �D b� �� Ȅ � b�  ���I�A� �� b� �A���AգFK��
 � A� � b� �� �D � b�  ��āI�āأA� �Y� b ��� 	�� E�" � �������� ��Y�� �� ��"� �Y"� FG�b �F  ���"F ބ  ��^�  ��FK��
 � A� �� b� �� � � b�  ���Aۣ�I�A� �� b� �A��FK��
 � A� � b� �� �D � bC  �  @_����A� @��� � �B   ����A� @���C � �  � ���F� �� H� "� �  A� � b� ��C �D��C��� �� ���� H "� � �ɑ��ɒ ��[ �
 "C� C�[ ��
 �� �
 � "C  K� �C � H� " "�  � �I��� �� � � "C  �� �� D � "C  ��� �� � � "C  K��
 �C � H� " "�  � ��C ��  � "C  ��� � "C ��C ȃ "C ��� � "C ��C ȃ "C !C ���K�� �C � H� " "�  � �� ȃ "C ��� "C���  "C���C  "C����  "C����  "C���! "C���C! "C����! "C����! "C���" "C���C" "C����" "C����" "C���# "C���C# "C����# "C����# "C���$ "C���� "C���C$ "C����$ "C����$ "C���% "C���C% "C����% "C����% "C���& "C���C& "C����& "C����& "C���' "C���C' "C����' "C����' "C���( "C���C( "C�K��
 � � HD " "�  � �I��I��ПāРK��
 � � HD " "�  � ���� H� "� ����  �R S CSa�  �"C K��
 ȃ � H) " "�  � �ԣ� H� "� ����  �R S CTa�  �"C K��
 ȃ � H� " "�  � �A�� H� "� ���K��
 ȃ � H� " "�  � �I��I��I�āРK��
 �C � H�) " "�  � �ԣ� H� "� ����  �R S CTa  �"C K��
 � � HD " "�  � �A�� H� "� ���K� � � H* " "�  � �A����* �� �* � "C  ��C* �� + � "C  ��C+ �� �+ � "C  ���+ �� , � "C  K��
 �� � H "� A� �D b "C  c # � �      require 	   luci.sys    luci.dispatcher    nixio    luci.tools.firewall    luci.model.network    arg 	          Map 	   firewall 
   translate    Firewall - Traffic Rules �   This page allows you to change advanced properties of the 
	           traffic rule entry, such as matched source and destination 
			   hosts. 	   redirect 
   build_url    admin/network/firewall/rules    init    uci    get    target    SNAT    luci    http    name    _name 	       (Unnamed SNAT)    SNAT %s    title    %s - %s    foreach    zone    section    NamedSection 
   anonymous 
   addremove     opt_enabled    Button 	   opt_name    Value    Name    option    proto 	   Protocol s   You may specify multiple by selecting "-- custom --" and 
		           then entering protocols separated by space.    value    all    All protocols    tcp udp    TCP+UDP    tcp    TCP    udp    UDP    icmp    ICMP 	   cfgvalue    src    Source zone 	   nocreate    default    wan 	   template    cbi/firewall_zonelist    DynamicList    src_mac    Source MAC address    rmempty 	   datatype    neg(macaddr)    placeholder    any    sys    net 
   mac_hints    src_ip    Source IP address    neg(ipaddr)    ipv4_hints 	   src_port    Source port d   Match incoming traffic originating from the given source 
			port or port range on the client host.    neg(portrange)    dest    Destination zone    lan    dest_ip    Destination IP address    neg(ip4addr) 
   dest_port    Destination port I   Match forwarded traffic to the given destination port or 
			port range.    src_dip    SNAT IP address .   Rewrite matched traffic to the given address.    ip4addr    ipairs    get_interfaces    ipaddrs    host    string    %s (%s) 
   shortname 
   src_dport 
   SNAT port h   Rewrite matched traffic to the given source port. May be 
			left empty to only rewrite the IP address. 
   portrange    Do not rewrite    extra    Extra arguments 8   Passes additional arguments to iptables. Use with care!    (Unnamed Rule)    rule 
   ListValue    family    Restrict to address family    IPv4 and IPv6    ipv4 
   IPv4 only    ipv6 
   IPv6 only    Any 
   icmp_type    Match ICMP type    echo-reply    destination-unreachable    network-unreachable    host-unreachable    protocol-unreachable    port-unreachable    fragmentation-needed    source-route-failed    network-unknown    host-unknown    network-prohibited    host-prohibited    TOS-network-unreachable    TOS-host-unreachable    communication-prohibited    host-precedence-violation    precedence-cutoff    source-quench    network-redirect    host-redirect    TOS-network-redirect    TOS-host-redirect    echo-request    router-advertisement    router-solicitation    time-exceeded    ttl-zero-during-transit    ttl-zero-during-reassembly    parameter-problem    ip-header-bad    required-option-missing    timestamp-request    timestamp-reply    address-mask-request    address-mask-reply 	   allowany    list(macaddr)    Source address    list(neg(portrange))    allowlocal    Destination address    Action    ACCEPT    DROP    drop    accept    REJECT    reject    NOTRACK    don't track 	       =   H    	   @ @ Y@    �@@@ Y    ��  ƀ� H�  � �@� A� ��A@ �  �  � �@  ��# �       network    name    gmatch    %S+    wan                     ^   d        A   @@� �   b�  Y   @ ��� @ ���  �  c  # �       Value 	   cfgvalue    tcpudp    tcp udp                     r   t    
   �   � @  E �  �� _A RA���@ # �       value    %s (%s)                     |   ~    
   �   � @  E �  �� _A RA���@ # �       value    %s (%s)                     �   �    
   �   � @  E �  �� _A RA���@ # �       value    %s (%s)                     �   �        A   @@� �   b�  Y   @ ��� @ ���  �  c  # �       Value 	   cfgvalue    tcpudp    tcp udp                          
   �   � @  E �  �� _A RA���@ # �       value    %s (%s)                     &  (   
   �   � @  E �  �� _A RA���@ # �       value    %s (%s)                     ;  =   
   �   � @  E �  �� _A RA���@ # �       value    %s (%s)                             