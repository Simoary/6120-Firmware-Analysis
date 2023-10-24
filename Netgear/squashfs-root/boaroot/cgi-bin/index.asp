<%
if request_Form("gui_language") <> "" then
	tcWebApi_set("LanguageSwitch_Entry","Language_Selection","gui_language")
end if	
%>

<html><head><link rel="stylesheet" href="/style/basic.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/basic.js"></script>
<script language=javascript type=text/javascript src="/top.js"></script>
<script language=javascript type=text/javascript src="/aye_utils.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_netgear_router")%> <%tcWebApi_get("SkuId_Entry","ProductName","s")%> </title>
<meta http-equiv="Content-Type" content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<meta http-equiv=Content-Style-Type content=text/css>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>
<body onload="loadvalue();" onResize="change_height();">
<form>
<script>
var enable_action=1;
var enabled_wds=0;
var enabled_wps=1;
var type="basic";
var charcount=0;
var file_version=0;
var file_region="";
var netgear_version=0;
var netgear_region="WW"
var help_info="_index";
var wps_charcount=0;
var wps_endis_configured=1;     // 1 for unconfigured, 5 for configured
var wps_an_endis_configured=1;  // 1 for unconfigured, 5 for configured
var folder_path="";     //save the browser's folder path, and show in USB creat/edit page
var qos_check_time=0;
var pin_refresh_time=0;
var select_basic="1";
var select_type="0";
var endis_wl_radio='1';
var endis_wla_radio='1';
var wps_process=0;
var enable_ap_flag="0";//bug 24666 according to the page 128 of spec 2.0,add AP mode
var ParentalControl="<%if tcWebApi_get("LiveParentalCtl_Common","Active","h") <> "N/A" then tcWebApi_get("LiveParentalCtl_Common","Active","s") end if%>";


var logs_checkbox_flag = 1;
var thank_login_flag = 0;
var host_name="WNDR3800";
var usb_router_flag = 1; 
var readyShareSupportedLevel = 7; 
var an_router_flag = 1;  //201403111400, Tony, Enable wireless 5G
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
var tivo_flag=1;
var auto_conn_flag=1;
var bridge_iptv_flag=1;
var parental_ctrl_flag=0;
var dfs_channel2_router_flag=0; //201404181523, Tony, Disable Wireless Channel Select
var new_multiple_lang=1;
endis_wl_radio="<%If tcWebApi_get("WLan_Common","APOn","h") <> "N/A" then tcWebApi_get("WLan_Common","APOn","s") end if%>";
endis_wla_radio="<%If tcWebApi_get("WLan11ac_Common","APOn","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","APOn","s") end if%>";

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

var gui_region="<%if tcWebApi_get("LanguageSwitch_Entry","GUI_Region","h") <> "N/A" then tcWebApi_get("LanguageSwitch_Entry","GUI_Region","s") end if%>";

var dns_hijack = "<%if tcWebApi_get("Dproxy_Entry","dnshijack_flag","h") = "N/A" then asp_write("1") else tcWebApi_get("Dproxy_Entry","dnshijack_flag","s") end if %>";
var lanip = ('<%If tcWebApi_get("Lan_Entry","IP","h") <> "N/A" then tcWebApi_get("Lan_Entry","IP","s") end if%>') ;
function changeUrl()
{
	if((dns_hijack == "1") && (this.location.hostname != lanip && this.location.hostname.indexOf("routerlogin.net") == -1 && this.location.hostname.indexOf("routerlogin.com") == -1))
		this.location.hostname = "www.routerlogin.net";
}

function loadvalue()
{
	changeUrl();
	change_height();

	if( usb_router_flag == 0 )
		document.getElementById("basic_ready").style.display = "none";

	if( parental_ctrl_flag == 0 )
		document.getElementById("basic_parental").style.display="none";
}
</script>

<div id="top">
	<iframe name="topframe" id="topframe" src="/cgi-bin/top.asp" allowtransparency="true" height="100%" width="100%" frameborder="0"></iframe>
</div>

<div id="container" class="container_center">

<div id="middle">
<div id="menu">
	<div id="basic_home" class="basic_button_purple" onClick="click_action('basic_home');"><b><span><%tcWebApi_multilingual("1","home_str")%></span></b></div>
	<div id="basic_dsl" class="basic_button" onClick="click_action('basic_dsl');"><b><span>xDSL</span></b></div>
	<div id="basic_internet" class="basic_button" onClick="click_action('basic_internet');"><b><span><%tcWebApi_multilingual("1","internet_str")%></span></b></div>
	<div id="basic_wireless" class="basic_button" onClick="click_action('basic_wireless');"><b><span><%tcWebApi_multilingual("1","wireless_str")%></span></b></div>
	<div id="basic_attached" class="basic_button" onClick="click_action('basic_attached');"><b><span><%tcWebApi_multilingual("1","attached_device_str")%></span></b></div>
	<div id="basic_parental" class="basic_button" onclick="click_action('basic_parental');"><b><span><%tcWebApi_multilingual("1","parent_control_str")%></span></b></div>
	<div id="basic_ready" class="basic_button" onclick="click_action('basic_ready');"><b><span><%tcWebApi_multilingual("1","readyshare_str")%></span></b></div>
	<div id="basic_guest" class="basic_button" onclick="click_action('basic_guest');"><b><span><%tcWebApi_multilingual("1","guest_network_str")%></span></b></div>
</div>
<!--div id="mini_height"> </div-->
<div id="formframe_div">
		<iframe name="formframe" id="formframe" src="/cgi-bin/basic_home_wait.asp" allowtransparency="true" height="100%" width="100%" scrolling="no" frameborder="0" ></iframe>
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
