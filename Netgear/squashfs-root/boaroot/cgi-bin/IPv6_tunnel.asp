<%
If Request_Form("ipv6_tunnel_flag") = "1" Then
	
	/* WAN IPv6 */
	tcWebApi_set("Wan_Common","6to4_tunnel","ipv6_tunnel_flag")
	tcWebApi_set("Wan_Common","6to4_relay_type","ipv6_hidden_6to4_relay_type")
	if request_Form("ipv6_hidden_6to4_relay_type") = "1" then
		tcWebApi_set("Wan_Common","6to4_relay_ip","ipv6_hidden_6to4_relay")
	end if 
	
	/* LAN IPv6 */
	tcWebApi_set("Lan_Entry","IP6InterfaceEnable","ipv6_hidden_enable_interface")
	tcWebApi_set("Lan_Entry","IP6","LANIPV6")
	tcWebApi_set("Lan_Entry","PREFIX6","LANIPV6PREFIXLENGTH")
	tcWebApi_set("Lan_Entry","IP6InterfaceID","ipv6_hidden_interface_id")
	tcWebApi_set("Lan_Entry","IP6LinkLocal","ipv6_hidden_interface_id")
	
	
	/* Firewall */
	tcWebApi_set("Firewall_Entry","firewall_status","ipv6_hidden_filtering") 
	tcWebApi_commit("Firewall_Entry")
	
	/* DHCP6s */
	tcWebApi_set("Dhcp6s_Entry","Enable","DHCP6SEnable")
	if request_Form("DHCP6SMode") = "1" then
		tcWebApi_set("Dhcp6s_Entry","Mode","DHCP6SMode")
	end if
	
	/* radvd */
	tcWebApi_set("Radvd_Entry","Enable","RADVDEnable")
	tcWebApi_set("Radvd_Entry","Mode","RADVDMode")
	tcWebApi_set("Radvd_Entry","M_Flag","RADVDMbit")
	tcWebApi_set("Radvd_Entry","O_Flag","RADVDObit")
	
	/* Commit */
	tcWebApi_commit("Radvd_Entry")
	tcWebApi_commit("Dhcp6s_Entry")
	tcWebApi_commit("Wan_PVC1")
	
	tcWebApi_set("AutoDetect_Entry","WanIPv6Status","ipv6_auto_detc_flag")


End If
%>
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/ipv6.js"></script>
<script language=javascript type=text/javascript src="/ipv6_tunnel.js"></script>
<title> </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/IPv6_tunnel.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="ipv6_tunnel">

<div class="page_title"><%tcWebApi_multilingual("1","ipv6_str")%></div>
<div class="fix_button" id="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
		<input class="common_bt" type=button name="Status Refresh" id=refresh value="<%tcWebApi_multilingual("0","glbstr_refresh")%>" onClick="location.href=IPv6_index.asp;">&nbsp;&nbsp;
		<input class="cancel_bt" type=button name=Cancel id=cancel value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick="location.href=IPv6_tunnel.asp;">&nbsp;&nbsp;
        <input class="apply_bt" type=submit name=Apply id=apply value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick="return check_ipv6_6to4(document.forms[0])";>
		</TD>
</TR>
</TABLE>
</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>


<script>
var ipv6_address_not_avaible_str="<%tcWebApi_multilingual("1","ipv6_address_not_avaible_str")%>";

var ipv6_ip_assign="<%if tcWebApi_get("Radvd_Entry","M_Flag","h") = "off" then asp_write("0") else asp_write("1") end if%>";
var ipv6_interface_type="<%if tcWebApi_get("Lan_Entry","IP6InterfaceEnable","h") = "1" then asp_write("1") else asp_write("0") end if%>";
var ipv6_interface_id="<%if tcWebApi_get("Lan_Entry","IP6InterfaceID","h") <> "N/A" then tcWebApi_get("Lan_Entry","IP6InterfaceID","s") else asp_write("0.0.0.0") end if%>";
var ipv6_cone_fitering="<%if tcWebApi_get("Firewall_Entry","firewall_status","h") = "1" then asp_write("0") else asp_write("1") end if%>";

var ipv6_lan_ip = "<%if tcWebApi_get("DeviceInfo_LanIP6","ManualGlobal","h") = "N/A" then tcWebApi_get("DeviceInfo_LanIP6","DynamicGlobal0","s") elseif tcWebApi_get("DeviceInfo_LanIP6","ManualGlobal","h") = "" then tcWebApi_get("DeviceInfo_LanIP6","DynamicGlobal0","h") else tcWebApi_get("DeviceInfo_LanIP6","ManualGlobal","s") end if%>";	


//var internet_ppp_type = "0";

var ipv6_6to4_relay_ip = "<%if tcWebApi_get("Wan_Common","6to4_relay_ip","h") <> "N/A" then tcWebApi_get("Wan_Common","6to4_relay_ip","s") else asp_write("0.0.0.0") end if%>";

var ipv6_wan_trans="<%tcWebApi_get("Wan_Common","TransMode","s")%>";
var ipv6_wan_dsl_active="<%tcWebApi_get("Wan_PVC1","Active","s")%>";
var ipv6_wan_dsl_isp="<%tcWebApi_get("Wan_PVC1","ISP","s")%>";

var ipv6_wan_eth_active="<%tcWebApi_get("WanExt_PVC10e1","Active","s")%>";
var ipv6_wan_eth_isp="<%tcWebApi_get("WanExt_PVC10e1","ISP","s")%>";

var internet_basic_type = "1";
if(ipv6_wan_trans=="ATM")
{
	
	if(ipv6_wan_dsl_active!="No")
	{
		if(ipv6_wan_dsl_isp=="2")
			internet_basic_type = "0";
	}
}
else
{
	if(ipv6_wan_eth_active!="No")
	{
		if(ipv6_wan_eth_isp=="2")
			internet_basic_type = "0";
	}
}


function loadvalue()
{
	var cf = document.forms[0];
	var i;

	/* Remote 6to4 Relay Router */
	var ipv6_6to4_relay_type = "<%if tcWebApi_get("Wan_Common","6to4_relay_type","h") <> "N/A" then tcWebApi_get("Wan_Common","6to4_relay_type","s") else asp_write("0") end if%>";
	if( ipv6_6to4_relay_type == "0" )
	{
		cf.remote[0].checked = true;
	}
	else if( ipv6_6to4_relay_type == "1" )
	{
		cf.remote[1].checked = true;
	}
	setRemote();
	var relay_array = ipv6_6to4_relay_ip.split('.');
	
	cf.Romte_IP_1.value = relay_array[0];
	cf.Romte_IP_2.value = relay_array[1];
	cf.Romte_IP_3.value = relay_array[2];
	cf.Romte_IP_4.value = relay_array[3];
	/*
	for( i=0; i<relay_array.length; i++ )
	{
		cf.Romte_IP[i].value = relay_array[i];
	}
	*/
	/* load the LAN Setup items' value */
	ipv6_load_common(cf);
}
</script>

<input type="hidden" name="ipv6_hidden_6to4_relay" value="">
<input type="hidden" name="ipv6_hidden_6to4_relay_type" value="0">
<input type="hidden" name="ipv6_hidden_enable_interface" value="">
<input type="hidden" name="ipv6_hidden_interface_id" value="">
<input type="hidden" name="ipv6_hidden_filtering" value="">
<input type="hidden" name="ipv6_tunnel_flag" value="0">
<input type=hidden name=LANIPV6 value="">
<input type=hidden name=LANIPV6PREFIXLENGTH value="64">
<input type=hidden name=DHCP6SEnable value="1">
<input type=hidden name=DHCP6SMode value="0">
<input type=hidden name=RADVDEnable value="1">
<input type=hidden name=RADVDMode value="0">
<input type=hidden name=RADVDMbit value="">
<input type=hidden name=RADVDObit value="on">
<input type="hidden" name="ipv6_auto_detc_flag" value="0">

<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<TR>
        <TD nowrap>
        <A tabindex=-1 href="javascript:loadhelp('_IPv6','internet')"><B><%tcWebApi_multilingual("1","internet_connection_type_str")%></B></A>
        </TD>
        <TD nowrap align=right>
        <select name="con_type" id="con_type" onChange="change_ipv6(document.forms[0].con_type.value)">
            <option value="disabled"><%tcWebApi_multilingual("1","disabled_str")%></option>
            <option value="autoDetect"><%tcWebApi_multilingual("1","auto_detect_str")%></option>
			<option value="autoConfig"><%tcWebApi_multilingual("1","auto_config_str")%></option>
            <option value="6to4" selected><%tcWebApi_multilingual("1","tunnel_6to4_str")%></option>
			<option value="bridge"><%tcWebApi_multilingual("1","pass_through_str")%></option>
			<option value="fixed"><%tcWebApi_multilingual("1","fixed_str")%></option>
			<option value="dhcp"><%tcWebApi_multilingual("1","dhcp_str")%></option>
			<option value="pppoe"><%tcWebApi_multilingual("1","pppoe_str")%></option>	
        </select>
        </TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_IPv6_tunnel','remote_relay')"><B><%tcWebApi_multilingual("1","remote_6to4_relay_str")%></B></A></TD>
</TR>
<TR>
	<TD nowrap colspan=2><input type="radio" name="remote" id="remote" value="0" onClick="setRemote()"><%tcWebApi_multilingual("1","auto_str")%></TD>
</TR>
<TR>
	<TD nowrap><input type="radio" name="remote" id="remote" value="1" onClick="setRemote()"><%tcWebApi_multilingual("1","static_ip_address_str")%></TD>
	<TD nowrap align=right>
	<input type="text" name="Romte_IP_1" id="romte_ipaddress1" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="Romte_IP_2" id="romte_ipaddress2" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="Romte_IP_3" id="romte_ipaddress3" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="Romte_IP_4" id="romte_ipaddress4" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
        <TD nowrap><A tabindex=-1 href="javascript:loadhelp('_IPv6_tunnel','lan_ipaddr')"><B><%tcWebApi_multilingual("1","lan_setup_str")%></B></A></TD>
</TR>
<TR>
        <TD nowrap><A tabindex=-1 href="javascript:loadhelp('_IPv6_tunnel','lan_ipaddr')"><B><%tcWebApi_multilingual("1","routers_ipv6_address_str")%></B></A></TD>
		<TD name="lan_ip" id="lan_ip" align=right><script>ipv6_write_ip(ipv6_lan_ip);</script></TD>
</TR>
<TR>
        <TD nowrap><A tabindex=-1 href="javascript:loadhelp('_IPv6_tunnel','lan_ip_assign')"><%tcWebApi_multilingual("1","ip_address_assignment_str")%></A></TD>
</TR>
<TR>
        <TD nowrap colspan=2><input type="radio" name="ipv6_lan_ip_assign" id="ipv6_lan_ip_assign" value="DHCP"><%tcWebApi_multilingual("1","use_dhcp_server_str")%></TD>
</TR>
<TR>
        <TD nowrap colspan=2><input type="radio" name="ipv6_lan_ip_assign" id="ipv6_lan_ip_assign" value="Auto Config"><%tcWebApi_multilingual("1","auto_config_str")%></TD>
</TR>
<TR>
        <TD nowrap colspan=2>
        <BR>
        <input type="checkbox" name="enable_interface" value="" onClick="set_interface();">
	<A tabindex=-1 href="javascript:loadhelp('_IPv6_auto','interface_id')"><%tcWebApi_multilingual("1","use_this_interface_id_str")%></A>
        </TD>
</TR>
<TR>
        <TD nowrap colspan=2><img src=/spacer.gif width=20 height=12 border=0>
	<input type="text" name="IP_interface_1" id="ip_interface1" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
        <input type="text" name="IP_interface_2" id="ip_interface2" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
        <input type="text" name="IP_interface_3" id="ip_interface3" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
        <input type="text" name="IP_interface_4" id="ip_interface4" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">
        </TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
        <TD nowrap>
        <A tabindex=-1 href="javascript:loadhelp('_IPv6_tunnel','nat')"><B><%tcWebApi_multilingual("1","ipv6_filtering_str")%></B></A>
        </TD>
        <TD nowrap align=right>
        <input type="radio" name="IPv6Filtering" id="ipv6_filtering" value="Secured"><%tcWebApi_multilingual("1","secured_str")%>&nbsp;
        <input type="radio" name="IPv6Filtering" id="ipv6_filtering" value="Open"><%tcWebApi_multilingual("1","open_str")%>&nbsp;&nbsp;
        </TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</TABLE>
</div>

<div id="waiting_bar" style="display:none">
<div  align="center"><BR><BR><TR><TD align="center"><B><%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%></B></TD></TR><BR><BR></div>
<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" id="loading_img" alt="waiting" /></div>
</div>

<%tcWebApi_multilingual("2","_IPv6_tunnel_help.asp")%>
</FORM>
</BODY>
</HTML>

