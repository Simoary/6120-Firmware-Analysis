<%
IF request_Form("submit_flag") <> "" then
	/* Use second PVC for IPv6 */
	if tcWebApi_get("Wan_Common","TransMode","h") = "ATM" then	
		tcWebApi_set("WebCurSet_Entry","wan_pvc","NUMBER_ONE")
		tcWebApi_set("WebCurSet_Entry","nat_pvc","NUMBER_ONE")
		tcWebApi_set("WebCurSet_Entry","wan_pvc_ext","NUMBER_ZERO")
		tcWebApi_set("WebCurSet_Entry","nat_pvc_ext","NUMBER_ZERO")
		tcWebApi_set("Wan_PVC","VPI","dsl_vpi")
		tcWebApi_set("Wan_PVC","VCI","dsl_vci")
	else
		tcWebApi_set("WebCurSet_Entry","wan_pvc","NUMBER_TEN")
		tcWebApi_set("WebCurSet_Entry","nat_pvc","NUMBER_TEN")
		tcWebApi_set("WebCurSet_Entry","wan_pvc_ext","NUMBER_ONE")
		tcWebApi_set("WebCurSet_Entry","nat_pvc_ext","NUMBER_ONE")
	end if
	tcWebApi_set("Wan_Common","6to4_tunnel","ipv6_tunnel_flag")
	tcWebApi_set("Wan_PVC","Active","ENABLE_STRING_YES")
	
	/* Basic Setting */
	tcWebApi_set("Wan_PVC","IPVERSION","IPVERSION")
	tcWebApi_set("Wan_PVC","ISP","ISP")
	tcWebApi_set("Wan_PVC","EnableDynIPv6","AutoConfig")
	tcWebApi_set("Wan_PVC","MTU","wan_TCPMTU")
	tcWebApi_set("Wan_PVC","MSS","wan_TCPMSS")
	
	tcWebApi_set("Wan_PVC","NATENABLE","NATENABLE")
	tcWebApi_set("Wan_PVC","DEFAULTROUTE","DEFAULTROUTE")
	tcWebApi_set("Wan_PVC","ENCAP","ENCAP")
	
	tcWebApi_set("Wan_PVC","PPPv6PD","PPPv6PD")
	tcWebApi_set("Wan_PVC","DHCPUSERCLASS","userClass")
	tcWebApi_set("Wan_PVC","DHCPDOMAINNAME","domainName")

	/* LAN IPv6 */
	tcWebApi_set("Lan_Entry","IP6InterfaceEnable","ipv6_hidden_enable_interface")
	tcWebApi_set("Lan_Entry","IP6","LANIPV6")
	tcWebApi_set("Lan_Entry","PREFIX6","LANIPV6PREFIXLENGTH")
	tcWebApi_set("Lan_Entry","IP6InterfaceID","ipv6_hidden_interface_id")
	tcWebApi_set("Lan_Entry","IP6LinkLocal","ipv6_hidden_interface_id")
	tcWebApi_commit("Lan_Entry")
	
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
	tcWebApi_commit("Wan_PVC")
	
	tcWebApi_set("AutoDetect_Entry","WanIPv6Status","ipv6_auto_detc_flag")
End if
%>	
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/ipv6.js"></script>
<script language=javascript type=text/javascript src="/ipv6_dhcp.js"></script>
<title> </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/IPv6_autoConfig.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="ipv6_dhcp">
<input type=hidden name=IPVERSION value="IPv4/IPv6">
<input type=hidden name=ISP value="0">
<input type=hidden name=NATENABLE value="Enable">
<input type=hidden name=DEFAULTROUTE value="Yes">
<input type=hidden name=ENCAP value="">
<input type=hidden name=EnableDynIPv6 value="0">
<input type=hidden name=PPPv6PD value="Yes">
<input type=hidden name=DHCP6SEnable value="1">
<input type=hidden name=AutoConfig value="0">
<input type=hidden name=DHCP6SMode value="0">
<input type=hidden name=RADVDEnable value="1">
<input type=hidden name=RADVDMode value="0">
<input type=hidden name=RADVDMbit value="">
<input type=hidden name=RADVDObit value="on">
<input type=hidden name=LANIPV6 value="">
<input type=hidden name=LANIPV6PREFIXLENGTH value="64">
<input type=hidden name=NUMBER_ZERO value="0">
<input type=hidden name=NUMBER_ONE value="1">
<input type=hidden name=NUMBER_TEN value="10">
<input type=hidden name=ENABLE_STRING_YES value="Yes">
<input type=hidden name=dsl_vpi value="<%tcWebApi_get("Wan_PVC0","VPI","s")%>">
<input type=hidden name=dsl_vci value="<%tcWebApi_get("Wan_PVC0","VCI","s")%>">
<input type=hidden name=wan_TCPMSS value="0">
<input type=hidden name=wan_TCPMTU value="0">
<input type="hidden" name="ipv6_tunnel_flag" value="0">


<div class="page_title"><%tcWebApi_multilingual("1","ipv6_str")%></div>
<div id="fix_button" class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
		<input class="common_bt" type=button name="Status Refresh" id=refresh value="<%tcWebApi_multilingual("0","glbstr_refresh")%>" onClick='location.href="IPv6_autoConfig.asp";'>&nbsp;&nbsp;
		<input class="cancel_bt" type=button name=Cancel id=cancel value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick='location.href="IPv6_autoConfig.asp";'>&nbsp;&nbsp;
        <input class="apply_bt" type=submit name=Apply id=apply value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick="return check_ipv6_dhcp(document.forms[0])";>
		</TD>
</TR>
</TABLE>

</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>


<script>
var alert_invalid_accout_name_str="<%tcWebApi_multilingual("1","alert_invalid_accout_name_str")%>";
var alert_invalid_domain_name_str="<%tcWebApi_multilingual("1","alert_invalid_domain_name_str")%>";
var alert_invalid_interfaceid_str="<%tcWebApi_multilingual("1","alert_invalid_interfaceid_str")%> Interface ID";
var ipv6_address_not_avaible_str="<%tcWebApi_multilingual("1","ipv6_address_not_avaible_str")%>";
var ipv6_prefix="<%if tcWebApi_get("Dhcp6s_Entry","Enable","h") = "1" then tcWebApi_get("Dhcp6s_Entry","PrefixIPv6","s") else tcWebApi_get("Radvd_Entry","PrefixIPv6","s") end if%>";
var ipv6_ip_assign="<%if tcWebApi_get("Radvd_Entry","M_Flag","h") = "off" then asp_write("0") else asp_write("1") end if%>";
var ipv6_interface_type="<%if tcWebApi_get("Lan_Entry","IP6InterfaceEnable","h") = "1" then asp_write("1") else asp_write("0") end if%>";
var ipv6_interface_id="<%if tcWebApi_get("Lan_Entry","IP6InterfaceID","h") <> "N/A" then tcWebApi_get("Lan_Entry","IP6InterfaceID","s") else asp_write("0.0.0.0") end if%>";
var ipv6_cone_fitering="<%if tcWebApi_get("Firewall_Entry","firewall_status","h") = "1" then asp_write("0") else asp_write("1") end if%>";
var ipv6_wan_ip = "<%if tcWebApi_get("WanInfo_Entry","IPv6","h") <> "N/A" then tcWebApi_get("WanInfo_Entry","IPv6","s") end if%>";
var ipv6_lan_ip = "<%if tcWebApi_get("DeviceInfo_LanIP6","ManualGlobal","h") = "N/A" then tcWebApi_get("DeviceInfo_LanIP6","DynamicGlobal0","s") elseif tcWebApi_get("DeviceInfo_LanIP6","ManualGlobal","h") = "" then tcWebApi_get("DeviceInfo_LanIP6","DynamicGlobal0","h") else tcWebApi_get("DeviceInfo_LanIP6","ManualGlobal","s") end if%>";

<%if tcWebApi_get("Wan_Common","TransMode","h") = "ATM" then %>
var wan_type = "<%tcWebApi_get("Wan_PVC1","ENCAP","s")%>";
<%else%>
var wan_type = "<%tcWebApi_get("WanExt_PVC10e1","ENCAP","s")%>";
<%end if%>

function loadvalue()
{
	var cf = document.forms[0];    
	ipv6_load_common(cf);
	
	//Decide MTU and MSS according Netgear Spec
	var current_mtu = "<%if tcWebApi_get("Wan_PVC","MTU","h") <> "N/A" then tcWebApi_get("Wan_PVC","MTU","s") end if%>";
	if(current_mtu=="" ||　current_mtu=="1500" || current_mtu=="1458")
		cf.wan_TCPMTU.value="1492";
	else 
	{
		if(parseInt(current_mtu,10)>=1492)
			cf.wan_TCPMTU.value="1492";
		else
			cf.wan_TCPMTU.value = current_mtu;	
	}
	cf.wan_TCPMSS.value = parseInt(cf.wan_TCPMTU.value,10) - 40;
	
	//Decide ENCAP
	if(wan_type=="PPPoE LLC" || wan_type=="1483 Bridged IP LLC" || wan_type=="1483 Bridged Only LLC")
		cf.ENCAP.value = "1483 Bridged IP LLC";
	else	
		cf.ENCAP.value = "1483 Bridged IP VC-Mux";
}
</script>

<input type="hidden" name="ipv6_hidden_enable_interface" value="">
<input type="hidden" name="ipv6_hidden_interface_id" value="">
<input type="hidden" name="ipv6_hidden_filtering" value="">
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
			<option value="autoConfig" selected><%tcWebApi_multilingual("1","auto_config_str")%></option>
            <option value="6to4"><%tcWebApi_multilingual("1","tunnel_6to4_str")%></option>
			<option value="bridge"><%tcWebApi_multilingual("1","pass_through_str")%></option>
			<option value="fixed"><%tcWebApi_multilingual("1","fixed_str")%></option>
			<option value="dhcp"><%tcWebApi_multilingual("1","dhcp_str")%></option>
			<option value="pppoe"><%tcWebApi_multilingual("1","pppoe_str")%></option>	
        </select>
        </TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_IPv6_dhcp','user_class')"><B><%tcWebApi_multilingual("1","dhcp_str")%> <%tcWebApi_multilingual("1","dhcp_user_class_str")%></B></A>
	<TD nowrap align=right>
	<input type="text" name="userClass" id="userclass" maxLength="60" size="16" onKeyPress="return getkey('ssid', event)" value="<%if tcWebApi_get("Wan_PVC","DHCPUSERCLASS","h") <> "N/A" then tcWebApi_get("Wan_PVC","DHCPUSERCLASS","s") end if%>">
	</TD>
</TR>
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_IPv6_dhcp','domain_name')"><B><%tcWebApi_multilingual("1","dhcp_str")%> <%tcWebApi_multilingual("1","dhcp_domain_name_str")%></B></A>
	<TD nowrap align=right>
	<input type="text" name="domainName" id="domain_name" maxLength="60" size="16" onKeyPress="return getkey('ssid', event)" value="<%if tcWebApi_get("Wan_PVC","DHCPDOMAINNAME","h") <> "N/A" then tcWebApi_get("Wan_PVC","DHCPDOMAINNAME","s") end if%>">
	</TD>
</TR>
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_IPv6_dhcp','wan_ipaddr')"><B><%tcWebApi_multilingual("1","routers_ipv6_address_wan_str")%></B></A>
	</TD>
	<TD name="wan_ip" id="wan_ip" nowrap align=right><script>ipv6_write_ip(ipv6_wan_ip);</script></TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
        <TD nowrap><A tabindex=-1 href="javascript:loadhelp('_IPv6_dhcp','lan_ipaddr')"><B><%tcWebApi_multilingual("1","lan_setup_str")%></B></A></TD>
</TR>
<TR>
        <TD nowrap><A tabindex=-1 href="javascript:loadhelp('_IPv6_dhcp','lan_ipaddr')"><B><%tcWebApi_multilingual("1","routers_ipv6_address_str")%></B></A></TD>
	<TD name="lan_ip" id="lan_ip" nowrap align=right><script>ipv6_write_ip(ipv6_lan_ip);</script></TD>
</TR>
<TR>
        <TD nowrap><A tabindex=-1 href="javascript:loadhelp('_IPv6_dhcp','lan_ip_assign')"><%tcWebApi_multilingual("1","ip_address_assignment_str")%></A></TD>
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
        <input type="checkbox" name="enable_interface" id="enable_interface" value="" onClick="set_interface();">
	<A tabindex=-1 href="javascript:loadhelp('_IPv6_dhcp','interface_id')"><%tcWebApi_multilingual("1","use_this_interface_id_str")%></A>
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
        <A tabindex=-1 href="javascript:loadhelp('_IPv6_dhcp','nat')"><B><%tcWebApi_multilingual("1","ipv6_filtering_str")%></B></A>
        </TD>
        <TD nowrap align=right>
        <input type="radio" name="IPv6Filtering" id="ipv6filtering" value="Secured"><%tcWebApi_multilingual("1","secured_str")%>&nbsp;
        <input type="radio" name="IPv6Filtering" id="ipv6filtering" value="Open"><%tcWebApi_multilingual("1","open_str")%>&nbsp;&nbsp;
        </TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</TABLE>
</div>
<div id="waiting_bar" style="display:none">
<div  align="center"><BR><BR><TR><TD align="center"><B><%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%></B></TD></TR><BR><BR></div>
<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" alt="waiting" /></div>
</div>
<%tcWebApi_multilingual("2","_IPv6_autoConfig_help.asp")%>
</FORM>
</BODY>
</HTML>