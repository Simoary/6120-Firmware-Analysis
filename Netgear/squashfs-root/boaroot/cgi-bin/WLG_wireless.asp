<%
	 if request_Form("wlanWEPFlag") = "1" then
		tcWebApi_set("WebCurSet_Entry","wlan_id","hidden_wlan_id")
		tcWebApi_set("WLan_Common","Country","WRegionCity")
		tcWebApi_set("WLan_Common","CountryCode","WRegionCode")
		tcWebApi_set("WLan_Common","CountryRegion","CountryRegion")
		tcWebApi_set("WLan_Common","Channel","wl_hidden_wlan_channel")
		tcWebApi_set("WLan_Entry","HideSSID","wl_enable_ssid_broadcast")
		tcWebApi_set("WLan_Entry","NoForwarding","wl_endis_wireless_isolation")
		tcWebApi_set("WLan_Entry","SSID","wl_ssid")
		if request_Form("opmode") = "1" then
		   tcWebApi_set("WLan_Common","WirelessMode","wlmode_bg")
		   tcWebApi_set("WLan_Common","WirelessModeIndex","opmode")
		elseif request_Form("opmode") = "2" then
			tcWebApi_set("WLan_Common","HT_BW","wla_hidden_HTBW_20")
			tcWebApi_set("WLan_Common","WirelessMode","wlmode_bgn")
			tcWebApi_set("WLan_Common","WirelessModeIndex","opmode")
		else
			tcWebApi_set("WLan_Common","HT_BW","wla_hidden_HTBW_20_40")
			tcWebApi_set("WLan_Common","WirelessMode","wlmode_bgn")
			tcWebApi_set("WLan_Common","WirelessModeIndex","opmode")
		end if
		tcWebApi_set("WLan_Entry","WPSConfMode","wl_hidden_wps_enable")
		if request_Form("wl_hidden_sec_type") = "0" then
		   tcWebApi_set("WLan_Entry","AuthMode","wl_hidden_auth_type")
		elseif request_Form("wl_hidden_sec_type") = "1" then
		   tcWebApi_set("WLan_Entry","WPSConfMode","wl_hidden_wps_disable")
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
		elseif request_Form("wl_hidden_sec_type") = "2" then
		   tcWebApi_set("WLan_Entry","WPSConfMode","wl_hidden_wps_disable")
		   tcWebApi_set("WLan_Entry","AuthMode","wl_hidden_wpapsk_auth_type_tkip")
		   tcWebApi_set("WLan_Entry","EncrypType","wl_hidden_auth_type_tkip")
		   tcWebApi_set("WLan_Entry","WPAPSK","passphrase")
		elseif request_Form("wl_hidden_sec_type") = "3" then
		   tcWebApi_set("WLan_Entry","AuthMode","wl_hidden_wpa2psk_auth_type_aes")
		   tcWebApi_set("WLan_Entry","EncrypType","wl_hidden_auth_type_aes")
		   tcWebApi_set("WLan_Entry","WPAPSK","passphrase")
		elseif request_Form("wl_hidden_sec_type") = "4" then
		   tcWebApi_set("WLan_Entry","AuthMode","wl_hidden_wpawpa2psk_auth_type_tkipaes")
		   tcWebApi_set("WLan_Entry","EncrypType","wl_hidden_auth_type_tkipaes")
		   tcWebApi_set("WLan_Entry","WPAPSK","passphrase")		  
		elseif request_Form("wl_hidden_sec_type") = "5" then
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

	 if request_Form("wlan_5G_WEPFlag") = "1" then
		tcWebApi_set("WebCurSet_Entry","wlan_ac_id","hidden_wlan_ac_id")
		tcWebApi_set("WLan11ac_Common","Country","WRegionCity")
		tcWebApi_set("WLan11ac_Common","CountryCode","WRegionCode")
		if Request_Form("WRegionCity") = "SOUTH AFRICA" then
		   tcWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand6")
		elseif Request_Form("WRegionCity") = "CHINA" then
		   tcWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")
		elseif Request_Form("WRegionCity") = "GERMANY" then
		   tcWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand6")
		elseif Request_Form("WRegionCity") = "ISRAEL" then
		   tcWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand6")
		elseif Request_Form("WRegionCity") = "JAPAN" then
		   tcWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand6")
		elseif Request_Form("WRegionCity") = "IRAN" then
		   tcWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")
		elseif Request_Form("WRegionCity") = "TURKEY" then
		   tcWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand6")
		elseif Request_Form("WRegionCity") = "UNITED ARAB EMIRATES" then
		   tcWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand6")
		elseif Request_Form("WRegionCity") = "RUSSIA" then
		   tcWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand6")
		elseif Request_Form("WRegionCity") = "TAIWAN" then
		   tcWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")
		else
		   tcWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand10")
		end if
		tcWebApi_set("WLan11ac_Common","Channel","wla_hidden_wlan_channel")
		tcWebApi_set("WLan11ac_Entry","HideSSID","wla_enable_ssid_broadcast")
		tcWebApi_set("WLan11ac_Entry","NoForwarding","wla_endis_wireless_isolation")
		tcWebApi_set("WLan11ac_Entry","SSID","wla_ssid")
		if request_Form("opmode_an") = "1" then
		   tcWebApi_set("WLan11ac_Common","WirelessMode","wlmode_a")
		   tcWebApi_set("WLan11ac_Common","WirelessModeIndex","opmode_an")
		elseif request_Form("opmode_an") = "2" then
			if tcWebApi_get("SkuId_Entry","WiFi5GMode","h") = "0" then
			   tcWebApi_set("WLan11ac_Common","HT_BW","wla_hidden_HTBW_20")
			else
			   tcWebApi_set("WLan11ac_Common","HT_BW","wla_hidden_HTBW_20_40")
			end if
			tcWebApi_set("WLan11ac_Common","WirelessMode","wlmode_an")
			tcWebApi_set("WLan11ac_Common","WirelessModeIndex","opmode_an")
		else
			if tcWebApi_get("SkuId_Entry","WiFi5GMode","h") = "0" then
			   tcWebApi_set("WLan11ac_Common","HT_BW","wla_hidden_HTBW_20_40")
			   tcWebApi_set("WLan11ac_Common","WirelessMode","wlmode_an")
			   tcWebApi_set("WLan11ac_Common","WirelessModeIndex","opmode_an")
			else
			   tcWebApi_set("WLan11ac_Common","HT_BW","wla_hidden_HTBW_20_40")
			   tcWebApi_set("WLan11ac_Common","WirelessMode","wlmode_anac")
			   tcWebApi_set("WLan11ac_Common","WirelessModeIndex","opmode_an")
			end if
		end if
		
		tcWebApi_set("WLan11ac_Entry","WPSConfMode","wla_hidden_wps_enable")
		if request_Form("wl_hidden_sec_type") = "1" then
		   tcWebApi_set("WLan11ac_Entry","WPSConfMode","wla_hidden_wps_disable")
		end if
		if request_Form("wl_hidden_sec_type") = "2" then
		   tcWebApi_set("WLan11ac_Entry","WPSConfMode","wla_hidden_wps_disable")
		end if

		if request_Form("wla_hidden_sec_type") = "0" then
		   tcWebApi_set("WLan11ac_Entry","AuthMode","wla_hidden_auth_type")
		elseif request_Form("wla_hidden_sec_type") = "1" then
		   tcWebApi_set("WLan11ac_Entry","WPSConfMode","wla_hidden_wps_disable")
		   if request_Form("Wepenc_an") = "5" then
			  tcWebApi_set("WLan11ac_Entry","AuthMode","wla_hidden_wep_64_auth_typ")
		   elseif request_Form("Wepenc_an") = "13" then
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
		elseif request_Form("wla_hidden_sec_type") = "2" then
		   tcWebApi_set("WLan11ac_Entry","AuthMode","wla_hidden_wpapsk_auth_type_tkip")
		   tcWebApi_set("WLan11ac_Entry","EncrypType","wla_hidden_auth_type_tkip")
		   tcWebApi_set("WLan11ac_Entry","WPAPSK","wla_hidden_wpa_psk")
		elseif request_Form("wla_hidden_sec_type") = "3" then
		   tcWebApi_set("WLan11ac_Entry","AuthMode","wla_hidden_wpa2psk_auth_type_aes")
		   tcWebApi_set("WLan11ac_Entry","EncrypType","wla_hidden_auth_type_aes")
		   tcWebApi_set("WLan11ac_Entry","WPAPSK","wla_hidden_wpa_psk")
		elseif request_Form("wla_hidden_sec_type") = "4" then
		   tcWebApi_set("WLan11ac_Entry","AuthMode","wla_hidden_wpawpa2psk_auth_type_tkipaes")
		   tcWebApi_set("WLan11ac_Entry","EncrypType","wla_hidden_auth_type_tkipaes")
		   tcWebApi_set("WLan11ac_Entry","WPAPSK","wla_hidden_wpa_psk")		   
		elseif request_Form("wla_hidden_sec_type") = "5" then
		   if request_Form("wla_hidden_wlan_mode") = "1" then
			  tcWebApi_set("WLan11ac_Entry","AuthMode","wla_hidden_wpa_auth_type_tkip")
			  tcWebApi_set("WLan11ac_Entry","EncrypType","wla_hidden_auth_type_tkip")
			  tcWebApi_set("WLan11ac_Entry","RADIUS_Server","radiusServerIP_a")
			  tcWebApi_set("WLan11ac_Entry","RADIUS_Port","textWpaeRadiusPort_an")
			  tcWebApi_set("WLan11ac_Entry","RADIUS_Key","textWpaeRadiusSecret_an")
		   elseif request_Form("wla_hidden_wlan_mode") = "3" then
			  tcWebApi_set("WLan11ac_Entry","AuthMode","wla_hidden_wpawpa2_auth_type_tkipaes")
			  tcWebApi_set("WLan11ac_Entry","EncrypType","wla_hidden_auth_type_tkipaes")
			  tcWebApi_set("WLan11ac_Entry","RADIUS_Server","radiusServerIP_a")
			  tcWebApi_set("WLan11ac_Entry","RADIUS_Port","textWpaeRadiusPort_an")
			  tcWebApi_set("WLan11ac_Entry","RADIUS_Key","textWpaeRadiusSecret_an")
			else
			  tcWebApi_set("WLan11ac_Entry","AuthMode","wla_hidden_wpa2_auth_type_aes")
			  tcWebApi_set("WLan11ac_Entry","EncrypType","wla_hidden_auth_type_aes")
			  tcWebApi_set("WLan11ac_Entry","RADIUS_Server","radiusServerIP_a")
			  tcWebApi_set("WLan11ac_Entry","RADIUS_Port","textWpaeRadiusPort_an")
			  tcWebApi_set("WLan11ac_Entry","RADIUS_Key","textWpaeRadiusSecret_an")
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
<script language=javascript type=text/javascript src="/aye_utils.js"></script>
<title><%tcWebApi_multilingual("1","glbstr_title")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onkeydown="KeyDown(event);" onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/WLG_wireless.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="wlan">

<div class="page_title" id="title"><%tcWebApi_multilingual("1","wireless_setting_str")%></div>
<div class="fix_button" id="check_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
	<input class="cancel_bt" type='button' name="Cancel" id="cancel" value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick='location.href="WLG_wireless.asp";'>&nbsp;&nbsp;
        <input class="apply_bt" type='submit' name="Apply" id="apply" value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onclick='return check_wlan();'>        </TD>
</TR>
</TABLE>
</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>


<script>
var wlan_enable="<%If tcWebApi_get("WLan_Common","APOn","h") <> "N/A" then tcWebApi_get("WLan_Common","APOn","s") end if%>";
var wlan5g_enable="<%If tcWebApi_get("WLan11ac_Common","APOn","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","APOn","s") end if%>";
var wlan_wps_enable="<%If tcWebApi_get("WLan_Entry","WPSConfMode","h") <> "N/A" then tcWebApi_get("WLan_Entry","WPSConfMode","s") end if%>";
var wlan5g_wps_enable="<%If tcWebApi_get("WLan11ac_Entry","WPSConfMode","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry","WPSConfMode","s") end if%>";
var netgear_region=top.netgear_region;
var wl_txctrl_web = "0";
var wla_txctrl_web = "0";
var host_name=parent.host_name;
var is_vc_release = parent.is_vc_release;
var wl_disablecoext="1";
var wep_security_str="<%tcWebApi_multilingual("1","wep_security_str")%>";
var wireless_repeating_str="<%tcWebApi_multilingual("1","wireless_repeating_str")%>";
var radius_server_port_str="<%tcWebApi_multilingual("1","radius_server_port_str")%>";
var invalid_password_str="<%tcWebApi_multilingual("1","invalid_password_str")%>";
var characters_radius_str="<%tcWebApi_multilingual("1","characters_radius_str")%>";
var wpa_enterprise_str="<%tcWebApi_multilingual("1","wpa_enterprise_str")%>";
var invalid_ip_str="<%tcWebApi_multilingual("1","invalid_ip_str")%>";
var conflict_ip_str="<%tcWebApi_multilingual("1","conflict_ip_str")%>";
var wps_in_process_str="<%tcWebApi_multilingual("1","wps_in_process_str")%>";
var ssid_blank_str="<%tcWebApi_multilingual("1","ssid_blank_str")%>";
var ssid_duplicate_str="<%tcWebApi_multilingual("1","ssid_duplicate_str")%>";
var ssid_character_str="<%tcWebApi_multilingual("1","ssid_character_str")%>";
var ssid_wep_support_str="<%tcWebApi_multilingual("1","ssid_wep_support_str")%>";
var wpapsk_guest_str="<%tcWebApi_multilingual("1","wpapsk_guest_str")%>";
var netgear_recommand_str="<%tcWebApi_multilingual("1","netgear_recommand_str")%>";
var dfs_channel_allow_str="<%tcWebApi_multilingual("1","dfs_channel_allow_str")%>";
var mins_str="<%tcWebApi_multilingual("1","mins_str")%>";
var seconds_channel_str="<%tcWebApi_multilingual("1","seconds_channel_str")%>";
var dfs_channel_str="<%tcWebApi_multilingual("1","dfs_channel_str")%>";
var dfs_channel_str="<%tcWebApi_multilingual("1","dfs_channel_str")%>";
var only_54mbps_rate_str = "<%tcWebApi_multilingual("1","only_54mbps_rate_str")%>";
var broadcast_disable_str = "<%tcWebApi_multilingual("1","broadcast_disable_str")%>";

var wlan_mode_54 = "<%tcWebApi_multilingual("1","up_to_54Mbps_str")%>";
var wlan_mode_150 = "<%tcWebApi_multilingual("1","up_to_150Mbps_str")%>";
var wlan_mode_400 = "<%tcWebApi_multilingual("1","up_to_400Mbps_str")%>";
var wlan_mode_433 = "<%tcWebApi_multilingual("1","up_to_433Mbps_str")%>";

var wps_progress_status="";
<%If tcWebApi_get("WLan_Common","APOn","h") = "1" then%>
   wps_progress_status="<%if tcWebApi_get("Info_WLan","wlanWPSStatus ","h") <> "" then tcWebApi_get("Info_WLan","wlanWPSStatus","s") end if%>";
   <%if request_Form("wlanWEPFlag") = "1" then%>
      if(wps_progress_status == "In progress")
         alert(wps_in_process_str);
   <%end if%>
<%else%>
   wps_progress_status="<%if tcWebApi_get("Info_WLan11ac","wlanWPSStatus ","h") <> "" then tcWebApi_get("Info_WLan11ac","wlanWPSStatus","s") end if%>";
   <%if request_Form("wlan_5G_WEPFlag") = "1" then%>
      if(wps_progress_status == "In progress")
         alert(wps_in_process_str);
   <%end if%>
<%end if%>

if( parent.mode_is_300 == 1 )
{
	var wlan_mode_130 = "<%tcWebApi_multilingual("1","up_to_145Mbps_str")%>";
	var wlan_mode_300 = "<%tcWebApi_multilingual("1","up_to_300Mbps_str")%>";
	var msg = "Per Wi-Fi Alliance guidelines for 40 Mhz and 20 Mhz coexistence, even if you select \'Up to 300Mbps\' mode, your products service rate might drop to 20 Mhz. This typically corresponds to 130Mbps to 145Mbps performance.";
}
else{
	var wlan_mode_130 = "<%tcWebApi_multilingual("1","up_to_65Mbps_str")%>";
	var wlan_mode_300 = "<%tcWebApi_multilingual("1","up_to_150Mbps_str")%>";
    // var msg = "Per Wi-Fi Alliance guidelines for 40 Mhz and 20 Mhz coexistence, even if you select \'Up to 150Mbps\' mode, your products service rate might drop to 20 Mhz. This typically corresponds to 65Mbps to 65Mbps performance.";
}
var wl_key1 = "<%If tcWebApi_get("WLan_Entry0","Key1Str","h") <> "N/A" then tcWebApi_get("WLan_Entry0","Key1Str","s") end if%>";
var wl_key2 = "<%If tcWebApi_get("WLan_Entry0","Key2Str","h") <> "N/A" then tcWebApi_get("WLan_Entry0","Key2Str","s") end if%>";
var wl_key3 = "<%If tcWebApi_get("WLan_Entry0","Key3Str","h") <> "N/A" then tcWebApi_get("WLan_Entry0","Key3Str","s") end if%>";
var wl_key4 = "<%If tcWebApi_get("WLan_Entry0","Key4Str","h") <> "N/A" then tcWebApi_get("WLan_Entry0","Key4Str","s") end if%>";
var wla_key1 = "";
var wla_key2 = "";
var wla_key3 = "";
var wla_key4 = "";

var wep_64_key1 = "";
var wep_64_key2 = "";
var wep_64_key3 = "";
var wep_64_key4 = "";
var wep_64_key1_a = "";
var wep_64_key2_a = "";
var wep_64_key3_a = "";
var wep_64_key4_a = "";

var wep_128_key1 = "";
var wep_128_key2 = "";
var wep_128_key3 = "";
var wep_128_key4 = "";
var wep_128_key1_a = "";
var wep_128_key2_a = "";
var wep_128_key3_a = "";
var wep_128_key4_a = "";

var lanIP = "192.168.1.1";
var lanSubnet = "255.255.255.0";
var wanIP = "172.17.144.126";
var wanSubnet = "255.255.254.0";

var str_wpae="";
var str_none="";
var str_wep="";
var str_wpa="";
var str_wpa2="";
var str_wpas="";
var str_none_an="";
var str_wep_an="";
var str_wpa_an="";
var str_wpa2_an="";
var str_wpas_an="";
var old_sectype="4";

<%if tcWebApi_get("WLan_Entry0","AuthMode","h") <> "N/A" then
    if tcWebApi_get("WLan_Entry0","AuthMode","h") = "WPA2" then%>
	    var get_wpae_mode="WPAE-AES";
    <%elseif tcWebApi_get("WLan_Entry0","AuthMode","h") = "WPA1WPA2" then%>
	    var get_wpae_mode="WPAE-TKIPAES";
	<%else%>
	     var get_wpae_mode="WPAE-TKIP";
	<%end if%>
	var get_radiusSerIp="<%tcWebApi_get("WLan_Entry0","RADIUS_Server","s")%>"
	var get_radiusPort ="<%tcWebApi_get("WLan_Entry0","RADIUS_Port","s")%>"
	var get_RadiusSecret = "<%tcWebApi_get("WLan_Entry0","RADIUS_Key","s")%>"
<%end if%>
var get_endis_guestNet="";
var get_endis_guestSSIDbro="";
var get_endis_allow_guest="";
var get_wpae_mode_a="WPAE-TKIPAES";
var get_radiusSerIp_a="";
var get_radiusPort_a="1812";
var get_endis_guestNet_a="";
var get_endis_guestSSIDbro_a="";
var get_endis_allow_guest_a="";

var StartChannel = new Array(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1); 
var FinishChannel = new Array(11,13,13,13,11,13,13,13,13,13,13,13,11,13,13,13,13,13,13,13,13,11,11); //middle east move up two line
//bug 23854:The dialogue of DFS channel is not implemented
var dfs_info="#";
dfs_info = dfs_info.substring(0, dfs_info.length - 1);//delete the last char '#' 

var wl_get_channel="1000";
var wla_get_channel="<%if tcWebApi_get("WLan11ac_Common","Channel","h") <> "" then tcWebApi_get("WLan11ac_Common","Channel","s") else asp_write("44") end if %>"; //get the current using channel 
var wl_get_countryA="4";

var old_endis_ssid_broadcast=<%if tcWebApi_get("WLan_Entry0","HideSSID ","h") <> "" then tcWebApi_get("WLan_Entry0","HideSSID","s") end if%>;
var old_wla_endis_ssid_broadcast=<%if tcWebApi_get("WLan11ac_Entry0","HideSSID ","h") <> "" then tcWebApi_get("WLan11ac_Entry0","HideSSID","s") end if%>;
var get_enable_video_value="0";
var old_endis_wireless_isolation=<%if tcWebApi_get("WLan_Entry0","NoForwarding","h") <> "" then tcWebApi_get("WLan_Entry0","NoForwarding","s") end if%>;
var old_wla_endis_wireless_isolation=<%if tcWebApi_get("WLan11ac_Entry0","NoForwarding","h") <> "" then tcWebApi_get("WLan11ac_Entry0","NoForwarding","s") end if%>;

var an_router_flag = parent.an_router_flag;
var str_have_an="";
var guest_router_flag=parent.guest_router_flag;
var wire_iso_flag=parent.wire_iso_flag;

var video_router_flag = parent.video_router_flag;
var dfs_channel_router_flag = parent.dfs_channel_router_flag;
var dfs_channel2_router_flag = parent.dfs_channel2_router_flag;/* bug 25665: DFS channel supported in canada,Europe and Austrilia */

var guest_mode_flag="0";
var wla_guest_mode_flag="";
var wifi5g_mode = "<%tcWebApi_get("SkuId_Entry","WiFi5GMode","s")%>";

</script>
<input type="hidden" name="hidden_wlan_mode">
<input type="hidden" name="hidden_wlan_channel">
<input type="hidden" name="generate_flag">
<input type="hidden" name="old_length">
<input type="hidden" name="old_length_a">
<input type="hidden" name="wl_sec_wpaphrase_len">
<input type="hidden" name="wla_sec_wpaphrase_len">
<input type="hidden" name="wl_hidden_wpa_psk">
<input type="hidden" name="wla_hidden_wpa_psk">
<input type="hidden" name="hidden_sec_type">
<input type="hidden" name="wep_press_flag">
<input type="hidden" name="wpa1_press_flag" value=0>
<input type="hidden" name="wpa2_press_flag" value=0>
<input type="hidden" name="wpas_press_flag" value=0>
<input type="hidden" name="wla_wpa1_press_flag" value=0>
<input type="hidden" name="wla_wpa2_press_flag" value=0>
<input type="hidden" name="wla_wpas_press_flag" value=0>
<input type="hidden" name="wps_change_flag" value="5">
<input type="hidden" name="hidden_enable_guestNet">
<input type="hidden" name="hidden_enable_ssidbro">
<input type="hidden" name="hidden_allow_guest">
<input type="hidden" name="radiusServerIP">
<input type="hidden" name="radiusServerIP_a">
<input type="hidden" name="opmode_bg">
<input type="hidden" name="wl_mode">

<input type="hidden" name="wl_ssid">
<input type="hidden" name="wla_ssid">
<input type="hidden" name="wl_WRegion">
<input type="hidden" name="CountryRegion" value="0">
<input type="hidden" name="wl_hidden_wlan_channel">
<input type="hidden" name="wla_hidden_wlan_channel">
<input type="hidden" name="wl_hidden_wlan_mode">
<input type="hidden" name="wla_hidden_wlan_mode">
<input type="hidden" name="wl_hidden_sec_type">
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
<input type="hidden" name="wla_hidden_sec_type">

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

<input type="hidden" name="wla_hidden_HTBW_20" value="0">
<input type="hidden" name="wla_hidden_HTBW_20_40" value="1">

<input type="hidden" name="wla_hidden_wps_disable" value="0">
<input type="hidden" name="wla_hidden_wps_enable" value="7">

<input type="hidden" name="hidden_endis_wl_wps" value="1">
<input type="hidden" name="hidden_endis_wla_wps" value="1">

<input type="hidden" name="hidden_WpaeRadiusSecret">
<input type="hidden" name="hidden_WpaeRadiusSecret_a">

<input type="hidden" name="wl_enable_ssid_broadcast" value="0">
<input type="hidden" name="wla_enable_ssid_broadcast" value="0">
<input type="hidden" name="hidden_enable_video">

<input type="hidden" name="wl_tx_ctrl">
<input type="hidden" name="wla_tx_ctrl">
<input type="hidden" name="wl_endis_wireless_isolation" value="0">
<input type="hidden" name="wla_endis_wireless_isolation" value="0">

<input type="hidden" name="wlanWEPFlag" value="0">
<input type="hidden" name="wlan_5G_WEPFlag" value="0">
<input type="hidden" name="wlmode_bg" value="0">
<input type="hidden" name="wlmode_n" value="6">
<input type="hidden" name="wlmode_bgn" value="9">
<input type="hidden" name="wlmode_a" value="2">
<input type="hidden" name="wlmode_an" value="8">
<input type="hidden" name="wlmode_anac" value="14">
<input type="hidden" name="WRegionCity" value="0">
<input type="hidden" name="WRegionCode" value="FR">
<input type="hidden" name="hidden_wlan_id" value="0">
<input type="hidden" name="hidden_wlan_ac_id" value="0">

<input type="hidden" name="CountryRegionABand0" value="0">
<input type="hidden" name="CountryRegionABand1" value="1">
<input type="hidden" name="CountryRegionABand2" value="2">
<input type="hidden" name="CountryRegionABand3" value="3">
<input type="hidden" name="CountryRegionABand4" value="4">
<input type="hidden" name="CountryRegionABand5" value="5">
<input type="hidden" name="CountryRegionABand6" value="6">
<input type="hidden" name="CountryRegionABand7" value="7">
<input type="hidden" name="CountryRegionABand8" value="8">
<input type="hidden" name="CountryRegionABand9" value="9">
<input type="hidden" name="CountryRegionABand10" value="10">
<input type="hidden" name="CountryRegionABand11" value="11">
<script>
if(an_router_flag == 1)
{
	document.write('<TR><TD nowrap colspan=2><A tabindex=-1 href="javascript:loadhelp(\'_wlan\',\'network\')"><B>' + '<%tcWebApi_multilingual("1","region_select_str")%>' + '</B></A></TD></TR>');
	document.write('<TR> <TD nowrap width=35%>' + '<%tcWebApi_multilingual("1","region_str")%>:' + '</TD><TD nowrap>');
	/*if(netgear_region.toUpperCase() == "NA" || netgear_region.toUpperCase() == "JP")
		document.write('<select name="WRegion" id="wireless_region" size="1" onchange="chgChA(1);setChannel();" >');
	else*/
		document.write('<select name="WRegion" id="wireless_region" size="1" onchange="chgChA(1);setChannel();">');
		//document.write('<option value=12>--- Select Region ---</option>');  //remove select region for new spec -->
			document.write('<option value=0>' + '<%tcWebApi_multilingual("1","africa_str")%>' + '</option>');
			document.write('<option value=1>' + '<%tcWebApi_multilingual("1","asia_str")%>' + '</option>');
			document.write('<option value=2>' + '<%tcWebApi_multilingual("1","australia_str")%>' + '</option>');
			document.write('<option value=3>' + '<%tcWebApi_multilingual("1","canada_str")%>' + '</option>');
			document.write('<option value=4>' + '<%tcWebApi_multilingual("1","china_str")%>' + '</option>');
			document.write('<option value=5>' + '<%tcWebApi_multilingual("1","europe_str")%>' + '</option>');
			document.write('<option value=6>' + '<%tcWebApi_multilingual("1","india_str")%>' + '</option>');
			document.write('<option value=7>' + '<%tcWebApi_multilingual("1","israel_str")%>' + '</option>');
			document.write('<option value=8>' + '<%tcWebApi_multilingual("1","japan_str")%>' + '</option>');
			document.write('<option value=9>' + '<%tcWebApi_multilingual("1","korea_str")%>' + '</option>');
			document.write('<option value=10>' + '<%tcWebApi_multilingual("1","malaysia_str")%>' + '</option>');
			document.write('<option value=11>' + '<%tcWebApi_multilingual("1","mexico_str")%>' + '</option>');
			document.write('<option value=12>' + '<%tcWebApi_multilingual("1","middle_algeria_str")%>' + '</option>');
			document.write('<option value=13>' + '<%tcWebApi_multilingual("1","middle_iran_str")%>' + '</option>');
			document.write('<option value=14>' + '<%tcWebApi_multilingual("1","middle_turkey_str")%>' + '</option>');
			document.write('<option value=15>' + '<%tcWebApi_multilingual("1","middle_saudi_str")%>' + '</option>');
			document.write('<option value=16>' + '<%tcWebApi_multilingual("1","middle_united_str")%>' + '</option>');
			document.write('<option value=17>' + '<%tcWebApi_multilingual("1","russia_str")%>' + '</option>');
			document.write('<option value=18>' + '<%tcWebApi_multilingual("1","singapore_str")%>' + '</option>');
			document.write('<option value=19>' + '<%tcWebApi_multilingual("1","south_america_str")%>' + '</option>');
			document.write('<option value=20>' + '<%tcWebApi_multilingual("1","taiwan_str")%>' + '</option>');
			document.write('<option value=21>' + '<%tcWebApi_multilingual("1","united_states_str")%>' + '</option>');
	document.write('</select></TD></TR>');
	document.write('<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>');
}
</script>
<TR> 
	<TD nowrap colspan=2><A tabindex=-1 href="javascript:loadhelp('_wlan','network')"><B><%tcWebApi_multilingual("1","wireless_network_str");%> <script>if( an_router_flag == 1) document.write("(2.4GHz b/g/n)")</script></B></A></TD>
</TR>
<TR id=ssid_bc_bgn>
	<TD nowrap>
	<input type="checkbox" name="ssid_bc" id="enable_ssid_bc" value="1"><%tcWebApi_multilingual("1","ssid_broadcast_enable_str")%>	</TD>
</TR>
<TR id=guestiso>
	<TD nowrap>
	<input type="checkbox" name="enable_isolation" id="enable_isolation" value="1"><%tcWebApi_multilingual("1","wireless_islation_enable_str")%>	</TD>
</TR>
<TR> 
	<TD nowrap width=35%><%tcWebApi_multilingual("1","name_ssid_str")%>:</TD>
	<TD nowrap><input type="text" name="ssid" id="ssid" value="<%if tcWebApi_get("WLan_Entry0","SSID","h") <> "N/A" then tcWebApi_get("WLan_Entry0","SSID","s") end if%>" size="20" maxlength="32"></TD>
</TR>
<tr style="display:none">
	<td><input type="text" name="wlssid_1" value="<%if tcWebApi_get("WLan_Entry1","SSID","h") <> "" then tcWebApi_get("WLan_Entry1","SSID","s") end if%>" size="20" maxlength="32"></td>
    <td><input type="text" name="wlssid_2" value="<%if tcWebApi_get("WLan_Entry2","SSID","h") <> "" then tcWebApi_get("WLan_Entry2","SSID","s") end if%>" size="20" maxlength="32"></td>
    <td><input type="text" name="wlssid_3" value="<%if tcWebApi_get("WLan_Entry3","SSID","h") <> "" then tcWebApi_get("WLan_Entry3","SSID","s") end if%>" size="20" maxlength="32"></td>
	<td><input type="text" name="wlassid_1" value="<%if tcWebApi_get("WLan11ac_Entry1","SSID","h") <> "" then tcWebApi_get("WLan11ac_Entry1","SSID","s") end if%>" size="20" maxlength="32"></td>
    <td><input type="text" name="wlassid_2" value="<%if tcWebApi_get("WLan11ac_Entry2","SSID","h") <> "" then tcWebApi_get("WLan11ac_Entry2","SSID","s") end if%>" size="20" maxlength="32"></td>
    <td><input type="text" name="wlassid_3" value="<%if tcWebApi_get("WLan11ac_Entry3","SSID","h") <> "" then tcWebApi_get("WLan11ac_Entry3","SSID","s") end if%>" size="20" maxlength="32"></td>
</tr>
<script>
if(an_router_flag == 0)
{
        document.write('<TR> <TD nowrap width=35%>' + '<%tcWebApi_multilingual("1","region_str")%>:' + '</TD><TD nowrap>');
		if(netgear_region.toUpperCase() == "NA" || netgear_region.toUpperCase() == "JP")
			document.write('<select name="WRegion" id="wireless_region" size="1" onchange="setChannel();" >');
		else
			document.write('<select name="WRegion" id="wireless_region" size="1" onchange="chgChA(1);setChannel();">');
			//document.write('<option value=12>--- Select Region ---</option>');  //remove select region for new spec -->
					document.write('<option value=0>' + '<%tcWebApi_multilingual("1","africa_str")%>' + '</option>');
					document.write('<option value=1>' + '<%tcWebApi_multilingual("1","asia_str")%>' + '</option>');
					document.write('<option value=2>' + '<%tcWebApi_multilingual("1","australia_str")%>' + '</option>');
					document.write('<option value=3>' + '<%tcWebApi_multilingual("1","canada_str")%>' + '</option>');
					document.write('<option value=4>' + '<%tcWebApi_multilingual("1","europe_str")%>' + '</option>');
					document.write('<option value=5>' + '<%tcWebApi_multilingual("1","israel_str")%>' + '</option>');
					document.write('<option value=6>' + '<%tcWebApi_multilingual("1","japan_str")%>' + '</option>');
					document.write('<option value=7>' + '<%tcWebApi_multilingual("1","korea_str")%>' + '</option>');
					document.write('<option value=8>' + '<%tcWebApi_multilingual("1","mexico_str")%>' + '</option>');
					document.write('<option value=11>' + '<%tcWebApi_multilingual("1","middle_east_str")%>' + '</option>'); //<!-- @@@ move up two line -->
					document.write('<option value=9>' + '<%tcWebApi_multilingual("1","south_america_str")%>' + '</option>');
				if(netgear_region.toUpperCase() == "NA")
					document.write('<option value=10>' + '<%tcWebApi_multilingual("1","north_america_str")%>' + '</option>');
				else
					document.write('<option value=10>' + '<%tcWebApi_multilingual("1","united_states_str")%>' + '</option>');
        document.write('</select></TD></TR>');
}
</script>
<TR> 
	<TD nowrap width=35%><%tcWebApi_multilingual("1","channel_str")%>:</TD>
	<TD nowrap>
	<select name="w_channel" id="wireless_channel" size="1">
		<option selected>Auto</option> 
		<option value=1>01</option>
		<option value=2>02</option>
		<option value=3>03</option>
		<option value=4>04</option>
		<option value=5>05</option>
		<option value=6>06</option>
		<option value=7>07</option>
		<option value=8>08</option>
		<option value=9>09</option>
		<option value=10>10</option>
		<option value=11>11</option>
		<option value=12>12</option>
		<option value=13>13</option>
		<option value=14>14</option>
	</select>	</TD>
</TR>
<TR> 
	<TD nowrap width=35%><%tcWebApi_multilingual("1","mode_str")%>:</TD>
	<TD nowrap id="opmode_all">
	<select name="opmode" id="opmode" size="1" onChange="wl_sectype_change()">
		<option value="1"><script>document.write(wlan_mode_54); if( is_vc_release == 1 ) document.write(' ' + 'b/g only');</script></option>
		<option value="2"><script>document.write(wlan_mode_130); if( is_vc_release == 1 ) document.write(' ' + 'b/g/n mixed mode (neighbor friendly)');</script></option>
		<option value="3"><script>document.write(wlan_mode_300); if( is_vc_release == 1 ) document.write(' ' + 'b/g/n mixed mode');</script></option>
<script>
	if( is_vc_release == 1 )
	{
		document.write('<option value="4">'+wlan_mode_300+' g/n only</option>');
		document.write('<option value="5">'+wlan_mode_300+' n only</option>');	
	}
</script>		
        </select>	</TD>
	<TD nowrap id="opmode_54">
	<select name="opmode54" size="1" onChange="wl_54_sectype_change()">
		<option value="1"><script>document.write(wlan_mode_54); if( is_vc_release == 1 ) document.write(' ' +'b/g only');</script></option>		
    </select>	</TD>
</TR>
</TABLE>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
	<TD nowrap colspan=2><A tabindex=-1 href="javascript:loadhelp('_wlan','security')"><B><%tcWebApi_multilingual("1","security_option_str")%></B></A></TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="security_type" id="security_type" value="Disable" onClick=setSecurity(1) AccessKey="N"><%tcWebApi_multilingual("1","none_str")%>
	<TD></TR>
<TR id="wep_54">
	<TD nowrap colspan=2>
	<input type="radio" name="security_type" id="security_type" value="WEP" onClick=setSecurity(2)><%tcWebApi_multilingual("1","wep_str")%>	</TD>
</TR>
<TR id="wpa_psk_54">
	<TD nowrap colspan=2>
	<input type="radio" name="security_type" id="security_type" value="WPA-PSK" onClick=setSecurity(3)><%tcWebApi_multilingual("1","wpa_psk_tkip_str")%>	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="security_type" id="security_type" value="WPA2-PSK" onClick=setSecurity(4)><%tcWebApi_multilingual("1","wpa2_psk_aes_str")%>	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="security_type" id="security_type" value="AUTO-PSK" onClick=setSecurity(5)><%tcWebApi_multilingual("1","wpapskTKIP_wpa2psk_AES_str")%>	</TD>
</TR>
<TR style="display:none">
	<TD nowrap colspan=2>
	<input type="radio" name="security_type" id="security_type" value="WPA-Enterprise" onClick=setSecurity(6)><%tcWebApi_multilingual("1","wpa_wpa2_enterprise_str")%>	</TD>
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
		<A tabindex=-1 href="javascript:loadhelp('_wlan','wep')"><B><%tcWebApi_multilingual("1","security_option_wep_str")%></B></A>		</TD>
	</TR>
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","authentication_type_str")%></TD>
		<TD nowrap>
			<select NAME="authAlgm" id="wep_auth_type" size="1">
				<option value=1  ><%tcWebApi_multilingual("1","shared_key_str")%></option>
				<option value=2 SELECTED ><%tcWebApi_multilingual("1","automatic_str")%></option>
			</select>		</TD>
	</TR>
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","encryption_strength_str")%></TD>
		<TD nowrap> 
			<select NAME="wepenc" id="wep_enc_strength" size="1" onChange="changekeylen(document.forms[0]);">
				<option value=5   ><%tcWebApi_multilingual("1","wep_64bit_str")%></option>
				<option value=13  ><%tcWebApi_multilingual("1","wep_128bit_str")%></option>
			</select>		</TD>
	</TR>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan','wepkey')"><B><%tcWebApi_multilingual("1","security_encryption_wep_key_str")%></B></A>		</TD>
	</TR>
	<!--<TR>
		<TD nowrap colspan=2>&nbsp;<%tcWebApi_multilingual("1","passphrase_str")%> :&nbsp;
			<input type="text" size="16" maxlength="32" NAME="passphraseStr" id="wep_passphrase" VALUE="">&nbsp;&nbsp;
			<input class="short_common_bt" type="button" name="Generate" id="wep_generate" value="<%tcWebApi_multilingual("0","glbstr_generate")%>" OnClick="clickgenerate(document.forms[0])">		</TD>
	</TR>-->
	<TR>
		<TD nowrap colspan=2>
		<TABLE>
		<TR>
			<TD nowrap><%tcWebApi_multilingual("1","key1_str")%>
			<input type=radio NAME="wep_key_no" id="wep_key_no" checked value="1">			</TD>
			<TD nowrap>
			<input TYPE="TEXT" SIZE="document.forms[0].wepenc.value*2+2" MAXLENGTH="32" NAME="KEY1" id="key1" VALUE="" OnFocus="this.maxLength=document.forms[0].wepenc.value*2;this.size=document.forms[0].wepenc.value*2+2;">			</TD>
		</TR>
		<TR>
			<TD nowrap><%tcWebApi_multilingual("1","key2_str")%>
			<input type=radio NAME="wep_key_no" id="wep_key_no" value="2">			</TD>
			<TD nowrap>
			<input TYPE="TEXT" SIZE="document.forms[0].wepenc.value*2+2" MAXLENGTH="32" NAME="KEY2" id="key2" VALUE="" OnFocus="this.maxLength=document.forms[0].wepenc.value*2;this.size=document.forms[0].wepenc.value*2+2;">			</TD>
		</TR>
		<TR>
			<TD nowrap><%tcWebApi_multilingual("1","key3_str")%>
			<input type=radio NAME="wep_key_no" id="wep_key_no" value="3">			</TD>
			<TD nowrap><input TYPE="TEXT" SIZE="document.forms[0].wepenc.value*2+2" MAXLENGTH="32" NAME="KEY3" id="key3" VALUE="" OnFocus="this.maxLength=document.forms[0].wepenc.value*2;this.size=document.forms[0].wepenc.value*2+2;">			</TD>
		</TR>
		<TR>
			<TD nowrap><%tcWebApi_multilingual("1","key4_str")%>
			<input type=radio NAME="wep_key_no" id="wep_key_no" value="4">			</TD>
			<TD nowrap>
			<input TYPE="TEXT" SIZE="document.forms[0].wepenc.value*2+2" MAXLENGTH="32" NAME="KEY4" id="key4" VALUE=""  OnFocus="this.maxLength=document.forms[0].wepenc.value*2;this.size=document.forms[0].wepenc.value*2+2;">			</TD>
		</TR>
		</TABLE>		</TD>
	</TR>
	</TABLE>
</div>

<div align="center" ID="wpa" style="position:absolute;top:0;left:0;visibility:hidden">
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan','wpa-psk')"><B><%tcWebApi_multilingual("1","security_option_str")%> (<%tcWebApi_multilingual("1","security_option_wpapsk_str")%>)</B></A>		</TD>
	</TR>
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","passphrase_str")%> :</TD>
		<TD nowrap>
		<input type="text" id="textWpaPwdPhrase" size="20" maxlength="64" name="passphrase" id="passphrase" value="<%If tcWebApi_get("WLan_Entry0","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry0","WPAPSK","s") end if%>" onFocus="document.forms[0].wpa1_press_flag.value=1" onKeyPress="document.forms[0].wpa1_press_flag.value=1">
		<span class="optiondesc" id="wpaPwdPhrExtText"><%tcWebApi_multilingual("1","characters_str")%></span>		</TD>
	</TR>
	</TABLE>
</div>
 
<div align="center" ID="wpa2" style="position:absolute;top:0;left:0;visibility:hidden">  
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan','wpa2-psk')"><B><%tcWebApi_multilingual("1","security_option_wpa2psk_str")%> (WPA2-PSK)</B></A>		</TD>
	</TR>
	<TR>
		<TD nowrap>
		<span class="optiondesc" id="wpaPwdPhraseText"><%tcWebApi_multilingual("1","passphrase_str")%> :</span>		</TD>
		<TD nowrap>
		<input type="text" id="textWpaPwdPhrase" maxlength="64" size="20" name="passphrase" id="passphrase" value="<%If tcWebApi_get("WLan_Entry0","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry0","WPAPSK","s") end if%>" onFocus="document.forms[0].wpa2_press_flag.value=1" onKeyPress="document.forms[0].wpa2_press_flag.value=1">
		<span class="optiondesc" id="wpaPwdPhrExtText"><%tcWebApi_multilingual("1","characters_str")%></span>		</TD>
	</TR>
	</TABLE>
</div>

<div align="center" ID="wpas" style="position:absolute;top:0;left:0;visibility:hidden">
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan','wpa-psk+wpa2-psk')"><B><%tcWebApi_multilingual("1","security_option_wpapsk_wpa2psk_str")%> (WPA-PSK + WPA2-PSK)</B></A>		</TD>
	</TR>
	<TR>
		<TD nowrap>
		<span class="optiondesc" id="wpaPwdPhraseText"><%tcWebApi_multilingual("1","passphrase_str")%> :</span>		</TD>
		<TD nowrap>
		<input type="text" id="textWpaPwdPhrase" size="20" maxlength="64" name="passphrase" id="passphrase" value="<%If tcWebApi_get("WLan_Entry0","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry0","WPAPSK","s") end if%>" onFocus="document.forms[0].wpas_press_flag.value=1" onKeyPress="document.forms[0].wpas_press_flag.value=1">
		<span class="optiondesc" id="wpaPwdPhrExtText"><%tcWebApi_multilingual("1","characters_str")%></span>		</TD>	  
	</TR>
	</TABLE>
</div>

<div align="center" ID="wpae" style="position:absolute;top:0;left:0;visibility:hidden">
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan','wpawpa2')"><B><%tcWebApi_multilingual("1","security_option_str")%> ( <%tcWebApi_multilingual("1","security_option_wpawpa2_enterprise_str")%> )</B></A>		</TD>
	</TR>
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","wpa_mode_str")%></TD>
		<TD>
		<select name="wpae_mode" id="wpae_mode" size='1' onChange="wpaemode()">
			<option value='WPAE-TKIP'>WPA [TKIP]</option>
			<option value='WPAE-AES'>WPA2 [AES]</option>
			<option value='WPAE-TKIPAES'>WPA [TKIP] + WPA2 [AES]</option>
		</select>		</TD>
	</TR>
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","radius_serverIP_str")%></TD>
        <TD nowrap>
        <input type="text" size="3" autocomplete="off" maxlength="3" name="radiusIPAddr1" id="radius_ipaddress1" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);">.
        <input type="text" size="3" autocomplete="off" maxlength="3" name="radiusIPAddr2" id="radius_ipaddress2" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);">.
        <input type="text" size="3" autocomplete="off" maxlength="3" name="radiusIPAddr3" id="radius_ipaddress3" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);">.
        <input type="text" size="3" autocomplete="off" maxlength="3" name="radiusIPAddr4" id="radius_ipaddress4" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);">        </TD>  
	</TR>
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","radius_serverPort_str")%></TD>	
		<TD nowrap><input type="text" name="textWpaeRadiusPort" id="radius_port" size="20" maxlength="5" value="1812" onKeyPress="return getkey('num',event);"></TD>	
	</TR>	
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","radius_server_shared_secret_str")%></TD>	
		<TD nowrap><input type="text" name="textWpaeRadiusSecret" id="radius_secret" size="20" maxlength="128" value="" onKeyPress="return getkey('ssid', event)"></TD>	
	</TR>	
	</TABLE>
</div>

<!--the following message is for a/n -->
<div id="have_an"></div>  <!-- 201403111400, Tony, Enable wireless 5G -->
<div align="center" ID="hidden_an" style="position:absolute;top:0;left:0;visibility:hidden">
<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR> 
	<TD nowrap colspan=2><A tabindex=-1 href="javascript:loadhelp('_wlan','network')"><B><%tcWebApi_multilingual("1","wireless_network_str_5g")%> (5GHz a/n)</B></A></TD>
</TR>
<TR id=ssid_bc_an>
	<TD nowrap>
	<input type="checkbox" name="ssid_bc_an" id="ssid_bc_an" value="1"><%tcWebApi_multilingual("1","ssid_broadcast_enable_str")%> </TD>
</TR>
<TR id=guestiso_an>
	<TD nowrap>
	<input type="checkbox" name="enable_isolation_an" id="enable_isolation_an" value="1"><%tcWebApi_multilingual("1","wireless_islation_enable_str")%>	</TD>
</TR>
<TR id=video>
	<TD nowrap colspan=2><input type=checkbox name="enable_video" value='1'>
	<A tabindex=-1><%tcWebApi_multilingual("1","video_network_enable_str")%></A>	</TD>
</TR>
<TR> 
	<TD nowrap width=35%><%tcWebApi_multilingual("1","name_ssid_str")%>:</TD>
	<TD nowrap><input type="text" name="ssid_an" id="ssid_an" value="<%if tcWebApi_get("WLan11ac_Entry0","SSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry0","SSID","s") end if%>" size="20" maxlength="32"></TD>
</TR>
<TR> 
	<TD nowrap width=35%><%tcWebApi_multilingual("1","channel_str")%>:</TD>
	<TD nowrap>
	<select name="w_channel_an" id="wireless_channel_an" size="1">
<script>
if(dfs_channel_router_flag == 1 )
	document.write("<option selected value=0>Auto</option> ");
</script>
		<option value=36>36</option>
		<option value=40>40</option>
		<option value=44>44</option>
		<option value=48>48</option>
		<option value=149>149</option>
		<option value=153>153</option>
		<option value=157>157</option>
		<option value=161>161</option>
		<option value=165>165</option>
	</select>	</TD>
</TR>
<TR> 
	<TD nowrap width=35%><%tcWebApi_multilingual("1","mode_str")%>:</TD>
	<TD nowrap id="opmode_an_all">
	<select name="opmode_an" id="opmode_an" size="1" onChange="chgChA(2);wla_sectype_change();">
		<option value="1"><script>document.write(wlan_mode_54)</script><option>
		<option value="2"><script>document.write(wlan_mode_150)</script></option>
		<script>
		if(wifi5g_mode == "0")//20141106 Mark for WIFI CERTIFICATED
		{
			document.write('<option value="3">' + wlan_mode_300 + '</option>');
		}
		else if(wifi5g_mode == "1")
		{
			if(AYECOM_WIFI_CERTIFICATED == 0)
			{
				document.write('<option value="3">' + wlan_mode_433 + '</option>');
			}
		}
		
		</script>
        </select>	</TD>
		<TD nowrap id="opmode_an_54">
	<select name="opmode_an54" size="1" onChange="chgChA(2);wla_54_sectype_change();">
		<option value="1"><script>document.write(wlan_mode_54)</script></option>
    </select>	</TD>
</TR>
</TABLE>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
	<TD nowrap colspan=2><A tabindex=-1 href="javascript:loadhelp('_wlan','security')"><B><%tcWebApi_multilingual("1","security_option_str")%></B></A></TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="security_type_an" id="security_type_an" value="Disable" onClick=setSecurity_an(1) AccessKey="N"><%tcWebApi_multilingual("1","none_str")%>	</TD>
</TR>
<TR style="display:none">
	<TD nowrap colspan=2 id="wep_an_54" >
	<input type="radio" name="security_type_an" id="security_type_an" value="WEP" onClick=setSecurity_an(2)><%tcWebApi_multilingual("1","wep_str")%>	</TD>
</TR>
<TR style="display:none">
	<TD nowrap colspan=2 id="wpa_psk_an_54">
	<input type="radio" name="security_type_an" id="security_type_an" value="WPA-PSK" onClick=setSecurity_an(3)><%tcWebApi_multilingual("1","wpa_psk_tkip_str")%>	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="security_type_an" id="security_type_an" value="WPA2-PSK" onClick=setSecurity_an(4)><%tcWebApi_multilingual("1","wpa2_psk_aes_str")%>	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="security_type_an" id="security_type_an" value="AUTO-PSK" onClick=setSecurity_an(5)><%tcWebApi_multilingual("1","wpapskTKIP_wpa2psk_AES_str")%>	</TD>
</TR>
<TR>
	<TD nowrap colspan=2 style="display:none">  <!--201404181545, Tony, Disable Wireless 5G radius server-->
	<input type="radio" name="security_type_an" id="security_type_an" value="WPA-Enterprise" onClick=setSecurity_an(6)><%tcWebApi_multilingual("1","wpa_wpa2_enterprise_str")%>	</TD>
</TR>
</TABLE>

<div id=view_a></div>

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
		<A tabindex=-1 href="javascript:loadhelp('_wlan','wep')"><B><%tcWebApi_multilingual("1","security_option_wep_str")%></B></A>		</TD>
	</TR>
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","authentication_type_str")%></TD>
		<TD nowrap>
			<select NAME="authAlgm_an" id="wep_auth_type_an" size="1"><!--bug 21943:change authAlgm_a to authAlgm_an,other changes is same as this -->
				<option value=1  ><%tcWebApi_multilingual("1","shared_key_str")%></option>
				<option value=2 SELECTED ><%tcWebApi_multilingual("1","automatic_str")%></option>
			</select>		</TD>
	</TR>
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","encryption_strength_str")%></TD>
		<TD nowrap> 
			<select NAME="Wepenc_an" id="wep_enc_strength_an" size="1" onChange="changekeylen_a(document.forms[0]);">
				<option value=5   ><%tcWebApi_multilingual("1","wep_64bit_str")%></option>
				<option value=13  ><%tcWebApi_multilingual("1","wep_128bit_str")%></option>
			</select>		</TD>
	</TR>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan','wepkey')"><B><%tcWebApi_multilingual("1","security_encryption_wep_key_str")%></B></A>		</TD>
	</TR>
	<!--<TR>
		<TD nowrap colspan=2>&nbsp;<%tcWebApi_multilingual("1","passphrase_str")%> :&nbsp;
			<input type="text" size="16" maxlength="32" NAME="passphraseStr_an" id="wep_passphrase_an" VALUE="">&nbsp;&nbsp;
			<input class="short_common_bt" type="button" name="Generate_an" id="wep_generate_an" value="<%tcWebApi_multilingual("0","glbstr_generate")%>" OnClick="clickgenerate_a(document.forms[0])">		</TD>
	</TR>-->
	<TR>
		<TD nowrap colspan=2>
		<TABLE>
		<TR>
			<TD nowrap><%tcWebApi_multilingual("1","key1_str")%>
			<input type=radio NAME="wep_key_no_an" id="wep_key_no_an" checked value="1">			</TD>
			<TD nowrap>
			<input TYPE="TEXT" SIZE="document.forms[0].Wepenc_an.value*2+2" MAXLENGTH="32" NAME="KEY1_an" id="key1_an" VALUE="" OnFocus="this.maxLength=document.forms[0].Wepenc_an.value*2;this.size=document.forms[0].Wepenc_an.value*2+2;" onKeyPress="return getkey('wep', event)">			</TD>
		</TR>
		<TR>
			<TD nowrap><%tcWebApi_multilingual("1","key2_str")%>
			<input type=radio NAME="wep_key_no_an" id="wep_key_no_an" value="2">			</TD>
			<TD nowrap>
			<input TYPE="TEXT" SIZE="document.forms[0].Wepenc_an.value*2+2" MAXLENGTH="32" NAME="KEY2_an" id="key2_an" VALUE="" OnFocus="this.maxLength=document.forms[0].Wepenc_an.value*2;this.size=document.forms[0].Wepenc_an.value*2+2;" onKeyPress="return getkey('wep', event)">			</TD>
		</TR>
		<TR>
			<TD nowrap><%tcWebApi_multilingual("1","key3_str")%>
			<input type=radio NAME="wep_key_no_an" id="wep_key_no_an" value="3">			</TD>
			<TD nowrap><input TYPE="TEXT" SIZE="document.forms[0].Wepenc_an.value*2+2" MAXLENGTH="32" NAME="KEY3_an" id="key3_an" VALUE="" OnFocus="this.maxLength=document.forms[0].Wepenc_an.value*2;this.size=document.forms[0].Wepenc_an.value*2+2;" onKeyPress="return getkey('wep', event)">			</TD>
		</TR>
		<TR>
			<TD nowrap><%tcWebApi_multilingual("1","key4_str")%>
			<input type=radio NAME="wep_key_no_an" id="wep_key_no_an" value="4">			</TD>
			<TD nowrap>
			<input TYPE="TEXT" SIZE="document.forms[0].wepenc.value*2+2" MAXLENGTH="32" NAME="KEY4_an" id="key4_an" VALUE=""  OnFocus="this.maxLength=document.forms[0].Wepenc_an.value*2;this.size=document.forms[0].Wepenc_an.value*2+2;" onKeyPress="return getkey('wep', event)">			</TD>
		</TR>
		</TABLE>		</TD>
	</TR>
	</TABLE>
</div>

<div align="center" ID="wpa_an" style="position:absolute;top:0;left:0;visibility:hidden">
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan','wpa-psk')"><B><%tcWebApi_multilingual("1","security_option_str")%> (<%tcWebApi_multilingual("1","security_option_wpapsk_str")%>)</B></A>		</TD>
	</TR>
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","passphrase_str")%> :</TD>
		<TD nowrap>
		<input type="text" id="textWpaPwdPhrase" size="20" maxlength="64" name="passphrase_an" id="passphrase_an" value="<%If tcWebApi_get("WLan11ac_Entry0","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry0","WPAPSK","s") end if%>" onFocus="document.forms[0].wla_wpa1_press_flag.value=1" onKeyPress="document.forms[0].wla_wpa1_press_flag.value=1">
		<span class="optiondesc" id="wpaPwdPhrExtText"><%tcWebApi_multilingual("1","characters_str")%></span>		</TD>
	</TR>
	</TABLE>
</div>
 
<div align="center" ID="wpa2_an" style="position:absolute;top:0;left:0;visibility:hidden">  
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan','wpa2-psk')"><B><%tcWebApi_multilingual("1","security_option_wpa2psk_str")%> (WPA2-PSK)</B></A>		</TD>
	</TR>
	<TR>
		<TD nowrap>
		<span class="optiondesc" id="wpaPwdPhraseText"><%tcWebApi_multilingual("1","passphrase_str")%> :</span>		</TD>
		<TD nowrap>
		<input type="text" id="textWpaPwdPhrase" maxlength="64" size="20" name="passphrase_an" id="passphrase_an" value="<%If tcWebApi_get("WLan11ac_Entry0","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry0","WPAPSK","s") end if%>" onFocus="document.forms[0].wla_wpa2_press_flag.value=1" onKeyPress="document.forms[0].wla_wpa2_press_flag.value=1">
		<span class="optiondesc" id="wpaPwdPhrExtText"><%tcWebApi_multilingual("1","characters_str")%></span>		</TD>
	</TR>
	</TABLE>
</div>

<div align="center" ID="wpas_an" style="position:absolute;top:0;left:0;visibility:hidden">
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan','wpa-psk+wpa2-psk')"><B><%tcWebApi_multilingual("1","security_option_wpapsk_wpa2psk_str")%> (WPA-PSK + WPA2-PSK)</B></A>		</TD>
	</TR>
	<TR>
		<TD nowrap>
		<span class="optiondesc" id="wpaPwdPhraseText"><%tcWebApi_multilingual("1","passphrase_str")%> :</span>		</TD>
		<TD nowrap>
		<input type="text" id="textWpaPwdPhrase" size="20" maxlength="64" name="passphrase_an" id="passphrase_an" value="<%If tcWebApi_get("WLan11ac_Entry0","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry0","WPAPSK","s") end if%>" onFocus="document.forms[0].wla_wpas_press_flag.value=1" onKeyPress="document.forms[0].wla_wpas_press_flag.value=1">
		<span class="optiondesc" id="wpaPwdPhrExtText"><%tcWebApi_multilingual("1","characters_str")%></span>		</TD>	  
	</TR>
	</TABLE>
</div>

<div align="center" ID="wpae_an" style="position:absolute;top:0;left:0;visibility:hidden">
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan','wpawpa2')"><B><%tcWebApi_multilingual("1","security_option_str")%> ( <%tcWebApi_multilingual("1","security_option_wpawpa2_enterprise_str")%> )</B></A>		</TD>
	</TR>
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","wpa_mode_str")%></TD>
		<TD>
		<select name="wpae_mode_an" id="wpae_mode_an" size='1' onChange="wpaemode_an()">
			<option value='WPAE-TKIP'>WPA [TKIP]</option>
			<option value='WPAE-AES'>WPA2 [AES]</option>
			<option value='WPAE-TKIPAES'>WPA [TKIP] + WPA2 [AES]</option>
		</select>		</TD>
	</TR>
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","radius_serverIP_str")%></TD>
        <TD nowrap>
        <input type="text" size="3" autocomplete="off" maxlength="3" name="radiusIPAddr1_an" id="radius_ipaddress1_an" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);">.
        <input type="text" size="3" autocomplete="off" maxlength="3" name="radiusIPAddr2_an" id="radius_ipaddress2_an" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);">.
        <input type="text" size="3" autocomplete="off" maxlength="3" name="radiusIPAddr3_an" id="radius_ipaddress3_an" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);">.
        <input type="text" size="3" autocomplete="off" maxlength="3" name="radiusIPAddr4_an" id="radius_ipaddress4_an" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);">        </TD>  
	</TR>
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","radius_serverPort_str")%></TD>	
		<TD nowrap><input type="text" name="textWpaeRadiusPort_an" id="radius_port_an" size="20" maxlength="5" value="1812" onKeyPress="return getkey('num',event);"></TD>	
	</TR>	
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","radius_server_shared_secret_str")%></TD>	
		<TD nowrap><input type="text" name="textWpaeRadiusSecret_an" id="radius_secret_an" size="20" maxlength="128" value="" onKeyPress="return getkey('ssid', event)"></TD>	
	</TR>	
	</TABLE>
</div>
</div>

<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</TABLE>
</div> 
<div id="waiting_bar" style="display:none">
<div  align="center"><BR><BR><TR><TD align="center"><B><%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%></B></TD></TR><BR><BR></div>
<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" alt="waiting" /></div>
</div>
<!-- main -->
<%tcWebApi_multilingual("2","_wlan_help.asp")%>
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
		form.KEY1.size=form.KEY2.size=form.KEY3.size=form.KEY4.size=12;
		form.KEY1.value = wep_64_key1;
		form.KEY2.value = wep_64_key2;
		form.KEY3.value = wep_64_key3;
		form.KEY4.value = wep_64_key4;
	}
	else
	{
		form.KEY1.size=form.KEY2.size=form.KEY3.size=form.KEY4.size=28;
		form.KEY1.value = wep_128_key1;
		form.KEY2.value = wep_128_key2;
		form.KEY3.value = wep_128_key3;
		form.KEY4.value = wep_128_key4;
	}	
	form.generate_flag.value=0;
}
function changekeylen_a(form)
{
	if(form.Wepenc_an.options[0].selected == true)
	{
		form.KEY1_an.size=form.KEY2_an.size=form.KEY3_an.size=form.KEY4_an.size=12;
		form.KEY1_an.value = wep_64_key1_a;
		form.KEY2_an.value = wep_64_key2_a;
		form.KEY3_an.value = wep_64_key3_a;
		form.KEY4_an.value = wep_64_key4_a;
	}
	else
	{
		form.KEY1_an.size=form.KEY2_an.size=form.KEY3_an.size=form.KEY4_an.size=28;
		form.KEY1_an.value = wep_128_key1_a;
		form.KEY2_an.value = wep_128_key2_a;
		form.KEY3_an.value = wep_128_key3_a;
		form.KEY4_an.value = wep_128_key4_a;
	}	
	form.generate_flag.value=0;
}


var wl_sectype="4";
//var wlg1_sectype="1";
//var wla1_sectype="1";
var wds_endis_fun="0";
var endis_wl_radio="1";
var wl_get_keyno="<%If tcWebApi_get("WLan_Entry0","DefaultKeyID","h") <> "N/A" then tcWebApi_get("WLan_Entry0","DefaultKeyID","s") else asp_write("1") end if%>";
var wl_get_keylength="64";
var wps_status="5";

function opmode_disabled()
{
	document.getElementById("opmode_all").style.display="none";
	document.getElementById("opmode_54").style.display="";
}

function opmode_abled()
{
	document.getElementById("opmode_all").style.display="";
	document.getElementById("opmode_54").style.display="none";
}

function setSecurity(num)
{
	var form=document.forms[0];
	form.wpa1_press_flag.value=0;
	form.wpa2_press_flag.value=0;
	form.wpas_press_flag.value=0;
	if(num==2)
	{
		opmode_abled();
		getObj("view").innerHTML=str_wep;
		<%if tcWebApi_get("WLan_Entry0","WEPAuthType","h") = "WEPAuto" then%>
		     form.authAlgm.value=2;  //2 auto
		<%else%>
		     form.authAlgm.value=1;  //1 shared
		<%end if%>
	    <%if tcWebApi_get("WLan_Entry0","AuthMode","h") = "WEP-64Bits" then%>
	         form.wepenc.value=5;  //5 64bit
	    <%else%>
             form.wepenc.value=13;  //13 128bit
	    <%end if%>

		/* to fix bug 25282:The length of the wep key is changed shorter when you click it.*/
		changekeylen(form);

		var keyno=wl_get_keyno;
		var keylength=wl_get_keylength;
		form.wep_key_no[eval(keyno)-1].checked = true;
		form.KEY1.value=wl_key1;
		form.KEY2.value=wl_key2;
		form.KEY3.value=wl_key3;
		form.KEY4.value=wl_key4;
		form.old_length.value=keylength;
	}
	else if(num==3)
	{
		opmode_abled();
		getObj("view").innerHTML=str_wpa;
	}
	else if(num==4)
	{
		opmode_abled();
		wl_sectype_change();
		getObj("view").innerHTML=str_wpa2;
	}
	else if(num==5)
	{
		opmode_abled();
		wl_sectype_change();
		getObj("view").innerHTML=str_wpas;
	}
	else if (num==6)
	{
		getObj("view").innerHTML=str_wpae;
		form.wpae_mode.value = get_wpae_mode;
		if(form.wpae_mode.value == 'WPAE-TKIP')
			opmode_disabled();
		else
		{
			opmode_abled();
			wl_sectype_change();
		}
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
	{
		opmode_abled();
		wl_sectype_change();
		getObj("view").innerHTML=str_none;
	}
}

var wla_sectype="1";
var wla_wds_endis_fun="0";
var endis_wla_radio="1";
var wla_get_keyno="1";
var wla_get_keylength="64";

function opmode_an_disabled()
{
	document.getElementById("opmode_an_all").style.display="none";
	document.getElementById("opmode_an_54").style.display="";
}

function opmode_an_abled()
{
	document.getElementById("opmode_an_all").style.display="";
	document.getElementById("opmode_an_54").style.display="none";
}

function setSecurity_an(num)
{
	var form=document.forms[0];
	form.wla_wpa1_press_flag.value=0;
	form.wla_wpa2_press_flag.value=0;
	form.wla_wpas_press_flag.value=0;
	if(num==2)
	{
		opmode_an_disabled();
		getObj("view_a").innerHTML=str_wep_an;
		<%if tcWebApi_get("WLan11ac_Entry0","WEPAuthType","h") = "WEPAuto" then%>
		     form.authAlgm_an.value=2;  //2 auto
		<%else%>
		     form.authAlgm_an.value=1;  //1 shared
		<%end if%>
	    <%if tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "WEP-64Bits" then%>
	         form.Wepenc_an.value=5;  //5 64bit
	    <%else%>
             form.Wepenc_an.value=13;  //13 128bit
	    <%end if%>

		/* to fix bug 25282:The length of the wep key is changed shorter when you click it.*/
		changekeylen_a(form);

		var keyno=wla_get_keyno;
		var keylength=wla_get_keylength;
		form.wep_key_no_an[eval(keyno)-1].checked = true;
		form.KEY1_an.value=wla_key1;
		form.KEY2_an.value=wla_key2;
		form.KEY3_an.value=wla_key3;
		form.KEY4_an.value=wla_key4;
		form.old_length_a.value=keylength;
	}
	else if(num==3)
	{
		opmode_an_disabled();
		getObj("view_a").innerHTML=str_wpa_an;
	}
	else if(num==4)
	{
		opmode_an_abled();
		wla_sectype_change();
		getObj("view_a").innerHTML=str_wpa2_an;
	}
	else if(num==5)
	{
		opmode_an_abled();
		wla_sectype_change();
		getObj("view_a").innerHTML=str_wpas_an;
	}
	else if (num==6)
	{		
		getObj("view_a").innerHTML=str_wpae_an;
		form.wpae_mode_an.value = get_wpae_mode_a;
		if(form.wpae_mode_an.value == 'WPAE-TKIP')
			opmode_an_disabled();
		else
		{
			opmode_an_abled();
			wla_sectype_change();
		}
		if( get_radiusSerIp_a != "" && get_radiusSerIp_a != "0.0.0.0" )
		{
			radiusIPArray = get_radiusSerIp_a.split(".");
			form.radiusIPAddr1_an.value = radiusIPArray[0];
			form.radiusIPAddr2_an.value = radiusIPArray[1];
			form.radiusIPAddr3_an.value = radiusIPArray[2];
			form.radiusIPAddr4_an.value = radiusIPArray[3];
		}
		form.textWpaeRadiusPort_an.value = get_radiusPort_a;		
	}		
	else
	{
		opmode_an_abled();
		wla_sectype_change();
		getObj("view_a").innerHTML=str_none_an;
		
	}
}

function change_web_format()
{
	if( guest_router_flag == 1 && wire_iso_flag == 1)
        document.getElementById("guestiso").style.display=""; //201311071310, Tony, Enable Wireless Isolation
    else
        document.getElementById("guestiso").style.display="none";
	if( guest_router_flag == 1 && wire_iso_flag == 1 && an_router_flag ==1)
        document.getElementById("guestiso_an").style.display=""; //201311071310, Tony, Enable Wireless Isolation
    else
        document.getElementById("guestiso_an").style.display="none";
	if(video_router_flag == 1)
		document.getElementById("ssid_bc_bgn").style.display="";
	else
		document.getElementById("ssid_bc_bgn").style.display="none";
	if(an_router_flag ==1 && video_router_flag == 1 )
	{
			document.getElementById("ssid_bc_an").style.display="";
			document.getElementById("video").style.display="none"; //201311071310, Tony, Disable Wireless video network
	}
	else{
			document.getElementById("ssid_bc_an").style.display="none";
			document.getElementById("video").style.display="none";
	}
}

function wl_sectype_change()
{
	var form=document.forms[0];
	if(form.opmode.options[0].selected == true)
	{
		document.getElementById("wep_54").style.display="";
		if(AYECOM_WIFI_CERTIFICATED == 1)//20141106 Mark for WIFI CERTIFICATED
			document.getElementById("wpa_psk_54").style.display="none";
		else
			document.getElementById("wpa_psk_54").style.display="";
	}
	else
	{
		document.getElementById("wep_54").style.display="none";
		document.getElementById("wpa_psk_54").style.display="none";
	}
}

function wl_54_sectype_change()
{
	var form=document.forms[0];
	document.getElementById("wep_54").style.display="";
	if(AYECOM_WIFI_CERTIFICATED == 1)//20141106 Mark for WIFI CERTIFICATED
		document.getElementById("wpa_psk_54").style.display="none";
	else
		document.getElementById("wpa_psk_54").style.display="";
}

function wla_sectype_change()
{
	var form=document.forms[0];
	if(form.opmode_an.options[0].selected == true)
	{
		//document.getElementById("wep_an_54").style.display="none";  //201404181426, Tony Disable Wireless 5G WEP Mode
		//document.getElementById("wpa_psk_an_54").style.display="none";  //201404181426, Tony Disable Wireless 5G WPAPSK Mode
	}
	else
	{
		//document.getElementById("wep_an_54").style.display="none";
		//document.getElementById("wpa_psk_an_54").style.display="none";
	}
}

function wla_54_sectype_change()
{
	var form=document.forms[0];
	//document.getElementById("wep_an_54").style.display="none";  //201404181426, Tony Disable Wireless 5G WEP Mode
	//document.getElementById("wpa_psk_an_54").style.display="none";  //201404181426, Tony Disable Wireless 5G WPAPSK Mode
}

function wpaemode()
{
	var form=document.forms[0];
	if(form.wpae_mode.options[0].selected == true)
	{
		document.getElementById("opmode_all").style.display="none";
		document.getElementById("opmode_54").style.display="";
		document.getElementById("wep_54").style.display="";
		if(AYECOM_WIFI_CERTIFICATED == 1)//20141106 Mark for WIFI CERTIFICATED
			document.getElementById("wpa_psk_54").style.display="none";
		else
			document.getElementById("wpa_psk_54").style.display="";
	}
	else
	{
		document.getElementById("opmode_all").style.display="";
		document.getElementById("opmode_54").style.display="none";
		wl_sectype_change();
	}
}

function wpaemode_an()
{
	var form=document.forms[0];
	if(form.wpae_mode_an.options[0].selected == true)
	{
		document.getElementById("opmode_an_all").style.display="none";
		document.getElementById("opmode_an_54").style.display="";
		//document.getElementById("wep_an_54").style.display="";
		//document.getElementById("wpa_psk_an_54").style.display="";
	}
	else
	{
		document.getElementById("opmode_an_all").style.display="";
		document.getElementById("opmode_an_54").style.display="none";
		wla_sectype_change();
	}
}

function loadvalue()
{
	top.enabled_wds=0;
	if((wlan_enable == 1 || wlan5g_enable == 1) && (wlan_wps_enable == 7 || wlan5g_wps_enable == 7))
	   top.enabled_wps=1;
	else
	   top.enabled_wps=0;
	if(old_endis_ssid_broadcast == '1' || old_wla_endis_ssid_broadcast == '1')//disable WPS Wizard Mark 20141117
	   top.enabled_wps=0;
	else
	   top.enabled_wps=1;

	var href_split="";
	href_split = parent.document.location.href.split('/');	   
	if(href_split[4] == "adv_index.asp")
	{
		menu_color_change('wireless_setup');
	}
	
	
	var form=document.forms[0];
	
	change_web_format();	
	
	var channel=wl_get_channel;
	var mode="<%tcWebApi_get("WLan_Common","WirelessModeIndex","s")%>";
	var opmode_bg=""
	
	if( mode == '1')
		form.opmode.options[0].selected = true;
	else if( mode == '2')
		form.opmode.options[1].selected = true;
	else
		form.opmode.options[2].selected = true;	
			
	
	if( is_vc_release == 1 )
	{
		if( "" == "1" )
			form.opmode.options[3].selected = true;
		if( "" == "1" )
			form.opmode.options[4].selected = true;
	}

/*	if(opmode_bg != ""){
		if( opmode_bg == mode){}
		else
			mode=opmode_bg;
	}
*/
	//16400
        if(old_endis_wireless_isolation=='1')
			form.enable_isolation.checked = true;
		else
			form.enable_isolation.checked = false;
		if(old_endis_ssid_broadcast=='0')
                form.ssid_bc.checked = true;
        else
                form.ssid_bc.checked = false;

    <%if tcWebApi_get("SkuId_Entry","WirelessRegion","h") <> "N/A" then%>
	     <%if tcWebApi_get("SkuId_Entry","WirelessRegion","h") = "NA" then%>
             form.WRegion.disabled=true;
	     <%elseif tcWebApi_get("SkuId_Entry","WirelessRegion","h") = "RU" then%>
             form.WRegion.disabled=true;
		<%elseif tcWebApi_get("SkuId_Entry","WirelessRegion","h") = "JP" then%>
             form.WRegion.disabled=true;
	     <%end if%>
	<%end if%>
	
	<%if tcWebApi_get("WLan_Common","Country","h") <> "N/A" then%>
	     <%if tcWebApi_get("WLan_Common","Country","h") = "SOUTH AFRICA" then%>
	         form.WRegion.value="0";
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "THAILAND" then%>
	         form.WRegion.value="1";
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "AUSTRALIA" then%>
	         form.WRegion.value="2";
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "CANADA" then%>
	         form.WRegion.value="3";
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "CHINA" then%>
	         form.WRegion.value="4";
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "GERMANY" then%>
	         form.WRegion.value="5";//Europe 
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "INDIA" then%>
	         form.WRegion.value="6";
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "ISRAEL" then%>
	         form.WRegion.value="7";
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "JAPAN" then%>
	         form.WRegion.value="8";
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "KOREA REPUBLIC" then%>
	         form.WRegion.value="9";
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "MALAYSIA" then%>
	         form.WRegion.value="10";
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "MEXICO" then%>
	         form.WRegion.value="11";
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "YEMEN" then%>
	         form.WRegion.value="12";
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "IRAN" then%>
	         form.WRegion.value="13";
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "TURKEY" then%>
	         form.WRegion.value="14";
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "SAUDI ARABIA" then%>
	         form.WRegion.value="15";
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "UNITED ARAB EMIRATES" then%>
	         form.WRegion.value="16";
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "RUSSIA" then%>
	         form.WRegion.value="17";
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "SINGAPORE" then%>
	         form.WRegion.value="18";
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "BRAZIL" then%>
	         form.WRegion.value="19";
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "TAIWAN" then%>
	         form.WRegion.value="20";
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "UNITED STATES" then%>
	         form.WRegion.value="21";
		 <%end if%>
	<%end if%>
	

	if(channel == 1000)
		channel = 0;
	if(wds_endis_fun=="0")
		form.w_channel.value = <%tcWebApi_get("WLan_Common","Channel","s")%>;
	else if(channel=="0")
		form.w_channel.options[0].selected = true;
	else
		form.w_channel.value = <%tcWebApi_get("WLan_Common","Channel","s")%>;
		
	//setwlan_mode();
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
	
	<%if tcWebApi_get("WLan_Entry0","AuthMode","h") <> "N/A" then%>
	     <%if tcWebApi_get("WLan_Entry0","AuthMode","h") = "OPEN" then%>
	          form.security_type[0].checked=true;
			  wl_sectype = 1;
		 <%elseif tcWebApi_get("WLan_Entry0","AuthMode","h") = "WEP-64Bits" then%>
	          form.security_type[1].checked=true;
			  wl_sectype = 2;
		 <%elseif tcWebApi_get("WLan_Entry0","AuthMode","h") = "WEP-128Bits" then%>
		      form.security_type[1].checked=true;
			  wl_sectype = 2;
		 <%elseif tcWebApi_get("WLan_Entry0","AuthMode","h") = "WPAPSK" then%>
	          form.security_type[2].checked=true;
			  wl_sectype = 3;
		 <%elseif tcWebApi_get("WLan_Entry0","AuthMode","h") = "WPA2PSK" then%>
	          form.security_type[3].checked=true;
			  wl_sectype = 4;
		 <%elseif tcWebApi_get("WLan_Entry0","AuthMode","h") = "WPAPSKWPA2PSK" then%>
	          form.security_type[4].checked=true;
			  wl_sectype = 5;
		 <%elseif tcWebApi_get("WLan_Entry0","AuthMode","h") = "WPA" then%>
	          form.security_type[5].checked=true;
			  wl_sectype = 6;
		 <%elseif tcWebApi_get("WLan_Entry0","AuthMode","h") = "WPA2" then%>
	          form.security_type[5].checked=true;
			  wl_sectype = 6;
		 <%else%>
	          form.security_type[5].checked=true;
			  wl_sectype = 6;
		 <%end if%>
	<%end if%>
	
	 <%if tcWebApi_get("WLan_Common","WirelessMode","h") = "9" then%>
	    <%if tcWebApi_get("WLan_Entry0","AuthMode","h") = "WPAPSK" then%>
		      form.security_type[4].checked=true;
			  wl_sectype = 5;
		<%end if%>
     <%end if%>

	setSecurity(wl_sectype);
	var sectype=wl_sectype;	
	if ( wds_endis_fun == '0' || endis_wl_radio == '0' )
		setDisabled(false,form.security_type[2],form.security_type[3],form.security_type[4],form.security_type[5]);	
	else
		setDisabled(true,form.security_type[2],form.security_type[3],form.security_type[4],form.security_type[5]);

	//Bug 19665, should not be both set to wep in main network and guest network.
	var wl_guest_enable="0";
	var wl_guest_sectype="1";	
	if(wl_guest_enable==1 && wl_guest_sectype==2)
		form.security_type[1].disabled = true;
		
	//form.security_type[parseInt(sectype)-1].checked=true;

	if(wl_sectype == '2')
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
	}
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
	else if(wl_sectype==6)
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
	}		

 	
	if(an_router_flag == 1){	
		str_have_an=getObj("hidden_an").innerHTML;
		getObj("hidden_an").innerHTML='';
		getObj("have_an").innerHTML=str_have_an;

		var channel_a=wla_get_channel;
		var mode_an="<%tcWebApi_get("WLan11ac_Common","WirelessModeIndex","s")%>";

		if( mode_an == '1')
			form.opmode_an.options[0].selected = true;
		else
		{
			if(AYECOM_WIFI_CERTIFICATED == 0 || wifi5g_mode == "0")//20141106 Mark for WIFI CERTIFICATED
			{
				if( mode_an == '2')
					form.opmode_an.options[1].selected = true;
				else
					form.opmode_an.options[2].selected = true; //201404181426, Tony Disable Wireless 5G WEP Mode		
			}
			else
				form.opmode_an.options[1].selected = true;
		}
		
		//16400
	        if(old_wla_endis_ssid_broadcast=='0')
        	        form.ssid_bc_an.checked = true;
       	 	else
                	form.ssid_bc_an.checked = false;
		if(old_wla_endis_wireless_isolation=='1')
        	form.enable_isolation_an.checked = true;
       	else
            form.enable_isolation_an.checked = false;
		if( get_enable_video_value == 1 )
			form.enable_video.checked = true;
		else
			form.enable_video.checked = false;
		
		setAwlan_mode();  //set Wireless 5G Mode
		//setAChannel(form.w_channel_an);	//201403111400, Tony, Disable wireless 5G	
		setChannel();

		if(wla_wds_endis_fun=="0")
			form.w_channel_an.value = channel_a;
		else if(channel_a=="0")
			form.w_channel_an.options[0].selected = true;
		else
			form.w_channel_an.value = channel_a;
			
		<%if tcWebApi_get("WLan11ac_Common","Country","h") <> "N/A" then%>
		    <%if tcWebApi_get("WLan11ac_Common","Country","h") = "YEMEN" then%>
			     form.w_channel_an.disabled = true;
	             form.opmode_an.disabled = true;
			<%end if%>
		<%end if%>
		
		<%if tcWebApi_get("WLan11ac_Common","Country","h") <> "N/A" then%>
		    <%if tcWebApi_get("WLan11ac_Common","Country","h") = "CHINA" then%>
			   if(channel_a == "149" || channel_a == "153" || channel_a == "157" || channel_a == "161" || channel_a == "165")
			      form.w_channel_an.value = channel_a;
			   else
                  form.w_channel_an.options[0].selected = true;
			<%elseif tcWebApi_get("WLan11ac_Common","Country","h") = "IRAN" then%>	  
			   if(channel_a == "149" || channel_a == "153" || channel_a == "157" || channel_a == "161" || channel_a == "165")
			      form.w_channel_an.value = channel_a;
			   else
                  form.w_channel_an.options[0].selected = true;
			<%elseif tcWebApi_get("WLan11ac_Common","Country","h") = "TAIWAN" then%>	  
			   if(channel_a == "149" || channel_a == "153" || channel_a == "157" || channel_a == "161" || channel_a == "165")
			      form.w_channel_an.value = channel_a;
			   else
                  form.w_channel_an.options[0].selected = true;
			<%end if%>
		<%end if%>		
		
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
		
	<%if tcWebApi_get("WLan11ac_Entry0","AuthMode","h") <> "N/A" then%>
	     <%if tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "OPEN" then%>
	          form.security_type_an[0].checked=true;
			  wla_sectype = 1;
		 <%elseif tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "WEP-64Bits" then%>
	          form.security_type_an[1].checked=true;
			  wla_sectype = 2;
		 <%elseif tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "WEP-128Bits" then%>
		      form.security_type_an[1].checked=true;
			  wla_sectype = 2;
		 <%elseif tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "WPAPSK" then%>
	          form.security_type_an[2].checked=true;
			  wla_sectype = 3;
		 <%elseif tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "WPA2PSK" then%>
	          form.security_type_an[3].checked=true;
			  wla_sectype = 4;
		 <%elseif tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "WPAPSKWPA2PSK" then%>
	          form.security_type_an[4].checked=true;
			  wla_sectype = 5;
		 <%elseif tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "WPA" then%>
	          form.security_type_an[5].checked=true;
			  wla_sectype = 6;
		 <%elseif tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "WPA2" then%>
	          form.security_type_an[5].checked=true;
			  wla_sectype = 6;
		 <%else%>
	          form.security_type_an[5].checked=true;
			  wla_sectype = 6;
		 <%end if%>
	<%end if%>

		setSecurity_an(wla_sectype);

		var sectype_a=wla_sectype;
		if ( wla_wds_endis_fun == '0' || endis_wla_radio == '0' )
			setDisabled(false,form.security_type_an[2],form.security_type_an[3],form.security_type_an[4],form.security_type_an[5]);	
		else
			setDisabled(true,form.security_type_an[2],form.security_type_an[3],form.security_type_an[4],form.security_type_an[5]);
		
		//Bug 19665, should not be both set to wep in main network and guest network.
		var wl_guest_enable_an="0";
		var wl_guest_sectype_an="1";
		if(wl_guest_enable_an==1 && wl_guest_sectype_an==2)
			form.security_type_an[1].disabled = true;

		form.security_type_an[parseInt(sectype_a)-1].checked=true;

		if(wla_sectype == '2')
		{
			var form=document.forms[0];
			var keyno=wla_get_keyno;
			var keylength=wla_get_keylength;
			changekeylen_a(document.forms[0]);
			form.wep_key_no_an[eval(keyno)-1].checked = true;
			form.KEY1_an.value=wla_key1;
			form.KEY2_an.value=wla_key2;
			form.KEY3_an.value=wla_key3;
			form.KEY4_an.value=wla_key4;
			form.old_length_a.value=keylength;
		}
		/*else if(wla_sectype==3)
		{
			form.passphrase_an.value=get_wpa1_a;
		}
		else if(wla_sectype==4)
		{
			form.passphrase_an.value=get_wpa2_a;
		}
		else if(wla_sectype==5)
		{
			form.passphrase_an.value=get_wpas_a;
		}*/
		else if(wla_sectype==6)
		{
			form.wpae_mode_an.value = get_wpae_mode_a;
			if( get_radiusSerIp_a != "" && get_radiusSerIp_a != "0.0.0.0" )
			{
				radiusIPArray = get_radiusSerIp_a.split(".");
				form.radiusIPAddr1_an.value = radiusIPArray[0];
				form.radiusIPAddr2_an.value = radiusIPArray[1];
				form.radiusIPAddr3_an.value = radiusIPArray[2];
				form.radiusIPAddr4_an.value = radiusIPArray[3];
			}
			form.textWpaeRadiusPort_an.value = get_radiusPort_a;
		}		
	}
	if( mode == '1')
	{
		document.getElementById("wep_54").style.display="";
		if(AYECOM_WIFI_CERTIFICATED == 1)//20141106 Mark for WIFI CERTIFICATED
			document.getElementById("wpa_psk_54").style.display="none";
		else
			document.getElementById("wpa_psk_54").style.display="";
	}
	else
	{
		document.getElementById("wep_54").style.display="none";
		document.getElementById("wpa_psk_54").style.display="none";
	}
	if( mode_an == '1')
	{
		//document.getElementById("wep_an_54").style.display="";
		//document.getElementById("wpa_psk_an_54").style.display="";
	}
	else
	{
		//document.getElementById("wep_an_54").style.display="none";
		//document.getElementById("wpa_psk_an_54").style.display="none";
	}
}

function KeyDown(e)
{
	var currKey=0, e=e||window.event;
	currKey= e.keyCode||e.which||e.charCode;

	if((e.altKey)&&(e.keyCode==53))
	{
		document.forms[0].opmode.value = 2;
	}
	else if((e.altKey)&&(e.keyCode==52))
	{
		document.forms[0].opmode.value = 3;
	}
	else if((e.altKey)&&(e.keyCode==48))
	{
		document.forms[0].Apply.selected=true;
		if(check_wlan())
			document.forms[0].submit();
	}
}

</script>
</BODY>
</HTML>
