LuaQ               	m      H@  ��  ��@"@�  H@ "� A  �� b� �  �� �� �   �  HA "� A �� b� � �� �� � !      � �    B !B  � !�      � �      � !�      � �       !     � �      B !B   � !�     � �      � !�     � �       !   B !B     � �    � !�     � �    � !�     !    B !B     � �  � # �       module    cloud_req.cloud_account    package    seeall    require    cloud_req.cloud_https 
   luci.json 	   luci.sys    luci.tools.debug    luci.model.accountmgnt    nixio    luci.fs     /usr/sbin/cloud_setupTMHomecare    bind_device_with_token    bind_device    unbind_device_with_token    unbind_device_with_accountname    unbind_device_with_accountid    unbind_device     unbind_device_with_feinfo_token "   unbind_device_with_feinfo_account    unbind_deviceWithFeatureInfo    check_bind    check_bind_status    update_alias    remove_deviceUser    get_accountRole           h    �   A   �@  b� @�� b�� ��  @  @ ��  �  �   Ā���   � ��
   �B"�� @A���B�A    �� D���@A���C�A    �� D���@A��D�A    �� D���@A��AD�A    �� D���@A�DC�E  �A���BD���D��� �  �A� [���� ���M��  �� B  @ �H c @�E � �A  �B b� ����B� �  �BE� �[�� ��� M��  �� B  @ �� � @�E��@�@�FY  � �@�F@�YB  @ �H c FB� Ȃ � H b���B� � H� �C ����B� H� �� ȃ ₀� [�"�  E �� [ "� �E� � �F GM ���� �� ��  HD	 "C � �� �� D H�	 "C � �� �� � @�F@�"C �� �� "C�
�  J CJJ "�   ��� ��
 ��
  HD "C �� ��
 "C�
� �KJ �� W��"C 
�  J CJH "�   � �
� �KHC "C 
� �LH� "C 
  MHC "�   � �� HC "C @�Ec # � 7      require    luci.model.uci    cursor    server 	���   method    POST    path    /common/v2/bind    params    get_device_basicinfo 	   deviceId        model 	   devModel    hwVer 	   devHwVer    fwVer    deviceType    accountManagerToken 	      cloud_https_getinfo_dispatch 	       error_code 	���   cloud_req.cloud_sdk_status    cloud_sendmsg    result 
   accountId    get    cloud_config    device_status    bind_status    need_unbind 
   accountid 	   tonumber    set    1    0    commit    fs    access 	   homecare    tm_homecare    enable    on 
   fork_exec 	    forceOn !   /etc/init.d/aviraserviceselector :   /usr/sbin/report_upload_bind;/usr/sbin/aviraservice start    call     touch /tmp/ifttt_allow_upload &    isfile    /usr/sbin/cloud_changeService    dofile                     j   l        A   �   d  c   # �       bind_device_with_token                     n   �    �   A   �@  b� @�� b�� ��  @  @ ��  �  �   Ā���   � ��
   �B"�� @A���B�A    �� D���@A���C�A    �� D���@A��D�A    �� D���@A��AD�A    �� D���@A�DC�E  �A���BD���D��� �  �A� [���� ���M��  �� B  @ �H c F�� � C H� b�����  HC �� ������ H �C � ₀�B    �Ȃ  CG�E��� [�"� M E �� [ "�  E ��� � �C � H "C �� � �C � H "C C� � �C  "C��� � "C�
�  �H IJ "�   � �
� CIJ "C 
�  �H IH�	 "�   ��
� CIE� ��_C� RC��"C 
  J"��   ��FC� ȃ
 �
 bC F�� ȃ
 bC�J�@��C bC J�@���� b� Y  � �A �� bC  CG# # � 1      require    luci.model.uci    cursor    server 	���   method    POST    path    /common/v2/unbind    params    get_device_basicinfo 	   deviceId        model 	   devModel    hwVer 	   devHwVer    fwVer    deviceType    accountManagerToken 	      cloud_https_getinfo_dispatch 	       get    cloud_config    device_status    bind_status    need_unbind 
   accountid    error_code 	   tonumber    set    0    delete    commit    fs    access 
   fork_exec !   /etc/init.d/aviraserviceselector @   /usr/sbin/report_upload_unbind '%s';/usr/sbin/aviraservice stop    get_last_cloud_account    delete_all    accountmgnt    cloud_account    call    rm -rf /tmp/ifttt_allow_upload    isfile    /usr/sbin/cloud_changeService    dofile                     �      �   A   �@  b� @�� b�� ��  @  @ ��  �  �   Ā���   � ��
   �B"�� @A���B�A    �� D���@A���C�A    �� D���@A��D�A    �� D���@A��AD�A    �� D���@A�DC�E  �A���BD���D��� �  �A� [���� ���M��  �� B  @ �H c F�� � C H� b�����  HC �� ������ H �C � ₀�B    �Ȃ  CG�E��� [�"� M E �� [ "�  E ��� � �C � H "C �� � �C � H "C C� � �C  "C��� � "C�
�  �H IJ "�   � �
� CIJ "C 
�  �H IH�	 "�   ��
� CIE� ��_C� RC��"C 
  J"��   ��FC� ȃ
 �
 bC F�� ȃ
 bC�J�@��C bC J�@���� b� Y  � �A �� bC  CG# # � 1      require    luci.model.uci    cursor    server 	���   method    POST    path    /common/v1/unbindDevice    params    get_device_basicinfo 	   deviceId        model 	   devModel    hwVer 	   devHwVer    fwVer    deviceType    cloudUserName 	      cloud_https_getinfo_dispatch 	       get    cloud_config    device_status    bind_status    need_unbind 
   accountid    error_code 	   tonumber    set    0    delete    commit    fs    access 
   fork_exec !   /etc/init.d/aviraserviceselector @   /usr/sbin/report_upload_unbind '%s';/usr/sbin/aviraservice stop    get_last_cloud_account    delete_all    accountmgnt    cloud_account    call    rm -rf /tmp/ifttt_allow_upload    isfile    /usr/sbin/cloud_changeService    dofile                       M   �   A   �@  b� @�� b�� ��  @  @ ��  �  �   Ā���   � ��
   �B"�� @A���B�A    �� D���@A���C�A    �� D���@A��D�A    �� D���@A��AD�A    �� D���@A�DC�E  �A���BD���D��� �  �A� [���� ���M��  �� B  @ �H c F�� � C H� b�����  HC �� ������ H �C � ₀�B    �Ȃ  CG�E��� [�"� M E �� [ "�  E ��� � �C � H "C �� � �C � H "C C� � �C  "C��� � "C�
�  �H IJ "�   � �
� CIJ "C 
�  �H IH�	 "�   ��
� CIE� ��_C� RC��"C 
  J"��   ��FC� ȃ
 �
 bC F�� ȃ
 bC�J�@��C bC J�@���� b� Y  � �A �� bC  CG# # � 1      require    luci.model.uci    cursor    server 	���   method    POST    path %   /common/v1/unbindDeviceWithAccountId    params    get_device_basicinfo 	   deviceId        model 	   devModel    hwVer 	   devHwVer    fwVer    deviceType 
   accountId 	      cloud_https_getinfo_dispatch 	       get    cloud_config    device_status    bind_status    need_unbind 
   accountid    error_code 	   tonumber    set    0    delete    commit    fs    access 
   fork_exec !   /etc/init.d/aviraserviceselector @   /usr/sbin/report_upload_unbind '%s';/usr/sbin/aviraservice stop    get_last_cloud_account    delete_all    accountmgnt    cloud_account    call    rm -rf /tmp/ifttt_allow_upload    isfile    /usr/sbin/cloud_changeService    dofile                     O  i   .   A   �@  b� @�� b�� �      ���    � � ���� � HA �� ��  �@  @�
   B"��    �V M@�@ �@�B����    �� [�"� �  ��
   C"�� AA � b� � ��  # �       require    luci.model.uci    cursor    unbind_device_with_token    get    cloud_config    device_status 
   accountid    get_cloudAccount 	    	      unbind_device_with_accountid    get_last_cloud_account    unbind_device_with_accountname                     k  �   �   A   �@  b� @�� b�� ��  @  @ ��  �  �   Ā���   � ��
   �B"�� @A���B�A    �� D���@A���C�A    �� D���@A��D�A    �� D���@A��AD�A    �� D���@A�DC�E  �A���BD���D��� �  �A� [���� ���M��  �� B  @ �H c F�� � C H� b�����  HC �� ������ H �C � ₀�B    �Ȃ  CG�E��� [�"� M E �� [ "�  E ��� � �C � H "C �� � �C � H "C C� � �C  "C��� � "C�
�  �H IJ "�   � �
� CIJ "C 
�  �H IH�	 "�   ��
� CIE� ��_C� RC��"C 
  J"��   ��FC� ȃ
 �
 bC F�� ȃ
 bC�J�@��C bC J�@���� b� Y  � �A �� bC  CG# # � 1      require    luci.model.uci    cursor    server 	���   method    POST    path '   /common/v2/unbindDeviceWithFeatureInfo    params    get_device_basicinfo 	   deviceId        model 	   devModel    hwVer 	   devHwVer    fwVer    deviceType    accountManagerToken 	      cloud_https_getinfo_dispatch 	       get    cloud_config    device_status    bind_status    need_unbind 
   accountid    error_code 	   tonumber    set    0    delete    commit    fs    access 
   fork_exec !   /etc/init.d/aviraserviceselector @   /usr/sbin/report_upload_unbind '%s';/usr/sbin/aviraservice stop    get_last_cloud_account    delete_all    accountmgnt    cloud_account    call    rm -rf /tmp/ifttt_allow_upload    isfile    /usr/sbin/cloud_changeService    dofile                     �     �   �   �@  �� ��@��� ��  @  � �Y@  @ � #   ���E  A��J  @��b�� �AB����A    �� �����AB����A    �� �����AB���A    �� �����AB�A��A    �� �����AB�C��  �AB�������   @ ����  ��A ��A 
   �E[�� � �"M�E  �# YB  @ �� � �FC H� �� ����FHC �� � ₀F�C ȃ D "��C    �� @������A� � b� M@� �A� ��b� @� �FH�C � H� �D bC FH�C � H �D bC F�H�C � HD bC�F�H�C bC�J� @�@C�� b� Y  � �J�@��� bC J� @�@C���	 b� Y  ��J�@���� � �C� ���bC J @C�b�� Y  ����J�
 H �C ��H�
 �C����CKȃ �C ����K� �� �  � ��C � �C @��c # � 2      require    luci.model.uci    cursor    server 	���   method    POST    path '   /common/v1/unbindDeviceWithFeatureInfo    params    get_device_basicinfo 	   deviceId        model 	   devModel    hwVer 	   devHwVer    fwVer    deviceType 
   accountId    cloudUserName 	      cloud_https_getinfo_dispatch 	       get    cloud_config    device_status    bind_status    need_unbind 
   accountid    error_code 	   tonumber    set    0    delete    commit    fs    access 
   fork_exec !   /etc/init.d/aviraserviceselector @   /usr/sbin/report_upload_unbind '%s';/usr/sbin/aviraservice stop    get_last_cloud_account    delete_all    accountmgnt    cloud_account    call    rm -rf /tmp/ifttt_allow_upload    isfile    /usr/sbin/cloud_changeService    dofile                          0   A   �@  b� @�� b�� �      ���    � � � �� � HA �� ��  �@  @�
   B"��    �V M@�@ �@�B����   @�� [�� "���  ��
   C"�� A� � � b��� ��  # �       require    luci.model.uci    cursor     unbind_device_with_feinfo_token    get    cloud_config    device_status 
   accountid    get_cloudAccount 	    	   "   unbind_device_with_feinfo_account    get_last_cloud_account                     !  �   �   A   �@  b� @�� b�� ��  @  @ ��  �  �   Ā���   � ��
   �B"�� @A���B�A    �� D���@A���C�A    �� D���@A��D�A    �� D���@A��AD�A    �� D���@A�DC�E  �A���BD���D��� �  �A� [���� ���M��  �� B  @ �H c F�� � C H� b�����  HC �� ������ H �C � ₀�B    �Ȃ  CG�E@� �G  � � �G �GC  @ � # 	  A ��b� M � �A � b� M ��	�FC� � D H� �� bC J� @��@�� b� Y  ��FC� �C	 �	 H�	 �
 bC FC� �C	 bC�J�@��� ��
 ��bC J� @��@�� b� Y  � �J�@���C bC 	� @�G@��M@���FC� � D H ��G��G	bC 	� �K@�FC� � bC�@� CG�K�� [�"� M E � [ "�  E �C� � �C � H "C C� � �C � H "C C� � �C  "C�C� � "C�
�  �H IJ "�   � �
� �JJ "C 
�  �H IH "�   ��
� �JE� ��_C� RC�"C 
  �L"��   ��F� �C � bC FC� �C bC� CG# # � 7      require    luci.model.uci    cursor    server 	���   method    POST    path !   /common/v2/checkDeviceBindStatus    params    get_device_basicinfo 	   deviceId        model 	   devModel    hwVer 	   devHwVer    fwVer    deviceType    accountManagerToken 	      cloud_https_getinfo_dispatch 	       get    cloud_config    device_status    bind_status    need_unbind 
   accountid    error_code    result 
   accountId 	   tonumber    set    1    fs    access 	   homecare    tm_homecare    enable    on    commit 
   fork_exec 	    forceOn !   /etc/init.d/aviraserviceselector :   /usr/sbin/report_upload_bind;/usr/sbin/aviraservice start 	���   0    delete @   /usr/sbin/report_upload_unbind '%s';/usr/sbin/aviraservice stop    get_last_cloud_account    delete_all    accountmgnt    cloud_account                     �  �    �      H@  "�  �@ "�� H�  �   �@A���A��   �� ��   �@�   B@��YA    �H� A� B@A�YA    �H� A� B@��YA    �H� A� B@�YA    �H� A� B�  @B@��A�H� �  ��D��  [ �����M E  �� �A  @ �B #  �� E�#��E � �B � "��F�E � C H� b����E  HC � ����B    �� �B���������  � M�� �� �� �� ��BH H �C ȃ � �B �BH H �C �� � �B ��H H �C � �B��I H �B��� �B����
 � �  � ������
 �B �� �B����
 � �  �������� [ C� ���B � ���₀ �  ���J � �C "C I � "C����  � M��@�� �� M�� ��BH H �C ȃ � �B �I H �B��� �B����
 � �   ��BH H� � �C � �B �I H� �B������
 H� C�B �� �B����
 � �  ������� �B @ � ��#  B�B  @ �B #   @B�@��B�@��� c�# � 5      require    luci.model.uci    cursor    server    method    POST    path    /common/v1/checkIsBinded    params    get_device_basicinfo 	   deviceId        model 	   devModel    hwVer 	   devHwVer    fwVer    deviceType 	      cloud_https_getinfo_dispatch 	    	���   error_code    get    cloud_config    device_status    bind_status    need_unbind 
   accountid    result 	   isBinded  	   tonumber    set    0    delete    commit    fs    access 
   fork_exec !   /etc/init.d/aviraserviceselector @   /usr/sbin/report_upload_unbind '%s';/usr/sbin/aviraservice stop    get_last_cloud_account    delete_all    accountmgnt    cloud_account    1 	   homecare    tm_homecare    enable    on 	    forceOn :   /usr/sbin/report_upload_bind;/usr/sbin/aviraservice start                     �     V   A   �@  b� @�� b�� ��  @  @ ��  �  �   Ā���   � ��
   �B"�� @A���B�A    �� D���@A���C�A    �� D���@A��D�A    �� D���@A��AD�A    �� D���@A�DC�E  �A���BD���D��� �  �A� [���� ���M��  �� B  @ �H c F�� � C H� b����F�E��M � ����  HC �� �  �B ��  �B���F� # �       require    luci.model.uci    cursor    server 	���   method    POST    path    /common/v1/updateAlias    params    get_device_basicinfo 	   deviceId        model 	   devModel    hwVer 	   devHwVer    fwVer    deviceType    alias 	      cloud_https_getinfo_dispatch 	       get    cloud_config    info    error_code    set    commit                       8   >   H   @  @ ��@  �  �   ��@��@A��   �� ��   ���   �A@�YA    �HA A� �A@��YA    �HA A� �A@A�YA    �HA A� �A@��YA    �HA A� �AA  @�A@�A� �HA �  ��D��  [ �����M�D  �� �A  @ �B  #  �# # �       server 	���   method    POST    path    /common/v2/removeDeviceUser    params    get_device_basicinfo 	   deviceId        model 	   devModel    hwVer 	   devHwVer    fwVer    deviceType    accountManagerToken 	      cloud_https_getinfo_dispatch 	       error_code                     ;  �   �   A   �@  b� @�� b�� ��  @  @ ��  �  �   Ā���   � ��
   �B"�� @A���B�A    �� D���@A���C�A    �� D���@A��D�A    �� D���@A��AD�A    �� D���@A�DC�E  �A���BD���D��� �  �A� [���� ���M��  �� B  @ �H c @�EM��@ �@�Ec @FYB  @ �H c @F@B�M��� �@F@B� �@�F�� ��  HC b����� � H �� ����� �� M �����  � M �@
��� H� � �C D �B Ƃ� H� �B��� �����
 � �  ���� HC	 ��	 ��	 
 �B Ƃ� HC	 �B����B�
 H�
 C�B �� ������
 � �  � ����B� �B E  �F�BFD�����E����# � -      require    luci.model.uci    cursor    server 	���   method    POST    path    /common/v2/getUserRole    params    get_device_basicinfo 	   deviceId        model 	   devModel    hwVer 	   devHwVer    fwVer    deviceType    accountManagerToken 	      cloud_https_getinfo_dispatch 	       error_code    result    role    get    cloud_config    device_status    bind_status    need_unbind 	   tonumber    set    1    commit    fs    access 	   homecare    tm_homecare    enable    on 
   fork_exec 	    forceOn !   /etc/init.d/aviraserviceselector :   /usr/sbin/report_upload_bind;/usr/sbin/aviraservice start                             