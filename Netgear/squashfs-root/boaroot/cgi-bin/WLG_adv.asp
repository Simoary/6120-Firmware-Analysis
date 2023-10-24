<%	 
    if request_Form("wladvFlag") = "1" then	 
        tcWebApi_set("WLan_Common","APOn","wl_enable_router")	   
        tcWebApi_set("WLan_Common","HT_BSSCoexistence","wl_enable_coexistence")	 
        tcWebApi_set("WLan_Common","FragThreshold","wl_frag")	 
        tcWebApi_set("WLan_Common","RTSThreshold","wl_rts")	 
        tcWebApi_set("WLan_Common","TxPreamble","wl_enable_shortpreamble")
		tcWebApi_set("WLan_Common","TxPower","wl_tx_ctrl")
		tcWebApi_set("WLan_Common","TxPower_Option","tx_power_ctrl")
		tcWebApi_set("WebCurSet_Entry","wlan_id","hidden_wlan_id")
		tcWebApi_set("WLan_Entry","WPSMode","hidden_wps_mode")
        tcWebApi_set("WLan_Entry","WscAPPinFlag","endis_pin")
        if request_Form("endis_pin") = "1" then
           tcWebApi_set("WLan_Entry","appin_fail_led","appin_fail_led")
        end if
		tcWebApi_set("WLan_Entry","WscAPPinAttackFlag","endis_brutal")
		tcWebApi_set("WLan_Entry","WscMaxPinAttack","wps_atk_times")
        if request_Form("endis_wsc_config") = "1" then
            tcWebApi_set("Info_WLan","WPSActiveStatus","hidden_wps_erase")
        end if
        tcWebApi_set("WLan_Entry","WPSConfStatus","endis_wsc_config")
        tcWebApi_commit("WebCurSet_Entry")		
        tcWebApi_commit("WLan_Entry")	 
    end if
    if request_Form("wladv5gFlag") = "1" then	 
        tcWebApi_set("WLan11ac_Common","APOn","wla_enable_router")	   
        tcWebApi_set("WLan11ac_Common","HT_BSSCoexistence","wla_enable_coexistence")	 
        tcWebApi_set("WLan11ac_Common","FragThreshold","wla_frag")	 
        tcWebApi_set("WLan11ac_Common","RTSThreshold","wla_rts")	 
        tcWebApi_set("WLan11ac_Common","TxPreamble","wla_enable_shortpreamble")
		tcWebApi_set("WLan11ac_Common","TxPower","wla_tx_ctrl")
		tcWebApi_set("WLan11ac_Common","TxPower_Option","tx_power_ctrl_an")
		tcWebApi_set("WebCurSet_Entry","wlan_ac_id","hidden_wlan_ac_id")
		tcWebApi_set("WLan11ac_Entry","WPSMode","hidden_wps_mode")
        tcWebApi_set("WLan11ac_Entry","WscAPPinFlag","endis_pin")
        if request_Form("endis_pin") = "1" then
           tcWebApi_set("WLan11ac_Entry","appin_fail_led","appin_fail_led")
        end if
		tcWebApi_set("WLan11ac_Entry","WscAPPinAttackFlag","endis_brutal")
		tcWebApi_set("WLan1ac_Entry","WscMaxPinAttack","wps_atk_times")
        if request_Form("endis_wsc_config_a") = "1" then
            tcWebApi_set("Info_WLan11ac","WPSActiveStatus","hidden_wps_erase")
        end if
        tcWebApi_set("WLan11ac_Entry","WPSConfStatus","endis_wsc_config_a")
        tcWebApi_commit("WebCurSet_Entry")		
        tcWebApi_commit("WLan11ac_Entry")	 
    end if	
 %>
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/wlan_advanced.js"></script>
<script language=javascript type=text/javascript src="/wadv_sechdule.js"></script>
<script language=javascript type=text/javascript src="/advanced.js"></script>
<script language=javascript type=text/javascript src="/basic.js"></script>
<title><%tcWebApi_multilingual("1","glbstr_title")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/WLG_adv.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="wlan_adv">

<div class="page_title" id="title"><%tcWebApi_multilingual("1","advanced_wireless_str")%></div>
<div class="fix_button" id="check_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
	<input class='cancel_bt' type='reset' name="Cancel" id="cancel" value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick='location.href="WLG_adv.asp";'>&nbsp;&nbsp;
        <input class="apply_bt" type="submit" name="Apply" id="apply" value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick="return checkadv(document.forms[0]);">
        </TD>
</TR>
</TABLE>

</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>


<script>


var ts="18043180";

var gui_region="English";
var netgear_region="";
if(netgear_region == "")
	netgear_region = "WW";
//var netgear_region=top.netgear_region;
var country="4";
var wla_channel="44";
var wps_progress_status="";

//wireless schedule
var ntp_updated = "0";
var wireless_schedule_flag = 0;  //201404211622, Tony, Disable Wireless Schedule Table
var wireless_schedule_num=0;

var wireless_schedule_num_a=0;

var enable_schedule = "0";// b/g/n
var enalbe_shcedule_an = "0";// a/n

// b/g/n
var old_wds_endis_fun="0";
var old_wla_wds_endis_fun="0";
var old_wds_repeater_basic="0";
var old_endis_wl_radio="<%If tcWebApi_get("WLan_Common","APOn","h") <> "N/A" then tcWebApi_get("WLan_Common","APOn","s") end if%>";
var old_endis_wl_coexistence="<%If tcWebApi_get("WLan_Common","HT_BSSCoexistence","h") <> "N/A" then tcWebApi_get("WLan_Common","HT_BSSCoexistence","s") end if%>";
var old_endis_ssid_broadcast='1';
var security_mode='4';
var wlan_adv_wpspin="<%if tcWebApi_get("Info_WLan","wlanSelfPinCode","h") <> "N/A" then tcWebApi_get("Info_WLan","wlanSelfPinCode","s") end if%>";
var wlendis_pin="<%if tcWebApi_get("WLan_Entry0","WscAPPinFlag","h") <> "N/A" then tcWebApi_get("WLan_Entry0","WscAPPinFlag","s") end if%>";
var wlendis_brutal="<%if tcWebApi_get("WLan_Entry0","WscAPPinAttackFlag","h") <> "N/A" then tcWebApi_get("WLan_Entry0","WscAPPinAttackFlag","s") end if%>";
var wlendis_pin_tmp='';
var wps_process_status="<%if tcWebApi_get("Info_WLan","wlanWPSStatus","h") <> "N/A" then tcWebApi_get("Info_WLan","wlanWPSStatus","s") end if%>";
var wps_status="<%if tcWebApi_get("WLan_Entry0","WPSConfStatus","h") <> "N/A" then tcWebApi_get("WLan_Entry0","WPSConfStatus","s") end if%>";
var wla_wps_status="<%if tcWebApi_get("WLan11ac_Entry0","WPSConfStatus","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry0","WPSConfStatus","s") end if%>";;
var endis_wl_wmm="1";
var old_endis_wireless_isolation='0';
var wlan_enable="<%If tcWebApi_get("WLan_Common","APOn","h") <> "N/A" then tcWebApi_get("WLan_Common","APOn","s") end if%>";
var wlan5g_enable="<%If tcWebApi_get("WLan11ac_Common","APOn","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","APOn","s") end if%>";
var wlan_wps_enable="<%If tcWebApi_get("WLan_Entry","WPSConfMode","h") <> "N/A" then tcWebApi_get("WLan_Entry","WPSConfMode","s") end if%>";
var wlan5g_wps_enable="<%If tcWebApi_get("WLan11ac_Entry","WPSConfMode","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry","WPSConfMode","s") end if%>";

// a/n
var old_wla_endis_wireless_isolation='0';
var old_endis_wla_radio="<%If tcWebApi_get("WLan11ac_Common","APOn","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","APOn","s") end if%>";;
var old_wla_endis_ssid_broadcast='1';
var endis_wla_wmm="1";
var an_router_flag = parent.an_router_flag;
var qos_router_flag = parent.qos_router_flag;
var video_router_flag = parent.video_router_flag;
var transmit_router_flag = 1;
var guest_router_flag=parent.guest_router_flag;
var wire_iso_flag=parent.wire_iso_flag;
var apmode_flag = 0;  //201311121446, Tony, Disable Wireless AP mode

if(old_endis_wl_radio == "1")
   wlan_adv_wpspin="<%if tcWebApi_get("Info_WLan","wlanSelfPinCode","h") <> "N/A" then tcWebApi_get("Info_WLan","wlanSelfPinCode","s") end if%>";
else if (old_endis_wla_radio == "1")
   wlan_adv_wpspin="<%if tcWebApi_get("Info_WLan11ac","wlanSelfPinCode","h") <> "N/A" then tcWebApi_get("Info_WLan11ac","wlanSelfPinCode","s") end if%>";

var enable_ap_flag="0";//bug 22880 according to the page 128 of spec 2.0,add AP mode
var dyn_get_ip_flag="1";
var dyn_get_dns_flag="1";
var invalid_ip_str="<%tcWebApi_multilingual("1","invalid_ip_str")%>";
var invalid_subnet_str="<%tcWebApi_multilingual("1","invalid_subnet_str")%>";
var invalid_gateway_str="<%tcWebApi_multilingual("1","invalid_gateway_str")%>";
var ip_gateway_subnet_str="<%tcWebApi_multilingual("1","ip_gateway_subnet_str")%>";
var device_not_null_str="<%tcWebApi_multilingual("1","device_not_null_str")%>";
var invalid_device_str="<%tcWebApi_multilingual("1","invalid_device_str")%>";
var wps_inprogess_str="<%tcWebApi_multilingual("1","wps_inprogess_str")%>";
var cts_threshold_outside_str="<%tcWebApi_multilingual("1","cts_threshold_outside_str")%>";
var fragmentation_outside_str="<%tcWebApi_multilingual("1","fragmentation_outside_str")%>";
var appin_fail_number_str="<%tcWebApi_multilingual("1","appin_fail_number_str")%>";

function apmode_display()
{
	var cf=document.forms[0];
	if(apmode_flag == 1)
	{
		document.getElementById("ap_bluebar").style.display="";
		document.getElementById("apmode").style.display="";
		document.getElementById("apmode_checkbox").style.display="";
	}
	else
	{
		document.getElementById("ap_bluebar").style.display="none";
		document.getElementById("apmode").style.display="none";
		document.getElementById("apmode_checkbox").style.display="none";
	}
}

function ap_display()
{
	var cf=document.forms[0];
	if(cf.enable_ap_mode.checked == true)
	{
		document.getElementById("ap_device_name").style.display="";
		document.getElementById("ap_dyn_getip").style.display="";
		document.getElementById("ap_addr").style.display="";
		document.getElementById("ap_mask").style.display="";
		document.getElementById("ap_dyn_dns").style.display="";
		document.getElementById("ap_daddr").style.display="";
		document.getElementById("ap_pdaddr").style.display="";
		document.getElementById("ap_gateway").style.display="";
	}
	else
	{
		document.getElementById("ap_device_name").style.display="none";
		document.getElementById("ap_dyn_getip").style.display="none";
		document.getElementById("ap_addr").style.display="none";
		document.getElementById("ap_mask").style.display="none";
		document.getElementById("ap_dyn_dns").style.display="none";
		document.getElementById("ap_daddr").style.display="none";
		document.getElementById("ap_pdaddr").style.display="none";
		document.getElementById("ap_gateway").style.display="none";
	}
}

function change_web_format()
{
        if( guest_router_flag == 0 && wire_iso_flag == 1)
                document.getElementById("guestiso").style.display="";
        else
                document.getElementById("guestiso").style.display="none";
		
		//bug 21638:remove the "Enable Wireless Isolation" in advanced wireless settings page
		//spec1.9-p125:It is a checkbox "Enable Wireless Isolation" below "Enable Wireless Router Radio" 
		//in the "Advanced Wireless Settings" page if the product doesn't support guest network.
		if( guest_router_flag == 0 && wire_iso_flag == 1 && an_router_flag ==1)
			document.getElementById("guestiso_an").style.display="";
		else
			document.getElementById("guestiso_an").style.display="none";
		
		if( qos_router_flag == 0 )
                document.getElementById("wmm_qos").style.display="";
        else
                document.getElementById("wmm_qos").style.display="none";

        if( video_router_flag == 0 )
                document.getElementById("ssid_bgn").style.display="";
	else
		document.getElementById("ssid_bgn").style.display="none";

	if( transmit_router_flag == 1 )
		document.getElementById("power_ctrl_bgn").style.display="";
	else
		document.getElementById("power_ctrl_bgn").style.display="none";

	if(wireless_schedule_flag == 1)
	{
		document.getElementById("schedule_bgn_enable").style.display="";
		document.getElementById("schedule_bgn_head").style.display="";
		document.getElementById("schedule_bgn_table").style.display="";
		document.getElementById("schedule_bgn_button").style.display="";
	}
	else
	{
		document.getElementById("schedule_bgn_enable").style.display="none";
		document.getElementById("schedule_bgn_head").style.display="none";
		document.getElementById("schedule_bgn_table").style.display="none";
		document.getElementById("schedule_bgn_button").style.display="none";
	}

	/* a/n */
	if( an_router_flag == 1 ){
		document.getElementById("adv_wlan_an").style.display="";
		document.getElementById("ap_an").style.display="";
		if( video_router_flag == 0 )
			document.getElementById("ssid_an").style.display="none";  //201404211622, Tony, Disable Wireless Broadcast SSID
		else
			document.getElementById("ssid_an").style.display="none";  //201404211622, Tony, Disable Wireless Broadcast SSID
		document.getElementById("frag_an").style.display="";
		document.getElementById("rts_an").style.display=""; 
		document.getElementById("pream_an").style.display="";
		document.getElementById("blue_an").style.display="";
		document.getElementById("wlaadv_keep_exist").style.display="";
	        if( qos_router_flag == 0 )
	                document.getElementById("wmm_qos_an").style.display="";
	        else
        	        document.getElementById("wmm_qos_an").style.display="none";
		if( transmit_router_flag == 1 )
			document.getElementById("power_ctrl_an").style.display="";
		else
			document.getElementById("power_ctrl_an").style.display="none";
		
		/*wireless schedule*/
		if(wireless_schedule_flag == 1)
		{
			document.getElementById("schedule_an_enable").style.display="";
			document.getElementById("schedule_an_head").style.display="";
			document.getElementById("schedule_an_table").style.display="";
			document.getElementById("schedule_an_button").style.display="";
		}
		else
		{
			document.getElementById("schedule_an_enable").style.display="none";
			document.getElementById("schedule_an_head").style.display="none";
			document.getElementById("schedule_an_table").style.display="none";
			document.getElementById("schedule_an_button").style.display="none";
		}
	}
	else{
		document.getElementById("adv_wlan_an").style.display="none";
		document.getElementById("ap_an").style.display="none";
		document.getElementById("ssid_an").style.display="none";
		document.getElementById("frag_an").style.display="none";
		document.getElementById("rts_an").style.display="none";
		document.getElementById("pream_an").style.display="none";
		document.getElementById("blue_an").style.display="none";
		document.getElementById("wlaadv_keep_exist").style.display="none";
		document.getElementById("wmm_qos_an").style.display="none";
		document.getElementById("power_ctrl_an").style.display="none";

		/*wireless schedule*/
		document.getElementById("schedule_an_enable").style.display="none";
		document.getElementById("schedule_an_head").style.display="none";
		document.getElementById("schedule_an_table").style.display="none";
		document.getElementById("schedule_an_button").style.display="none";

	}
	document.getElementById("wladv_pin").style.display="";
	document.getElementById("wladv_endis_wps").style.display="";
	document.getElementById("wladv_keep_exist").style.display="";
	document.getElementById("wlaadv_keep_exist").style.display="";
	
	
}

function change_enable_pin()
{
	var cf = document.forms[0];
	if( cf.pin_disable.checked == true )
		document.getElementById("brutal").style.display="";
	else
		document.getElementById("brutal").style.display="none";
}

function loadvalue()
{
	var form=document.forms[0];
	change_web_format();
	apmode_display();
	
	form.device_name.value="WNDR3800";

	if((wlan_enable == 1 || wlan5g_enable == 1) && (wlan_wps_enable == 7 || wlan5g_wps_enable == 7))
	   top.enabled_wps=1;
	else
	   top.enabled_wps=0;
	top.enabled_wds=0;
        if( top.location.href.indexOf("adv_index.asp") != -1 )
                menu_color_change('advanced_wireless');
        else //bug23925 in basic page: if the radio is Off, the wireless button will link to wladv page.
	{
		top.endis_wl_radio=old_endis_wl_radio;
		top.endis_wla_radio=old_endis_wla_radio;
	//	basic_menu_color_change('advanced_wireless');
	}


	var wlan_get_pream="<%If tcWebApi_get("WLan_Common","TxPreamble","h") <> "N/A" then tcWebApi_get("WLan_Common","TxPreamble","s") end if%>";
	var wlan_get_pream_a="<%If tcWebApi_get("WLan11ac_Common","TxPreamble","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","TxPreamble","s") end if%>";

	if(wlan_get_pream == '0')
		form.enable_shortpreamble[2].selected = true;
	else if (wlan_get_pream == '1')
		form.enable_shortpreamble[1].selected = true;
	else
		form.enable_shortpreamble[0].selected = true;
	if(wlan_get_pream_a == '2')
		form.enable_shortpreamble_an[2].selected = true;
	else if(wlan_get_pream_a == '1')
		form.enable_shortpreamble_an[1].selected = true;
	else
		form.enable_shortpreamble_an[0].selected = true;
		

	//form.tx_power_ctrl.value='0';
	//form.tx_power_ctrl_an.value='0';
	
	form.tx_power_ctrl.value = "<%If tcWebApi_get("WLan_Common","TxPower_Option","h") <> "N/A" then tcWebApi_get("WLan_Common","TxPower_Option","s") end if%>";
	form.tx_power_ctrl_an.value = "<%If tcWebApi_get("WLan11ac_Common","TxPower_Option","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","TxPower_Option","s") end if%>";

	form.rts.value = "<%If tcWebApi_get("WLan_Common","RTSThreshold","h") <> "N/A" then tcWebApi_get("WLan_Common","RTSThreshold","s") end if%>";
	form.rts_an.value = "<%If tcWebApi_get("WLan11ac_Common","RTSThreshold","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","RTSThreshold","s") end if%>";

	form.frag.value = "<%If tcWebApi_get("WLan_Common","FragThreshold","h") <> "N/A" then tcWebApi_get("WLan_Common","FragThreshold","s") end if%>";
	form.frag_an.value = "<%If tcWebApi_get("WLan11ac_Common","FragThreshold","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","FragThreshold","s") end if%>";
	
	if(enable_ap_flag == '1')
		form.enable_ap_mode.checked = true;
	else
		form.enable_ap_mode.checked = false;
	ap_display();
	if(dyn_get_ip_flag == '1')
		form.dyn_get_ip.checked = true;
	else
		form.dyn_get_ip.checked = false;
	setIP(form);
	var apmode_get_ip="0.0.0.0";
	if (apmode_get_ip!="")
	{
		var ip_array=apmode_get_ip.split('.');
		form.APaddr1.value=ip_array[0];
		form.APaddr2.value=ip_array[1];
		form.APaddr3.value=ip_array[2];
		form.APaddr4.value=ip_array[3];
	}
	var apmode_get_subnet="0.0.0.0";
	if (apmode_get_subnet!="")
	{
		var mask_array=apmode_get_subnet.split('.');
		form.APmask1.value=mask_array[0];
		form.APmask2.value=mask_array[1];	
		form.APmask3.value=mask_array[2];
		form.APmask4.value=mask_array[3]; 
	}
	var apmode_get_gateway="0.0.0.0";
	if (apmode_get_gateway!="")
	{
		var gtw_array=apmode_get_gateway.split('.');
		form.APgateway1.value=gtw_array[0];
		form.APgateway2.value=gtw_array[1];
		form.APgateway3.value=gtw_array[2];
		form.APgateway4.value=gtw_array[3];	
	}
	if(dyn_get_dns_flag == '1')
		form.dyn_get_dns.checked = true;
	else
		form.dyn_get_dns.checked = false;
	setDNS(form);
	var apmode_get_dns1="172.17.151.2";
	if (apmode_get_dns1!="" && apmode_get_dns1.indexOf(":")==-1)
	{
		var dns1_array=apmode_get_dns1.split('.');
		form.APDAddr1.value=dns1_array[0];
		form.APDAddr2.value=dns1_array[1];
		form.APDAddr3.value=dns1_array[2];
		form.APDAddr4.value=dns1_array[3];
	}
	var apmode_get_dns2="172.17.151.1";
	if (apmode_get_dns2!="" && apmode_get_dns2.indexOf(":")==-1)
	{
		var dns2_array=apmode_get_dns2.split('.');
		form.APPDAddr1.value=dns2_array[0];
		form.APPDAddr2.value=dns2_array[1];
		form.APPDAddr3.value=dns2_array[2];
		form.APPDAddr4.value=dns2_array[3];
	}

	if(old_endis_wl_radio=='1')
		form.enable_ap.checked = true;
	else
		form.enable_ap.checked = false;
		
	if(old_endis_wl_coexistence=='1')
	    form.enable_coexistence.checked = true;
	else
		form.enable_coexistence.checked = false;

	if(old_endis_wla_radio=='1')
		form.enable_ap_an.checked = true;
	else
		form.enable_ap_an.checked = false;	


	//wireless schedule
	if(enable_schedule == "1")
		form.wirless_schedule.checked = true;
	else
		form.wirless_schedule.checked = false;

	if(enalbe_shcedule_an == "1")
		form.wirless_schedule_an.checked = true;
	else
		form.wirless_schedule_an.checked = false;

	check_schedule_onoff();


	if(old_endis_ssid_broadcast=='1')
		form.ssid_bc.checked = true;
	else
		form.ssid_bc.checked = false;
	if(old_endis_wireless_isolation=='1')
		form.enable_isolation.checked = true;
	else
		form.enable_isolation.checked = false;
	
	if(old_wla_endis_ssid_broadcast=='1')
		form.ssid_bc_an.checked = true;
	else
		form.ssid_bc_an.checked = false;
	if(old_wla_endis_wireless_isolation=='1')
		form.enable_isolation_an.checked = true;
	else
		form.enable_isolation_an.checked = false;
	if(endis_wl_wmm == "1")
		form.wmm_enable.checked = true;
	else
		form.wmm_enable.checked = false;
	if(endis_wla_wmm == "1")
		form.wmm_enable_a.checked = true;
	else
		form.wmm_enable_a.checked = false;	

	if(wlendis_pin == '1')
		form.pin_disable.checked = true;
	else
		form.pin_disable.checked = false;
	if(wlendis_brutal == '1')
		form.brutal_enable.checked = true;
	else
		form.brutal_enable.checked = false;
	if(wlendis_pin == '1')
		document.getElementById("brutal").style.display="";
	else
		document.getElementById("brutal").style.display="none";
	if (wps_status == '2')
		form.protect_enable.checked = true;
	else if (wps_status == 1)
		form.protect_enable.checked = false;
	if (wla_wps_status == '2')
                form.wsc_config[1].checked = true;
        else if (wla_wps_status == 1)
                form.wsc_config[1].checked = false;
	if (wlendis_pin == '0')
	{
		getObj('wladv_pin').color = 'gray';
	}	
					
	//	|| '1' == 6 
	if ( (security_mode == '2' && '2' == '1' && old_endis_wl_radio == '1') ||
		( '1' == '2' && '2' == '1' && old_endis_wla_radio == '1')
		|| ('4' == 6 && old_endis_wl_radio == '1')
		|| ('1' == 6 && old_endis_wla_radio == '1') 
		|| ( old_wds_endis_fun == '1' && old_endis_wl_radio == '1')
		|| ( old_wla_wds_endis_fun == '1' && old_endis_wla_radio == '1')
		|| (old_endis_wl_radio == '0' && old_endis_wla_radio == '0')
		|| (wlan_wps_enable == '0' && wlan5g_wps_enable == '0')
	)
	{
		getObj('wladv_pin').color = 'gray';	
		getObj('wladv_endis_wps').color = 'gray';	
		getObj('wladv_keep_exist').color = 'gray';	
		getObj('wlaadv_keep_exist').color = 'gray';
		getObj('brutal').color = 'gray';
		form.pin_disable.disabled=true;
		form.brutal_enable.disabled=true;
		form.wps_atk_times.disabled=true;
		form.protect_enable.disabled=true;		
		form.wsc_config[1].disabled=true;
	}

	form.acs_level[1].checked = true;
}
</script>
<input type="hidden" name="wl_rts">
<input type="hidden" name="wl_frag">
<input type="hidden" name="wl_enable_ssid_broadcast">
<input type="hidden" name="wl_enable_shortpreamble">
<input type="hidden" name="wl_tx_ctrl">
<input type="hidden" name="wl_enable_router" value="ignore">
<input type="hidden" name="endis_pin" value=1>
<input type="hidden" name="appin_fail_led" value=0>
<input type="hidden" name="endis_brutal" value=1>
<input type="hidden" name="wlg_endis_wireless_isolation">
<input type="hidden" name="wla_endis_wireless_isolation">

<input type="hidden" name="wla_rts">
<input type="hidden" name="wla_frag">
<input type="hidden" name="wla_enable_ssid_broadcast">
<input type="hidden" name="wla_enable_shortpreamble">
<input type="hidden" name="wla_tx_ctrl">
<input type="hidden" name="wla_enable_router" value="ignore">
<input type="hidden" name="wla_enable_coexistence" value="0">
<input type="hidden" name="wla_enable_bandwidth" value="0">

<input type="hidden" name="wds_change_ip">
<input type="hidden" name="enable_router" value="ignore">
<input type="hidden" name="enable_ssid_broadcast" value="ignore">
<input type="hidden" name="endis_wsc_config" value=5>
<input type="hidden" name="endis_wsc_config_a" value=5>

<input type="hidden" name="wladv_endis_wmm">
<input type="hidden" name="wladv_endis_wmm_a">
<input type="hidden" name="hid_enable_apmode">
<input type="hidden" name="wl_enable_coexistence" value="0">
<input type="hidden" name="wl_enable_bandwidth" value="0">
<input type="hidden" name="hid_dyn_get_ip">
<input type="hidden" name="hid_dyn_get_dns">
<input type="hidden" name="hid_ap_ipaddr">
<input type="hidden" name="hid_ap_subnet">
<input type="hidden" name="hid_ap_gateway">
<input type="hidden" name="ap_dnsaddr1">
<input type="hidden" name="ap_dnsaddr2">
<input type="hidden" name="hidden_wlan_id" value="0">
<input type="hidden" name="hidden_wlan_ac_id" value="0">
<input type="hidden" name="hidden_wps_erase" value="0">
<input type="hidden" name="hidden_wps_mode" value="0">

<input type="hidden" name="wladv_enable_schedule" value="">
<input type="hidden" name="wladv_enable_schedule_a" value="">
<input type="hidden" name="wladv_schedule_type" value="">
<input type="hidden" name="wladv_schedule_edit_num" value="">
<input type="hidden" name="wladv_schedule_delete_num" value="">
<input type="hidden" name="wladvFlag" value="0">
<input type="hidden" name="wladv5gFlag" value="0">
<input type="hidden" name="wladv_wds_mode">
<input type="hidden" name="test" value="<%tcWebApi_multilingual("internet")%>">
<input type="hidden" name="test2" value="<%tcWebApi_multilingual("wireless")%>">

<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_wladv','settings')"><B><%tcWebApi_multilingual("1","advanced_wireless_str")%><script> if(an_router_flag == 1) document.write("(2.4GHz b/g/n)")</script> </B></A>
	</TD>
</TR>	
<TR>
	<TD nowrap>
	<input type="checkbox" name="enable_ap" id="enable_ap" value="1" onClick="check_schedule_onoff();"><%tcWebApi_multilingual("1","wireless_radio_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap>
	<input type="checkbox" name="enable_coexistence" id="enable_coexistence" value="1"><%tcWebApi_multilingual("1","wireless_coexistence_str")%>
	</TD>
</TR>
<!--
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","channel_bandwidth_str")%></TD>
	<TD nowrap>
	<select name="enable_bandwidth" onClick="check_coexistence();">
		<option value="0">20MHz</option>
		<option value="1">20/40MHz</option>
	</select>
	</TD>
</TR>
-->
<TR id=guestiso>
	<TD nowrap>
	<input type="checkbox" name="enable_isolation" value="1"><%tcWebApi_multilingual("1","wireless_isolation_str")%>
	</TD>
</TR>
<TR id=ssid_bgn>
	<TD nowrap>
	<input type="checkbox" name="ssid_bc" value="1"><%tcWebApi_multilingual("1","ssid_broadcast_str")%>
	</TD>
</TR> 
<TR id=wmm_qos>
	<TD nowrap><input type="checkbox" name="wmm_enable" value="1"><%tcWebApi_multilingual("1","wmm_setting_str")%><script> if(an_router_flag == 1) document.write("(2.4GHz b/g/n)");</script></a></TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","fragmentation_str")%></TD>
	<TD nowrap>
	<input type="text" maxLength=4 size=5 name="frag" id="frag" value="2346" onFocus="this.select();" onKeyPress="return getkey('num', event)">
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","cts_rts_threshold_str")%></TD>
	<TD nowrap>
	<input maxLength=4 size=5 name="rts" id="rts" value="2347" onFocus="this.select();" onKeyPress="return getkey('num', event)">
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","preamble_mode_str")%></TD>
	<TD nowrap>
	<select name="enable_shortpreamble" id="enable_short_preamble">
		<option value="0"><%tcWebApi_multilingual("1","automatic_str")%></option>
		<option value="1"><%tcWebApi_multilingual("1","short_preamble_str")%></option>
		<option value="2"><%tcWebApi_multilingual("1","logn_preamble_str")%></option>
	</select>
	</TD>
</TR>
<TR id=power_ctrl_bgn>
	<TD nowrap><%tcWebApi_multilingual("1","transmit_power_str")%></TD>
	<TD nowrap>
	<select name="tx_power_ctrl" id="tx_power_ctrl">
		<option value="0">100%</option>
		<option value="1">75%</option>
		<option value="2">50%</option>
		<option value="3">25%</option>
	</select>
	</TD>
</TR>
<TR id="schedule_bgn_enable" ><TD colspan="2" nowrap ><input type="checkbox" name="wirless_schedule" id="turnoff" value="1" onClick="enable_schedule_button();"><b><%tcWebApi_multilingual("1","wireless_signal_turn_off_str")%></b></TD></TR>
<TR id="schedule_bgn_head"><TD colspan="2" nowrap><b><%tcWebApi_multilingual("1","wireless_signal_turn_off_time_period_str")%></b></TD></TR>
<TR id="schedule_bgn_table">
	<TD colspan="2" nowrap>
	<TABLE id="WirelessOnOff" border="1" cellpadding="2" cellspacing="1" width="80%" align="left">
	<TR>
		<TD nowrap width="15%" align="left"><span class="subhead"><%tcWebApi_multilingual("1","period_str")%></span></TD>
		<TD nowrap width="20%" align="left"><span class="subhead"><%tcWebApi_multilingual("1","start_str")%></span></TD>
		<TD nowrap width="20%" align='left'><span class="subhead"><%tcWebApi_multilingual("1","end_str")%></span></TD>
		<TD nowrap align="left"><span class="subhead"><%tcWebApi_multilingual("1","recurrence_pattern_str")%></span></TD>
	</TR>
	<script>
	if(wireless_schedule_num > 0)
	{
		var i = 0, j = 0, n = 0;

		for(i=1; i<=wireless_schedule_num; i++)
		{
			var str = eval("wireless_schedule_array" + i);
			str = remove_space(str);
			var each_info = str.split("-");

			document.write('<TR>');
			document.write('<TD nowrap align="center"><input type="radio" name="priod_select" id="schedule_select" value="'+i+'"></TD>');
			if((gui_region=="German" && netgear_region=="WW") || netgear_region=="GR")
			{
				n = parseInt(each_info[0], 10);
				document.write('<TD nowrap align="left">'+hour_schedule_24[n]+'</TD>');

				n = parseInt(each_info[1], 10);
				document.write('<TD nowrap align="left">'+hour_schedule_24[n]+'</TD>');
			}
			else
			{
				n = parseInt(each_info[0], 10);
				document.write('<TD nowrap align="left">'+hour_schedule_12[n]+'</TD>');

				n = parseInt(each_info[1], 10);
				document.write('<TD nowrap align="left">'+hour_schedule_12[n]+'</TD>');
			}

			document.write('<TD nowrap align="left">');
			if(each_info[2] == "Daily")
				document.write(each_info[2]);
			else if(each_info[2] == "")
				document.write("&nbsp;");
			else
			{
				var day_num = each_info[2].split(",");
				for(j=0; j<day_num.length; j++)
				{
					n = parseInt(day_num[j], 10);
					document.write(week_days[n] + " ");
				}
				document.write('</TD>');
				document.write('</TR>');
			}
		}
	}
	</script>
	</TABLE>
	</TD>
</TR>
<TR id="schedule_bgn_button"><TD colspan=2 align="center" nowrap>
	<input type="button" name="add_period" id="add_schedule" value="Add a new period" onClick='return check_wireless_schedule("bgn", "add");'>&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" name="edit_period" id="edit_schedule" value="Edit" onClick='return check_wireless_schedule("bgn", "edit");'>&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" name="delete_period" id="del_schedule" value="Delete" onClick='return check_wireless_schedule("bgn", "delete");'>
	</TD>
</TR>
<TR id=blue_an><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR id=adv_wlan_an>
        <TD nowrap colspan=2>
        <A tabindex=-1 href="javascript:loadhelp('_wladv','settings')"><B><%tcWebApi_multilingual("1","advanced_wireless5g_str")%> (5GHz a/n) </B></A>
        </TD>
</TR>
<TR id=ap_an>
        <TD nowrap>
        <input type="checkbox" name="enable_ap_an" id="enable_ap_an" value="1" onClick="check_schedule_onoff();"><%tcWebApi_multilingual("1","wireless_radio_str")%>
        </TD>
</TR>
<TR id=guestiso_an>
	<TD nowrap>
	<input type="checkbox" name="enable_isolation_an" id="enable_isolation_an" value="1"><%tcWebApi_multilingual("1","wireless_isolation_str")%>
	</TD>
</TR>
<TR id=ssid_an>
        <TD nowrap>
        <input type="checkbox" name="ssid_bc_an" id="ssid_bc_an" value="1"><%tcWebApi_multilingual("1","ssid_broadcast_str")%>
        </TD>
</TR>
<TR id=wmm_qos_an>
	<TD nowrap>
	<input type="checkbox" name="wmm_enable_a" id="wmm_enable_a" value="1"><a tabindex=-1 href="javascript:loadhelp('_wladv','wifi')"><b><%tcWebApi_multilingual("1","wmm_setting_str")%></b></a>
	</TD>
</TR>
<TR id=frag_an>
        <TD nowrap><%tcWebApi_multilingual("1","fragmentation_str")%></TD>
        <TD nowrap>
        <input type="text" maxLength=4 size=5 name="frag_an" id="frag_an" value="2346" onFocus="this.select();" onKeyPress="return getkey('num', event)">
        </TD>
</TR>
<TR id=rts_an>
        <TD nowrap><%tcWebApi_multilingual("1","cts_rts_threshold_str")%></TD>
        <TD nowrap>
        <input maxLength=4 size=5 name="rts_an" id="rts_an" value="2347" onFocus="this.select();" onKeyPress="return getkey('num', event)">
        </TD>
</TR>
<TR id=pream_an>
        <TD nowrap><%tcWebApi_multilingual("1","preamble_mode_str")%></TD>
        <TD nowrap>
        <select name="enable_shortpreamble_an" id="enable_short_preamble_an">
                <option value="0"><%tcWebApi_multilingual("1","automatic_str")%></option>
                <option value="1"><%tcWebApi_multilingual("1","short_preamble_str")%></option>
                <option value="2"><%tcWebApi_multilingual("1","logn_preamble_str")%></option>
        </select>
        </TD>
</TR>
<TR id=power_ctrl_an>
	<TD nowrap><%tcWebApi_multilingual("1","transmit_power_str")%></TD>
	<TD nowrap>
	<select name="tx_power_ctrl_an" id="tx_power_ctrl_an">
		<option value="0">100%</option>
		<option value="1">75%</option>
		<option value="2">50%</option>
		<option value="3">25%</option>
	</select>
	</TD>
</TR>
<TR id=schedule_an_enable><TD colspan="2" nowrap><input type="checkbox" name="wirless_schedule_an" value="1" onClick="enable_schedule_button();"><b><%tcWebApi_multilingual("1","wireless_signal_turn_off_str")%></b></TD></TR>
<TR id=schedule_an_head><TD colspan="2" nowrap><b><%tcWebApi_multilingual("1","wireless_signal_turn_off_time_period_str")%></b></TD></TR>
<TR id=schedule_an_table>
	<TD colspan="2" nowrap>
	<TABLE id="WirelessOnOff5G" border="1" cellpadding="2" cellspacing="1" width="80%" align="left">
	<TR>
		<TD nowrap width="15%" align="left"><span class="subhead"><%tcWebApi_multilingual("1","period_str")%></span></TD>
		<TD nowrap width="20%" align="left"><span class="subhead"><%tcWebApi_multilingual("1","start_str")%></span></TD>
		<TD nowrap width="20%" align="left"><span class="subhead"><%tcWebApi_multilingual("1","end_str")%></span></TD>
		<TD nowrap align="left"><span class="subhead"><%tcWebApi_multilingual("1","recurrence_pattern_str")%></span></TD>
	</TR>
	<script>
	if(wireless_schedule_num_a > 0)
	{
		var i = 0, j = 0, n = 0;

		for(i=1; i<=wireless_schedule_num_a; i++)
		{
			var str = eval("wireless_schedule_array_a" + i);
			str = remove_space(str);
			var each_info = str.split("-");

			document.write('<TR>');
			document.write('<TD nowrap align="center"><input type="radio" name="priod_select_an" id="schedule_select _an" value="'+i+'"></TD>');

			if((gui_region=="German" && netgear_region=="WW") || netgear_region=="GR")
			{
				n = parseInt(each_info[0], 10);
				document.write('<TD nowrap align="left">'+hour_schedule_24[n]+'</TD>');

				n = parseInt(each_info[1], 10);
				document.write('<TD nowrap align="left">'+hour_schedule_24[n]+'</TD>');
			}
			else
			{
				n = parseInt(each_info[0], 10);
				document.write('<TD nowrap align="left">'+hour_schedule_12[n]+'</TD>');

				n = parseInt(each_info[1], 10);
				document.write('<TD nowrap align="left">'+hour_schedule_12[n]+'</TD>');
			}

			document.write('<TD nowrap align="left">');
			if(each_info[2] == "Daily")
				document.write(each_info[2]);
			else if(each_info[2] == "")
				document.write("&nbsp;");
			else
			{
				var day_num = each_info[2].split(",");
				for(j=0; j<day_num.length; j++)
				{
					n = parseInt(day_num[j], 10);
					document.write(week_days[n] + " ")
				}
				document.write('</TD>');
				document.write('</TR>');
			}
		}
	}
	</script>
	</TABLE>
	</TD>
</TR>
<TR id=schedule_an_button><TD colspan=2 align="center" nowrap>
	<input type="submit" name="add_period_an" id="add_schedule_an" value="Add a new period" onClick='return check_wireless_schedule("an", "add");'>&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" name="edit_period_an" id="edit_shedule_an" value="Edit" onClick='return check_wireless_schedule("an", "edit");'>&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" name="delete_period_an" id="del_schedule_an" value="Delete" onClick='return check_wireless_schedule("an", "delete");'>
	</TD>
</TR>
<TR id=blue_an><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap>
	<B><A tabindex=-1 href="javascript:loadhelp('_wladv','wps')"><%tcWebApi_multilingual("1","wps_setting_str")%></A></B>
	</TD> 
</TR>
<TR id='wladv_pin'>
	<TD nowrap><%tcWebApi_multilingual("1","router_pin_str")%>:</TD>
	<TD nowrap><B><script>document.write(wlan_adv_wpspin);</script></B></TD>
</TR>
<TR id='wladv_endis_wps'>
	<TD nowrap colspan=2 >
	<input type="checkbox" name="pin_disable" id="pin_disable" value=1 onclick="change_enable_pin()"><%tcWebApi_multilingual("1","router_pin_enable_str")%><script><%if tcWebApi_get("WLan_Entry0","WscAPPinFailFlag","h") <> "N/A" then if tcWebApi_get("WLan_Entry0","WscAPPinFailFlag","h") = "1" then%> document.write("(<%tcWebApi_multilingual("1","attack_detect_str")%>)");<%end if%><%end if%></script>
	</TD>
</TR>
<TR id="brutal">
	<TD nowrap colspan=2 >
	<img src=/spacer.gif width=20 height=12 border=0>
	<input type="checkbox" name="brutal_enable" value=1><%tcWebApi_multilingual("1","prevent_pin_compromise_str")%>
	<input type="text" name="wps_atk_times" size="2" value="<%if tcWebApi_get("WLan_Entry0","WscMaxPinAttack","h") <> "N/A" then tcWebApi_get("WLan_Entry0","WscMaxPinAttack","s") end if%>"><%tcWebApi_multilingual("1","fail_pin_connect_str")%>
	<br><img src=/spacer.gif width=45 height=12 border=0><%tcWebApi_multilingual("1","auto_disable_str")%>
	</TD>
</TR>
<TR id='wladv_keep_exist'>
	<TD nowrap colspan=2 >
	<input type="checkbox" name="protect_enable" id="wsc_config" value="on"><%tcWebApi_multilingual("1","keep_exist_wireless_str")%><script> if( an_router_flag == 1) document.write("(2.4GHz b/g/n)");</script>
	</TD>
</TR>
<TR id='wlaadv_keep_exist'>
        <TD nowrap colspan=2 >
	<input type="checkbox" name="wsc_config" id="wsc_config_an" value="on"><%tcWebApi_multilingual("1","keep_exist_wireless5g_str")%> (5GHz a/n)
        </TD>
</TR>
<TR id=ap_bluebar><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR id=apmode>
	<TD nowrap colspan=2 ><A tabindex=-1 href="javascript:loadhelp('_wladv','apmode')"><B><%tcWebApi_multilingual("1","ap_mode_str")%></B></A></TD>
</TR>
<TR id=apmode_checkbox>
	<TD nowrap colspan=2 >
	<input type="checkbox" name="enable_ap_mode" id="ap_mode" onClick="ap_display()"><%tcWebApi_multilingual("1","ap_mode_enable_str")%>
	</TD>
</TR>
<TR id=ap_device_name>
	<TD nowrap><img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","device_name_str")%></TD>
	<TD nowrap align=right><input type="text" name="device_name" size="20" maxlength="12" value=""></TD>
</TR>
<TR id=ap_dyn_getip>
	<TD nowrap colspan=2 ><img src=/spacer.gif width=20 height=12 border=0>
		<input type="checkbox" name="dyn_get_ip" onClick="setIP(document.forms[0])"><%tcWebApi_multilingual("1","get_ip_dynamic_str")%>
	</TD>
</TR>
<TR id=ap_addr>
	<TD nowrap><img src=/spacer.gif width=20 height=12 border=0><img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","ip_addr_str")%></TD>
	<TD nowrap align=right>
		<input type="text" name="APaddr1"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);" >.
		<input type="text" name="APaddr2"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);">.
		<input type="text" name="APaddr3"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);">.
		<input type="text" name="APaddr4"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);">
	</TD>
</TR>
<TR id=ap_mask>
	<TD nowrap><img src=/spacer.gif width=20 height=12 border=0><img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","ip_mask_str")%></TD>		
	<TD nowrap align=right>
		<input type="text" name="APmask1"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);" >.
		<input type="text" name="APmask2"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);">.
		<input type="text" name="APmask3"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);">.
		<input type="text" name="APmask4"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);">
	</TD> 
</TR>
<TR id=ap_gateway>
	<TD nowrap><img src=/spacer.gif width=20 height=12 border=0><img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","gateway_ip_str")%></TD>		
	<TD nowrap align=right>
		<input type="text" name="APgateway1"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);" >.
		<input type="text" name="APgateway2"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);">.
		<input type="text" name="APgateway3"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);">.
		<input type="text" name="APgateway4"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);">
	</TD>
</TR>
<TR id=ap_dyn_dns>
	<TD nowrap colspan=2 ><img src=/spacer.gif width=20 height=12 border=0>
		<input type="checkbox" name="dyn_get_dns" onClick="setDNS(document.forms[0])"><%tcWebApi_multilingual("1","dns_server_str")%>
	</TD>
</TR>
<TR id=ap_daddr>
	<TD nowrap><img src=/spacer.gif width=20 height=12 border=0><img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","primary_dns_str")%></TD>
	<TD nowrap align=right>
	<input type="text" name="APDAddr1"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);" >.
	<input type="text" name="APDAddr2"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);">.
	<input type="text" name="APDAddr3"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);">.
	<input type="text" name="APDAddr4"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);">
	</TD>
</TR>
<TR id=ap_pdaddr>
	<TD nowrap><img src=/spacer.gif width=20 height=12 border=0><img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","secondary_dns_str")%></TD>
	<TD nowrap align=right>
	<input type="text" name="APPDAddr1"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);" >.
	<input type="text" name="APPDAddr2"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);">.
	<input type="text" name="APPDAddr3"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);">.
	<input type="text" name="APPDAddr4"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onKeyDown="keydown(event,this);" onKeyPress="return getkey('num',event);" onKeyUp="keyup(event,this);">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_wladv','access')"><B><%tcWebApi_multilingual("1","wireless_card_str")%></B></A>
	</TD>
	<TD nowrap>
	<input class="common_bt" type="button" name="access" id="access" value="<%tcWebApi_multilingual("1","access_list_str")%>" onClick="location.href='WLG_acl.asp'">
	</TD>
</TR>
<TR><TD>&nbsp;</TD></TR>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap style="display:none">   <!----------------201311121446, Tony, Disable Wireless Sensitivity for ACS Channel-------------------->
	<TABLE border="0" cellpadding="2" cellspacing="1" width="80%" align="left">
	<TR>
		<A tabindex=-1 href=""><B><%tcWebApi_multilingual("1","sensitivity_acs_str")%></B></A>
	</TR>
	<tr>
	        <td align="left" nowrap colspan="2">
	            <input type="radio" name="acs_level" value="0"><%tcWebApi_multilingual("1","high_str")%>
		</td>
	</tr>
	<tr>
		<td align="left" nowrap colspan="2">
		       <input type="radio" name="acs_level" value="1"><%tcWebApi_multilingual("1","middle_str")%>
		</td>
		</tr>
	<tr>
		<td align="left" nowrap colspan="2">
		        <input type="radio" name="acs_level" value="2"><%tcWebApi_multilingual("1","low_str")%>
		</td>
	</tr>

	</TABLE>
	</TD>
</TR>
<TR><TD>&nbsp;</TD></TR>
</TR>
<TR><TD colspan=2 style="display:none"><img src="/liteblue.gif" width=100% height=12></TD></TR>  <!----------------201311121446, Tony, Disable line blue-------------------->
</TABLE>
</div>
<div id="waiting_bar" style="display:none">
<div  align="center"><BR><BR><TR><TD align="center"><B><%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%></B></TD></TR><BR><BR></div>
<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" alt="waiting" /></div>
</div>
<%tcWebApi_multilingual("2","_wladv_help.asp")%>
</FORM>
</BODY>
</HTML>
