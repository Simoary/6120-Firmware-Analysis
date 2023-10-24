<%
if request_Form("gui_language") <> "" then
	tcWebApi_set("LanguageSwitch_Entry","Language_Selection","gui_language")
end if	
%>
<html><head><link rel="stylesheet" href="/style/advanced.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/region_class.js"></script>
<script language=javascript type=text/javascript src="/advanced.js"></script>
<script language=javascript type=text/javascript src="/top.js"></script>
<script language=javascript type=text/javascript src="/aye_utils.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_netgear_router")%> <%tcWebApi_get("SkuId_Entry","ProductName","s")%> </title>
<meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>
<body onload="loadvalue();" onResize="change_height();">
<form>
<script>
var wlan_enable="<%If tcWebApi_get("WLan_Common","APOn","h") <> "N/A" then tcWebApi_get("WLan_Common","APOn","s") end if%>";
var wlan5g_enable="<%If tcWebApi_get("WLan11ac_Common","APOn","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","APOn","s") end if%>";
var wlan_wps_enable="<%If tcWebApi_get("WLan_Entry","WPSConfMode","h") <> "N/A" then tcWebApi_get("WLan_Entry","WPSConfMode","s") end if%>";
var wlan5g_wps_enable="<%If tcWebApi_get("WLan11ac_Entry","WPSConfMode","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry","WPSConfMode","s") end if%>";
var enable_action=1;
var enabled_wds=0;
if((wlan_enable == 1 || wlan5g_enable == 1) && (wlan_wps_enable == 7 || wlan5g_wps_enable == 7))
   var enabled_wps=1;
else
   var enabled_wps=0;
var type="advanced";
var charcount=0;
var file_version=0;
var file_region="";
var netgear_version=0;
var netgear_region="WW";

var help_info="_index";
var wps_charcount=0;
var wps_endis_configured=1;     // 1 for unconfigured, 5 for configured
var wps_an_endis_configured=1;  // 1 for unconfigured, 5 for configured
var folder_path="";     //save the browser's folder path, and show in USB creat/edit page
var qos_check_time=0;
var pin_refresh_time=0;
var select_basic="0";
var select_type="1";
var plc_setting_flag="";
var wps_process=0;
var enable_ap_flag="0";//bug 24666 according to the page 128 of spec 2.0,add AP mode
var ParentalControl="<%if tcWebApi_get("LiveParentalCtl_Common","Active","h") <> "N/A" then tcWebApi_get("LiveParentalCtl_Common","Active","s") end if%>";

var gui_region="<%if tcWebApi_get("LanguageSwitch_Entry","GUI_Region","h") <> "N/A" then tcWebApi_get("LanguageSwitch_Entry","GUI_Region","s") end if%>";
var region_class;
var TriggerorForward;

var logs_checkbox_flag = 1;
var thank_login_flag = 0;
var host_name="DEVG2000F";
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
var dns_third_flag=0; //if support third DNS this value is 1, don't this vlaue is 0
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
var tivo_flag=1;
var auto_conn_flag=1;
var bridge_iptv_flag=1;
var parental_ctrl_flag=0;
var dfs_channel2_router_flag=1;
var new_multiple_lang=1;

//Set current internet Type
var Wan_PVC_ISP = "<%tcWebApi_get("Wan_PVC","ISP","s")%>";
var Wan_PVC_ENCAP = "<%tcWebApi_get("Wan_PVC","ENCAP","s")%>";
var Pptp_Entry_Active = "<%tcWebApi_get("Pptp_Entry","Active","s")%>";
var L2tp_Entry_Active = "<%tcWebApi_get("L2tp_Entry","Active","s")%>";
var Wan_Common_TransMode = "<%tcWebApi_get("Wan_Common","TransMode","s")%>";

if(Wan_PVC_ISP=="2")
{
	if(Wan_PVC_ENCAP=="PPPoA LLC" ||Wan_PVC_ENCAP=="PPPoA VC-Mux")
		menu_internet="pppoa";
	else
		menu_internet="pppoe";
		
	if(Wan_Common_TransMode!="ATM")	
		menu_internet="pppoe";	
}
else
{
	if(Pptp_Entry_Active=="Yes")
		menu_internet="pptp";
	else if(L2tp_Entry_Active=="Yes")	
		menu_internet="l2tp";
	else
	{
		if(Wan_PVC_ENCAP=="1483 Routed IP LLC(IPoA)" || Wan_PVC_ENCAP=="1483 Routed IP VC-Mux")
			menu_internet="ipoa";
		else
			menu_internet="ipoe";
	}	
}
if ((ParentalControl=="Yes") || (ParentalControl=="No"))
{
	parental_ctrl_flag = 1;
}	
if(ParentalControl=="Yes")
	ParentalControl="1";
else if(ParentalControl=="No")	
	ParentalControl="0";

//End of set internet Type

var menu_isp = "<% if tcWebApi_get("Wan_PVC","ISP","h") <> "N/A" then tcWebApi_get("Wan_PVC","ISP","s") end if%>";
var menu_isp_version = "<% if tcWebApi_get("Wan_PVC","IPVERSION","h") <> "N/A" then tcWebApi_get("Wan_PVC","IPVERSION","s") end if%>";
var is_minidlna = "<%if tcWebApi_get("Minidlna_Entry","friendly_name","h") <> "N/A" then asp_write("1") else asp_write("0") end if%>";
var from_nowan = "0";

var dns_hijack = "<%if tcWebApi_get("Dproxy_Entry","dnshijack_flag","h") = "N/A" then asp_write("1") else tcWebApi_get("Dproxy_Entry","dnshijack_flag","s") end if %>";
var lanip = ('<%If tcWebApi_get("Lan_Entry","IP","h") <> "N/A" then tcWebApi_get("Lan_Entry","IP","s") end if%>') ;
function changeUrl()
{
	if((dns_hijack == "1") && (this.location.hostname != lanip && this.location.hostname.indexOf("routerlogin.net") == -1 && this.location.hostname.indexOf("routerlogin.com") == -1))
		this.location.hostname = "www.routerlogin.net";
}

/* Handle IPv6 Disable/PPPoE/DHCP/Autoconfig/Static/Passthrough */
var ipv6_wan_trans="<%tcWebApi_get("Wan_Common","TransMode","s")%>";
var ipv6_wan_dsl_active="<%tcWebApi_get("Wan_PVC1","Active","s")%>";
var ipv6_wan_dsl_isp="<%tcWebApi_get("Wan_PVC1","ISP","s")%>";
var ipv6_wan_dsl_dyn="<%tcWebApi_get("Wan_PVC1","EnableDynIPv6","s")%>";

var ipv6_wan_eth_active="<%tcWebApi_get("WanExt_PVC10e1","Active","s")%>";
var ipv6_wan_eth_isp="<%tcWebApi_get("WanExt_PVC10e1","ISP","s")%>";
var ipv6_wan_eth_dyn="<%tcWebApi_get("WanExt_PVC10e1","EnableDynIPv6","s")%>";

var ipv6_wan_auto="<%tcWebApi_get("AutoDetect_Entry","WanIPv6Status","s")%>";
var ipv6_tunnel="<%tcWebApi_get("Wan_Common","6to4_tunnel","s")%>";
var menu_ipv6_status;

if(ipv6_wan_auto=="1")
{
	menu_ipv6_status="AUTO";
}
else
{
	menu_ipv6_status="Disable";//default
	
	if(ipv6_tunnel=="1")
	{
		menu_ipv6_status="TUNNEL";
	}
	else if(ipv6_wan_trans=="ATM")
	{
		if(ipv6_wan_dsl_active!="No")
		{
			if(ipv6_wan_dsl_isp=="2")
				menu_ipv6_status="PPPoE";
			else if(ipv6_wan_dsl_isp=="1")	
				menu_ipv6_status="Static";
			else if(ipv6_wan_dsl_isp=="3")	
				menu_ipv6_status="Passthrough";	
			else if(ipv6_wan_dsl_isp=="0")	
			{
				if(ipv6_wan_dsl_dyn=="0")
					menu_ipv6_status="Autoconfig";	
				else	
					menu_ipv6_status="DHCP";	
			}	
		}
	}
	else
	{
		if(ipv6_wan_eth_active!="No")
		{
			if(ipv6_wan_eth_isp=="2")
				menu_ipv6_status="PPPoE";
			else if(ipv6_wan_eth_isp=="1")	
				menu_ipv6_status="Static";
			else if(ipv6_wan_eth_isp=="3")	
				menu_ipv6_status="Passthrough";	
			else if(ipv6_wan_eth_isp=="0")	
			{
				if(ipv6_wan_eth_dyn=="0")
					menu_ipv6_status="Autoconfig";	
				else	
					menu_ipv6_status="DHCP";	
			}	
		}	
	}
}
function loadvalue()
{
	changeUrl();
	setFooterClass();
	change_height();

	region_class = initClass(gui_region);

	if( from_nowan == "1" )
		menu_color_change('setup_wizard');
	else
		menu_color_change('home');

	if(guest_router_flag == 1 )
	{
		//document.getElementById("guest_network_setup").style.display="";
		//if( an_router_flag == 1 )
			//document.getElementById("guest_a").style.display="";
	}

	if( usb_router_flag == 1)
	{		
		if( is_minidlna == 1)
			document.getElementById("usb_media").style.display="";
		else
			document.getElementById("usb_media").style.display="none";
	}

	if(block_sites_flag == 1)
		document.getElementById("security_block_site").style.display="";

	if( plc_setting_flag == 1)
		document.getElementById("advanced_plc").style.display="";

	if( wds_router_flag == 1)
		document.getElementById("advanced_wds").style.display="";

	if( qos_router_flag == 1)
		document.getElementById("qos_setup").style.display="";

	if( usb_router_flag == 1)
		document.getElementById("advanced_usb").style.display="";

	if(ipv6_flag == 1)
		document.getElementById("advanced_ipv6").style.display="";
	else
		document.getElementById("advanced_ipv6").style.display="none";

	if(tr069_router_flag == 1)
		document.getElementById("advanced_tr069").style.display="";

	if(traffic_router_flag == 1)
		document.getElementById("advanced_traffic").style.display="";	

	if(parental_ctrl_flag == 1)
		document.getElementById("security_parental").style.display="";
		
}

</script>
<div id="top">
	<iframe name="topframe" id="topframe" src="/cgi-bin/top.asp" allowtransparency="true" height="100%" width="100%" frameborder="0"></iframe>
</div>

<div id="container" class="container_center">
<div id="middle">
<div id="menu">
<script>
var setup_open=0;
var usb_open=0;
var security_open=0;
var admin_open=0;
var advanced_open=0;
</script>
	<div id="home" class="advanced_purple_button" onClick="click_adv_action('home');"><b><span><%tcWebApi_multilingual("1","advanced_home_str")%></span></b></div>
	<div id="setup_wizard" class="advanced_black_button" onClick="click_adv_action('setup_wizard');"><b><span><%tcWebApi_multilingual("1","setup_wizard_str")%></span></b></div>
	<div id="wps" class="advanced_black_button" onClick="click_adv_action('wps');"><b><span><%tcWebApi_multilingual("1","wps_wizard_str")%></span></b></div>

	<div id="setup" class="advanced_white_close_button" onClick="open_or_close_sub('setup'); setup_open++;"><b><span><%tcWebApi_multilingual("1","setup_str")%></span></b></div>
	<div id="setup_sub" class="sub_men"  style="display: none">
	<dl>
		<dt id="internet_setup" class="sub_back"><a onClick="click_adv_action('internet_setup');"><b><span><%tcWebApi_multilingual("1","internet_setup_str")%></span></b></a></dt><!--href="javascript:void(0)"-->
		<dt id="dsl_setup" class="sub_back"><a onclick="click_adv_action('dsl_setup');"><b><span><%tcWebApi_multilingual("1","dsl_setup_str")%></span></b></a></dt><!--href="javascript:void(0)"-->
		<dt id="wireless_setup" class="sub_back"><a  target="formframe" onClick="click_adv_action('wireless_setup');"><b><span><%tcWebApi_multilingual("1","wireless_setup_str")%></span></b></a></dt> <!--href="javascript:void(1)"-->
		<dt id="guest_network_setup" class="sub_back"><a  target="formframe" onClick="click_adv_action('guest_network_setup');"><b><span><%tcWebApi_multilingual("1","guest_network_str")%></span></b></a></dt>
		<!--<dt id="guest_a" class="sub_back" style="display:none"><a  target="formframe" onclick="click_adv_action('guest_a');"><b><u>Guest Network<script>document.write("a/n");</script></u></b></a></dt>-->	
		<dt id="wan_setup" class="sub_back"><a  target="formframe" onClick="click_adv_action('wan_setup');"><b><span><%tcWebApi_multilingual("1","wan_setup_str")%></span></b></a></dt>
		<!------------------------------------------------------------------------------------------------>
		
	    <dt id="lan_setup" class="sub_back"><a target="formframe" onClick="click_adv_action('lan_setup');"><b><span><%tcWebApi_multilingual("1","lan_setup_str")%></span></b></a></dt>
		<dt id="qos_setup" class="sub_back" style="display: none"><a  target="formframe" onClick="click_adv_action('qos_setup');"><b><span><%tcWebApi_multilingual("1","qos_setup_str")%></span></b></a></dt>
	</dl>
	</div>
	<div id="usb" class="advanced_white_close_button" onClick="open_or_close_sub('usb'); usb_open++;"><b><span><%tcWebApi_multilingual("1","usb_storage_str")%></span></b></div>
	<div id="usb_sub" class="sub_men" style="display: none">	
	<dl>	
		<dt id="usb_basic" class="sub_back"><a  target="formframe" onClick="click_adv_action('usb_basic');">
		<b><span><%tcWebApi_multilingual("1","basic_setting_str")%></b></span>
</a></dt>
	       	<dt id="usb_advanced" class="sub_back"><a  target="formframe" onClick="click_adv_action('usb_advanced');"><b><span><%tcWebApi_multilingual("1","advanced_setting_str")%></span></b></a></dt>
		<dt id="usb_media" class="sub_back" style="display: none"><a  target="formframe" onClick="click_adv_action('usb_media');"><b><span><%tcWebApi_multilingual("1","media_server_str")%></span></b></a></dt>
	</dl>	
	</div>

	<div id="security" class="advanced_white_close_button" onClick="open_or_close_sub('security'); security_open++;"><b><span><%tcWebApi_multilingual("1","security_str")%></span></b></div>
	<div id="security_sub" class="sub_men"  style="display: none">
	<dl>
		<dt id="security_parental" class="sub_back" style="display: none"><a  target="formframe" onClick="click_adv_action('security_parental');"><b><span><%tcWebApi_multilingual("1","parental_control_str")%></span></b></a></dt>
		<dt id="security_block_site" class="sub_back"><a  target="formframe" onClick="click_adv_action('security_block_site');"><b><span><%tcWebApi_multilingual("1","block_site_str")%></span></b></a></dt>
		<dt id="security_block_service" class="sub_back"><a  target="formframe" onClick="click_adv_action('security_block_service');"><b><span><%tcWebApi_multilingual("1","block_service_str")%></span></b></a></dt>
		<dt id="security_schedule" class="sub_back"><a  target="formframe" onClick="click_adv_action('security_schedule');"><b><span><%tcWebApi_multilingual("1","schedule_str")%></span></b></a></dt>
		<dt id="security_email" class="sub_back"><a  target="formframe" onClick="click_adv_action('security_email');"><b><span><%tcWebApi_multilingual("1","email_str")%></span></b></a></dt>
	</dl>	
	</div>

	<div id="admin" class="advanced_white_close_button" onClick="open_or_close_sub('admin'); admin_open++;"><b><span><%tcWebApi_multilingual("1","administration_str")%></span></b></div>
	<div id="admin_sub" class="sub_men"  style="display: none">
	<dl>
	       	<dt id="admin_status" class="sub_back"><a  target="formframe" onClick="click_adv_action('admin_status');"><b><span><%tcWebApi_multilingual("1","router_status_str")%></span></b></a></dt>
			
		<!--------------------- 201212201711, Tony, remove "Logs" ----------------------------------->
		<dt id="admin_logs" class="sub_back"><a  target="formframe" onClick="click_adv_action('admin_logs');"><b><span><%tcWebApi_multilingual("1","logs_str")%></span></b></a></dt>
		<!-------------------------------------------------------------------------------------------->
		
		<dt id="admin_attached" class="sub_back"><a  target="formframe" onClick="click_adv_action('admin_attached');"><b><span><%tcWebApi_multilingual("1","attached_devices_str")%></span></b></a></dt>
		<dt id="admin_bakup" class="sub_back"><a  target="formframe" onClick="click_adv_action('admin_bakup');"><b><span><%tcWebApi_multilingual("1","backup_settings_str")%></span></b></a></dt>
		<dt id="admin_setpassword" class="sub_back"><a  target="formframe" onClick="click_adv_action('admin_setpassword');"><b><span><%tcWebApi_multilingual("1","set_password_str")%></span></b></a></dt>
		<dt id="admin_upgrade" class="sub_back"><a  target="formframe" onClick="click_adv_action('admin_upgrade');"><b><span><%tcWebApi_multilingual("1","firmware_update_str")%></span></b></a></dt>
	</dl>	
	</div>	

	<div id="advance" class="advanced_white_close_button" onClick="open_or_close_sub('advance'); advanced_open++;"><b><span><%tcWebApi_multilingual("1","advanced_setup_str")%></span></b></div>
	
	<div id="advance_sub" class="sub_men"  style="display: none">
	<dl>
		<dt id="advanced_plc" class="sub_back" style="display: none"><a  target="formframe" onClick="click_adv_action('advanced_plc');"><b><span><%tcWebApi_multilingual("1","powerline_devices_str")%></span></b></a></dt>
		<dt id="advanced_wireless" class="sub_back"><a  target="formframe" onClick="click_adv_action('advanced_wireless');"><b><span><%tcWebApi_multilingual("1","wireless_settings_str")%></span></b></a></dt>
		<dt id="advanced_wds" class="long_name" ><a  target="formframe" style="display:none" onClick="click_adv_action('advanced_wds');"><b><span><%tcWebApi_multilingual("1","wireless_repeat_function_str")%></span></b></a></dt>
		<dt id="advanced_pf_pt" class="long_name"><a  target="formframe" onClick="click_adv_action('advanced_pf_pt');"><b><span><%tcWebApi_multilingual("1","port_forward_trigger_str")%></span></b></a></dt>
		<dt id="advanced_ddns" class="sub_back"><a  target="formframe" onClick="click_adv_action('advanced_ddns');"><b><span><%tcWebApi_multilingual("1","dynamic_dns_str")%></span></b></a></dt>
		<dt id="advanced_static" class="sub_back"><a  target="formframe"  onClick="click_adv_action('advanced_static');"><b><span><%tcWebApi_multilingual("1","static_route_str")%></span></b></a></dt>
		<dt id="advanced_remote" class="sub_back"><a target="formframe" onClick="click_adv_action('advanced_remote');"><b><span><%tcWebApi_multilingual("1","remote_management_str")%></span></b></a></dt>
		<dt id="advanced_usb" class="sub_back"><a  target="formframe" style="display:none" onClick="click_adv_action('advanced_usb');"><b><span><%tcWebApi_multilingual("1","usb_setting_str")%></span></b></a></dt>
		<dt id="advanced_upnp" class="sub_back"><a  target="formframe"  onClick="click_adv_action('advanced_upnp');"><b><span><%tcWebApi_multilingual("1","upnp_str")%></span></b></a></dt>
		<dt id="advanced_ipv6" class="sub_back"><a target="formframe" onClick="click_adv_action('advanced_ipv6');"><b><span><%tcWebApi_multilingual("1","ipv6_str")%></span></b></a></dt>
		<dt id="advanced_tr069" class="sub_back"><a  target="formframe" style="display:none" onClick="click_adv_action('advanced_tr069');"><b><span>TR069</span></b></a></dt>
		<dt id="advanced_traffic" class="sub_back"><a target="formframe" onClick="click_adv_action('advanced_traffic');"><b><span><%tcWebApi_multilingual("1","traffic_meter_str")%></span></b></a></dt> <!--href="javascript:void(0)"-->
		<!--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	</dl>	
	</div>	
</div>
<!--div id="mini_height"> </div-->
<div id="formframe_div">
		<iframe name="formframe" id="formframe" src="RST_status.asp" allowtransparency="true" height="100%" width="100%" scrolling="no" frameborder="0">		</iframe>
</div>

<div id="footer" class="footer"> <img class="footer_img" src="/image/footer/footer.gif">
<div id="support">
	<b> <%tcWebApi_multilingual("0","glbstr_help_support_str")%></b> &nbsp;
		<a target="_blank" href="http://downloadcenter.netgear.com"><%tcWebApi_multilingual("0","glbstr_documentation_str")%></a> | 
		<a target="_blank" href="http://support.netgear.com"><%tcWebApi_multilingual("0","glbstr_support_netgear_str")%></a> | 
		<a target="_blank" href="http://kb.netgear.com/app/answers/detail/a_id/12923"><%tcWebApi_multilingual("0","glbstr_router_faq_str")%></a> |
		<a target="_blank" href="/GPL.htm"><%tcWebApi_multilingual("0","glbstr_gnu_gpl_str")%></a>
</div>
<div id="search" align=right>
	<b> <%tcWebApi_multilingual("0","glbstr_search_help_str")%> </b>
	<input type="text" name="search" value="Enter Search Item" onKeyPress="detectEnter('num',event);" onFocus="this.select();" >
	<input id="search_button" class="search_button" type="button" name="dosearch" value="GO" onClick="do_search();">
</div>
</div>
</div>
</div>
</form>
</body>
</html>
