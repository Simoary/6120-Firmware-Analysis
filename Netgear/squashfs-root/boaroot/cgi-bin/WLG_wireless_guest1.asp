<%
	if request_Form("wlanGuestFlag") = "1" then
	   tcWebApi_set("WebCurSet_Entry","wlan_id","hidden_wlan_id")
	   tcWebApi_set("WebCurSet_Entry","wlan_id_tmp","hidden_wlan_id")
	   tcWebApi_set("WLan_Entry","EnableSSID","hidden_enable_guestNet")
	   tcWebApi_set("WLan_Entry","HideSSID","hidden_enable_ssidbro")
	   tcWebApi_set("WLan_Entry","GuestAllowLocal","hidden_allow_guest")
	   tcWebApi_set("WLan_Entry","NoForwarding","wlg_guest_endis_wireless_isolation")
	   tcWebApi_set("WLan_Entry","SSID","s_gssid")
	   if request_Form("hidden_sec_type") = "0" then
		  tcWebApi_set("WLan_Entry","AuthMode","wl_hidden_auth_type")
	   elseif request_Form("hidden_sec_type") = "1" then
		  
		  if request_Form("wepenc") = "5" then
			 tcWebApi_set("WLan_Entry","AuthMode","wl_hidden_wep_64_auth_typ")
		  elseif request_Form("wepenc") = "13" then
			 tcWebApi_set("WLan_Entry","AuthMode","wl_hidden_wep_128_auth_typ")
		  end if
		  if request_Form("authAlgm") = "1" then
			 tcWebApi_set("WLan_Entry","WEPAuthType","wl_hidden_wep_auth_type_shared")
		  else
			 tcWebApi_set("WLan_Entry","WEPAuthType","wl_hidden_wep_auth_type_auto")
		  end if
		  tcWebApi_set("WLan_Entry","DefaultKeyID","wl_hidden_wep_key_select")
		  tcWebApi_set("WLan_Entry","Key1Str","KEY1")
		  tcWebApi_set("WLan_Entry","Key2Str","KEY2")
		  tcWebApi_set("WLan_Entry","Key3Str","KEY3")
		  tcWebApi_set("WLan_Entry","Key4Str","KEY4")
	   elseif request_Form("hidden_sec_type") = "2" then
		  tcWebApi_set("WLan_Entry","AuthMode","wl_hidden_wpapsk_auth_type_tkip")
		  tcWebApi_set("WLan_Entry","EncrypType","wl_hidden_auth_type_tkip")
		  tcWebApi_set("WLan_Entry","WPAPSK","hidden_wpa_psk")
	   elseif request_Form("hidden_sec_type") = "3" then
		  tcWebApi_set("WLan_Entry","AuthMode","wl_hidden_wpa2psk_auth_type_aes")
		  tcWebApi_set("WLan_Entry","EncrypType","wl_hidden_auth_type_aes")
		  tcWebApi_set("WLan_Entry","WPAPSK","hidden_wpa_psk")
	   elseif request_Form("hidden_sec_type") = "4" then
		  tcWebApi_set("WLan_Entry","AuthMode","wl_hidden_wpawpa2psk_auth_type_tkipaes")
		  tcWebApi_set("WLan_Entry","EncrypType","wl_hidden_auth_type_tkipaes")
		  tcWebApi_set("WLan_Entry","WPAPSK","hidden_wpa_psk")
	   elseif request_Form("hidden_sec_type") = "5" then
		  if request_Form("wl_hidden_wlan_mode") = "1" then
			 tcWebApi_set("WLan_Entry","AuthMode","wl_hidden_wpa_auth_type_tkip")
			 tcWebApi_set("WLan_Entry","EncrypType","wl_hidden_auth_type_tkip")
			 tcWebApi_set("WLan_Entry","RADIUS_Server","radiusServerIP")
			 tcWebApi_set("WLan_Entry","RADIUS_Port","textWpaeRadiusPort")
			 tcWebApi_set("WLan_Entry","RADIUS_Key","textWpaeRadiusSecret")
		  elseif request_Form("wl_hidden_wlan_mode") = "3" then
			 tcWebApi_set("WLan_Entry","AuthMode","wl_hidden_wpawpa2_auth_type_tkipaes")
			 tcWebApi_set("WLan_Entry","EncrypType","wl_hidden_auth_type_tkipaes")
			 tcWebApi_set("WLan_Entry","RADIUS_Server","radiusServerIP")
			 tcWebApi_set("WLan_Entry","RADIUS_Port","textWpaeRadiusPort")
			 tcWebApi_set("WLan_Entry","RADIUS_Key","textWpaeRadiusSecret")
		  else
			 tcWebApi_set("WLan_Entry","AuthMode","wl_hidden_wpa2_auth_type_aes")
			 tcWebApi_set("WLan_Entry","EncrypType","wl_hidden_auth_type_aes")
			 tcWebApi_set("WLan_Entry","RADIUS_Server","radiusServerIP")
			 tcWebApi_set("WLan_Entry","RADIUS_Port","textWpaeRadiusPort")
			 tcWebApi_set("WLan_Entry","RADIUS_Key","textWpaeRadiusSecret")
		  end if	  	   
	   end if
	   tcWebApi_commit("WebCurSet_Entry")
	   tcWebApi_commit("WLan_Entry")
	end if
	
	if request_Form("wlanGuest5GFlag") = "1" then
	   tcWebApi_set("WebCurSet_Entry","wlan_ac_id","hidden_wlan_ac_id")
	   tcWebApi_set("WebCurSet_Entry","wlan_ac_id_tmp","hidden_wlan_ac_id")
	   tcWebApi_set("WLan11ac_Entry","EnableSSID","hidden_enable_guestNet_an")
	   tcWebApi_set("WLan11ac_Entry","HideSSID","hidden_enable_ssidbro_an")
	   tcWebApi_set("WLan11ac_Entry","GuestAllowLocal","hidden_allow_guest_an")
	   tcWebApi_set("WLan11ac_Entry","NoForwarding","wla_guest_endis_wireless_isolation")
	   tcWebApi_set("WLan11ac_Entry","SSID","s_gssid_an")
	   if request_Form("hidden_sec_type_an") = "0" then
		  tcWebApi_set("WLan11ac_Entry","AuthMode","wla_hidden_auth_type")
	   elseif request_Form("hidden_sec_type_an") = "1" then
		  
		  if request_Form("wepenc_an") = "5" then
			 tcWebApi_set("WLan11ac_Entry","AuthMode","wla_hidden_wep_64_auth_typ")
		  elseif request_Form("wepenc_an") = "13" then
			 tcWebApi_set("WLan11ac_Entry","AuthMode","wla_hidden_wep_128_auth_typ")
		  end if
		  if request_Form("authAlgm_an") = "1" then
			 tcWebApi_set("WLan11ac_Entry","WEPAuthType","wla_hidden_wep_auth_type_shared")
		  else
			 tcWebApi_set("WLan11ac_Entry","WEPAuthType","wla_hidden_wep_auth_type_auto")
		  end if
		  tcWebApi_set("WLan11ac_Entry","Key1Str","KEY1")
		  tcWebApi_set("WLan11ac_Entry","Key2Str","KEY2")
		  tcWebApi_set("WLan11ac_Entry","Key3Str","KEY3")
		  tcWebApi_set("WLan11ac_Entry","Key4Str","KEY4")
	   elseif request_Form("hidden_sec_type_an") = "2" then
		  tcWebApi_set("WLan11ac_Entry","AuthMode","wla_hidden_wpapsk_auth_type_tkip")
		  tcWebApi_set("WLan11ac_Entry","EncrypType","wla_hidden_auth_type_tkip")
		  tcWebApi_set("WLan11ac_Entry","WPAPSK","hidden_wpa_psk_an")
	   elseif request_Form("hidden_sec_type_an") = "3" then
		  tcWebApi_set("WLan11ac_Entry","AuthMode","wla_hidden_wpa2psk_auth_type_aes")
		  tcWebApi_set("WLan11ac_Entry","EncrypType","wla_hidden_auth_type_aes")
		  tcWebApi_set("WLan11ac_Entry","WPAPSK","hidden_wpa_psk_an")
	   elseif request_Form("hidden_sec_type_an") = "4" then
		  tcWebApi_set("WLan11ac_Entry","AuthMode","wla_hidden_wpawpa2psk_auth_type_tkipaes")
		  tcWebApi_set("WLan11ac_Entry","EncrypType","wla_hidden_auth_type_tkipaes")
		  tcWebApi_set("WLan11ac_Entry","WPAPSK","hidden_wpa_psk_an")
	   elseif request_Form("hidden_sec_type_an") = "5" then
		  if request_Form("wl_hidden_wlan_mode") = "1" then
			 tcWebApi_set("WLan11ac_Entry","AuthMode","wla_hidden_wpa_auth_type_tkip")
			 tcWebApi_set("WLan11ac_Entry","EncrypType","wla_hidden_auth_type_tkip")
			 tcWebApi_set("WLan11ac_Entry","RADIUS_Server","radiusServerIP")
			 tcWebApi_set("WLan11ac_Entry","RADIUS_Port","textWpaeRadiusPort")
			 tcWebApi_set("WLan11ac_Entry","RADIUS_Key","textWpaeRadiusSecret")
		  elseif request_Form("wl_hidden_wlan_mode") = "3" then
			 tcWebApi_set("WLan11ac_Entry","AuthMode","wla_hidden_wpawpa2_auth_type_tkipaes")
			 tcWebApi_set("WLan11ac_Entry","EncrypType","wla_hidden_auth_type_tkipaes")
			 tcWebApi_set("WLan11ac_Entry","RADIUS_Server","radiusServerIP")
			 tcWebApi_set("WLan11ac_Entry","RADIUS_Port","textWpaeRadiusPort")
			 tcWebApi_set("WLan11ac_Entry","RADIUS_Key","textWpaeRadiusSecret")
		  else
			 tcWebApi_set("WLan11ac_Entry","AuthMode","wla_hidden_wpa2_auth_type_aes")
			 tcWebApi_set("WLan11ac_Entry","EncrypType","wla_hidden_auth_type_aes")
			 tcWebApi_set("WLan11ac_Entry","RADIUS_Server","radiusServerIP")
			 tcWebApi_set("WLan11ac_Entry","RADIUS_Port","textWpaeRadiusPort")
			 tcWebApi_set("WLan11ac_Entry","RADIUS_Key","textWpaeRadiusSecret")
		  end if	  	   
	   end if
	   tcWebApi_commit("WebCurSet_Entry")
	   tcWebApi_commit("WLan11ac_Entry")
	end if
%>
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/wlan.js"></script>
<script language=javascript type=text/javascript src="/advanced.js"></script>
<script language=javascript type=text/javascript src="/basic.js"></script>
<title><%tcWebApi_multilingual("1","glbstr_title")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/WLG_wireless_guest1.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="wlan_g1_a1">

<div class="page_title" id="title"><script>
//if(parent.an_router_flag == 1)
        //document.write('Guest Network Settings b/g/n');
//else
        document.write("<%tcWebApi_multilingual("1","guest_network_setting_str")%>");
</script></div>
<div class="fix_button" id="check_button">
<TABLE cellspacing=2 cellPadding=0 width=100% border=0>
<TR>
        <TD nowrap colspan=2 align=center>
	<input class="cancel_bt" type='button' name='Cancel' id='cancel' value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick='location.href="WLG_wireless_guest1.asp";'>&nbsp;&nbsp;
        <input class="apply_bt" type='submit' name='Apply' id='apply' value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onclick='return check_wlan_guest("bgn")'>
        </TD>
</TR>
</TABLE>
</div>
<div id="main" class="main_top_button"> 
<TABLE width=100%% border=0 cellpadding=0 cellspacing=3>
<TR><TD colSpan=2></TD></TR>
<script>
var tmp_guestID = "<%if tcWebApi_get("WebCurSet_Entry","wlan_id_tmp","h") <> "N/A" then tcWebApi_get("WebCurSet_Entry","wlan_id_tmp","s") end if%>";
var tmp_guest5gID = "<%if tcWebApi_get("WebCurSet_Entry","wlan_ac_id_tmp","h") <> "N/A" then tcWebApi_get("WebCurSet_Entry","wlan_ac_id_tmp","s") end if%>";
var wps_in_process_str="<%tcWebApi_multilingual("1","wps_in_process_str")%>";
var ssid_blank_str="<%tcWebApi_multilingual("1","ssid_blank_str")%>";
var ssid_duplicate_str="<%tcWebApi_multilingual("1","ssid_duplicate_str")%>";
var ssid_character_str="<%tcWebApi_multilingual("1","ssid_character_str")%>";
var ssid_wep_support_str="<%tcWebApi_multilingual("1","ssid_wep_support_str")%>";
var invalid_ipaddr_str="<%tcWebApi_multilingual("1","invalid_ipaddr_str")%>";
var ipaddr_conflict_str="<%tcWebApi_multilingual("1","ipaddr_conflict_str")%>";
var radius_server_port_str="<%tcWebApi_multilingual("1","radius_server_port_str")%>";
var invalid_password_str="<%tcWebApi_multilingual("1","invalid_password_str")%>";
var radius_server_character_str="<%tcWebApi_multilingual("1","radius_server_character_str")%>";
var insufficient_password_length_str = "<%tcWebApi_multilingual("1","insufficient_password_length_str")%>";
var only_54mbps_rate_str = "<%tcWebApi_multilingual("1","only_54mbps_rate_str")%>";

var wps_progress_status="";
<%If tcWebApi_get("WLan_Common","APOn","h") = "1" then%>
   wps_progress_status="<%if tcWebApi_get("Info_WLan","wlanWPSStatus ","h") <> "" then tcWebApi_get("Info_WLan","wlanWPSStatus","s") end if%>";
   <%if request_Form("wlanGuestFlag") = "1" then%>
      if(wps_progress_status == "In progress")
         alert(wps_in_process_str);
   <%end if%>
<%else%>
   wps_progress_status="<%if tcWebApi_get("Info_WLan11ac","wlanWPSStatus ","h") <> "" then tcWebApi_get("Info_WLan11ac","wlanWPSStatus","s") end if%>";
   <%if request_Form("wlanGuest5GFlag") = "1" then%>
      if(wps_progress_status == "In progress")
         alert(wps_in_process_str);
   <%end if%>
<%end if%>

var wl_key1 = "";
var wl_key2 = "";
var wl_key3 = "";
var wl_key4 = "";

var wep_64_key1 = "";
var wep_64_key2 = "";
var wep_64_key3 = "";
var wep_64_key4 = "";

var wep_128_key1 = "";
var wep_128_key2 = "";
var wep_128_key3 = "";
var wep_128_key4 = "";

var wl_simple_mode_an="3";
var wl_key1_an = "";
var wl_key2_an = "";
var wl_key3_an = "";
var wl_key4_an = "";

var wep_64_key1_an = "";
var wep_64_key2_an = "";
var wep_64_key3_an = "";
var wep_64_key4_an = "";

var wep_128_key1_an = "";
var wep_128_key2_an = "";
var wep_128_key3_an = "";
var wep_128_key4_an = "";

var lanIP = "192.168.1.1";
var lanSubnet = "255.255.255.0";
var wanIP = "172.17.144.126";
var wanSubnet = "255.255.254.0";
var guest_router_flag=parent.guest_router_flag;
var wire_iso_flag=parent.wire_iso_flag;
var old_wla_endis_wireless_isolation='0';
var str_have_an="";

var str_none="";
var str_wep="";
var str_wpa="";
var str_wpa2="";
var str_wpas="";
var str_wpae="";
var str_none_an="";
var str_wep_an="";
var str_wpa_an="";
var str_wpa2_an="";
var str_wpas_an="";
var str_wpae_an="";
var wds_endis_fun="0";
var old_sectype="1";
var old_sectype_an="1";

var get_wpae_mode="WPAE-TKIPAES";
var get_radiusSerIp="";
var get_radiusPort="1812";
var get_endis_guestNet="0";
var get_bssid_number = "1";
var get_endis_guestSSIDbro="1";
var get_endis_allow_guest="0";
var old_endis_wireless_isolation='0';
//bug 23999:combine b/g/n and a/n page 
var get_wpae_mode_an="WPAE-TKIPAES";
var get_radiusSerIp_an="";
var get_radiusPort_an="1812";
var get_endis_guestNet_an="0";
var get_endis_guestSSIDbro_an="1";
var get_enable_video_value_an="0";
var get_endis_allow_guest_an="0";
var old_endis_wireless_isolation_an='0';

var StartChannel = new Array(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,1); 
var FinishChannel = new Array(11,13,13,13,11,13,13,13,13,11,13,13,11); 

var wl_simple_mode="2";
</script>
<input type="hidden" name="old_length">
<input type="hidden" name="generate_flag">
<input type="hidden" name="sec_wpaphrase_len">
<input type="hidden" name="hidden_wpa_psk">
<input type="hidden" name="hidden_sec_type">
<input type="hidden" name="wep_press_flag">
<input type="hidden" name="wpa1_press_flag" value=0>
<input type="hidden" name="wpa2_press_flag" value=0>
<input type="hidden" name="wpas_press_flag" value=0>

<input type="hidden" name="old_length_an">
<input type="hidden" name="generate_flag_an">
<input type="hidden" name="sec_wpaphrase_len_an">
<input type="hidden" name="hidden_wpa_psk_an">
<input type="hidden" name="hidden_sec_type_an">
<input type="hidden" name="wep_press_flag_an">
<input type="hidden" name="wpa1_press_flag_an" value=0>
<input type="hidden" name="wpa2_press_flag_an" value=0>
<input type="hidden" name="wpas_press_flag_an" value=0>

<input type="hidden" name="wps_change_flag" value="5">

<input type="hidden" name="hidden_wlan_id" value="0">
<input type="hidden" name="hidden_wlan_ac_id" value="0">
<input type="hidden" name="wlanGuestFlag" value="0">
<input type="hidden" name="wlanGuest5GFlag" value="0">
<input type="hidden" name="hidden_enable_guestNet">
<input type="hidden" name="hidden_enable_ssidbro">
<input type="hidden" name="hidden_allow_guest">
<input type="hidden" name="radiusServerIP">
<input type="hidden" name="s_gssid">
<input type="hidden" name="hidden_WpaeRadiusSecret">
<input type="hidden" name="wlg_guest_endis_wireless_isolation">
<input type="hidden" name="hidden_guest_network_mode_flag">
<input type="hidden" name="wl_hidden_wlan_mode" value="">

<input type="hidden" name="hidden_enable_guestNet_an">
<input type="hidden" name="hidden_enable_ssidbro_an">
<input type="hidden" name="hidden_enable_video_an">
<input type="hidden" name="hidden_allow_guest_an">
<input type="hidden" name="radiusServerIP_a">
<input type="hidden" name="s_gssid_an">
<input type="hidden" name="hidden_WpaeRadiusSecret_a">
<input type="hidden" name="wla_guest_endis_wireless_isolation">
<input type="hidden" name="hidden_guest_network_mode_flag_an">
<input type="hidden" name="wl_hidden_wlan_mode_an" value="">
<input type="hidden" name="wl_hidden_wps_disable" value="0">
<input type="hidden" name="wl_hidden_wps_enable" value="7">
<input type="hidden" name="wl_hidden_auth_type" value="OPEN">
<input type="hidden" name="wl_hidden_wep_64_auth_typ" value="WEP-64Bits">
<input type="hidden" name="wl_hidden_wep_128_auth_typ" value="WEP-128Bits">
<input type="hidden" name="wl_hidden_wpapsk_auth_type_tkip" value="WPAPSK">
<input type="hidden" name="wl_hidden_wpa2psk_auth_type_aes" value="WPA2PSK">
<input type="hidden" name="wl_hidden_wpawpa2psk_auth_type_tkipaes" value="WPAPSKWPA2PSK">
<input type="hidden" name="wl_hidden_wpa_auth_type_tkip" value="WPA">
<input type="hidden" name="wl_hidden_wpa2_auth_type_aes" value="WPA2">
<input type="hidden" name="wl_hidden_wpawpa2_auth_type_tkipaes" value="WPA1WPA2">
<input type="hidden" name="wl_hidden_wep_auth_type_shared" value="SharedKey">
<input type="hidden" name="wl_hidden_wep_auth_type_auto" value="WEPAuto">
<input type="hidden" name="wl_hidden_wep_key_select" >
<input type="hidden" name="wl_hidden_auth_type_aes" value="AES">
<input type="hidden" name="wl_hidden_auth_type_tkip" value="TKIP">
<input type="hidden" name="wl_hidden_auth_type_tkipaes" value="TKIPAES">

<input type="hidden" name="wla_hidden_auth_type" value="OPEN">
<input type="hidden" name="wla_hidden_wep_64_auth_typ" value="WEP-64Bits">
<input type="hidden" name="wla_hidden_wep_128_auth_typ" value="WEP-128Bits">
<input type="hidden" name="wla_hidden_wpapsk_auth_type_tkip" value="WPAPSK">
<input type="hidden" name="wla_hidden_wpa2psk_auth_type_aes" value="WPA2PSK">
<input type="hidden" name="wla_hidden_wpawpa2psk_auth_type_tkipaes" value="WPAPSKWPA2PSK">
<input type="hidden" name="wla_hidden_wpa_auth_type_tkip" value="WPA">
<input type="hidden" name="wla_hidden_wpa2_auth_type_aes" value="WPA2">
<input type="hidden" name="wla_hidden_wpawpa2_auth_type_tkipaes" value="WPA1WPA2">
<input type="hidden" name="wla_hidden_wep_auth_type_shared" value="SharedKey">
<input type="hidden" name="wla_hidden_wep_auth_type_auto" value="WEPAuto">
<input type="hidden" name="wla_hidden_auth_type_aes" value="AES">
<input type="hidden" name="wla_hidden_auth_type_tkip" value="TKIP">
<input type="hidden" name="wla_hidden_auth_type_tkipaes" value="TKIPAES">

<TR>
	<TD nowrap colspan=2><B><%tcWebApi_multilingual("1","network_profiles_str")%></B></TD>
</TR>
</TABLE>

<TABLE width=100% border=1 cellpadding=0 name=ssid_table id=ssid_table>
<TR>
	<TD class=subhead>&nbsp;&nbsp;</TD>
	<TD class=subhead align=center><%tcWebApi_multilingual("1","profile_str")%></TD>
	<TD class=subhead align=center><%tcWebApi_multilingual("1","ssid_str")%></TD>
	<TD class=subhead align=center><%tcWebApi_multilingual("1","security_str")%></TD>
	<TD class=subhead align=center><%tcWebApi_multilingual("1","enable_str")%></TD>
	<TD class=subhead align=center><%tcWebApi_multilingual("1","ssid_broadcast_str")%></TD>
</TR>
<TR>
	<TD align=center><input type=radio name=ssidSelect id=ssid_select value=1 onclick=Check_Profile()></TD>
	<TD align=center>1</TD>
	<TD align=center>
	<script>
	var show_ssid_1="<%if tcWebApi_get("WLan_Entry1","SSID","h") <> "N/A" then tcWebApi_get("WLan_Entry1","SSID","s") end if%>";
	//show_ssid=old_ssid.replace(/>/g, '&gt;').replace(/</g, '&lt;').replace(/ /g,"&nbsp;");
	document.write(show_ssid_1);	
	</script>
	</TD>
	<TD align=center>
    <script>
	var security_mode = "<%if tcWebApi_get("WLan_Entry1","AuthMode","h") <> "N/A" then tcWebApi_get("WLan_Entry1","AuthMode","s") end if%>";
	if(security_mode == "OPEN")
	   document.write("<%tcWebApi_multilingual("1","none_str")%>");
	 else if(security_mode == "WEP-64Bits")
	   document.write("<%tcWebApi_multilingual("1","wep_str")%>");
	 else if(security_mode == "WEP-128Bits")
	   document.write("<%tcWebApi_multilingual("1","wep_str")%>");
	 else if(security_mode == "WPAPSK")
	   document.write("<%tcWebApi_multilingual("1","wpa_psk_str")%>");
	 else if(security_mode == "WPA2PSK")
	   document.write("<%tcWebApi_multilingual("1","wpa2_psk_str")%>");
	 else if(security_mode == "WPAPSKWPA2PSK")
	   document.write("<%tcWebApi_multilingual("1","wpa_wpa2_psk_str")%>");
	 else if(security_mode == "WPA")
	   document.write("WPA [TKIP]");
	 else if(security_mode == "WPA2")
	   document.write("WPA2 [AES]");
	 else if(security_mode == "WPA1WPA2")
	   document.write("WPA [TKIP] + WPA2 [AES]");
	</script>
	</TD>
	<TD align=center>
	<script>
	var ssid_enable = "<%if tcWebApi_get("WLan_Entry1","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan_Entry1","EnableSSID","s") end if%>";
	if(ssid_enable == 1)
	   document.write("<%tcWebApi_multilingual("0","glbstr_yes")%>");
	else
	   document.write("<%tcWebApi_multilingual("0","glbstr_no")%>");
	</script>
	</TD>
	<TD align=center>
	<script>
	var ssid_broadcast = "<%if tcWebApi_get("WLan_Entry1","HideSSID","h") <> "N/A" then tcWebApi_get("WLan_Entry1","HideSSID","s") end if%>";
    var get_endis_allow_guest = "<%if tcWebApi_get("WLan_Entry1","GuestAllowLocal","h") <> "N/A" then tcWebApi_get("WLan_Entry1","GuestAllowLocal","s") end if%>";
	if(ssid_broadcast == 0)
	    document.write("<%tcWebApi_multilingual("0","glbstr_yes")%>");
    else
	    document.write("<%tcWebApi_multilingual("0","glbstr_no")%>"); 
	</script>
	</TD>
</TR>

<TR>
	<TD align=center><input type=radio name=ssidSelect id=ssid_select value=2 onclick=Check_Profile()></TD>
	<TD align=center>2</TD>
	<TD align=center>
	<script>
	var show_ssid_2="<%if tcWebApi_get("WLan_Entry2","SSID","h") <> "N/A" then tcWebApi_get("WLan_Entry2","SSID","s") end if%>";
	document.write(show_ssid_2);	
	</script>
	</TD>
	<TD align=center>
	<script>
	var security_mode = "<%if tcWebApi_get("WLan_Entry2","AuthMode","h") <> "N/A" then tcWebApi_get("WLan_Entry2","AuthMode","s") end if%>";
	if(security_mode == "OPEN")
	   document.write("<%tcWebApi_multilingual("1","none_str")%>");
    else if(security_mode == "WEP-64Bits")
	   document.write("<%tcWebApi_multilingual("1","wep_str")%>");
	else if(security_mode == "WEP-128Bits")
	   document.write("<%tcWebApi_multilingual("1","wep_str")%>");
	else if(security_mode == "WPAPSK")
	   document.write("<%tcWebApi_multilingual("1","wpa_psk_str")%>");
	else if(security_mode == "WPA2PSK")
	   document.write("<%tcWebApi_multilingual("1","wpa2_psk_str")%>");
	else if(security_mode == "WPAPSKWPA2PSK")
	   document.write("<%tcWebApi_multilingual("1","wpa_wpa2_psk_str")%>");
	else if(security_mode == "WPA")
	   document.write("WPA [TKIP]");
	else if(security_mode == "WPA2")
	   document.write("WPA2 [AES]");
	else if(security_mode == "WPA1WPA2")
	   document.write("WPA [TKIP] + WPA2 [AES]");
	</script>
	</TD>
	<TD align=center>
    <script>
	var ssid_enable = "<%if tcWebApi_get("WLan_Entry2","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan_Entry2","EnableSSID","s") end if%>";
	if(ssid_enable == 1)
	   document.write("<%tcWebApi_multilingual("0","glbstr_yes")%>");
	else
	   document.write("<%tcWebApi_multilingual("0","glbstr_no")%>");
	</script>
	</TD>
	<TD align=center>
    <script>
	var ssid_broadcast = "<%if tcWebApi_get("WLan_Entry2","HideSSID","h") <> "N/A" then tcWebApi_get("WLan_Entry2","HideSSID","s") end if%>";
    var get_endis_allow_guest = "<%if tcWebApi_get("WLan_Entry2","GuestAllowLocal","h") <> "N/A" then tcWebApi_get("WLan_Entry2","GuestAllowLocal","s") end if%>";
	if(ssid_broadcast == 0)
	    document.write("<%tcWebApi_multilingual("0","glbstr_yes")%>");
    else
	    document.write("<%tcWebApi_multilingual("0","glbstr_no")%>"); 
	</script>
	</TD>
</TR>

<TR>
	<TD align=center><input type=radio name=ssidSelect id=ssid_select value=3 onclick=Check_Profile()></TD>
	<TD align=center>3</TD>
	<TD align=center>
	<script>
	var show_ssid_3="<%if tcWebApi_get("WLan_Entry3","SSID","h") <> "N/A" then tcWebApi_get("WLan_Entry3","SSID","s") end if%>";
	document.write(show_ssid_3);	
	</script>
	</TD>
	<TD align=center>
	<script>
	var security_mode = "<%if tcWebApi_get("WLan_Entry3","AuthMode","h") <> "N/A" then tcWebApi_get("WLan_Entry3","AuthMode","s") end if%>";
	if(security_mode == "OPEN")
	   document.write("<%tcWebApi_multilingual("1","none_str")%>");
    else if(security_mode == "WEP-64Bits")
	   document.write("<%tcWebApi_multilingual("1","wep_str")%>");
	else if(security_mode == "WEP-128Bits")
	   document.write("<%tcWebApi_multilingual("1","wep_str")%>");
	else if(security_mode == "WPAPSK")
	   document.write("<%tcWebApi_multilingual("1","wpa_psk_str")%>");
	else if(security_mode == "WPA2PSK")
	   document.write("<%tcWebApi_multilingual("1","wpa2_psk_str")%>");
	else if(security_mode == "WPAPSKWPA2PSK")
	   document.write("<%tcWebApi_multilingual("1","wpa_wpa2_psk_str")%>");
	else if(security_mode == "WPA")
	   document.write("WPA [TKIP]");
	else if(security_mode == "WPA2")
	   document.write("WPA2 [AES]");
	else if(security_mode == "WPA1WPA2")
	   document.write("WPA [TKIP] + WPA2 [AES]");
	</script>
	</TD>
	<TD align=center>
	<script>
	var ssid_enable = "<%if tcWebApi_get("WLan_Entry3","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan_Entry3","EnableSSID","s") end if%>";
	if(ssid_enable == 1)
	   document.write("<%tcWebApi_multilingual("0","glbstr_yes")%>");
	else
	   document.write("<%tcWebApi_multilingual("0","glbstr_no")%>");
	</script>
	</TD>
	<TD align=center>
    <script>
	var ssid_broadcast = "<%if tcWebApi_get("WLan_Entry3","HideSSID","h") <> "N/A" then tcWebApi_get("WLan_Entry3","HideSSID","s") end if%>";
    var get_endis_allow_guest = "<%if tcWebApi_get("WLan_Entry3","GuestAllowLocal","h") <> "N/A" then tcWebApi_get("WLan_Entry3","GuestAllowLocal","s") end if%>";
	if(ssid_broadcast == 0)
	    document.write("<%tcWebApi_multilingual("0","glbstr_yes")%>");
    else
	    document.write("<%tcWebApi_multilingual("0","glbstr_no")%>"); 
	</script>
	</TD>
</TR>

</TABLE> 
<TR><TD>&nbsp;&nbsp;</TD></TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_bgn','wireless')"><B><%tcWebApi_multilingual("1","wireless_profile_str")%> - <%tcWebApi_multilingual("1","profile_str")%> <span id="pro_count">1</span><script> if( parent.an_router_flag == 1) document.write("(2.4GHz b/g/n)")</script></B></A>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2><input type=checkbox name="enable_bssid" id="enable_bssid" value='1'>
	<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_bgn','enable_guest')"><%tcWebApi_multilingual("1","guest_network_enable_str")%></A>
	</TD>
</TR>
<TR>	
	<TD nowrap colspan=2><input type=checkbox name="enable_ssid_bc" id="enable_ssid_bc" value='1'>
	<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_bgn','enable_ssid')"><%tcWebApi_multilingual("1","ssid_broadcast_enable_str")%></A>
	</TD>
</TR>
<TR>	
	<TD nowrap colspan=2><input type=checkbox name="allow_access" id="allow_access" value='1'>
	<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_bgn','allow_guest')"><%tcWebApi_multilingual("1","allow_guest_access_local_network_str")%></A>
	</TD>
</TR>
<TR id=guestiso>
	<TD nowrap>
	<input type="checkbox" name="enable_isolate" id="enable_isolate" value="1">
	<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_bgn','wl_guest_iso')"><%tcWebApi_multilingual("1","wireless_isolation_enable_str")%>
	</TD>
</TR>
<TR>	
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_bgn','guest_ssid')"><%tcWebApi_multilingual("1","guest_wireless_network_name_str")%> :</A>
	</TD>
	<TD nowrap colspan=2><input type="text" name="ssid" id="ssid" size="20" maxlength="32"></TD>
</TR>
<tr style="display:none">
	<td><input type="text" name="wlssid" value="<%if tcWebApi_get("WLan_Entry0","SSID","h") <> "" then tcWebApi_get("WLan_Entry0","SSID","s") end if%>" size="20" maxlength="32"></td>
	<td><input type="text" name="wlssid_1" value="<%if tcWebApi_get("WLan_Entry1","SSID","h") <> "" then tcWebApi_get("WLan_Entry1","SSID","s") end if%>" size="20" maxlength="32"></td>
    <td><input type="text" name="wlssid_2" value="<%if tcWebApi_get("WLan_Entry2","SSID","h") <> "" then tcWebApi_get("WLan_Entry2","SSID","s") end if%>" size="20" maxlength="32"></td>
    <td><input type="text" name="wlssid_3" value="<%if tcWebApi_get("WLan_Entry3","SSID","h") <> "" then tcWebApi_get("WLan_Entry3","SSID","s") end if%>" size="20" maxlength="32"></td>
	<td><input type="text" name="wlassid" value="<%if tcWebApi_get("WLan11ac_Entry0","SSID","h") <> "" then tcWebApi_get("WLan11ac_Entry0","SSID","s") end if%>" size="20" maxlength="32"></td>
	<td><input type="text" name="wlassid_1" value="<%if tcWebApi_get("WLan11ac_Entry1","SSID","h") <> "" then tcWebApi_get("WLan11ac_Entry1","SSID","s") end if%>" size="20" maxlength="32"></td>
    <td><input type="text" name="wlassid_2" value="<%if tcWebApi_get("WLan11ac_Entry2","SSID","h") <> "" then tcWebApi_get("WLan11ac_Entry2","SSID","s") end if%>" size="20" maxlength="32"></td>
    <td><input type="text" name="wlassid_3" value="<%if tcWebApi_get("WLan11ac_Entry3","SSID","h") <> "" then tcWebApi_get("WLan11ac_Entry3","SSID","s") end if%>" size="20" maxlength="32"></td>
</tr>
</TABLE>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
	<TD nowrap colspan=2><A tabindex=-1 href="javascript:loadhelp('_wlan_guest_bgn','security')"><B><%tcWebApi_multilingual("1","security_options_str")%></B></A></TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="security_type" id="security_type" value="Disable" onClick=setSecurity(1)><%tcWebApi_multilingual("1","none_str")%>
	<TD>
</TR>
<TR id="wep_54">
	<TD nowrap colspan=2>
	<input type="radio" name="security_type" id="security_type" value="WEP" onClick=setSecurity(2)><%tcWebApi_multilingual("1","wep_str")%>
	</TD>
</TR>
<TR id="wpa_psk_54">
	<TD nowrap colspan=2>
	<input type="radio" name="security_type" id="security_type" value="WPA-PSK" onClick=setSecurity(3)><%tcWebApi_multilingual("1","wpa_psk_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="security_type" id="security_type" value="WPA2-PSK" onClick=setSecurity(4)><%tcWebApi_multilingual("1","wpa2_psk_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="security_type" id="security_type" value="AUTO-PSK" onClick=setSecurity(5)><%tcWebApi_multilingual("1","wpa_wpa2_psk_str")%>
	</TD>
</TR>
<TR id="wpa_enterprise">
	<TD nowrap colspan=2>
	<input type="radio" name="security_type" id="security_type" value="WPA-Enterprise" onClick=setSecurity(6)><%tcWebApi_multilingual("1","wpa_wpa2_enterprise_str")%>
	</TD>
</TR>
</TABLE>

<div id=view></div>

<div align="center" ID="none" style="position:absolute;top:0;left:0;visibility:hidden">
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<TR>
		<TD nowrap colspan=2></TD>
	</TR>
	</TABLE>
</div>   

<div align="center" ID="wep" style="position:absolute;top:0;left:0;visibility:hidden">
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_bgn','wep')"><B><%tcWebApi_multilingual("1","security_encryption_wep_str")%></B></A>
		</TD>
	</TR>
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","authenication_type_str")%></TD>
		<TD nowrap>
			<select NAME="authAlgm" id="wep_auth_type" size="1">
				<option value=1  ><%tcWebApi_multilingual("1","share_key_str")%></option>
				<option value=2 SELECTED ><%tcWebApi_multilingual("1","automatic_str")%></option>
			</select>
		</TD>
	</TR>
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","encryption_strength_str")%></TD>
		<TD nowrap> 
			<select NAME="wepenc" id="wep_enc_strength" size="1" onChange="changekeylen(document.forms[0]);">
				<option value=5   ><%tcWebApi_multilingual("1","wep_64_bits_str")%></option>
				<option value=13  ><%tcWebApi_multilingual("1","wep_128_bits_str")%></option>
			</select>
		</TD>
	</TR>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_bgn','wepkey')"><B><%tcWebApi_multilingual("1","security_encryption_wep_key_str")%></B></A>
		</TD>
	</TR>
	<!--<TR>
		<TD nowrap colspan=2>&nbsp;<%tcWebApi_multilingual("1","passphrase_str")%> :&nbsp;
			<input type="text" size="16" maxlength="32" NAME="passphraseStr" id="wep_passphrase" VALUE="">&nbsp;&nbsp;
			<input class="short_common_bt" type="button" name="Generate" id="wep_generate" value="<%tcWebApi_multilingual("0","glbstr_generate")%>" OnClick="clickgenerate(document.forms[0])">
		</TD>
	</TR>-->
	<TR>
		<TD nowrap colspan=2>
		<TABLE>
		<TR>
			<TD nowrap><%tcWebApi_multilingual("1","key_1_str")%>
			<input type=radio NAME="wep_key_no" id="wep_key_no" checked value="1">
			</TD>
			<TD nowrap>
			<input TYPE="TEXT" SIZE="document.forms[0].wepenc.value*2+2" MAXLENGTH="32" NAME="KEY1" id="key1" VALUE="" OnFocus="this.maxLength=document.forms[0].wepenc.value*2;this.size=document.forms[0].wepenc.value*2+2;" onKeyPress="return getkey('wep', event)">
			</TD>
		</TR>
		<TR>
			<TD nowrap><%tcWebApi_multilingual("1","key_2_str")%>
			<input type=radio NAME="wep_key_no" id="wep_key_no" value="2">
			</TD>
			<TD nowrap>
			<input TYPE="TEXT" SIZE="document.forms[0].wepenc.value*2+2" MAXLENGTH="32" NAME="KEY2" id="key2" VALUE="" OnFocus="this.maxLength=document.forms[0].wepenc.value*2;this.size=document.forms[0].wepenc.value*2+2;" onKeyPress="return getkey('wep', event)">
			</TD>
		</TR>
		<TR>
			<TD nowrap><%tcWebApi_multilingual("1","key_3_str")%>
			<input type=radio NAME="wep_key_no" id="wep_key_no" value="3">
			</TD>
			<TD nowrap><input TYPE="TEXT" SIZE="document.forms[0].wepenc.value*2+2" MAXLENGTH="32" NAME="KEY3" id="key3" VALUE="" OnFocus="this.maxLength=document.forms[0].wepenc.value*2;this.size=document.forms[0].wepenc.value*2+2;" onKeyPress="return getkey('wep', event)">
			</TD>
		</TR>
		<TR>
			<TD nowrap><%tcWebApi_multilingual("1","key_4_str")%>
			<input type=radio NAME="wep_key_no" id="wep_key_no" value="4">
			</TD>
			<TD nowrap>
			<input TYPE="TEXT" SIZE="document.forms[0].wepenc.value*2+2" MAXLENGTH="32" NAME="KEY4" id="key4" VALUE=""  OnFocus="this.maxLength=document.forms[0].wepenc.value*2;this.size=document.forms[0].wepenc.value*2+2;" onKeyPress="return getkey('wep', event)">
			</TD>
		</TR>
		</TABLE>
		</TD>
	</TR>
	</TABLE>
</div>

<div align="center" ID="wpa" style="position:absolute;top:0;left:0;visibility:hidden">
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_bgn','wpa-psk')"><B><%tcWebApi_multilingual("1","security_options_str")%> (<%tcWebApi_multilingual("1","security_encryption_wpapsk_str")%>)</B></A>
		</TD>
	</TR>
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","passphrase_str")%> :</TD>
		<TD nowrap>
		<input type="text" id="textWpaPwdPhrase" size="20" maxlength="64" name="passphrase" id="passphrase" value="" onFocus="document.forms[0].wpa1_press_flag.value=1" onKeyPress="document.forms[0].wpa1_press_flag.value=1">
		<span class="optiondesc" id="wpaPwdPhrExtText"><%tcWebApi_multilingual("1","characters_digits_str")%></span>
		</TD>
	</TR>
	</TABLE>
</div>
 
<div align="center" ID="wpa2" style="position:absolute;top:0;left:0;visibility:hidden">  
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_bgn','wpa2-psk')"><B><%tcWebApi_multilingual("1","security_encryption_wpa2psk_str")%> (WPA2-PSK)</B></A>
		</TD>
	</TR>
	<TR>
		<TD nowrap>
		<span class="optiondesc" id="wpaPwdPhraseText"><%tcWebApi_multilingual("1","passphrase_str")%> :</span>
		</TD>
		<TD nowrap>
		<input type="text" id="textWpaPwdPhrase" maxlength="64" size="20" name="passphrase" id="passphrase" value="" onFocus="document.forms[0].wpa2_press_flag.value=1" onKeyPress="document.forms[0].wpa2_press_flag.value=1">
		<span class="optiondesc" id="wpaPwdPhrExtText"><%tcWebApi_multilingual("1","characters_digits_str")%></span>
		</TD>
	</TR>
	</TABLE>
</div>

<div align="center" ID="wpas" style="position:absolute;top:0;left:0;visibility:hidden">
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_bgn','wpa-psk+wpa2-psk')"><B><%tcWebApi_multilingual("1","security_encryption_wpawpa2psk_str")%> (WPA-PSK + WPA2-PSK)</B></A>
		</TD>
	</TR>
	<TR>
		<TD nowrap>
		<span class="optiondesc" id="wpaPwdPhraseText"><%tcWebApi_multilingual("1","passphrase_str")%> :</span>
		</TD>
		<TD nowrap>
		<input type="text" id="textWpaPwdPhrase" size="20" maxlength="64" name="passphrase" id="passphrase" value="" onFocus="document.forms[0].wpas_press_flag.value=1" onKeyPress="document.forms[0].wpas_press_flag.value=1">
		<span class="optiondesc" id="wpaPwdPhrExtText"><%tcWebApi_multilingual("1","characters_digits_str")%></span>
		</TD>	  
	</TR>
	</TABLE>
</div>

<div align="center" ID="wpae" style="position:absolute;top:0;left:0;visibility:hidden">
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_bgn','wpawpa2')"><B><%tcWebApi_multilingual("1","security_options_str")%> ( <%tcWebApi_multilingual("1","security_encryption_wpawpa2_enterprise_str")%> )</B></A>
		</TD>
	</TR>
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","wpa_mode_str")%></TD>
		<TD>
		<select name="wpae_mode" id="wpae_mode" size='1'>
			<option value='WPAE-TKIP'>WPA [TKIP]</option>
			<option value='WPAE-AES'>WPA2 [AES]</option>
			<option value='WPAE-TKIPAES'>WPA [TKIP] + WPA2 [AES]</option>
		</select>
		</TD>
	</TR>
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","radius_server_ip_address_str")%></TD>
        <TD nowrap>
        <input type="text" size="3" autocomplete="off" maxlength="3" name="radiusIPAddr1" id="radius_ipaddress1" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
        <input type="text" size="3" autocomplete="off" maxlength="3" name="radiusIPAddr2" id="radius_ipaddress2" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
        <input type="text" size="3" autocomplete="off" maxlength="3" name="radiusIPAddr3" id="radius_ipaddress3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
        <input type="text" size="3" autocomplete="off" maxlength="3" name="radiusIPAddr4" id="radius_ipaddress4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
        </TD>  
	</TR>
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","radius_server_port_str")%></TD>	
		<TD nowrap><input type="text" name="textWpaeRadiusPort" id="radius_port" size="20" maxlength="5" value="1812" onKeyPress="return getkey('num',event);"></TD>	
	</TR>	
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","radius_server_share_secret_str")%></TD>	
		<TD nowrap><input type="text" name="textWpaeRadiusSecret" id="radius_secret" size="20" maxlength="128" value="" onKeyPress="return getkey('ssid', event)"></TD>	
	</TR>	
	</TABLE>
</div>
<div id="have_an"></div>
<div align="center" ID="hidden_an" style="position:absolute;top:0;left:0;visibility:hidden">
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2><B><%tcWebApi_multilingual("1","network_profiles_str")%></B></TD>
</TR>
<TABLE width=100% border=1 cellpadding=0 name=ssid_table id=ssid_table>
<TR>
	<TD class=subhead>&nbsp;&nbsp;</TD>
	<TD class=subhead align=center><%tcWebApi_multilingual("1","profile_str")%></TD>
	<TD class=subhead align=center><%tcWebApi_multilingual("1","ssid_str")%></TD>
	<TD class=subhead align=center><%tcWebApi_multilingual("1","security_str")%></TD>
	<TD class=subhead align=center><%tcWebApi_multilingual("1","enable_str")%></TD>
	<TD class=subhead align=center><%tcWebApi_multilingual("1","ssid_broadcast_str")%></TD>
</TR>
<TR>
	<TD align=center><input type=radio name=ssidSelect_an id=ssid_select value=1 onclick=Check_Profile_5g()></TD>
	<TD align=center>1</TD>
	<TD align=center>
	<script>
	var show_ssid_1="<%if tcWebApi_get("WLan11ac_Entry1","SSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","SSID","s") end if%>";
	//show_ssid=old_ssid.replace(/>/g, '&gt;').replace(/</g, '&lt;').replace(/ /g,"&nbsp;");
	document.write(show_ssid_1);	
	</script>
	</TD>
	<TD align=center>
    <script>
	var security_mode = "<%if tcWebApi_get("WLan11ac_Entry1","AuthMode","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","AuthMode","s") end if%>";
	if(security_mode == "OPEN")
	   document.write("<%tcWebApi_multilingual("1","none_str")%>");
	 else if(security_mode == "WEP-64Bits")
	   document.write("<%tcWebApi_multilingual("1","wep_str")%>");
	 else if(security_mode == "WEP-128Bits")
	   document.write("<%tcWebApi_multilingual("1","wep_str")%>");
	 else if(security_mode == "WPAPSK")
	   document.write("<%tcWebApi_multilingual("1","wpa_psk_str")%>");
	 else if(security_mode == "WPA2PSK")
	   document.write("<%tcWebApi_multilingual("1","wpa2_psk_str")%>");
	 else if(security_mode == "WPAPSKWPA2PSK")
	   document.write("<%tcWebApi_multilingual("1","wpa_wpa2_psk_str")%>");
	 else if(security_mode == "WPA")
	   document.write("WPA [TKIP]");
	 else if(security_mode == "WPA2")
	   document.write("WPA2 [AES]");
	 else if(security_mode == "WPA1WPA2")
	   document.write("WPA [TKIP] + WPA2 [AES]");
	</script>
	</TD>
	<TD align=center>
	<script>
	var ssid_enable = "<%if tcWebApi_get("WLan11ac_Entry1","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","EnableSSID","s") end if%>";
	if(ssid_enable == 1)
	   document.write("<%tcWebApi_multilingual("0","glbstr_yes")%>");
	else
	   document.write("<%tcWebApi_multilingual("0","glbstr_no")%>");
	</script>
	</TD>
	<TD align=center>
	<script>
	var ssid_broadcast = "<%if tcWebApi_get("WLan11ac_Entry1","HideSSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","HideSSID","s") end if%>";
	if(ssid_broadcast == 0)
	    document.write("<%tcWebApi_multilingual("0","glbstr_yes")%>");
    else
	    document.write("<%tcWebApi_multilingual("0","glbstr_no")%>"); 
	</script>
	</TD>
</TR>

<TR>
	<TD align=center><input type=radio name=ssidSelect_an id=ssid_select value=2 onclick=Check_Profile_5g()></TD>
	<TD align=center>2</TD>
	<TD align=center>
	<script>
	var show_ssid_2="<%if tcWebApi_get("WLan11ac_Entry2","SSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","SSID","s") end if%>";
	document.write(show_ssid_2);	
	</script>
	</TD>
	<TD align=center>
	<script>
	var security_mode = "<%if tcWebApi_get("WLan11ac_Entry2","AuthMode","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","AuthMode","s") end if%>";
	if(security_mode == "OPEN")
	   document.write("<%tcWebApi_multilingual("1","none_str")%>");
    else if(security_mode == "WEP-64Bits")
	   document.write("<%tcWebApi_multilingual("1","wep_str")%>");
	else if(security_mode == "WEP-128Bits")
	   document.write("<%tcWebApi_multilingual("1","wep_str")%>");
	else if(security_mode == "WPAPSK")
	   document.write("<%tcWebApi_multilingual("1","wpa_psk_str")%>");
	else if(security_mode == "WPA2PSK")
	   document.write("<%tcWebApi_multilingual("1","wpa2_psk_str")%>");
	else if(security_mode == "WPAPSKWPA2PSK")
	   document.write("<%tcWebApi_multilingual("1","wpa_wpa2_psk_str")%>");
	else if(security_mode == "WPA")
	   document.write("WPA [TKIP]");
	else if(security_mode == "WPA2")
	   document.write("WPA2 [AES]");
	else if(security_mode == "WPA1WPA2")
	   document.write("WPA [TKIP] + WPA2 [AES]");
	</script>
	</TD>
	<TD align=center>
    <script>
	var ssid_enable = "<%if tcWebApi_get("WLan11ac_Entry2","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","EnableSSID","s") end if%>";
	if(ssid_enable == 1)
	   document.write("<%tcWebApi_multilingual("0","glbstr_yes")%>");
	else
	   document.write("<%tcWebApi_multilingual("0","glbstr_no")%>");
	</script>
	</TD>
	<TD align=center>
    <script>
	var ssid_broadcast = "<%if tcWebApi_get("WLan11ac_Entry2","HideSSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","HideSSID","s") end if%>";
	if(ssid_broadcast == 0)
	    document.write("<%tcWebApi_multilingual("0","glbstr_yes")%>");
    else
	    document.write("<%tcWebApi_multilingual("0","glbstr_no")%>"); 
	</script>
	</TD>
</TR>

<TR>
	<TD align=center><input type=radio name=ssidSelect_an id=ssid_select value=3 onclick=Check_Profile_5g()></TD>
	<TD align=center>3</TD>
	<TD align=center>
	<script>
	var show_ssid_3="<%if tcWebApi_get("WLan11ac_Entry3","SSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","SSID","s") end if%>";
	document.write(show_ssid_3);	
	</script>
	</TD>
	<TD align=center>
	<script>
	var security_mode = "<%if tcWebApi_get("WLan11ac_Entry3","AuthMode","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","AuthMode","s") end if%>";
	if(security_mode == "OPEN")
	   document.write("<%tcWebApi_multilingual("1","none_str")%>");
    else if(security_mode == "WEP-64Bits")
	   document.write("<%tcWebApi_multilingual("1","wep_str")%>");
	else if(security_mode == "WEP-128Bits")
	   document.write("<%tcWebApi_multilingual("1","wep_str")%>");
	else if(security_mode == "WPAPSK")
	   document.write("<%tcWebApi_multilingual("1","wpa_psk_str")%>");
	else if(security_mode == "WPA2PSK")
	   document.write("<%tcWebApi_multilingual("1","wpa2_psk_str")%>");
	else if(security_mode == "WPAPSKWPA2PSK")
	   document.write("<%tcWebApi_multilingual("1","wpa_wpa2_psk_str")%>");
	else if(security_mode == "WPA")
	   document.write("WPA [TKIP]");
	else if(security_mode == "WPA2")
	   document.write("WPA2 [AES]");
	else if(security_mode == "WPA1WPA2")
	   document.write("WPA [TKIP] + WPA2 [AES]");
	</script>
	</TD>
	<TD align=center>
	<script>
	var ssid_enable = "<%if tcWebApi_get("WLan11ac_Entry3","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","EnableSSID","s") end if%>";
	if(ssid_enable == 1)
	   document.write("<%tcWebApi_multilingual("0","glbstr_yes")%>");
	else
	   document.write("<%tcWebApi_multilingual("0","glbstr_no")%>");
	</script>
	</TD>
	<TD align=center>
    <script>
	var ssid_broadcast = "<%if tcWebApi_get("WLan11ac_Entry3","HideSSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","HideSSID","s") end if%>";
	if(ssid_broadcast == 0)
	    document.write("<%tcWebApi_multilingual("0","glbstr_yes")%>");
    else
	    document.write("<%tcWebApi_multilingual("0","glbstr_no")%>"); 
	</script>
	</TD>
</TR>

</TABLE> 
<TR><TD>&nbsp;&nbsp;</TD></TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_bgn','wireless')"><B><%tcWebApi_multilingual("1","wireless_settings_5GHz_str")%> - <%tcWebApi_multilingual("1","profile_str")%> <span id="pro_count_5g">1</span> (5GHz a/n) </B></A>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2><input type=checkbox name="enable_bssid_an" id="enable_bssid_an" value='1'>
	<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_bgn','enable_guest')"><%tcWebApi_multilingual("1","guest_network_enable_str")%></A>
	</TD>
</TR>
<TR>	
	<TD nowrap colspan=2><input type=checkbox name="enable_ssid_bc_an" id="enable_ssid_bc_an" value='1'>
	<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_bgn','enable_ssid')"><%tcWebApi_multilingual("1","ssid_broadcast_enable_str")%></A>
	</TD>
</TR>
<TR style="display:none"> <!--201404221216, Tony, Disable Wireless Video Network-->
	<TD nowrap colspan=2><input type=checkbox name="enable_video_an" id="enable_video_an" value='1'>
	<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_bgn','video')"><%tcWebApi_multilingual("1","video_network_enable_str")%></A>
	</TD>
</TR>	
<TR>	
	<TD nowrap colspan=2><input type=checkbox name="allow_access_an" id="allow_access_an" value='1'>
	<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_bgn','allow_guest')"><%tcWebApi_multilingual("1","allow_guest_access_local_network_str")%></A>
	</TD>
</TR>
<TR id=guestiso_an>
	<TD nowrap>
	<input type="checkbox" name="enable_isolation_an" id="enable_isolation_an" value="1">
	<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_bgn','wl_guest_iso')"><%tcWebApi_multilingual("1","wireless_isolation_enable_str")%>
	</TD>
</TR>
<TR>	
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_bgn','guest_ssid')"><%tcWebApi_multilingual("1","guest_wireless_network_name_str")%> :</A></TD>
	<TD nowrap colspan=2><input type="text" name="ssid_an" id="ssid_an" size="20" maxlength="32"></TD>
</TR>
</TABLE>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
	<TD nowrap colspan=2><A tabindex=-1 href="javascript:loadhelp('_wlan_guest_bgn','security')"><B><%tcWebApi_multilingual("1","security_options_str")%></B></A></TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="security_type_an" id="security_type_an" value="Disable" onClick=setSecurity_an(1)><%tcWebApi_multilingual("1","none_str")%>
	<TD>
</TR>
<TR id="wep_54_5g">
	<TD nowrap colspan=2>
	<input type="radio" name="security_type_an" id="security_type_an" value="WEP" onClick=setSecurity_an(2)><%tcWebApi_multilingual("1","wep_str")%>
	</TD>
</TR>
<TR id="wpa_psk_54_5g">
	<TD nowrap colspan=2>
	<input type="radio" name="security_type_an" id="security_type_an" value="WPA-PSK" onClick=setSecurity_an(3)><%tcWebApi_multilingual("1","wpa_psk_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="security_type_an" id="security_type_an" value="WPA2-PSK" onClick=setSecurity_an(4)><%tcWebApi_multilingual("1","wpa2_psk_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="security_type_an" id="security_type_an" value="AUTO-PSK" onClick=setSecurity_an(5)><%tcWebApi_multilingual("1","wpa_wpa2_psk_str")%>
	</TD>
</TR>
<TR id="wpa_enterprise_5g">
	<TD nowrap colspan=2>
	<input type="radio" name="security_type_an" id="security_type_an" value="WPA-Enterprise" onClick=setSecurity_an(6)><%tcWebApi_multilingual("1","wpa_wpa2_enterprise_str")%>
	</TD>
</TR>
</TABLE>
<div id=view_an></div>

<div align="center" ID="none_an" style="position:absolute;top:0;left:0;visibility:hidden">
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<TR>
		<TD nowrap colspan=2></TD>
	</TR>
	</TABLE>
</div> 
<div align="center" ID="wep_an" style="position:absolute;top:0;left:0;visibility:hidden">
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_bgn','wep_auth')"><B><%tcWebApi_multilingual("1","security_encryption_wep_str")%></B></A>
		</TD>
	</TR>
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","authenication_type_str")%></TD>
		<TD nowrap>
			<select NAME="authAlgm_an" id="wep_auth_type_an" size="1">
				<option value=1  ><%tcWebApi_multilingual("1","share_key_str")%></option>
				<option value=2 SELECTED ><%tcWebApi_multilingual("1","automatic_str")%></option>
			</select>
		</TD>
	</TR>
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","encryption_strength_str")%></TD>
		<TD nowrap> 
			<select NAME="Wepenc_an" id="wep_enc_strength_an" size="1" onChange="changekeylen_an(document.forms[0]);">
				<option value=5   ><%tcWebApi_multilingual("1","wep_64_bits_str")%></option>
				<option value=13  ><%tcWebApi_multilingual("1","wep_128_bits_str")%></option>
			</select>
		</TD>
	</TR>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_bgn','wepkey')"><B><%tcWebApi_multilingual("1","security_encryption_wep_key_str")%></B></A>
		</TD>
	</TR>
	<!--<TR>
		<TD nowrap colspan=2>&nbsp;<%tcWebApi_multilingual("1","passphrase_str")%> :&nbsp;
			<input type="text" size="16" maxlength="32" NAME="passphraseStr_an" id="wep_passphrase_an" VALUE="">&nbsp;&nbsp;
			<input class="short_common_bt" type="button" name="Generate_an" id="wep_generate_an" value="<%tcWebApi_multilingual("0","glbstr_generate")%>" OnClick="clickgenerate_a(document.forms[0])">
		</TD>
	</TR>-->
	<TR>
		<TD nowrap colspan=2>
		<TABLE>
		<TR>
			<TD nowrap><%tcWebApi_multilingual("1","key_1_str")%>
			<input type=radio NAME="wep_key_no_an" id="wep_key_no_an" checked value="1">
			</TD>
			<TD nowrap>
			<input TYPE="TEXT" SIZE="document.forms[0].Wepenc_an.value*2+2" MAXLENGTH="32" NAME="KEY1_an" id="key1_an" VALUE="" OnFocus="this.maxLength=document.forms[0].Wepenc_an.value*2;this.size=document.forms[0].Wepenc_an.value*2+2;" onKeyPress="return getkey('wep', event)">
			</TD>
		</TR>
		<TR>
			<TD nowrap><%tcWebApi_multilingual("1","key_2_str")%>
			<input type=radio NAME="wep_key_no_an" id="wep_key_no_an" value="2">
			</TD>
			<TD nowrap>
			<input TYPE="TEXT" SIZE="document.forms[0].Wepenc_an.value*2+2" MAXLENGTH="32" NAME="KEY2_an" id="key2_an" VALUE="" OnFocus="this.maxLength=document.forms[0].Wepenc_an.value*2;this.size=document.forms[0].Wepenc_an.value*2+2;" onKeyPress="return getkey('wep', event)">
			</TD>
		</TR>
		<TR>
			<TD nowrap><%tcWebApi_multilingual("1","key_3_str")%>
			<input type=radio NAME="wep_key_no_an" id="wep_key_no_an" value="3">
			</TD>
			<TD nowrap><input TYPE="TEXT" SIZE="document.forms[0].Wepenc_an.value*2+2" MAXLENGTH="32" NAME="KEY3_an" id="key3_an" VALUE="" OnFocus="this.maxLength=document.forms[0].Wepenc_an.value*2;this.size=document.forms[0].Wepenc_an.value*2+2;" onKeyPress="return getkey('wep', event)">
			</TD>
		</TR>
		<TR>
			<TD nowrap><%tcWebApi_multilingual("1","key_4_str")%>
			<input type=radio NAME="wep_key_no_an" id="wep_key_no_an" value="4">
			</TD>
			<TD nowrap>
			<input TYPE="TEXT" SIZE="document.forms[0].Wepenc_an.value*2+2" MAXLENGTH="32" NAME="KEY4_an" id="key4_an" VALUE=""  OnFocus="this.maxLength=document.forms[0].Wepenc_an.value*2;this.size=document.forms[0].Wepenc_an.value*2+2;" onKeyPress="return getkey('wep', event)">
			</TD>
		</TR>
		</TABLE>
		</TD>
	</TR>
	</TABLE>
</div>

<div align="center" ID="wpa_an" style="position:absolute;top:0;left:0;visibility:hidden">
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_bgn','wpa-psk')"><B><%tcWebApi_multilingual("1","security_options_str")%> (<%tcWebApi_multilingual("1","security_encryption_wpapsk_str")%>)</B></A>
		</TD>
	</TR>
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","passphrase_str")%> :</TD>
		<TD nowrap>
		<input type="text" id="textWpaPwdPhrase" size="20" maxlength="64" name="passphrase_an" id="passphrase_an" value="" onFocus="document.forms[0].wpa1_press_flag_an.value=1" onKeyPress="document.forms[0].wpa1_press_flag_an.value=1">
		<span class="optiondesc" id="wpaPwdPhrExtText"><%tcWebApi_multilingual("1","characters_digits_str")%></span>
		</TD>
	</TR>
	</TABLE>
</div>
 
<div align="center" ID="wpa2_an" style="position:absolute;top:0;left:0;visibility:hidden">  
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_bgn','wpa2-psk')"><B><%tcWebApi_multilingual("1","security_encryption_wpa2psk_str")%> (WPA2-PSK)</B></A>
		</TD>
	</TR>
	<TR>
		<TD nowrap>
		<span class="optiondesc" id="wpaPwdPhraseText"><%tcWebApi_multilingual("1","passphrase_str")%> :</span>
		</TD>
		<TD nowrap>
		<input type="text" id="textWpaPwdPhrase" maxlength="64" size="20" name="passphrase_an" id="passphrase_an" value="" onFocus="document.forms[0].wpa2_press_flag_an.value=1" onKeyPress="document.forms[0].wpa2_press_flag_an.value=1">
		<span class="optiondesc" id="wpaPwdPhrExtText"><%tcWebApi_multilingual("1","characters_digits_str")%></span>
		</TD>
	</TR>
	</TABLE>
</div>

<div align="center" ID="wpas_an" style="position:absolute;top:0;left:0;visibility:hidden">
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_bgn','wpa-psk+wpa2-psk')"><B><%tcWebApi_multilingual("1","security_encryption_wpawpa2psk_str")%> (WPA-PSK + WPA2-PSK)</B></A>
		</TD>
	</TR>
	<TR>
		<TD nowrap>
		<span class="optiondesc" id="wpaPwdPhraseText"><%tcWebApi_multilingual("1","passphrase_str")%> :</span>
		</TD>
		<TD nowrap>
		<input type="text" id="textWpaPwdPhrase" size="20" maxlength="64" name="passphrase_an" id="passphrase_an" value="" onFocus="document.forms[0].wpas_press_flag_an.value=1" onKeyPress="document.forms[0].wpas_press_flag_an.value=1">
		<span class="optiondesc" id="wpaPwdPhrExtText"><%tcWebApi_multilingual("1","characters_digits_str")%></span>
		</TD>	  
	</TR>
	</TABLE>
</div>

<div align="center" ID="wpae_an" style="position:absolute;top:0;left:0;visibility:hidden">
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_bgn','wpawpa2')"><B><%tcWebApi_multilingual("1","security_options_str")%> ( <%tcWebApi_multilingual("1","security_encryption_wpawpa2_enterprise_str")%> )</B></A>
		</TD>
	</TR>
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","wpa_mode_str")%></TD>
		<TD>
		<select name="wpae_mode_an" id="wpae_mode_an" size='1'>
			<option value='WPAE-TKIP'>WPA [TKIP]</option>
			<option value='WPAE-AES'>WPA2 [AES]</option>
			<option value='WPAE-TKIPAES'>WPA [TKIP] + WPA2 [AES]</option>
		</select>
		</TD>
	</TR>
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","radius_server_ip_address_str")%></TD>
        <TD nowrap>
        <input type="text" size="3" autocomplete="off" maxlength="3" name="radiusIPAddr1_an" id="radius_ipaddress1_an" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
        <input type="text" size="3" autocomplete="off" maxlength="3" name="radiusIPAddr2_an" id="radius_ipaddress2_an" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
        <input type="text" size="3" autocomplete="off" maxlength="3" name="radiusIPAddr3_an" id="radius_ipaddress3_an" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
        <input type="text" size="3" autocomplete="off" maxlength="3" name="radiusIPAddr4_an" id="radius_ipaddress4_an"onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
        </TD>  
	</TR>
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","radius_server_port_str")%></TD>	
		<TD nowrap><input type="text" name="textWpaeRadiusPort_an" id="radius_port_an" size="20" maxlength="5" value="1812" onKeyPress="return getkey('num',event);"></TD>	
	</TR>	
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","radius_server_share_secret_str")%></TD>	
		<TD nowrap><input type="text" name="textWpaeRadiusSecret_an" id="radius_secret_an" size="20" maxlength="128" value="" onKeyPress="return getkey('ssid', event)"></TD>	
	</TR>	
	</TABLE>
</div>
</div>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</div>
<div id="waiting_bar" style="display:none">
<div  align="center"><BR><BR><TR><TD align="center"><B><%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%></B></TD></TR><BR><BR></div>
<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" alt="waiting" /></div>
</div>
<%tcWebApi_multilingual("2","_wlan_guest_bgn_help.asp")%>
</FORM>
<script>
function getObj(name)
{
	if (document.getElementById)
	{
		return document.getElementById(name);
	}
	else if (document.all)
	{
		return document.all[name];
	}
	else if (document.layers)
	{
		return document.layers[name];
	}
}
function changekeylen(form)
{
	if(form.wepenc.options[0].selected == true)
	{
	    if(form.ssidSelect[0].checked==true)
		{
		form.KEY1.size=form.KEY2.size=form.KEY3.size=form.KEY4.size=12;
		form.KEY1.value="<%If tcWebApi_get("WLan_Entry1","Key1Str","h") <> "N/A" then tcWebApi_get("WLan_Entry1","Key1Str","s") end if%>";;
		form.KEY2.value="<%If tcWebApi_get("WLan_Entry1","Key2Str","h") <> "N/A" then tcWebApi_get("WLan_Entry1","Key2Str","s") end if%>";
		form.KEY3.value="<%If tcWebApi_get("WLan_Entry1","Key3Str","h") <> "N/A" then tcWebApi_get("WLan_Entry1","Key3Str","s") end if%>";
		form.KEY4.value="<%If tcWebApi_get("WLan_Entry1","Key4Str","h") <> "N/A" then tcWebApi_get("WLan_Entry1","Key4Str","s") end if%>";
		}
	}
	else
	{
	    if(form.ssidSelect[0].checked==true)
		{
		form.KEY1.size=form.KEY2.size=form.KEY3.size=form.KEY4.size=12;
		form.KEY1.value="<%If tcWebApi_get("WLan_Entry1","Key1Str","h") <> "N/A" then tcWebApi_get("WLan_Entry1","Key1Str","s") end if%>";;
		form.KEY2.value="<%If tcWebApi_get("WLan_Entry1","Key2Str","h") <> "N/A" then tcWebApi_get("WLan_Entry1","Key2Str","s") end if%>";
		form.KEY3.value="<%If tcWebApi_get("WLan_Entry1","Key3Str","h") <> "N/A" then tcWebApi_get("WLan_Entry1","Key3Str","s") end if%>";
		form.KEY4.value="<%If tcWebApi_get("WLan_Entry1","Key4Str","h") <> "N/A" then tcWebApi_get("WLan_Entry1","Key4Str","s") end if%>";
		}
	}
	form.generate_flag.value=0;
}
function changekeylen_an(form)
{
	if(form.Wepenc_an.options[0].selected == true)
	{
	    if(form.ssidSelect_an[0].checked==true)
		{
		form.KEY1_an.size=form.KEY2_an.size=form.KEY3_an.size=form.KEY4_an.size=12;
		form.KEY1_an.value = "<%If tcWebApi_get("WLan11ac_Entry1","Key1Str","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","Key1Str","s") end if%>";
		form.KEY2_an.value = "<%If tcWebApi_get("WLan11ac_Entry1","Key2Str","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","Key2Str","s") end if%>";
		form.KEY3_an.value = "<%If tcWebApi_get("WLan11ac_Entry1","Key3Str","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","Key3Str","s") end if%>";
		form.KEY4_an.value = "<%If tcWebApi_get("WLan11ac_Entry1","Key4Str","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","Key4Str","s") end if%>";
		}
	}
	else
	{
	    if(form.ssidSelect_an[0].checked==true)
		{
		form.KEY1_an.size=form.KEY2_an.size=form.KEY3_an.size=form.KEY4_an.size=28;
		form.KEY1_an.value = "<%If tcWebApi_get("WLan11ac_Entry1","Key1Str","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","Key1Str","s") end if%>";
		form.KEY2_an.value = "<%If tcWebApi_get("WLan11ac_Entry1","Key2Str","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","Key2Str","s") end if%>";
		form.KEY3_an.value = "<%If tcWebApi_get("WLan11ac_Entry1","Key3Str","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","Key3Str","s") end if%>";
		form.KEY4_an.value = "<%If tcWebApi_get("WLan11ac_Entry1","Key4Str","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","Key4Str","s") end if%>";
		}
	}
	form.generate_flag_an.value=0;
}

var wl_sectype="1";
var wds_endis_fun="0";
var endis_wl_radio="1";
var wl_get_keyno_guest1="<%If tcWebApi_get("WLan_Entry1","DefaultKeyID","h") <> "N/A" then tcWebApi_get("WLan_Entry1","DefaultKeyID","s") else asp_write("1") end if%>";
var wl_get_keyno_guest2="<%If tcWebApi_get("WLan_Entry2","DefaultKeyID","h") <> "N/A" then tcWebApi_get("WLan_Entry2","DefaultKeyID","s") else asp_write("1") end if%>";
var wl_get_keyno_guest3="<%If tcWebApi_get("WLan_Entry3","DefaultKeyID","h") <> "N/A" then tcWebApi_get("WLan_Entry3","DefaultKeyID","s") else asp_write("1") end if%>";

var wl_sectype_an="1";
var wla_wds_endis_fun_an="0";
var endis_wla_radio_an="1";
var wl_get_keyno_an="1";
var wps_status="5";

function setSecurity(num)
{
	var form=document.forms[0];
	form.wpa1_press_flag.value=0;
	form.wpa2_press_flag.value=0;
	form.wpas_press_flag.value=0;
	//if(tmp_guestID == 1)
	if(form.ssidSelect[0].checked==true)
	{
	if(num==2)
	{
	    <%if tcWebApi_get("WLan_Entry1","WEPAuthType","h") = "WEPAuto" then%>
			 var auth = 2;
		<%else%>
			 var auth = 1;
		<%end if%>
	    <%if tcWebApi_get("WLan_Entry1","AuthMode","h") = "WEP-64Bits" then%>
	         var keylength = 5;  //5 64bit
	    <%else%>
             var keylength = 13;  //13 128bit
	    <%end if%>
		getObj("view").innerHTML=str_wep;
		var form=document.forms[0];
		var keyno=wl_get_keyno_guest1;
		form.wep_key_no[eval(keyno)-1].checked = true;
		form.authAlgm.options[eval(auth)-1].selected = true;
	    if(keylength==5)
			form.wepenc.options[0].selected=true;
		else
			form.wepenc.options[1].selected=true;
		form.KEY1.value="<%If tcWebApi_get("WLan_Entry1","Key1Str","h") <> "N/A" then tcWebApi_get("WLan_Entry1","Key1Str","s") end if%>";;
		form.KEY2.value="<%If tcWebApi_get("WLan_Entry1","Key2Str","h") <> "N/A" then tcWebApi_get("WLan_Entry1","Key2Str","s") end if%>";
		form.KEY3.value="<%If tcWebApi_get("WLan_Entry1","Key3Str","h") <> "N/A" then tcWebApi_get("WLan_Entry1","Key3Str","s") end if%>";
		form.KEY4.value="<%If tcWebApi_get("WLan_Entry1","Key4Str","h") <> "N/A" then tcWebApi_get("WLan_Entry1","Key4Str","s") end if%>";
		form.old_length.value=keylength;
	}
	else if(num==3)
	{
		getObj("view").innerHTML=str_wpa;
		form.passphrase.value = "<%If tcWebApi_get("WLan_Entry1","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry1","WPAPSK","s") end if%>";
	}
	else if(num==4)
	{
		getObj("view").innerHTML=str_wpa2;
		form.passphrase.value = "<%If tcWebApi_get("WLan_Entry1","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry1","WPAPSK","s") end if%>";
	}
	else if(num==5)
	{
		getObj("view").innerHTML=str_wpas;
		form.passphrase.value = "<%If tcWebApi_get("WLan_Entry1","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry1","WPAPSK","s") end if%>";
	}
	else if (num==6)
	{
	    <%if tcWebApi_get("WLan_Entry1","AuthMode","h") <> "N/A" then
             if tcWebApi_get("WLan_Entry1","AuthMode","h") = "WPA2" then%>
	         var get_wpae_mode="WPAE-AES";
        <%elseif tcWebApi_get("WLan_Entry1","AuthMode","h") = "WPA1WPA2" then%>
	         var get_wpae_mode="WPAE-TKIPAES";
	    <%else%>
	         var get_wpae_mode="WPAE-TKIP";
	    <%end if%>
	    var get_radiusSerIp="<%tcWebApi_get("WLan_Entry1","RADIUS_Server","s")%>";
	    var get_radiusPort ="<%tcWebApi_get("WLan_Entry1","RADIUS_Port","s")%>";
	    var get_RadiusSecret = "<%tcWebApi_get("WLan_Entry1","RADIUS_Key","s")%>";
        <%end if%>
		getObj("view").innerHTML=str_wpae;
		form.wpae_mode.value = get_wpae_mode;
		if( get_radiusSerIp != "" && get_radiusSerIp != "0.0.0.0" )
		{
			radiusIPArray = get_radiusSerIp.split(".");
			form.radiusIPAddr1.value = radiusIPArray[0];
			form.radiusIPAddr2.value = radiusIPArray[1];
			form.radiusIPAddr3.value = radiusIPArray[2];
			form.radiusIPAddr4.value = radiusIPArray[3];
		}
		form.textWpaeRadiusPort.value = get_radiusPort;
        form.textWpaeRadiusSecret.value = get_RadiusSecret;		
	}
	else
		getObj("view").innerHTML=str_none;
	} //end of guest1
	//else if(tmp_guestID == 2)
	else if(form.ssidSelect[1].checked==true)
	{
	if(num==2)
	{
	    <%if tcWebApi_get("WLan_Entry2","WEPAuthType","h") = "WEPAuto" then%>
		     var auth = 2;
		<%else%>
		     var auth = 1;
		<%end if%>
	    <%if tcWebApi_get("WLan_Entry2","AuthMode","h") = "WEP-64Bits" then%>
	         var keylength = 5;  //5 64bit
	    <%else%>
             var keylength = 13;  //13 128bit
	    <%end if%>
		getObj("view").innerHTML=str_wep;
		var form=document.forms[0];
		var keyno=wl_get_keyno_guest2;
		form.wep_key_no[eval(keyno)-1].checked = true;
		form.authAlgm.options[eval(auth)-1].selected = true;
	    if(keylength==5)
			form.wepenc.options[0].selected=true;
		else
			form.wepenc.options[1].selected=true;
		form.KEY1.value="<%If tcWebApi_get("WLan_Entry2","Key1Str","h") <> "N/A" then tcWebApi_get("WLan_Entry2","Key1Str","s") end if%>";;
		form.KEY2.value="<%If tcWebApi_get("WLan_Entry2","Key2Str","h") <> "N/A" then tcWebApi_get("WLan_Entry2","Key2Str","s") end if%>";
		form.KEY3.value="<%If tcWebApi_get("WLan_Entry2","Key3Str","h") <> "N/A" then tcWebApi_get("WLan_Entry2","Key3Str","s") end if%>";
		form.KEY4.value="<%If tcWebApi_get("WLan_Entry2","Key4Str","h") <> "N/A" then tcWebApi_get("WLan_Entry2","Key4Str","s") end if%>";
		form.old_length.value=keylength;
	}
	else if(num==3)
	{
		getObj("view").innerHTML=str_wpa;
		form.passphrase.value = "<%If tcWebApi_get("WLan_Entry2","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry2","WPAPSK","s") end if%>";
	}
	else if(num==4)
	{
		getObj("view").innerHTML=str_wpa2;
		form.passphrase.value = "<%If tcWebApi_get("WLan_Entry2","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry2","WPAPSK","s") end if%>";
	}
	else if(num==5)
	{
		getObj("view").innerHTML=str_wpas;
		form.passphrase.value = "<%If tcWebApi_get("WLan_Entry2","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry2","WPAPSK","s") end if%>";
	}
	else if (num==6)
	{
		<%if tcWebApi_get("WLan_Entry2","AuthMode","h") <> "N/A" then
             if tcWebApi_get("WLan_Entry2","AuthMode","h") = "WPA2" then%>
	         var get_wpae_mode="WPAE-AES";
        <%elseif tcWebApi_get("WLan_Entry2","AuthMode","h") = "WPA1WPA2" then%>
	         var get_wpae_mode="WPAE-TKIPAES";
	    <%else%>
	         var get_wpae_mode="WPAE-TKIP";
	    <%end if%>
	    var get_radiusSerIp="<%tcWebApi_get("WLan_Entry2","RADIUS_Server","s")%>";
	    var get_radiusPort ="<%tcWebApi_get("WLan_Entry2","RADIUS_Port","s")%>";
	    var get_RadiusSecret = "<%tcWebApi_get("WLan_Entry2","RADIUS_Key","s")%>";
        <%end if%>
		getObj("view").innerHTML=str_wpae;
		form.wpae_mode.value = get_wpae_mode;
		if( get_radiusSerIp != "" && get_radiusSerIp != "0.0.0.0" )
		{
			radiusIPArray = get_radiusSerIp.split(".");
			form.radiusIPAddr1.value = radiusIPArray[0];
			form.radiusIPAddr2.value = radiusIPArray[1];
			form.radiusIPAddr3.value = radiusIPArray[2];
			form.radiusIPAddr4.value = radiusIPArray[3];
		}
		form.textWpaeRadiusPort.value = get_radiusPort;
        form.textWpaeRadiusSecret.value = get_RadiusSecret;		
	}
	else
		getObj("view").innerHTML=str_none;
	} //end of guest2
	//else if(tmp_guestID == 3)
	else if (form.ssidSelect[2].checked==true)
	{
	if(num==2)
	{
	    <%if tcWebApi_get("WLan_Entry3","WEPAuthType","h") = "WEPAuto" then%>
		     var auth = 2;
		<%else%>
		     var auth = 1;
		<%end if%>
	    <%if tcWebApi_get("WLan_Entry3","AuthMode","h") = "WEP-64Bits" then%>
	         var keylength = 5;  //5 64bit
	    <%else%>
             var keylength = 13;  //13 128bit
	    <%end if%>
		getObj("view").innerHTML=str_wep;
		var form=document.forms[0];
		var keyno=wl_get_keyno_guest3;
		form.wep_key_no[eval(keyno)-1].checked = true;
		form.authAlgm.options[eval(auth)-1].selected = true;
	    if(keylength==5)
			form.wepenc.options[0].selected=true;
		else
			form.wepenc.options[1].selected=true;
		form.KEY1.value="<%If tcWebApi_get("WLan_Entry3","Key1Str","h") <> "N/A" then tcWebApi_get("WLan_Entry3","Key1Str","s") end if%>";;
		form.KEY2.value="<%If tcWebApi_get("WLan_Entry3","Key2Str","h") <> "N/A" then tcWebApi_get("WLan_Entry3","Key2Str","s") end if%>";
		form.KEY3.value="<%If tcWebApi_get("WLan_Entry3","Key3Str","h") <> "N/A" then tcWebApi_get("WLan_Entry3","Key3Str","s") end if%>";
		form.KEY4.value="<%If tcWebApi_get("WLan_Entry3","Key4Str","h") <> "N/A" then tcWebApi_get("WLan_Entry3","Key4Str","s") end if%>";
		form.old_length.value=keylength;
	}
	else if(num==3)
	{
		getObj("view").innerHTML=str_wpa;
		form.passphrase.value = "<%If tcWebApi_get("WLan_Entry3","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry3","WPAPSK","s") end if%>";
	}
	else if(num==4)
	{
		getObj("view").innerHTML=str_wpa2;
		form.passphrase.value = "<%If tcWebApi_get("WLan_Entry3","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry3","WPAPSK","s") end if%>";
	}
	else if(num==5)
	{
		getObj("view").innerHTML=str_wpas;
		form.passphrase.value = "<%If tcWebApi_get("WLan_Entry3","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry3","WPAPSK","s") end if%>";
	}
	else if (num==6)
	{
		<%if tcWebApi_get("WLan_Entry3","AuthMode","h") <> "N/A" then
             if tcWebApi_get("WLan_Entry3","AuthMode","h") = "WPA2" then%>
	         var get_wpae_mode="WPAE-AES";
        <%elseif tcWebApi_get("WLan_Entry3","AuthMode","h") = "WPA1WPA2" then%>
	         var get_wpae_mode="WPAE-TKIPAES";
	    <%else%>
	         var get_wpae_mode="WPAE-TKIP";
	    <%end if%>
	    var get_radiusSerIp="<%tcWebApi_get("WLan_Entry3","RADIUS_Server","s")%>";
	    var get_radiusPort ="<%tcWebApi_get("WLan_Entry3","RADIUS_Port","s")%>";
	    var get_RadiusSecret = "<%tcWebApi_get("WLan_Entry3","RADIUS_Key","s")%>";
        <%end if%>
		getObj("view").innerHTML=str_wpae;
		form.wpae_mode.value = get_wpae_mode;
		if( get_radiusSerIp != "" && get_radiusSerIp != "0.0.0.0" )
		{
			radiusIPArray = get_radiusSerIp.split(".");
			form.radiusIPAddr1.value = radiusIPArray[0];
			form.radiusIPAddr2.value = radiusIPArray[1];
			form.radiusIPAddr3.value = radiusIPArray[2];
			form.radiusIPAddr4.value = radiusIPArray[3];
		}
		form.textWpaeRadiusPort.value = get_radiusPort;
        form.textWpaeRadiusSecret.value = get_RadiusSecret;		
	}
	else
		getObj("view").innerHTML=str_none;
	} //end of guest3
}
function setSecurity_an(num)
{
	var form=document.forms[0];
	form.wpa1_press_flag_an.value=0;
	form.wpa2_press_flag_an.value=0;
	form.wpas_press_flag_an.value=0;
	if(form.ssidSelect_an[0].checked==true)
	{
	if(num==2)
	{
	    <%if tcWebApi_get("WLan11ac_Entry1","WEPAuthType","h") = "WEPAuto" then%>
			 var auth = 2;
		<%else%>
			 var auth = 1;
		<%end if%>
	    <%if tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WEP-64Bits" then%>
	         var keylength_an = 5;  //5 64bit
	    <%else%>
             var keylength_an = 13;  //13 128bit
	    <%end if%>
		form.authAlgm_an.options[eval(auth)-1].selected = true;
		if(keylength_an==5)
			form.wepenc_an.options[0].selected=true;
		else
			form.wepenc_an.options[1].selected=true;
		form.KEY1.value="<%If tcWebApi_get("WLan11ac_Entry1","Key1Str","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","Key1Str","s") end if%>";;
		form.KEY2.value="<%If tcWebApi_get("WLan11ac_Entry1","Key2Str","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","Key2Str","s") end if%>";
		form.KEY3.value="<%If tcWebApi_get("WLan11ac_Entry1","Key3Str","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","Key3Str","s") end if%>";
		form.KEY4.value="<%If tcWebApi_get("WLan11ac_Entry1","Key4Str","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","Key4Str","s") end if%>";
		getObj("view_an").innerHTML=str_wep_an;
		var form=document.forms[0];
		var keyno_an=wl_get_keyno_an;
		form.wep_key_no_an[eval(keyno_an)-1].checked = true;
		form.KEY1_an.value=wl_key1_an;
		form.KEY2_an.value=wl_key2_an;
		form.KEY3_an.value=wl_key3_an;
		form.KEY4_an.value=wl_key4_an;
		form.old_length_an.value=keylength_an;
	}
	else if(num==3)
	{
		getObj("view_an").innerHTML=str_wpa_an;
		form.passphrase_an.value = "<%If tcWebApi_get("WLan11ac_Entry1","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","WPAPSK","s") end if%>";
	}
	else if(num==4)
	{
		getObj("view_an").innerHTML=str_wpa2_an;
		form.passphrase_an.value = "<%If tcWebApi_get("WLan11ac_Entry1","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","WPAPSK","s") end if%>";
	}
	else if(num==5)
	{
		getObj("view_an").innerHTML=str_wpas_an;
		form.passphrase_an.value = "<%If tcWebApi_get("WLan11ac_Entry1","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","WPAPSK","s") end if%>";
	}
	else if (num==6)
	{
		<%if tcWebApi_get("WLan11ac_Entry1","AuthMode","h") <> "N/A" then
             if tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WPA2" then%>
	         var get_wpae_mode_an="WPAE-AES";
        <%elseif tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WPA1WPA2" then%>
	         var get_wpae_mode_an="WPAE-TKIPAES";
	    <%else%>
	         var get_wpae_mode_an="WPAE-TKIP";
	    <%end if%>
	    var get_radiusSerIp_an="<%tcWebApi_get("WLan11ac_Entry1","RADIUS_Server","s")%>";
	    var get_radiusPort_an ="<%tcWebApi_get("WLan11ac_Entry1","RADIUS_Port","s")%>";
	    var get_RadiusSecret_an = "<%tcWebApi_get("WLan11ac_Entry1","RADIUS_Key","s")%>";
        <%end if%>
		getObj("view_an").innerHTML=str_wpae_an;
		form.wpae_mode_an.value = get_wpae_mode_an;
		if( get_radiusSerIp_an != "" && get_radiusSerIp_an != "0.0.0.0" )
		{
			radiusIPArray_an = get_radiusSerIp_an.split(".");
			form.radiusIPAddr1_an.value = radiusIPArray_an[0];
			form.radiusIPAddr2_an.value = radiusIPArray_an[1];
			form.radiusIPAddr3_an.value = radiusIPArray_an[2];
			form.radiusIPAddr4_an.value = radiusIPArray_an[3];
		}
		form.textWpaeRadiusPort_an.value = get_radiusPort_an;
        form.textWpaeRadiusSecret_an.value = get_RadiusSecret_an;		
	}
	else
		getObj("view_an").innerHTML=str_none_an;
    } //end of guest1
	
    else if(form.ssidSelect_an[1].checked==true)
	{
	if(num==2)
	{
	    <%if tcWebApi_get("WLan11ac_Entry2","WEPAuthType","h") = "WEPAuto" then%>
			 var auth = 2;
		<%else%>
			 var auth = 1;
		<%end if%>
	    <%if tcWebApi_get("WLan11ac_Entry2","AuthMode","h") = "WEP-64Bits" then%>
	         var keylength_an = 5;  //5 64bit
	    <%else%>
             var keylength_an = 13;  //13 128bit
	    <%end if%>
		form.authAlgm_an.options[eval(auth)-1].selected = true;
		if(keylength_an==5)
			form.wepenc_an.options[0].selected=true;
		else
			form.wepenc_an.options[1].selected=true;
		form.KEY1.value="<%If tcWebApi_get("WLan11ac_Entry2","Key1Str","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","Key1Str","s") end if%>";;
		form.KEY2.value="<%If tcWebApi_get("WLan11ac_Entry2","Key2Str","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","Key2Str","s") end if%>";
		form.KEY3.value="<%If tcWebApi_get("WLan11ac_Entry2","Key3Str","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","Key3Str","s") end if%>";
		form.KEY4.value="<%If tcWebApi_get("WLan11ac_Entry2","Key4Str","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","Key4Str","s") end if%>";
		getObj("view_an").innerHTML=str_wep_an;
		var form=document.forms[0];
		var keyno_an=wl_get_keyno_an;
		form.wep_key_no_an[eval(keyno_an)-1].checked = true;
		form.KEY1_an.value=wl_key1_an;
		form.KEY2_an.value=wl_key2_an;
		form.KEY3_an.value=wl_key3_an;
		form.KEY4_an.value=wl_key4_an;
		form.old_length_an.value=keylength_an;
	}
	else if(num==3)
	{
		getObj("view_an").innerHTML=str_wpa_an;
		form.passphrase_an.value = "<%If tcWebApi_get("WLan11ac_Entry2","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","WPAPSK","s") end if%>";
	}
	else if(num==4)
	{
		getObj("view_an").innerHTML=str_wpa2_an;
		form.passphrase_an.value = "<%If tcWebApi_get("WLan11ac_Entry2","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","WPAPSK","s") end if%>";
	}
	else if(num==5)
	{
		getObj("view_an").innerHTML=str_wpas_an;
		form.passphrase_an.value = "<%If tcWebApi_get("WLan11ac_Entry2","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","WPAPSK","s") end if%>";
	}
	else if (num==6)
	{
		<%if tcWebApi_get("WLan11ac_Entry2","AuthMode","h") <> "N/A" then
             if tcWebApi_get("WLan11ac_Entry2","AuthMode","h") = "WPA2" then%>
	         var get_wpae_mode_an="WPAE-AES";
        <%elseif tcWebApi_get("WLan11ac_Entry2","AuthMode","h") = "WPA1WPA2" then%>
	         var get_wpae_mode_an="WPAE-TKIPAES";
	    <%else%>
	         var get_wpae_mode_an="WPAE-TKIP";
	    <%end if%>
	    var get_radiusSerIp_an="<%tcWebApi_get("WLan11ac_Entry2","RADIUS_Server","s")%>";
	    var get_radiusPort_an ="<%tcWebApi_get("WLan11ac_Entry2","RADIUS_Port","s")%>";
	    var get_RadiusSecret_an = "<%tcWebApi_get("WLan11ac_Entry2","RADIUS_Key","s")%>";
        <%end if%>
		getObj("view_an").innerHTML=str_wpae_an;
		form.wpae_mode_an.value = get_wpae_mode_an;
		if( get_radiusSerIp_an != "" && get_radiusSerIp_an != "0.0.0.0" )
		{
			radiusIPArray_an = get_radiusSerIp_an.split(".");
			form.radiusIPAddr1_an.value = radiusIPArray_an[0];
			form.radiusIPAddr2_an.value = radiusIPArray_an[1];
			form.radiusIPAddr3_an.value = radiusIPArray_an[2];
			form.radiusIPAddr4_an.value = radiusIPArray_an[3];
		}
		form.textWpaeRadiusPort_an.value = get_radiusPort_an;
        form.textWpaeRadiusSecret_an.value = get_RadiusSecret_an;		
	}
	else
		getObj("view_an").innerHTML=str_none_an;
    } //end of guest2
	
	else if(form.ssidSelect_an[2].checked==true)
	{
	if(num==2)
	{
	    <%if tcWebApi_get("WLan11ac_Entry3","WEPAuthType","h") = "WEPAuto" then%>
			 var auth = 2;
		<%else%>
			 var auth = 1;
		<%end if%>
	    <%if tcWebApi_get("WLan11ac_Entry3","AuthMode","h") = "WEP-64Bits" then%>
	         var keylength_an = 5;  //5 64bit
	    <%else%>
             var keylength_an = 13;  //13 128bit
	    <%end if%>
		form.authAlgm_an.options[eval(auth)-1].selected = true;
		if(keylength_an==5)
			form.wepenc_an.options[0].selected=true;
		else
			form.wepenc_an.options[1].selected=true;
		form.KEY1.value="<%If tcWebApi_get("WLan11ac_Entry3","Key1Str","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","Key1Str","s") end if%>";;
		form.KEY2.value="<%If tcWebApi_get("WLan11ac_Entry3","Key2Str","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","Key2Str","s") end if%>";
		form.KEY3.value="<%If tcWebApi_get("WLan11ac_Entry3","Key3Str","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","Key3Str","s") end if%>";
		form.KEY4.value="<%If tcWebApi_get("WLan11ac_Entry3","Key4Str","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","Key4Str","s") end if%>";
		getObj("view_an").innerHTML=str_wep_an;
		var form=document.forms[0];
		var keyno_an=wl_get_keyno_an;
		form.wep_key_no_an[eval(keyno_an)-1].checked = true;
		form.KEY1_an.value=wl_key1_an;
		form.KEY2_an.value=wl_key2_an;
		form.KEY3_an.value=wl_key3_an;
		form.KEY4_an.value=wl_key4_an;
		form.old_length_an.value=keylength_an;
	}
	else if(num==3)
	{
		getObj("view_an").innerHTML=str_wpa_an;
		form.passphrase_an.value = "<%If tcWebApi_get("WLan11ac_Entry3","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","WPAPSK","s") end if%>";
	}
	else if(num==4)
	{
		getObj("view_an").innerHTML=str_wpa2_an;
		form.passphrase_an.value = "<%If tcWebApi_get("WLan11ac_Entry3","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","WPAPSK","s") end if%>";
	}
	else if(num==5)
	{
		getObj("view_an").innerHTML=str_wpas_an;
		form.passphrase_an.value = "<%If tcWebApi_get("WLan11ac_Entry3","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","WPAPSK","s") end if%>";
	}
	else if (num==6)
	{
		<%if tcWebApi_get("WLan11ac_Entry3","AuthMode","h") <> "N/A" then
             if tcWebApi_get("WLan11ac_Entry3","AuthMode","h") = "WPA2" then%>
	         var get_wpae_mode_an="WPAE-AES";
        <%elseif tcWebApi_get("WLan11ac_Entry3","AuthMode","h") = "WPA1WPA2" then%>
	         var get_wpae_mode_an="WPAE-TKIPAES";
	    <%else%>
	         var get_wpae_mode_an="WPAE-TKIP";
	    <%end if%>
	    var get_radiusSerIp_an="<%tcWebApi_get("WLan11ac_Entry3","RADIUS_Server","s")%>";
	    var get_radiusPort_an ="<%tcWebApi_get("WLan11ac_Entry3","RADIUS_Port","s")%>";
	    var get_RadiusSecret_an = "<%tcWebApi_get("WLan11ac_Entry3","RADIUS_Key","s")%>";
        <%end if%>
		getObj("view_an").innerHTML=str_wpae_an;
		form.wpae_mode_an.value = get_wpae_mode_an;
		if( get_radiusSerIp_an != "" && get_radiusSerIp_an != "0.0.0.0" )
		{
			radiusIPArray_an = get_radiusSerIp_an.split(".");
			form.radiusIPAddr1_an.value = radiusIPArray_an[0];
			form.radiusIPAddr2_an.value = radiusIPArray_an[1];
			form.radiusIPAddr3_an.value = radiusIPArray_an[2];
			form.radiusIPAddr4_an.value = radiusIPArray_an[3];
		}
		form.textWpaeRadiusPort_an.value = get_radiusPort_an;
        form.textWpaeRadiusSecret_an.value = get_RadiusSecret_an;		
	}
	else
		getObj("view_an").innerHTML=str_none_an;
    } //end of guest3
}
function loadvalue()
{
	top.enabled_wds=0;

        if( top.location.href.indexOf("adv_index.asp") != -1 )
                menu_color_change('guest_network_setup');
        else
                basic_menu_color_change('basic_guest');

	var form=document.forms[0];

	if( guest_router_flag == 1 && wire_iso_flag == 1)
        document.getElementById("guestiso").style.display="";
    else
        document.getElementById("guestiso").style.display="none";
		
    if(tmp_guestID == 1)
	{
	   getObj('pro_count').innerHTML = 1;
	   form.ssidSelect[0].checked=true;
	   get_endis_guestNet="<%if tcWebApi_get("WLan_Entry1","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan_Entry1","EnableSSID","s") end if%>";
	   get_endis_guestSSIDbro="<%if tcWebApi_get("WLan_Entry1","HideSSID","h") <> "N/A" then tcWebApi_get("WLan_Entry1","HideSSID","s") end if%>";
       get_endis_allow_guest = "<%if tcWebApi_get("WLan_Entry1","GuestAllowLocal","h") <> "N/A" then tcWebApi_get("WLan_Entry1","GuestAllowLocal","s") end if%>";
	   old_endis_wireless_isolation="<%if tcWebApi_get("WLan_Entry1","NoForwarding","h") <> "N/A" then tcWebApi_get("WLan_Entry1","NoForwarding","s") end if%>";
	   form.ssid.value = "<%if tcWebApi_get("WLan_Entry1","SSID","h") <> "N/A" then tcWebApi_get("WLan_Entry1","SSID","s") end if%>";
	   if( get_endis_guestNet == 1 )
		   form.enable_bssid.checked = true;
	   else
		   form.enable_bssid.checked = false;
	   if( get_endis_guestSSIDbro == 0 )
		   form.enable_ssid_bc.checked = true;
	   else
		   form.enable_ssid_bc.checked = false;
       if( get_endis_allow_guest == 1 )
           form.allow_access.checked = true;
       else
           form.allow_access.checked = false;
	   if(old_endis_wireless_isolation == 1)
		   form.enable_isolate.checked = true;
	   else
		   form.enable_isolate.checked = false;
	   <%if tcWebApi_get("WLan_Entry1","AuthMode","h") <> "N/A" then%>
	        <%if tcWebApi_get("WLan_Entry1","AuthMode","h") = "OPEN" then%>
	             form.security_type[0].checked=true;
			     wl_sectype = 1;
		    <%elseif tcWebApi_get("WLan_Entry1","AuthMode","h") = "WEP-64Bits" then%>
	             form.security_type[1].checked=true;
			     wl_sectype = 2;
		    <%elseif tcWebApi_get("WLan_Entry1","AuthMode","h") = "WEP-128Bits" then%>
		         form.security_type[1].checked=true;
			     wl_sectype = 2;
		    <%elseif tcWebApi_get("WLan_Entry1","AuthMode","h") = "WPAPSK" then%>
	             form.security_type[2].checked=true;
			     wl_sectype = 3;
		    <%elseif tcWebApi_get("WLan_Entry1","AuthMode","h") = "WPA2PSK" then%>
	             form.security_type[3].checked=true;
			     wl_sectype = 4;
		    <%elseif tcWebApi_get("WLan_Entry1","AuthMode","h") = "WPAPSKWPA2PSK" then%>
	             form.security_type[4].checked=true;
			     wl_sectype = 5;
		    <%elseif tcWebApi_get("WLan_Entry1","AuthMode","h") = "WPA" then%>
	             form.security_type[5].checked=true;
			     wl_sectype = 6;
		    <%elseif tcWebApi_get("WLan_Entry1","AuthMode","h") = "WPA2" then%>
	             form.security_type[5].checked=true;
			     wl_sectype = 6;
		    <%else%>
	             form.security_type[5].checked=true;
			     wl_sectype = 6;
		    <%end if%>
	   <%end if%>
	}
	else if(tmp_guestID == 2)
	{
	   getObj('pro_count').innerHTML = 2;
	   form.ssidSelect[1].checked=true;
	   get_endis_guestNet="<%if tcWebApi_get("WLan_Entry2","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan_Entry2","EnableSSID","s") end if%>";
	   get_endis_guestSSIDbro="<%if tcWebApi_get("WLan_Entry2","HideSSID","h") <> "N/A" then tcWebApi_get("WLan_Entry2","HideSSID","s") end if%>";
	   get_endis_allow_guest = "<%if tcWebApi_get("WLan_Entry2","GuestAllowLocal","h") <> "N/A" then tcWebApi_get("WLan_Entry2","GuestAllowLocal","s") end if%>";
       old_endis_wireless_isolation="<%if tcWebApi_get("WLan_Entry2","NoForwarding","h") <> "N/A" then tcWebApi_get("WLan_Entry2","NoForwarding","s") end if%>";
	   form.ssid.value = "<%if tcWebApi_get("WLan_Entry2","SSID","h") <> "N/A" then tcWebApi_get("WLan_Entry2","SSID","s") end if%>";
	   if( get_endis_guestNet == 1 )
		   form.enable_bssid.checked = true;
	   else
		   form.enable_bssid.checked = false;
	   if( get_endis_guestSSIDbro == 0 )
		   form.enable_ssid_bc.checked = true;
	   else
		   form.enable_ssid_bc.checked = false;
       if( get_endis_allow_guest == 1 )
           form.allow_access.checked = true;
       else
           form.allow_access.checked = false;
	   if(old_endis_wireless_isolation == 1)
		   form.enable_isolate.checked = true;
	   else
		   form.enable_isolate.checked = false;
	   <%if tcWebApi_get("WLan_Entry2","AuthMode","h") <> "N/A" then%>
	        <%if tcWebApi_get("WLan_Entry2","AuthMode","h") = "OPEN" then%>
	             form.security_type[0].checked=true;
			     wl_sectype = 1;
		    <%elseif tcWebApi_get("WLan_Entry2","AuthMode","h") = "WEP-64Bits" then%>
	             form.security_type[1].checked=true;
			     wl_sectype = 2;
		    <%elseif tcWebApi_get("WLan_Entry2","AuthMode","h") = "WEP-128Bits" then%>
		         form.security_type[1].checked=true;
			     wl_sectype = 2;
		    <%elseif tcWebApi_get("WLan_Entry2","AuthMode","h") = "WPAPSK" then%>
	             form.security_type[2].checked=true;
			     wl_sectype = 3;
		    <%elseif tcWebApi_get("WLan_Entry2","AuthMode","h") = "WPA2PSK" then%>
	             form.security_type[3].checked=true;
			     wl_sectype = 4;
		    <%elseif tcWebApi_get("WLan_Entry2","AuthMode","h") = "WPAPSKWPA2PSK" then%>
	             form.security_type[4].checked=true;
			     wl_sectype = 5;
		    <%elseif tcWebApi_get("WLan_Entry2","AuthMode","h") = "WPA" then%>
	             form.security_type[5].checked=true;
			     wl_sectype = 6;
		    <%elseif tcWebApi_get("WLan_Entry2","AuthMode","h") = "WPA2" then%>
	             form.security_type[5].checked=true;
			     wl_sectype = 6;
		    <%else%>
	             form.security_type[5].checked=true;
			     wl_sectype = 6;
		    <%end if%>
	   <%end if%>
	}
	else if(tmp_guestID == 3)
	{
	   getObj('pro_count').innerHTML = 3;
	   form.ssidSelect[2].checked=true;
	   get_endis_guestNet="<%if tcWebApi_get("WLan_Entry3","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan_Entry3","EnableSSID","s") end if%>";
	   get_endis_guestSSIDbro="<%if tcWebApi_get("WLan_Entry3","HideSSID","h") <> "N/A" then tcWebApi_get("WLan_Entry3","HideSSID","s") end if%>";
       get_endis_allow_guest = "<%if tcWebApi_get("WLan_Entry3","GuestAllowLocal","h") <> "N/A" then tcWebApi_get("WLan_Entry3","GuestAllowLocal","s") end if%>";
	   old_endis_wireless_isolation="<%if tcWebApi_get("WLan_Entry3","NoForwarding","h") <> "N/A" then tcWebApi_get("WLan_Entry3","NoForwarding","s") end if%>";
	   form.ssid.value = "<%if tcWebApi_get("WLan_Entry3","SSID","h") <> "N/A" then tcWebApi_get("WLan_Entry3","SSID","s") end if%>";
	   if( get_endis_guestNet == 1 )
		   form.enable_bssid.checked = true;
	   else
		   form.enable_bssid.checked = false;
	   if( get_endis_guestSSIDbro == 0 )
		   form.enable_ssid_bc.checked = true;
	   else
		   form.enable_ssid_bc.checked = false;
       if( get_endis_allow_guest == 1 )
           form.allow_access.checked = true;
       else
           form.allow_access.checked = false;
	   if(old_endis_wireless_isolation == 1)
		   form.enable_isolate.checked = true;
	   else
		   form.enable_isolate.checked = false;
	   <%if tcWebApi_get("WLan_Entry3","AuthMode","h") <> "N/A" then%>
	        <%if tcWebApi_get("WLan_Entry3","AuthMode","h") = "OPEN" then%>
	             form.security_type[0].checked=true;
			     wl_sectype = 1;
		    <%elseif tcWebApi_get("WLan_Entry3","AuthMode","h") = "WEP-64Bits" then%>
	             form.security_type[1].checked=true;
			     wl_sectype = 2;
		    <%elseif tcWebApi_get("WLan_Entry3","AuthMode","h") = "WEP-128Bits" then%>
		         form.security_type[1].checked=true;
			     wl_sectype = 2;
		    <%elseif tcWebApi_get("WLan_Entry3","AuthMode","h") = "WPAPSK" then%>
	             form.security_type[2].checked=true;
			     wl_sectype = 3;
		    <%elseif tcWebApi_get("WLan_Entry3","AuthMode","h") = "WPA2PSK" then%>
	             form.security_type[3].checked=true;
			     wl_sectype = 4;
		    <%elseif tcWebApi_get("WLan_Entry3","AuthMode","h") = "WPAPSKWPA2PSK" then%>
	             form.security_type[4].checked=true;
			     wl_sectype = 5;
		    <%elseif tcWebApi_get("WLan_Entry3","AuthMode","h") = "WPA" then%>
	             form.security_type[5].checked=true;
			     wl_sectype = 6;
		    <%elseif tcWebApi_get("WLan_Entry3","AuthMode","h") = "WPA2" then%>
	             form.security_type[5].checked=true;
			     wl_sectype = 6;
		    <%else%>
	             form.security_type[5].checked=true;
			     wl_sectype = 6;
		    <%end if%>
	   <%end if%>
	}
	else
	{
	   form.ssidSelect[0].checked=true;
	   get_endis_guestNet="<%if tcWebApi_get("WLan_Entry1","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan_Entry1","EnableSSID","s") end if%>";
	   get_endis_guestSSIDbro="<%if tcWebApi_get("WLan_Entry1","HideSSID","h") <> "N/A" then tcWebApi_get("WLan_Entry1","HideSSID","s") end if%>";
       get_endis_allow_guest = "<%if tcWebApi_get("WLan_Entry1","GuestAllowLocal","h") <> "N/A" then tcWebApi_get("WLan_Entry1","GuestAllowLocal","s") end if%>";
	   old_endis_wireless_isolation = "<%if tcWebApi_get("WLan_Entry1","NoForwarding","h") <> "N/A" then tcWebApi_get("WLan_Entry1","NoForwarding","s") end if%>";
	   form.ssid.value = "<%if tcWebApi_get("WLan_Entry1","SSID","h") <> "N/A" then tcWebApi_get("WLan_Entry1","SSID","s") end if%>";
	   if( get_endis_guestNet == 1 )
		   form.enable_bssid.checked = true;
	   else
		   form.enable_bssid.checked = false;
	   if( get_endis_guestSSIDbro == 0 )
		   form.enable_ssid_bc.checked = true;
	   else
		   form.enable_ssid_bc.checked = false;
       if( get_endis_allow_guest == 1 )
           form.allow_access.checked = true;
       else
           form.allow_access.checked = false;
	   if(old_endis_wireless_isolation == 1)
		   form.enable_isolate.checked = true;
	   else
		   form.enable_isolate.checked = false;
	   <%if tcWebApi_get("WLan_Entry1","AuthMode","h") <> "N/A" then%>
	        <%if tcWebApi_get("WLan_Entry1","AuthMode","h") = "OPEN" then%>
	             form.security_type[0].checked=true;
			     wl_sectype = 1;
		    <%elseif tcWebApi_get("WLan_Entry1","AuthMode","h") = "WEP-64Bits" then%>
	             form.security_type[1].checked=true;
			     wl_sectype = 2;
		    <%elseif tcWebApi_get("WLan_Entry1","AuthMode","h") = "WEP-128Bits" then%>
		         form.security_type[1].checked=true;
			     wl_sectype = 2;
		    <%elseif tcWebApi_get("WLan_Entry1","AuthMode","h") = "WPAPSK" then%>
	             form.security_type[2].checked=true;
			     wl_sectype = 3;
		    <%elseif tcWebApi_get("WLan_Entry1","AuthMode","h") = "WPA2PSK" then%>
	             form.security_type[3].checked=true;
			     wl_sectype = 4;
		    <%elseif tcWebApi_get("WLan_Entry1","AuthMode","h") = "WPAPSKWPA2PSK" then%>
	             form.security_type[4].checked=true;
			     wl_sectype = 5;
		    <%elseif tcWebApi_get("WLan_Entry1","AuthMode","h") = "WPA" then%>
	             form.security_type[5].checked=true;
			     wl_sectype = 6;
		    <%elseif tcWebApi_get("WLan_Entry1","AuthMode","h") = "WPA2" then%>
	             form.security_type[5].checked=true;
			     wl_sectype = 6;
		    <%else%>
	             form.security_type[5].checked=true;
			     wl_sectype = 6;
		    <%end if%>
	   <%end if%>
	}
	
	str_none=getObj("none").innerHTML;
	str_wep=getObj("wep").innerHTML;
	str_wpa=getObj("wpa").innerHTML;
	str_wpa2=getObj("wpa2").innerHTML;
	str_wpas=getObj("wpas").innerHTML;
	str_wpae=getObj("wpae").innerHTML;
	getObj("none").innerHTML='';	
	getObj("wep").innerHTML='';	
	getObj("wpa").innerHTML='';	
	getObj("wpa2").innerHTML='';	
	getObj("wpas").innerHTML='';
	getObj("wpae").innerHTML='';
	setSecurity(wl_sectype);
	var sectype=wl_sectype;
	if ( wds_endis_fun == '0' || endis_wl_radio == '0' )
		setDisabled(false,form.security_type[2],form.security_type[3],form.security_type[4],form.security_type[5]);	
	else
		setDisabled(true,form.security_type[2],form.security_type[3],form.security_type[4],form.security_type[5]);
	
	//Bug 19665, should not be both set to wep in main network and guest network.
	var wireless_sectype="4";//if wireless_sectype==2 WEP security type
	if(endis_wl_radio==1 && wireless_sectype==2)
		form.security_type[1].disabled = true;

        //Bug 21810, when set wireless to 300/150. the wep and tkip in guest network should be removed.
	var wireless_opmode="<%tcWebApi_get("WLan_Common","WirelessMode","s")%>";
	if(wireless_opmode == '0')
	{
		document.getElementById("wep_54").style.display=""; 
		document.getElementById("wpa_psk_54").style.display=""; 
		document.getElementById("wep_54_5g").style.display="none"; //201404221216, Tony, Disable Wireless WEP
		document.getElementById("wpa_psk_54_5g").style.display="none"; //201404221216, Tony, Disable Wireless WPA-PSK [TKIP]
        document.getElementById("wpa_enterprise").style.display="none"; //201404221216, Tony, Disable Wireless WPA/WPA2 Enterprise
        document.getElementById("wpa_enterprise_5g").style.display="none"; //201404221216, Tony, Disable Wireless WPA/WPA2 Enterprise
	}
	else
	{
		document.getElementById("wep_54").style.display="none";
		document.getElementById("wpa_psk_54").style.display="none";
		document.getElementById("wep_54_5g").style.display="none"; //201404221216, Tony, Disable Wireless WEP
		document.getElementById("wpa_psk_54_5g").style.display="none"; //201404221216, Tony, Disable Wireless WPA-PSK [TKIP]
        document.getElementById("wpa_enterprise").style.display="none"; //201404221216, Tony, Disable Wireless WPA/WPA2 Enterprise
        document.getElementById("wpa_enterprise_5g").style.display="none"; //201404221216, Tony, Disable Wireless WPA/WPA2 Enterprise
	}

	form.security_type[parseInt(sectype)-1].checked=true;
	/*if(wl_sectype == '2')
	{
		var form=document.forms[0];
		var keyno=wl_get_keyno;
		var keylength=wl_get_keylength;
		changekeylen(document.forms[0]);
		form.wep_key_no[eval(keyno)-1].checked = true;
		form.KEY1.value=wl_key1;
		form.KEY2.value=wl_key2;
		form.KEY3.value=wl_key3;
		form.KEY4.value=wl_key4;
		form.old_length.value=keylength;
	}*/
	/*else if(wl_sectype==3)
	{
		form.passphrase.value=get_wpa1;
	}
	else if(wl_sectype==4)
	{
		form.passphrase.value=get_wpa2;
	}
	else if(wl_sectype==5)
	{
		form.passphrase.value=get_wpas;
	}*/
	/*else if(wl_sectype==6)
	{
		form.wpae_mode.value = get_wpae_mode;
		if( get_radiusSerIp != "" && get_radiusSerIp != "0.0.0.0" )
		{
			radiusIPArray = get_radiusSerIp.split(".");
			form.radiusIPAddr1.value = radiusIPArray[0];
			form.radiusIPAddr2.value = radiusIPArray[1];
			form.radiusIPAddr3.value = radiusIPArray[2];
			form.radiusIPAddr4.value = radiusIPArray[3];
		}
		form.textWpaeRadiusPort.value = get_radiusPort;
	}*/
	
	if(parent.an_router_flag == 1)
	{
		str_have_an=getObj("hidden_an").innerHTML;
		getObj("hidden_an").innerHTML='';
		getObj("have_an").innerHTML=str_have_an;
		//menu_color_change('guest_a');
		
		if( guest_router_flag == 1 && wire_iso_flag == 1)
			document.getElementById("guestiso_an").style.display="";
		else
			document.getElementById("guestiso_an").style.display="none";
			
	if(tmp_guest5gID == 1)
	{
	   getObj('pro_count_5g').innerHTML = 1;
	   form.ssidSelect_an[0].checked=true;
	   get_endis_guestNet_an="<%if tcWebApi_get("WLan11ac_Entry1","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","EnableSSID","s") end if%>";
	   get_endis_guestSSIDbro_an="<%if tcWebApi_get("WLan11ac_Entry1","HideSSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","HideSSID","s") end if%>";
       get_endis_allow_guest_an = "<%if tcWebApi_get("WLan11ac_Entry1","GuestAllowLocal","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","GuestAllowLocal","s") end if%>";
	   old_endis_wireless_isolation_an="<%if tcWebApi_get("WLan11ac_Entry1","NoForwarding","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","NoForwarding","s") end if%>";
	   form.ssid_an.value = "<%if tcWebApi_get("WLan11ac_Entry1","SSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","SSID","s") end if%>";
	   if( get_endis_guestNet_an == 1 )
		   form.enable_bssid_an.checked = true;
	   else
		   form.enable_bssid_an.checked = false;
	   if( get_endis_guestSSIDbro_an == 0 )
		   form.enable_ssid_bc_an.checked = true;
	   else
		   form.enable_ssid_bc_an.checked = false;
       if( get_endis_allow_guest_an == 1 )
           form.allow_access_an.checked = true;
       else
           form.allow_access_an.checked = false;
	   if(old_endis_wireless_isolation_an == 1)
		   form.enable_isolation_an.checked = true;
	   else
		   form.enable_isolation_an.checked = false;
	   <%if tcWebApi_get("WLan11ac_Entry1","AuthMode","h") <> "N/A" then%>
	        <%if tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "OPEN" then%>
	             form.security_type_an[0].checked=true;
			     wl_sectype_an = 1;
		    <%elseif tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WEP-64Bits" then%>
	             form.security_type_an[1].checked=true;
			     wl_sectype_an = 2;
		    <%elseif tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WEP-128Bits" then%>
		         form.security_type_an[1].checked=true;
			     wl_sectype_an = 2;
		    <%elseif tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WPAPSK" then%>
	             form.security_type_an[2].checked=true;
			     wl_sectype_an = 3;
		    <%elseif tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WPA2PSK" then%>
	             form.security_type_an[3].checked=true;
			     wl_sectype_an = 4;
		    <%elseif tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WPAPSKWPA2PSK" then%>
	             form.security_type_an[4].checked=true;
			     wl_sectype_an = 5;
		    <%elseif tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WPA" then%>
	             form.security_type_an[5].checked=true;
			     wl_sectype_an = 6;
		    <%elseif tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WPA2" then%>
	             form.security_type_an[5].checked=true;
			     wl_sectype_an = 6;
		    <%else%>
	             form.security_type_an[5].checked=true;
			     wl_sectype_an = 6;
		    <%end if%>
	   <%end if%>
	}
    else if(tmp_guest5gID == 2)
	{
	   getObj('pro_count_5g').innerHTML = 2;
	   form.ssidSelect_an[1].checked=true;
	   get_endis_guestNet_an="<%if tcWebApi_get("WLan11ac_Entry2","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","EnableSSID","s") end if%>";
	   get_endis_guestSSIDbro_an="<%if tcWebApi_get("WLan11ac_Entry2","HideSSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","HideSSID","s") end if%>";
       get_endis_allow_guest_an = "<%if tcWebApi_get("WLan11ac_Entry2","GuestAllowLocal","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","GuestAllowLocal","s") end if%>";
	   old_endis_wireless_isolation_an="<%if tcWebApi_get("WLan11ac_Entry2","NoForwarding","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","NoForwarding","s") end if%>";
	   form.ssid_an.value = "<%if tcWebApi_get("WLan11ac_Entry2","SSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","SSID","s") end if%>";
	   if( get_endis_guestNet_an == 1 )
		   form.enable_bssid_an.checked = true;
	   else
		   form.enable_bssid_an.checked = false;
	   if( get_endis_guestSSIDbro_an == 0 )
		   form.enable_ssid_bc_an.checked = true;
	   else
		   form.enable_ssid_bc_an.checked = false;
       if( get_endis_allow_guest_an == 1 )
           form.allow_access_an.checked = true;
       else
           form.allow_access_an.checked = false;
	   if(old_endis_wireless_isolation_an == 1)
		   form.enable_isolation_an.checked = true;
	   else
		   form.enable_isolation_an.checked = false;
	   <%if tcWebApi_get("WLan11ac_Entry2","AuthMode","h") <> "N/A" then%>
	        <%if tcWebApi_get("WLan11ac_Entry2","AuthMode","h") = "OPEN" then%>
	             form.security_type_an[0].checked=true;
			     wl_sectype_an = 1;
		    <%elseif tcWebApi_get("WLan11ac_Entry2","AuthMode","h") = "WEP-64Bits" then%>
	             form.security_type_an[1].checked=true;
			     wl_sectype_an = 2;
		    <%elseif tcWebApi_get("WLan11ac_Entry2","AuthMode","h") = "WEP-128Bits" then%>
		         form.security_type_an[1].checked=true;
			     wl_sectype_an = 2;
		    <%elseif tcWebApi_get("WLan11ac_Entry2","AuthMode","h") = "WPAPSK" then%>
	             form.security_type_an[2].checked=true;
			     wl_sectype_an = 3;
		    <%elseif tcWebApi_get("WLan11ac_Entry2","AuthMode","h") = "WPA2PSK" then%>
	             form.security_type_an[3].checked=true;
			     wl_sectype_an = 4;
		    <%elseif tcWebApi_get("WLan11ac_Entry2","AuthMode","h") = "WPAPSKWPA2PSK" then%>
	             form.security_type_an[4].checked=true;
			     wl_sectype_an = 5;
		    <%elseif tcWebApi_get("WLan11ac_Entry2","AuthMode","h") = "WPA" then%>
	             form.security_type_an[5].checked=true;
			     wl_sectype_an = 6;
		    <%elseif tcWebApi_get("WLan11ac_Entry2","AuthMode","h") = "WPA2" then%>
	             form.security_type_an[5].checked=true;
			     wl_sectype_an = 6;
		    <%else%>
	             form.security_type_an[5].checked=true;
			     wl_sectype_an = 6;
		    <%end if%>
	   <%end if%>
	}
	else if(tmp_guest5gID == 3)
	{
	   getObj('pro_count_5g').innerHTML = 3;
	   form.ssidSelect_an[2].checked=true;
	   get_endis_guestNet_an="<%if tcWebApi_get("WLan11ac_Entry3","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","EnableSSID","s") end if%>";
	   get_endis_guestSSIDbro_an="<%if tcWebApi_get("WLan11ac_Entry3","HideSSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","HideSSID","s") end if%>";
       get_endis_allow_guest_an = "<%if tcWebApi_get("WLan11ac_Entry3","GuestAllowLocal","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","GuestAllowLocal","s") end if%>";
	   old_endis_wireless_isolation_an="<%if tcWebApi_get("WLan11ac_Entry3","NoForwarding","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","NoForwarding","s") end if%>";
	   form.ssid_an.value = "<%if tcWebApi_get("WLan11ac_Entry3","SSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","SSID","s") end if%>";
	   if( get_endis_guestNet_an == 1 )
		   form.enable_bssid_an.checked = true;
	   else
		   form.enable_bssid_an.checked = false;
	   if( get_endis_guestSSIDbro_an == 0 )
		   form.enable_ssid_bc_an.checked = true;
	   else
		   form.enable_ssid_bc_an.checked = false;
       if( get_endis_allow_guest_an == 1 )
           form.allow_access_an.checked = true;
       else
           form.allow_access_an.checked = false;
	   if(old_endis_wireless_isolation_an == 1)
		   form.enable_isolation_an.checked = true;
	   else
		   form.enable_isolation_an.checked = false;
	   <%if tcWebApi_get("WLan11ac_Entry3","AuthMode","h") <> "N/A" then%>
	        <%if tcWebApi_get("WLan11ac_Entry3","AuthMode","h") = "OPEN" then%>
	             form.security_type_an[0].checked=true;
			     wl_sectype_an = 1;
		    <%elseif tcWebApi_get("WLan11ac_Entry3","AuthMode","h") = "WEP-64Bits" then%>
	             form.security_type_an[1].checked=true;
			     wl_sectype_an = 2;
		    <%elseif tcWebApi_get("WLan11ac_Entry3","AuthMode","h") = "WEP-128Bits" then%>
		         form.security_type_an[1].checked=true;
			     wl_sectype_an = 2;
		    <%elseif tcWebApi_get("WLan11ac_Entry3","AuthMode","h") = "WPAPSK" then%>
	             form.security_type_an[2].checked=true;
			     wl_sectype_an = 3;
		    <%elseif tcWebApi_get("WLan11ac_Entry3","AuthMode","h") = "WPA2PSK" then%>
	             form.security_type_an[3].checked=true;
			     wl_sectype_an = 4;
		    <%elseif tcWebApi_get("WLan11ac_Entry3","AuthMode","h") = "WPAPSKWPA2PSK" then%>
	             form.security_type_an[4].checked=true;
			     wl_sectype_an = 5;
		    <%elseif tcWebApi_get("WLan11ac_Entry3","AuthMode","h") = "WPA" then%>
	             form.security_type_an[5].checked=true;
			     wl_sectype_an = 6;
		    <%elseif tcWebApi_get("WLan11ac_Entry3","AuthMode","h") = "WPA2" then%>
	             form.security_type_an[5].checked=true;
			     wl_sectype_an = 6;
		    <%else%>
	             form.security_type_an[5].checked=true;
			     wl_sectype_an = 6;
		    <%end if%>
	   <%end if%>
	}
	else
	{
	   getObj('pro_count_5g').innerHTML = 1;
	   form.ssidSelect_an[0].checked=true;
	   get_endis_guestNet_an="<%if tcWebApi_get("WLan11ac_Entry1","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","EnableSSID","s") end if%>";
	   get_endis_guestSSIDbro_an="<%if tcWebApi_get("WLan11ac_Entry1","HideSSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","HideSSID","s") end if%>";
       get_endis_allow_guest_an = "<%if tcWebApi_get("WLan11ac_Entry1","GuestAllowLocal","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","GuestAllowLocal","s") end if%>";
	   old_endis_wireless_isolation_an="<%if tcWebApi_get("WLan11ac_Entry1","NoForwarding","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","NoForwarding","s") end if%>";
	   form.ssid_an.value = "<%if tcWebApi_get("WLan11ac_Entry1","SSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","SSID","s") end if%>";
	   if( get_endis_guestNet_an == 1 )
		   form.enable_bssid_an.checked = true;
	   else
		   form.enable_bssid_an.checked = false;
	   if( get_endis_guestSSIDbro_an == 0 )
		   form.enable_ssid_bc_an.checked = true;
	   else
		   form.enable_ssid_bc_an.checked = false;
       if( get_endis_allow_guest_an == 1 )
           form.allow_access_an.checked = true;
       else
           form.allow_access_an.checked = false;
	   if(old_endis_wireless_isolation_an == 1)
		   form.enable_isolation_an.checked = true;
	   else
		   form.enable_isolation_an.checked = false;
	   <%if tcWebApi_get("WLan11ac_Entry1","AuthMode","h") <> "N/A" then%>
	        <%if tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "OPEN" then%>
	             form.security_type_an[0].checked=true;
			     wl_sectype_an = 1;
		    <%elseif tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WEP-64Bits" then%>
	             form.security_type_an[1].checked=true;
			     wl_sectype_an = 2;
		    <%elseif tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WEP-128Bits" then%>
		         form.security_type_an[1].checked=true;
			     wl_sectype_an = 2;
		    <%elseif tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WPAPSK" then%>
	             form.security_type_an[2].checked=true;
			     wl_sectype_an = 3;
		    <%elseif tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WPA2PSK" then%>
	             form.security_type_an[3].checked=true;
			     wl_sectype_an = 4;
		    <%elseif tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WPAPSKWPA2PSK" then%>
	             form.security_type_an[4].checked=true;
			     wl_sectype_an = 5;
		    <%elseif tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WPA" then%>
	             form.security_type_an[5].checked=true;
			     wl_sectype_an = 6;
		    <%elseif tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WPA2" then%>
	             form.security_type_an[5].checked=true;
			     wl_sectype_an = 6;
		    <%else%>
	             form.security_type_an[5].checked=true;
			     wl_sectype_an = 6;
		    <%end if%>
	   <%end if%>
	}
	
		/*if(old_wla_endis_wireless_isolation=='1')
			form.enable_isolation_an.checked = true;
		else
			form.enable_isolation_an.checked = false;
		/*if( get_endis_guestNet_an == 1 )
			form.enable_bssid_an.checked = true;
		else
			form.enable_bssid_an.checked = false;
		if( get_endis_guestSSIDbro_an == 1 )
			form.enable_ssid_bc_an.checked = true;
		else
			form.enable_ssid_bc_an.checked = false;*/
		
		if( get_enable_video_value_an == 1 )
			form.enable_video_an.checked = true;
		else
			form.enable_video_an.checked = false;
			
		/*if( get_endis_allow_guest_an == 1 )
			form.allow_access_an.checked = true;
		else
			form.allow_access_an.checked = false;*/
			
		str_none_an=getObj("none_an").innerHTML;
		str_wep_an=getObj("wep_an").innerHTML;
		str_wpa_an=getObj("wpa_an").innerHTML;
		str_wpa2_an=getObj("wpa2_an").innerHTML;
		str_wpas_an=getObj("wpas_an").innerHTML;
		str_wpae_an=getObj("wpae_an").innerHTML;
		getObj("none_an").innerHTML='';	
		getObj("wep_an").innerHTML='';	
		getObj("wpa_an").innerHTML='';	
		getObj("wpa2_an").innerHTML='';	
		getObj("wpas_an").innerHTML='';
		getObj("wpae_an").innerHTML='';
		setSecurity_an(wl_sectype_an);
		var sectype_an=wl_sectype_an;
		if ( wla_wds_endis_fun_an == '0' || endis_wla_radio_an == '0' )
			setDisabled(false,form.security_type_an[2],form.security_type_an[3],form.security_type_an[4],form.security_type_an[5]);	
		else
			setDisabled(true,form.security_type_an[2],form.security_type_an[3],form.security_type_an[4],form.security_type_an[5]);
	
	//Bug 19665, should not be both set to wep in main network and guest network.
		var wla_sectype="1";
		if(endis_wla_radio_an==1 && wla_sectype==2)
			form.security_type_an[1].disabled = true;

		form.security_type_an[parseInt(sectype_an)-1].checked=true;
		/*if(wl_sectype_an == '2')
		{
			var form=document.forms[0];
			var keyno_an=wl_get_keyno_an;
			var keylength_an=wl_get_keylength_an;
			changekeylen_an(document.forms[0]);
			form.wep_key_no_an[eval(keyno_an)-1].checked = true;
			form.KEY1_an.value=wl_key1_an;
			form.KEY2_an.value=wl_key2_an;
			form.KEY3_an.value=wl_key3_an;
			form.KEY4_an.value=wl_key4_an;
			form.old_length_an.value=keylength_an;
		}
		else if(wl_sectype_an==3)
		{
			form.passphrase_an.value=get_wpa1_an;
		}
		else if(wl_sectype_an==4)
		{
			form.passphrase_an.value=get_wpa2_an;
		}
		else if(wl_sectype_an==5)
		{
			form.passphrase_an.value=get_wpas_an;
		}
		else if(wl_sectype_an==6)
		{
			form.wpae_mode_an.value = get_wpae_mode_an;
			if( get_radiusSerIp_an != "" && get_radiusSerIp_an != "0.0.0.0" )
			{
				radiusIPArray_an = get_radiusSerIp_an.split(".");
				form.radiusIPAddr1_an.value = radiusIPArray_an[0];
				form.radiusIPAddr2_an.value = radiusIPArray_an[1];
				form.radiusIPAddr3_an.value = radiusIPArray_an[2];
				form.radiusIPAddr4_an.value = radiusIPArray_an[3];
			}
			form.textWpaeRadiusPort_an.value = get_radiusPort_an;
		}*/
	}
}

function Check_Profile()
{
   var form=document.forms[0];
   if(form.ssidSelect[0].checked==true)
   {
      getObj('pro_count').innerHTML = 1;
	  get_endis_guestNet="<%if tcWebApi_get("WLan_Entry1","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan_Entry1","EnableSSID","s") end if%>";
	  get_endis_guestSSIDbro="<%if tcWebApi_get("WLan_Entry1","HideSSID","h") <> "N/A" then tcWebApi_get("WLan_Entry1","HideSSID","s") end if%>";
      get_endis_allow_guest = "<%if tcWebApi_get("WLan_Entry1","GuestAllowLocal","h") <> "N/A" then tcWebApi_get("WLan_Entry1","GuestAllowLocal","s") end if%>";
	  old_endis_wireless_isolation="<%if tcWebApi_get("WLan_Entry1","NoForwarding","h") <> "N/A" then tcWebApi_get("WLan_Entry1","NoForwarding","s") end if%>";
	  form.ssid.value = "<%if tcWebApi_get("WLan_Entry1","SSID","h") <> "N/A" then tcWebApi_get("WLan_Entry1","SSID","s") end if%>";
	  if( get_endis_guestNet == 1 )
		 form.enable_bssid.checked = true;
	  else
		 form.enable_bssid.checked = false;
	  if( get_endis_guestSSIDbro == 0 )
		 form.enable_ssid_bc.checked = true;
	  else
		 form.enable_ssid_bc.checked = false;
      if( get_endis_allow_guest == 1 )
         form.allow_access.checked = true;
      else
         form.allow_access.checked = false;
	  if(old_endis_wireless_isolation == 1)
		 form.enable_isolate.checked = true;
	  else
		 form.enable_isolate.checked = false;
		
	  <%if tcWebApi_get("WLan_Entry1","AuthMode","h") <> "N/A" then%>
	      <%if tcWebApi_get("WLan_Entry1","AuthMode","h") = "OPEN" then%>
	           form.security_type[0].checked=true;
			   wl_sectype = 1;
		  <%elseif tcWebApi_get("WLan_Entry1","AuthMode","h") = "WEP-64Bits" then%>
	           form.security_type[1].checked=true;
			   wl_sectype = 2;
		  <%elseif tcWebApi_get("WLan_Entry1","AuthMode","h") = "WEP-128Bits" then%>
		       form.security_type[1].checked=true;
			   wl_sectype = 2;
		  <%elseif tcWebApi_get("WLan_Entry1","AuthMode","h") = "WPAPSK" then%>
	           form.security_type[2].checked=true;
			   wl_sectype = 3;
		  <%elseif tcWebApi_get("WLan_Entry1","AuthMode","h") = "WPA2PSK" then%>
	           form.security_type[3].checked=true;
			   wl_sectype = 4;
		  <%elseif tcWebApi_get("WLan_Entry1","AuthMode","h") = "WPAPSKWPA2PSK" then%>
	           form.security_type[4].checked=true;
			   wl_sectype = 5;
		  <%elseif tcWebApi_get("WLan_Entry1","AuthMode","h") = "WPA" then%>
	           form.security_type[5].checked=true;
			   wl_sectype = 6;
		  <%elseif tcWebApi_get("WLan_Entry1","AuthMode","h") = "WPA2" then%>
	           form.security_type[5].checked=true;
			   wl_sectype = 6;
		  <%else%>
	           form.security_type[5].checked=true;
			   wl_sectype = 6;
		  <%end if%>
	   <%end if%>
	   setSecurity(wl_sectype);
   }
   else if(form.ssidSelect[1].checked==true)
   {
      getObj('pro_count').innerHTML = 2;
	  get_endis_guestNet="<%if tcWebApi_get("WLan_Entry2","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan_Entry2","EnableSSID","s") end if%>";
	  get_endis_guestSSIDbro="<%if tcWebApi_get("WLan_Entry2","HideSSID","h") <> "N/A" then tcWebApi_get("WLan_Entry2","HideSSID","s") end if%>";
      get_endis_allow_guest = "<%if tcWebApi_get("WLan_Entry2","GuestAllowLocal","h") <> "N/A" then tcWebApi_get("WLan_Entry2","GuestAllowLocal","s") end if%>";
	  old_endis_wireless_isolation="<%if tcWebApi_get("WLan_Entry2","NoForwarding","h") <> "N/A" then tcWebApi_get("WLan_Entry2","NoForwarding","s") end if%>";
	  form.ssid.value = "<%if tcWebApi_get("WLan_Entry2","SSID","h") <> "N/A" then tcWebApi_get("WLan_Entry2","SSID","s") end if%>";
	  if( get_endis_guestNet == 1 )
		form.enable_bssid.checked = true;
	  else
		form.enable_bssid.checked = false;
	  if( get_endis_guestSSIDbro == 0 )
		 form.enable_ssid_bc.checked = true;
	  else
		 form.enable_ssid_bc.checked = false;
      if( get_endis_allow_guest == 1 )
         form.allow_access.checked = true;
      else
         form.allow_access.checked = false;
	  if(old_endis_wireless_isolation == 1)
		 form.enable_isolate.checked = true;
	  else
		 form.enable_isolate.checked = false;
		
      <%if tcWebApi_get("WLan_Entry2","AuthMode","h") <> "N/A" then%>
	      <%if tcWebApi_get("WLan_Entry2","AuthMode","h") = "OPEN" then%>
	           form.security_type[0].checked=true;
			   wl_sectype = 1;
		  <%elseif tcWebApi_get("WLan_Entry2","AuthMode","h") = "WEP-64Bits" then%>
	           form.security_type[1].checked=true;
			   wl_sectype = 2;
		  <%elseif tcWebApi_get("WLan_Entry2","AuthMode","h") = "WEP-128Bits" then%>
		       form.security_type[1].checked=true;
			   wl_sectype = 2;
		  <%elseif tcWebApi_get("WLan_Entry2","AuthMode","h") = "WPAPSK" then%>
	           form.security_type[2].checked=true;
			   wl_sectype = 3;
		  <%elseif tcWebApi_get("WLan_Entry2","AuthMode","h") = "WPA2PSK" then%>
	           form.security_type[3].checked=true;
			   wl_sectype = 4;
		  <%elseif tcWebApi_get("WLan_Entry2","AuthMode","h") = "WPAPSKWPA2PSK" then%>
	           form.security_type[4].checked=true;
			   wl_sectype = 5;
		  <%elseif tcWebApi_get("WLan_Entry2","AuthMode","h") = "WPA" then%>
	           form.security_type[5].checked=true;
			   wl_sectype = 6;
		  <%elseif tcWebApi_get("WLan_Entry2","AuthMode","h") = "WPA2" then%>
	           form.security_type[5].checked=true;
			   wl_sectype = 6;
		  <%else%>
	           form.security_type[5].checked=true;
			   wl_sectype = 6;
		  <%end if%>
	   <%end if%>
	   setSecurity(wl_sectype);
   }
   else if(form.ssidSelect[2].checked==true)
   {
      getObj('pro_count').innerHTML = 3;
	  get_endis_guestNet="<%if tcWebApi_get("WLan_Entry3","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan_Entry3","EnableSSID","s") end if%>";
	  get_endis_guestSSIDbro="<%if tcWebApi_get("WLan_Entry3","HideSSID","h") <> "N/A" then tcWebApi_get("WLan_Entry3","HideSSID","s") end if%>";
      get_endis_allow_guest = "<%if tcWebApi_get("WLan_Entry3","GuestAllowLocal","h") <> "N/A" then tcWebApi_get("WLan_Entry3","GuestAllowLocal","s") end if%>";
	  old_endis_wireless_isolation="<%if tcWebApi_get("WLan_Entry3","NoForwarding","h") <> "N/A" then tcWebApi_get("WLan_Entry3","NoForwarding","s") end if%>";
	  form.ssid.value = "<%if tcWebApi_get("WLan_Entry3","SSID","h") <> "N/A" then tcWebApi_get("WLan_Entry3","SSID","s") end if%>";
	  if( get_endis_guestNet == 1 )
		form.enable_bssid.checked = true;
	  else
		form.enable_bssid.checked = false;
      if( get_endis_guestSSIDbro == 0 )
		 form.enable_ssid_bc.checked = true;
	  else
		 form.enable_ssid_bc.checked = false;
      if( get_endis_allow_guest == 1 )
         form.allow_access.checked = true;
      else
         form.allow_access.checked = false;
	  if(old_endis_wireless_isolation == 1)
		 form.enable_isolate.checked = true;
	  else
		 form.enable_isolate.checked = false;
		
	  <%if tcWebApi_get("WLan_Entry3","AuthMode","h") <> "N/A" then%>
	      <%if tcWebApi_get("WLan_Entry3","AuthMode","h") = "OPEN" then%>
	           form.security_type[0].checked=true;
			   wl_sectype = 1;
		  <%elseif tcWebApi_get("WLan_Entry3","AuthMode","h") = "WEP-64Bits" then%>
	           form.security_type[1].checked=true;
			   wl_sectype = 2;
		  <%elseif tcWebApi_get("WLan_Entry3","AuthMode","h") = "WEP-128Bits" then%>
		       form.security_type[1].checked=true;
			   wl_sectype = 2;
		  <%elseif tcWebApi_get("WLan_Entry3","AuthMode","h") = "WPAPSK" then%>
	           form.security_type[2].checked=true;
			   wl_sectype = 3;
		  <%elseif tcWebApi_get("WLan_Entry3","AuthMode","h") = "WPA2PSK" then%>
	           form.security_type[3].checked=true;
			   wl_sectype = 4;
		  <%elseif tcWebApi_get("WLan_Entry3","AuthMode","h") = "WPAPSKWPA2PSK" then%>
	           form.security_type[4].checked=true;
			   wl_sectype = 5;
		  <%elseif tcWebApi_get("WLan_Entry3","AuthMode","h") = "WPA" then%>
	           form.security_type[5].checked=true;
			   wl_sectype = 6;
		  <%elseif tcWebApi_get("WLan_Entry3","AuthMode","h") = "WPA2" then%>
	           form.security_type[5].checked=true;
			   wl_sectype = 6;
		  <%else%>
	           form.security_type[5].checked=true;
			   wl_sectype = 6;
		  <%end if%>
	   <%end if%>
	   setSecurity(wl_sectype);
   }
}

function Check_Profile_5g()
{
   var form=document.forms[0];
   if(form.ssidSelect_an[0].checked==true)
   {
       getObj('pro_count_5g').innerHTML = 1;
	   get_endis_guestNet_an="<%if tcWebApi_get("WLan11ac_Entry1","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","EnableSSID","s") end if%>";
	   get_endis_guestSSIDbro_an="<%if tcWebApi_get("WLan11ac_Entry1","HideSSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","HideSSID","s") end if%>";
       get_endis_allow_guest_an = "<%if tcWebApi_get("WLan11ac_Entry1","GuestAllowLocal","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","GuestAllowLocal","s") end if%>";
	   old_endis_wireless_isolation_an="<%if tcWebApi_get("WLan11ac_Entry1","NoForwarding","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","NoForwarding","s") end if%>";
	   form.ssid_an.value = "<%if tcWebApi_get("WLan11ac_Entry1","SSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","SSID","s") end if%>";
	   if( get_endis_guestNet_an == 1 )
		   form.enable_bssid_an.checked = true;
	   else
		   form.enable_bssid_an.checked = false;
	   if( get_endis_guestSSIDbro_an == 0 )
		   form.enable_ssid_bc_an.checked = true;
	   else
		   form.enable_ssid_bc_an.checked = false;
       if( get_endis_allow_guest_an == 1 )
           form.allow_access_an.checked = true;
       else
           form.allow_access_an.checked = false;
	   if(old_endis_wireless_isolation_an == 1)
		   form.enable_isolation_an.checked = true;
	   else
		   form.enable_isolation_an.checked = false;
	   <%if tcWebApi_get("WLan11ac_Entry1","AuthMode","h") <> "N/A" then%>
	        <%if tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "OPEN" then%>
	             form.security_type_an[0].checked=true;
			     wl_sectype_an = 1;
		    <%elseif tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WEP-64Bits" then%>
	             form.security_type_an[1].checked=true;
			     wl_sectype_an = 2;
		    <%elseif tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WEP-128Bits" then%>
		         form.security_type_an[1].checked=true;
			     wl_sectype_an = 2;
		    <%elseif tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WPAPSK" then%>
	             form.security_type_an[2].checked=true;
			     wl_sectype_an = 3;
		    <%elseif tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WPA2PSK" then%>
	             form.security_type_an[3].checked=true;
			     wl_sectype_an = 4;
		    <%elseif tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WPAPSKWPA2PSK" then%>
	             form.security_type_an[4].checked=true;
			     wl_sectype_an = 5;
		    <%elseif tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WPA" then%>
	             form.security_type_an[5].checked=true;
			     wl_sectype_an = 6;
		    <%elseif tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WPA2" then%>
	             form.security_type_an[5].checked=true;
			     wl_sectype_an = 6;
		    <%else%>
	             form.security_type_an[5].checked=true;
			     wl_sectype_an = 6;
		    <%end if%>
	   <%end if%>
	   setSecurity_an(wl_sectype_an);
   }
   else if(form.ssidSelect_an[1].checked==true)
   {
       getObj('pro_count_5g').innerHTML = 2;
	   get_endis_guestNet_an="<%if tcWebApi_get("WLan11ac_Entry2","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","EnableSSID","s") end if%>";
	   get_endis_guestSSIDbro_an="<%if tcWebApi_get("WLan11ac_Entry2","HideSSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","HideSSID","s") end if%>";
       get_endis_allow_guest_an = "<%if tcWebApi_get("WLan11ac_Entry2","GuestAllowLocal","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","GuestAllowLocal","s") end if%>";
	   old_endis_wireless_isolation_an="<%if tcWebApi_get("WLan11ac_Entry2","NoForwarding","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","NoForwarding","s") end if%>";
	   form.ssid_an.value = "<%if tcWebApi_get("WLan11ac_Entry2","SSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","SSID","s") end if%>";
	   if( get_endis_guestNet_an == 1 )
		   form.enable_bssid_an.checked = true;
	   else
		   form.enable_bssid_an.checked = false;
	   if( get_endis_guestSSIDbro_an == 0 )
		   form.enable_ssid_bc_an.checked = true;
	   else
		   form.enable_ssid_bc_an.checked = false;
       if( get_endis_allow_guest_an == 1 )
           form.allow_access_an.checked = true;
       else
           form.allow_access_an.checked = false;
	   if(old_endis_wireless_isolation_an == 1)
		   form.enable_isolation_an.checked = true;
	   else
		   form.enable_isolation_an.checked = false;
	   <%if tcWebApi_get("WLan11ac_Entry2","AuthMode","h") <> "N/A" then%>
	        <%if tcWebApi_get("WLan11ac_Entry2","AuthMode","h") = "OPEN" then%>
	             form.security_type_an[0].checked=true;
			     wl_sectype_an = 1;
		    <%elseif tcWebApi_get("WLan11ac_Entry2","AuthMode","h") = "WEP-64Bits" then%>
	             form.security_type_an[1].checked=true;
			     wl_sectype_an = 2;
		    <%elseif tcWebApi_get("WLan11ac_Entry2","AuthMode","h") = "WEP-128Bits" then%>
		         form.security_type_an[1].checked=true;
			     wl_sectype_an = 2;
		    <%elseif tcWebApi_get("WLan11ac_Entry2","AuthMode","h") = "WPAPSK" then%>
	             form.security_type_an[2].checked=true;
			     wl_sectype_an = 3;
		    <%elseif tcWebApi_get("WLan11ac_Entry2","AuthMode","h") = "WPA2PSK" then%>
	             form.security_type_an[3].checked=true;
			     wl_sectype_an = 4;
		    <%elseif tcWebApi_get("WLan11ac_Entry2","AuthMode","h") = "WPAPSKWPA2PSK" then%>
	             form.security_type_an[4].checked=true;
			     wl_sectype_an = 5;
		    <%elseif tcWebApi_get("WLan11ac_Entry2","AuthMode","h") = "WPA" then%>
	             form.security_type_an[5].checked=true;
			     wl_sectype_an = 6;
		    <%elseif tcWebApi_get("WLan11ac_Entry2","AuthMode","h") = "WPA2" then%>
	             form.security_type_an[5].checked=true;
			     wl_sectype_an = 6;
		    <%else%>
	             form.security_type_an[5].checked=true;
			     wl_sectype_an = 6;
		    <%end if%>
	   <%end if%>
	   setSecurity_an(wl_sectype_an);
   }
   else if(form.ssidSelect_an[2].checked==true)
   {
       getObj('pro_count_5g').innerHTML = 3;
	   get_endis_guestNet_an="<%if tcWebApi_get("WLan11ac_Entry3","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","EnableSSID","s") end if%>";
	   get_endis_guestSSIDbro_an="<%if tcWebApi_get("WLan11ac_Entry3","HideSSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","HideSSID","s") end if%>";
       get_endis_allow_guest_an = "<%if tcWebApi_get("WLan11ac_Entry3","GuestAllowLocal","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","GuestAllowLocal","s") end if%>";
	   old_endis_wireless_isolation_an="<%if tcWebApi_get("WLan11ac_Entry3","NoForwarding","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","NoForwarding","s") end if%>";
	   form.ssid_an.value = "<%if tcWebApi_get("WLan11ac_Entry3","SSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","SSID","s") end if%>";
	   if( get_endis_guestNet_an == 1 )
		   form.enable_bssid_an.checked = true;
	   else
		   form.enable_bssid_an.checked = false;
	   if( get_endis_guestSSIDbro_an == 0 )
		   form.enable_ssid_bc_an.checked = true;
	   else
		   form.enable_ssid_bc_an.checked = false;
       if( get_endis_allow_guest_an == 1 )
           form.allow_access_an.checked = true;
       else
           form.allow_access_an.checked = false;
	   if(old_endis_wireless_isolation_an == 1)
		   form.enable_isolation_an.checked = true;
	   else
		   form.enable_isolation_an.checked = false;
	   <%if tcWebApi_get("WLan11ac_Entry3","AuthMode","h") <> "N/A" then%>
	        <%if tcWebApi_get("WLan11ac_Entry3","AuthMode","h") = "OPEN" then%>
	             form.security_type_an[0].checked=true;
			     wl_sectype_an = 1;
		    <%elseif tcWebApi_get("WLan11ac_Entry3","AuthMode","h") = "WEP-64Bits" then%>
	             form.security_type_an[1].checked=true;
			     wl_sectype_an = 2;
		    <%elseif tcWebApi_get("WLan11ac_Entry3","AuthMode","h") = "WEP-128Bits" then%>
		         form.security_type_an[1].checked=true;
			     wl_sectype_an = 2;
		    <%elseif tcWebApi_get("WLan11ac_Entry3","AuthMode","h") = "WPAPSK" then%>
	             form.security_type_an[2].checked=true;
			     wl_sectype_an = 3;
		    <%elseif tcWebApi_get("WLan11ac_Entry3","AuthMode","h") = "WPA2PSK" then%>
	             form.security_type_an[3].checked=true;
			     wl_sectype_an = 4;
		    <%elseif tcWebApi_get("WLan11ac_Entry3","AuthMode","h") = "WPAPSKWPA2PSK" then%>
	             form.security_type_an[4].checked=true;
			     wl_sectype_an = 5;
		    <%elseif tcWebApi_get("WLan11ac_Entry3","AuthMode","h") = "WPA" then%>
	             form.security_type_an[5].checked=true;
			     wl_sectype_an = 6;
		    <%elseif tcWebApi_get("WLan11ac_Entry3","AuthMode","h") = "WPA2" then%>
	             form.security_type_an[5].checked=true;
			     wl_sectype_an = 6;
		    <%else%>
	             form.security_type_an[5].checked=true;
			     wl_sectype_an = 6;
		    <%end if%>
	   <%end if%>
	   setSecurity_an(wl_sectype_an);
   }
}
</script>
</BODY>
</HTML>
