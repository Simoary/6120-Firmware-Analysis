LuaQ                u     H@  "� A   ��  b� �   ��  �� �    �  	�D � A� � b �  �	�� ���	��	E � ������  �C�D ��C  �C�D �� AE @��
℀�D  @��  �D
 EB
A @�
�E b "E  # � ��� A� � b� �� � F�	"� F    �� ��E  ����F� �E�	� A� � �F�	� b�  �� �� G�	" �  "�   
BH��H�!   �     �EI��	 �� �	 � "E  EI�
 �� F
 � "E  �J��	 ��
 F A� � b "�  [ 
D�ȖDBH�D̗!E   �	 �  �  	    D�� F�Jȅ	 � H� �� � � b�  ��J�	 A� �F �� � � ��  ƅJH�	 �� �� � H " �  E  [ 
E [�"@�F�N�� � H " bF  F�N�F � H� " bF  F�N�� � H " bF  �  ���J��	 �E � A� �� b "E  �J��	 �E  A� �F b "E  �J��	 ��
 � A� �� b "�  � 
�BR���R��BS�!�  ��!�   ����!  �	 �����J�
 ��  A� �F b "�  � 
�BH����� ��  � "E  ���E �� � � "E  ���� ��  � "E  �J�
 �E � A� �� b "�   
CȖח�׮�W� �� "E �W� �E "E �J�
 �E  A� �F b "�  [ 
DCȖDחD�׮��� �� "E ��� �E "E �J�
 �E � A� �� b "E  �J�
 �E  A� �F b "�  � 
�CH���Y��J�
 ��
  A� �F b "�  � 
ăڮ��� �� "E �F� �E�	� A� � b� �� �F G�	"� FG�	b� �G�	� �  "�   
�[��
 �� � H " "�  [ 
DDȸD�R�E�	"� D�D�\��[��
 � � HF " "�  � 
�Dȸ��R�E�	"� ����\�!E  �	D��!�  �	���!� D�! ��!E  �	 �D��!�  �	 ����# # � v      require    luci.model.network    luci.model.firewall    luci.dispatcher 
   luci.util    Map 	   firewall 
   translate    Firewall - Zone Settings 	   redirect    luci    dispatcher 
   build_url    admin/network/firewall/zones    init    uci 	   get_zone    arg 	      http    dsp    title    %s - %s    translatef    Zone %q    name    ?    section    NamedSection    sid    zone �  This section defines common properties of %q. 
		The <em>input</em> and <em>output</em> options set the default 
		policies for traffic entering and leaving this zone while the 
		<em>forward</em> option describes the policy for forwarded traffic 
		between different networks within the zone. 
		<em>Covered networks</em> specifies which available networks are 
		member of this zone. 
   anonymous 
   addremove  
   on_commit    tab    general    General Settings 	   advanced    Advanced Settings 
   taboption    Value    Name 	   optional    forcewrite 	   datatype    uciname    write 
   ListValue    input    Input    output    Output    forward    Forward    ipairs    value    REJECT    reject    DROP    drop    ACCEPT    accept    Flag    masq    Masquerading    mtu_fix    MSS clamping    network    Covered networks 	   template    cbi/network_netlist    widget 	   checkbox    cast    string 
   formvalue 	   cfgvalue    family    Restrict to address family    rmempty        IPv4 and IPv6    ipv4 
   IPv4 only    ipv6 
   IPv6 only    DynamicList 	   masq_src .   Restrict Masquerading to given source subnets (   list(neg(or(uciname,hostname,ip4addr)))    placeholder 
   0.0.0.0/0    depends 
   masq_dest 3   Restrict Masquerading to given destination subnets 
   conntrack    Force connection tracking    log    Enable logging on this zone    enabled    1 
   log_limit    Limit log messages 
   10/minute    fwd_out    Inter-Zone Forwarding �  The options below control the forwarding policies between 
		this zone (%s) and other zones. <em>Destination zones</em> cover 
		forwarded traffic <strong>originating from %q</strong>. 
		<em>Source zones</em> match forwarded traffic from other zones 
		<strong>targeted at %q</strong>. The forwarding rule is 
		<em>unidirectional</em>, e.g. a forward from lan to wan does 
		<em>not</em> imply a permission to forward from wan to lan as well.    option    out -   Allow forward to <em>destination zones</em>: 	   nocreate    exclude    cbi/firewall_zonelist    in *   Allow forward from <em>source zones</em>:        :   @       J   F � �@  ���b��Y   @�� � � � �����  � � ����# �    	   get_zone    arg 	      section    sid                     L   X    	&   �   � �� M����� � �@�J  F�b� � �@ �  Ā �� �Ā ��  
� AHA � "��� ���  � A �A b� �� �� B   � ��A  ��� �# �       name    rename_zone    exclude 	   redirect 
   build_url    admin/network/firewall/zones    title    %s - %s 
   translate    Firewall - Zone Settings    translatef    Zone %q    ?                     n   p     
   �   �@@�   � ����@    ���  �  # �       Value 
   formvalue    -                     r   t       �   �@@�   � ����@  � ��   �@@� ����  # �       Value 	   cfgvalue                     v   }       �   � ��@ � �
�  A@[ "� �
  �@��"B�A  @�# �       clear_networks    imatch    add_network                     �   �       �   � �  J  FA�ȁ  b�"  �V Q���A�� ����   �A  �A[ �� $�#  # �       ipairs    get_forwardings_by    src 	      dest    table    concat                          �   �       �   � �  J  FA�ȁ  b�"  �V Q���A�� ����   ��  # �       ipairs    get_forwardings_by    dest 	      src                     �   �     
   �   �@@�   � ����@    ���  �  # �       Value 
   formvalue    -                     �   �     
   �   �@@�   � ����@    ���  �  # �       Value 
   formvalue    -                     �   �       �   � �HA  �@�� �
�  �@[ "� �
  �@��"B�A  @�# �       del_forwardings_by    src    imatch    add_forwarding_to                     �   �       �   � �HA  �@�� �
�  �@[ "� �
  �@��"B�A  @�# �       del_forwardings_by    dest    imatch    add_forwarding_from                             