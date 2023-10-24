
<html><head><link rel="stylesheet" href="/style/form.css">
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body>
DeviceID:WNDR3800;<br>
HardwareVersion:WNDR3800;<br>
FirmwareVersion:V1.0.0.13;<br>

<script>
var logs_checkbox_flag = 1;
var thank_login_flag = 0;
var host_name="WNDR3800";
var usb_router_flag = 1; 
var readyShareSupportedLevel = 7; 
var an_router_flag = 1;
var wireless_schedule_flag = 1;
var guest_router_flag = 1;
var traffic_router_flag=1;
var qos_router_flag=1;
var multi_lang_router_flag=1;
var wds_router_flag=1;
var video_router_flag=1;
var transmit_router_flag=1;
var pppoe_mac_router_flag=1;
var ddns_oray_router_flag=0;
var ddns_wildcards_flag=0;
var dfs_channel_router_flag=0;
var russian_ppp_flag=0;
var russian_pppoe_flag=0;
var l2tp_flag=1;
var igmp_flag=1;
var pppoe_intranet_flag=1;
var dns_third_flag=1;
var tr069_router_flag=0;
var block_sites_flag=1;
var ipv6_flag=1;
var mode_is_300=1;
var is_vc_release=0;
var vpn_show_flag=1;
var router_type="RangeMax(TM)";
var max_bandwidth=1000;
var wire_iso_flag=1;
var bigpond_flag=0;
var apmode_flag=1;
var tivo_flag=0;
var auto_conn_flag=1;
var bridge_iptv_flag=1;
var parental_ctrl_flag=1;
var dfs_channel2_router_flag=1;
var new_multiple_lang=1;

function showWirelessN()              //Wireless b/g/n
{
	if( an_router_flag == 1)
		var strN="WLAN(b/g/n)-Security:"
	else
		var strN="WLAN-Security:"
	var security_mode_n="4";
	if ( security_mode_n == 2 )
	{
		strN=strN+"SecurityMode=WEP;"

		shared_key="2";
		if ( shared_key == "0" )
			strN=strN+"WEPAuthType=Open;";
		else if ( shared_key == "1" )
			strN=strN+"WEPAuthType=Shared;";
		else
			strN=strN+"WEPAuthType=Auto;";
		wep_encry="64";
		if ( wep_encry == "5" )
			strN=strN+"WEPStrength=64;";
		else
			strN=strN+"WEPStrength=128;";

		strN=strN+"WEPKey1=;";
		strN=strN+"WEPKey2=;";
		strN=strN+"WEPKey3=;";
		strN=strN+"WEPKey4=;";

		key_no="1";
		strN=strN+"ActiveKeyIndex="+key_no+";";
	}
	else if (security_mode_n == 3)
	{
		strN=strN+"SecurityMode=WPA-PSK;";

		wpa1_pwd="".replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/\\\\/g,"\\").replace(/\\\"/g,"\"").replace(/\\`/g,"`");
		strN=strN+"WPAPassPhrase="+wpa1_pwd+";";
	}
	else if (security_mode_n == 4)
	{
		strN=strN+"SecurityMode=WPA2-PSK;";

		wpa2_pwd="12345678".replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/\\\\/g,"\\").replace(/\\\"/g,"\"").replace(/\\`/g,"`");
		strN=strN+"WPAPassPhrase="+wpa2_pwd+";";
	}
	else if (security_mode_n == 5)
	{
		strN=strN+"SecurityMode=WPA-PSK-Mixed;";

		wpa1wpa2_pwd="".replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/\\\\/g,"\\").replace(/\\\"/g,"\"").replace(/\\`/g,"`");
		strN=strN+"WPAPassPhrase="+wpa1wpa2_pwd+";";
	}
	else if (security_mode_n == 6)
	{
		strN=strN+"SecurityMode=WPA/WPA2-Enterprise;";
		
		strN=strN+"WPAMode="+"WPAE-TKIPAES"+";";
		strN=strN+"RADIUSserverIP="+""+";";
		strN=strN+"RADIUSserverPort="+"1812"+";";
		wpae_pwd="".replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/\\\\\\\\/g,"\\").replace(/\\\"/g,"\"").replace(/\\\\\\`/g,"`");
		strN=strN+"RADIUSserverSecret="+wpae_pwd+";";
	}
	else
		strN=strN+"SecurityMode=NONE;";
	document.write(strN);
	document.write("<br>");
}

function showWirelessAN()		//wireless a/n
{
	var strA="WLAN(a/n)-Security:"
	var security_mode_a="1";
	if ( security_mode_a == 2 )
	{
		strA=strA+"SecurityMode=WEP;"

		shared_key="2";
		if ( shared_key == "0" )
			strA=strA+"WEPAuthType=Open;";
		else if ( shared_key == "1" )
			strA=strA+"WEPAuthType=Shared;";
		else
			strA=strA+"WEPAuthType=Auto;";
		wep_encry="64";
		if ( wep_encry == "5" )
			strA=strA+"WEPStrength=64;";
		else
			strA=strA+"WEPStrength=128;";

		strA=strA+"WEPKey1=;";
		strA=strA+"WEPKey2=;";
		strA=strA+"WEPKey3=;";
		strA=strA+"WEPKey4=;";

		key_no="1";
		strA=strA+"ActiveKeyIndex="+key_no+";";
	}
	else if (security_mode_a == 3)
	{
		strA=strA+"SecurityMode=WPA-PSK;";

		wpa1_pwd="".replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/\\\\/g,"\\").replace(/\\\"/g,"\"").replace(/\\`/g,"`");
		strA=strA+"WPAPassPhrase="+wpa1_pwd+";";
	}
	else if (security_mode_a == 4)
	{
		strA=strA+"SecurityMode=WPA2-PSK;";

		wpa2_pwd="".replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/\\\\/g,"\\").replace(/\\\"/g,"\"").replace(/\\`/g,"`");
		strA=strA+"WPAPassPhrase="+wpa2_pwd+";";
	}
	else if (security_mode_a == 5)
	{
		strA=strA+"SecurityMode=WPA-PSK-Mixed;";

		wpa1wpa2_pwd="".replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/\\\\/g,"\\").replace(/\\\"/g,"\"").replace(/\\`/g,"`");
		strA=strA+"WPAPassPhrase="+wpa1wpa2_pwd+";";
	}
	else if (security_mode_a == 6)
	{
		strA=strA+"SecurityMode=WPA/WPA2-Enterprise;";
		
		strA=strA+"WPAMode="+"WPAE-TKIPAES"+";";
		strA=strA+"RADIUSserverIP="+""+";";
		strA=strA+"RADIUSserverPort="+"1812"+";";
		wpaeA_pwd="".replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/\\\\\\\\/g,"\\").replace(/\\\"/g,"\"").replace(/\\\\\\`/g,"`");
		strA=strA+"RADIUSserverSecret="+wpaeA_pwd+";";
	}
	else
		strA=strA+"SecurityMode=NONE;";
	document.write(strA);
	document.write("<br>");
}
if( an_router_flag == 1 )
	showWirelessAN();

showWirelessN();
</script>
</body>
</html>
