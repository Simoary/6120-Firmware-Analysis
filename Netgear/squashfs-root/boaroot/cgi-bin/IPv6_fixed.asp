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
	tcWebApi_set("Wan_PVC","NATENABLE","NATENABLE")
	tcWebApi_set("Wan_PVC","DEFAULTROUTE","DEFAULTROUTE")
	tcWebApi_set("Wan_PVC","ENCAP","ENCAP")
	tcWebApi_set("Wan_PVC","IPADDR6","ipv6_wan_ip_fixed")
	tcWebApi_set("Wan_PVC","PREFIX6","ipv6_wan_fixed_prefix")
	tcWebApi_set("Wan_PVC","DEFGATEWAY6","ipv6_wan_gw_fixed")
	tcWebApi_set("Wan_PVC","DNSIPv61st","ipv6_primary_dns_fixed")
	tcWebApi_set("Wan_PVC","DNSIPv62nd","ipv6_second_dns_fixed")
	tcWebApi_set("Wan_PVC","MTU","wan_TCPMTU")
	tcWebApi_set("Wan_PVC","MSS","wan_TCPMSS")
	
	/* LAN IPv6 */
	tcWebApi_set("Lan_Entry","IP6","ipv6_lan_ip_fixed")
	tcWebApi_set("Lan_Entry","PREFIX6","ipv6_lan_fixed_prefix")
	tcWebApi_commit("Lan_Entry")
	
	/* Firewall */
	tcWebApi_set("Firewall_Entry","firewall_status","ipv6_hidden_filtering") 
	tcWebApi_commit("Firewall_Entry")
	
	/* DHCP6s */
	tcWebApi_set("Dhcp6s_Entry","Enable","DHCP6SEnable")
	if request_Form("DHCP6SMode") = "1" then
		tcWebApi_set("Dhcp6s_Entry","Mode","DHCP6SMode")
	end if
	tcWebApi_set("Dhcp6s_Entry","DNSserver","ipv6_primary_dns_fixed")
	tcWebApi_set("Dhcp6s_Entry","SecDNSserver","ipv6_second_dns_fixed")
	if request_Form("RADVDMbit") = "on" then
		TCWebApi_set("Dhcp6s_Entry","PrefixIPv6","PrefixIPv6")
		TCWebApi_set("Dhcp6s_Entry","Prefixv6Len","ipv6_lan_fixed_prefix")
	else
		TCWebApi_set("Radvd_Entry","PrefixIPv6","PrefixIPv6")
		TCWebApi_set("Radvd_Entry","Prefixv6Len","ipv6_lan_fixed_prefix")
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
<script language=javascript type=text/javascript src="/ipv6_fixed.js"></script>
<title> </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/IPv6_fixed.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="ipv6_fixed">
<input type=hidden name=IPVERSION value="IPv6">
<input type=hidden name=ISP value="1">
<input type=hidden name=NATENABLE value="Enable">
<input type=hidden name=DEFAULTROUTE value="Yes">
<input type=hidden name=ENCAP value="">
<input type=hidden name=EnableDynIPv6 value="1">
<input type=hidden name=PPPv6PD value="Yes">
<input type=hidden name=DHCP6SEnable value="1">
<input type=hidden name=DHCP6SMode value="1">
<input type=hidden name=DNSserver value="">
<input type=hidden name=SecDNSserver value="">
<input type=hidden name=RADVDEnable value="1">
<input type=hidden name=RADVDMode value="">
<input type=hidden name=RADVDMbit value="">
<input type=hidden name=RADVDObit value="on">
<input type=hidden name=LANIPV6 value="">
<input type=hidden name=LANIPV6PREFIXLENGTH value="64">
<input type=hidden name=PrefixIPv6 value="">
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
		<input class="cancel_bt" type=button name=Cancel id=cancel value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick='location.href="IPv6_fixed.asp";'>&nbsp;&nbsp;
        <input class="apply_bt" type=submit name=Apply id=apply value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick="return check_ipv6_fixed(document.forms[0])";>
		</TD>
</TR>
</TABLE>
</div>
<div id="main" class="main_top_button">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>


<script>
var alert_invalid_ipaddress_str="<%tcWebApi_multilingual("1","alert_invalid_ipaddress_str")%>";
var alert_invalid_gatewayaddress_str="<%tcWebApi_multilingual("1","alert_invalid_gatewayaddress_str")%>";
var alert_invalid_primary_dns_str="<%tcWebApi_multilingual("1","alert_invalid_primary_dns_str")%>";
var alert_invalid_secondary_dns_str="<%tcWebApi_multilingual("1","alert_invalid_secondary_dns_str")%>";
var alert_invalid_lan_setup_str="<%tcWebApi_multilingual("1","alert_invalid_lan_setup_str")%>" + "\n<%tcWebApi_multilingual("1","lan_setup_str")%>" + " <%tcWebApi_multilingual("1","ipv6_address_prefix_length_str")%>";
var alert_invalid_wan_setup_str="<%tcWebApi_multilingual("1","alert_invalid_wan_setup_str")%>" + "\n<%tcWebApi_multilingual("1","wan_setup_str")%>" + " <%tcWebApi_multilingual("1","ipv6_address_prefix_length_str")%>";
var alert_lan_wan_ip_must_be_the_same_subnet_str="<%tcWebApi_multilingual("1","alert_lan_wan_ip_must_be_the_same_subnet_str")%>";
var ipv6_address_not_avaible_str="<%tcWebApi_multilingual("1","ipv6_address_not_avaible_str")%>";

var ipv6_ip_assign="<%if tcWebApi_get("Radvd_Entry","M_Flag","h") = "off" then asp_write("0") else asp_write("1") end if%>";

var ipv6_lan = "<%if tcWebApi_get("DeviceInfo_LanIP6","ManualGlobal","h") = "N/A" then tcWebApi_get("DeviceInfo_LanIP6","DynamicGlobal0","s") elseif tcWebApi_get("DeviceInfo_LanIP6","ManualGlobal","h") = "" then tcWebApi_get("DeviceInfo_LanIP6","DynamicGlobal0","h") else tcWebApi_get("DeviceInfo_LanIP6","ManualGlobal","s") end if%>";
if(ipv6_lan=="N/A") 
	ipv6_lan="";
else{
	if(ipv6_lan.indexOf("/")!=-1)
		ipv6_lan = ipv6_lan.split("/")[0];
}

var ipv6_lan_prefix_len = "<%if tcWebApi_get("Lan_Entry","PREFIX6","h") <> "N/A" then tcWebApi_get("Lan_Entry","PREFIX6","s") end if%>";

var ipv6_cone_fitering="<%if tcWebApi_get("Firewall_Entry","firewall_status","h") = "1" then asp_write("0") else asp_write("1") end if%>";


<%if tcWebApi_get("Wan_Common","TransMode","h") = "ATM" then %>
var ipv6_wan = "<%if tcWebApi_get("Wan_PVC1","IPADDR6","h") <> "N/A" then tcWebApi_get("Wan_PVC1","IPADDR6","s") end if%>";
var ipv6_wan_prefix_len = "<%if tcWebApi_get("Wan_PVC1","PREFIX6","h") <> "N/A" then tcWebApi_get("Wan_PVC1","PREFIX6","s") end if%>";
var ipv6_default_gw = "<%if tcWebApi_get("Wan_PVC1","DEFGATEWAY6","h") <> "N/A" then tcWebApi_get("Wan_PVC1","DEFGATEWAY6","s") end if%>";
var ipv6_wan_primary_dns = "<%if tcWebApi_get("Wan_PVC1","DNSIPv61st","h") <> "N/A" then tcWebApi_get("Wan_PVC1","DNSIPv61st","s") end if%>";
var ipv6_wan_second_dns = "<%if tcWebApi_get("Wan_PVC1","DNSIPv62nd","h") <> "N/A" then tcWebApi_get("Wan_PVC1","DNSIPv62nd","s") end if%>";
var wan_type = "<%tcWebApi_get("Wan_PVC1","ENCAP","s")%>";
<%else%>
var ipv6_wan = "<%if tcWebApi_get("WanExt_PVC10e1","IPADDR6","h") <> "N/A" then tcWebApi_get("WanExt_PVC10e1","IPADDR6","s") end if%>";
var ipv6_wan_prefix_len = "<%if tcWebApi_get("WanExt_PVC10e1","PREFIX6","h") <> "N/A" then tcWebApi_get("WanExt_PVC10e1","PREFIX6","s") end if%>";
var ipv6_default_gw = "<%if tcWebApi_get("WanExt_PVC10e1","DEFGATEWAY6","h") <> "N/A" then tcWebApi_get("WanExt_PVC10e1","DEFGATEWAY6","s") end if%>";
var ipv6_wan_primary_dns = "<%if tcWebApi_get("WanExt_PVC10e1","DNSIPv61st","h") <> "N/A" then tcWebApi_get("WanExt_PVC10e1","DNSIPv61st","s") end if%>";
var ipv6_wan_second_dns = "<%if tcWebApi_get("WanExt_PVC10e1","DNSIPv62nd","h") <> "N/A" then tcWebApi_get("WanExt_PVC10e1","DNSIPv62nd","s") end if%>";
var wan_type = "<%tcWebApi_get("WanExt_PVC10e1","ENCAP","s")%>";
<%end if%>

function loadvalue()
{
	var cf = document.forms[0];
	var i;
	
	if(ipv6_wan=="")
	{
		cf.IPv6_wan1.value = "0";
		cf.IPv6_wan2.value = "0";
		cf.IPv6_wan3.value = "0";
		cf.IPv6_wan4.value = "0";
		cf.IPv6_wan5.value = "0";
		cf.IPv6_wan6.value = "0";
		cf.IPv6_wan7.value = "0";
		cf.IPv6_wan8.value = "0";
	}
	else
	{
		/* IPv6 Address/Prefix Length */
		var ipv6_wan_ip = ipv6_wan.split(":");
		cf.IPv6_wan1.value = ipv6_wan_ip[0];
		cf.IPv6_wan2.value = ipv6_wan_ip[1];
		cf.IPv6_wan3.value = ipv6_wan_ip[2];
		cf.IPv6_wan4.value = ipv6_wan_ip[3];
		cf.IPv6_wan5.value = ipv6_wan_ip[4];
		cf.IPv6_wan6.value = ipv6_wan_ip[5];
		cf.IPv6_wan7.value = ipv6_wan_ip[6];
		cf.IPv6_wan8.value = ipv6_wan_ip[7];
	}
	
	if(ipv6_wan_prefix_len=="" && ipv6_wan!="")
		cf.IPv6_wan_prefix.value = "0"
	else
		cf.IPv6_wan_prefix.value = ipv6_wan_prefix_len;

	/* Default IPv6 Gatewy */
	if(ipv6_default_gw=="")
	{
		cf.IPv6_gw1.value = "0";
		cf.IPv6_gw2.value = "0";
		cf.IPv6_gw3.value = "0";
		cf.IPv6_gw4.value = "0";
		cf.IPv6_gw5.value = "0";
		cf.IPv6_gw6.value = "0";
		cf.IPv6_gw7.value = "0";
		cf.IPv6_gw8.value = "0";
	}
	else
	{
		var ipv6_gateway_ip = ipv6_default_gw.split(":");
		cf.IPv6_gw1.value = ipv6_gateway_ip[0];
		cf.IPv6_gw2.value = ipv6_gateway_ip[1];
		cf.IPv6_gw3.value = ipv6_gateway_ip[2];
		cf.IPv6_gw4.value = ipv6_gateway_ip[3];
		cf.IPv6_gw5.value = ipv6_gateway_ip[4];
		cf.IPv6_gw6.value = ipv6_gateway_ip[5];
		cf.IPv6_gw7.value = ipv6_gateway_ip[6];
		cf.IPv6_gw8.value = ipv6_gateway_ip[7];
	}
	
	/* Primary DNS Server & Secondary DNS Server */
	if(ipv6_wan_primary_dns=="")
	{
		cf.IPv6_Pri_DNS1.value = "0";
		cf.IPv6_Pri_DNS2.value = "0";
		cf.IPv6_Pri_DNS3.value = "0";
		cf.IPv6_Pri_DNS4.value = "0";
		cf.IPv6_Pri_DNS5.value = "0";
		cf.IPv6_Pri_DNS6.value = "0";
		cf.IPv6_Pri_DNS7.value = "0";
		cf.IPv6_Pri_DNS8.value = "0";
	}
	else
	{
		var ipv6_primary_dns = ipv6_wan_primary_dns.split(":");
		cf.IPv6_Pri_DNS1.value = ipv6_primary_dns[0];
		cf.IPv6_Pri_DNS2.value = ipv6_primary_dns[1];
		cf.IPv6_Pri_DNS3.value = ipv6_primary_dns[2];
		cf.IPv6_Pri_DNS4.value = ipv6_primary_dns[3];
		cf.IPv6_Pri_DNS5.value = ipv6_primary_dns[4];
		cf.IPv6_Pri_DNS6.value = ipv6_primary_dns[5];
		cf.IPv6_Pri_DNS7.value = ipv6_primary_dns[6];
		cf.IPv6_Pri_DNS8.value = ipv6_primary_dns[7];
	}

	if(ipv6_wan_second_dns=="")
	{
		cf.IPv6_Sec_DNS1.value = "0";
		cf.IPv6_Sec_DNS2.value = "0";
		cf.IPv6_Sec_DNS3.value = "0";
		cf.IPv6_Sec_DNS4.value = "0";
		cf.IPv6_Sec_DNS5.value = "0";
		cf.IPv6_Sec_DNS6.value = "0";
		cf.IPv6_Sec_DNS7.value = "0";
		cf.IPv6_Sec_DNS8.value = "0";
	}
	else
	{
		var ipv6_second_dns = ipv6_wan_second_dns.split(":");
		cf.IPv6_Sec_DNS1.value = ipv6_second_dns[0];
		cf.IPv6_Sec_DNS2.value = ipv6_second_dns[1];
		cf.IPv6_Sec_DNS3.value = ipv6_second_dns[2];
		cf.IPv6_Sec_DNS4.value = ipv6_second_dns[3];
		cf.IPv6_Sec_DNS5.value = ipv6_second_dns[4];
		cf.IPv6_Sec_DNS6.value = ipv6_second_dns[5];
		cf.IPv6_Sec_DNS7.value = ipv6_second_dns[6];
		cf.IPv6_Sec_DNS8.value = ipv6_second_dns[7];
	}
	
	/* IP Address Assignment */
        if( ipv6_ip_assign == "1" )
        {
                cf.ipv6_lan_ip_assign[0].checked = true;
        }
        else if( ipv6_ip_assign == "0" )
        {
                cf.ipv6_lan_ip_assign[1].checked = true;
        }

		
	/* IPv6 Address/Prefix Length */
	if(ipv6_lan=="")
	{
		cf.IPv6_lan1.value = "0";
		cf.IPv6_lan2.value = "0";
		cf.IPv6_lan3.value = "0";
		cf.IPv6_lan4.value = "0";
		cf.IPv6_lan5.value = "0";
		cf.IPv6_lan6.value = "0";
		cf.IPv6_lan7.value = "0";
		cf.IPv6_lan8.value = "0";
	}else
	{
		var ipv6_lan_ip = ipv6_lan.split(":");
		cf.IPv6_lan1.value = ipv6_lan_ip[0];
		cf.IPv6_lan2.value = ipv6_lan_ip[1];
		cf.IPv6_lan3.value = ipv6_lan_ip[2];
		cf.IPv6_lan4.value = ipv6_lan_ip[3];
		cf.IPv6_lan5.value = ipv6_lan_ip[4];
		cf.IPv6_lan6.value = ipv6_lan_ip[5];
		cf.IPv6_lan7.value = ipv6_lan_ip[6];
		cf.IPv6_lan8.value = ipv6_lan_ip[7];
	}

	/*
	for( i=0; i<ipv6_lan_ip.length; i++ )
	{
		if(ipv6_lan_ip[i]=="" && ipv6_lan!="")
			cf.IPv6_lan[i].value = "0";
		else
			cf.IPv6_lan[i].value = ipv6_lan_ip[i];
	}*/

	if(ipv6_lan_prefix_len=="" && ipv6_lan!="")
		cf.IPv6_lan_prefix.value = "0";
	else
		cf.IPv6_lan_prefix.value = ipv6_lan_prefix_len;

	/* IPv6 Filtering */
        if(ipv6_cone_fitering == 0)
        {
                cf.IPv6Filtering[0].checked = true;
        }
        else if(ipv6_cone_fitering == 1)
        {
                cf.IPv6Filtering[1].checked = true;
        }
	//Decide ENCAP
	if(wan_type=="PPPoE LLC" || wan_type=="1483 Bridged IP LLC" || wan_type=="1483 Bridged Only LLC")
		cf.ENCAP.value = "1483 Bridged IP LLC";
	else	
		cf.ENCAP.value = "1483 Bridged IP VC-Mux";	
}
</script>

<input type="hidden" name="ipv6_wan_ip_fixed" value="">
<input type="hidden" name="ipv6_wan_fixed_prefix" value="">
<input type="hidden" name="ipv6_wan_gw_fixed" value="">
<input type="hidden" name="ipv6_primary_dns_fixed" value="">
<input type="hidden" name="ipv6_second_dns_fixed" value="">
<input type="hidden" name="ipv6_lan_ip_fixed" value="">
<input type="hidden" name="ipv6_lan_fixed_prefix" value="">
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
			<option value="autoConfig"><%tcWebApi_multilingual("1","auto_config_str")%></option>
            <option value="6to4"><%tcWebApi_multilingual("1","tunnel_6to4_str")%></option>
			<option value="bridge"><%tcWebApi_multilingual("1","pass_through_str")%></option>
			<option value="fixed" selected><%tcWebApi_multilingual("1","fixed_str")%></option>
			<option value="dhcp"><%tcWebApi_multilingual("1","dhcp_str")%></option>
			<option value="pppoe"><%tcWebApi_multilingual("1","pppoe_str")%></option>	
        </select>
        </TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_IPv6_fixed','wan_ipaddr')"><B><%tcWebApi_multilingual("1","wan_setup_str")%></B></A></TD>	
</TR>
<TR>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_IPv6_fixed','wan_ipaddr')"><%tcWebApi_multilingual("1","ipv6_address_prefix_length_str")%></A></TD>
</TR>
<TR>
	<TD nowrap colspan=2><img src=/spacer.gif width=20 height=12 border=0>
	<input type="text" name="IPv6_wan1" id="ipv6_wan1" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_wan2" id="ipv6_wan2" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_wan3" id="ipv6_wan3" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_wan4" id="ipv6_wan4" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_wan5" id="ipv6_wan5" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_wan6" id="ipv6_wan6" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_wan7" id="ipv6_wan7" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_wan8" id="ipv6_wan8" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">/
	<input type="text" name="IPv6_wan_prefix" id="ipv6_wan_prefix" size="2" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num', event);" onkeyup="keyup_n(event,this,3);">
	</TD>
</TR>
<TR>
        <TD nowrap><A tabindex=-1 href="javascript:loadhelp('_IPv6_fixed','wan_gtway')"><%tcWebApi_multilingual("1","default_ipv6_gateway_str")%></A></TD>
</TR>	
<TR>
	<TD nowrap colspan=2><img src=/spacer.gif width=20 height=12 border=0>
        <input type="text" name="IPv6_gw1" id="ipv6_gw1" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
        <input type="text" name="IPv6_gw2" id="ipv6_gw2" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
        <input type="text" name="IPv6_gw3" id="ipv6_gw3" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
        <input type="text" name="IPv6_gw4" id="ipv6_gw4" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
        <input type="text" name="IPv6_gw5" id="ipv6_gw5" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
        <input type="text" name="IPv6_gw6" id="ipv6_gw6" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
        <input type="text" name="IPv6_gw7" id="ipv6_gw7" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
        <input type="text" name="IPv6_gw8" id="ipv6_gw8" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">
        </TD>
</TR>
<TR>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_IPv6_fixed','dns_server')">Primary DNS Server</A></TD>
</TR>
<TR>
	<TD nowrap colspan=2><img src=/spacer.gif width=20 height=12 border=0>
	<input type="text" name="IPv6_Pri_DNS1" id="ipv6_pri_dns1" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_Pri_DNS2" id="ipv6_pri_dns2" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_Pri_DNS3" id="ipv6_pri_dns3" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_Pri_DNS4" id="ipv6_pri_dns4" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_Pri_DNS5" id="ipv6_pri_dns5" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_Pri_DNS6" id="ipv6_pri_dns6" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_Pri_DNS7" id="ipv6_pri_dns7" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_Pri_DNS8" id="ipv6_pri_dns8" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">
	</TD>
</TR>
<TR>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_IPv6_fixed','dns_server')">Secondary DNS Server</A></TD>
</TR>
<TR>
	<TD nowrap colspan=2><img src=/spacer.gif width=20 height=12 border=0>
	<input type="text" name="IPv6_Sec_DNS1" id="ipv6_sec_dns1" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_Sec_DNS2" id="ipv6_sec_dns2" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_Sec_DNS3" id="ipv6_sec_dns3" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_Sec_DNS4" id="ipv6_sec_dns4" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_Sec_DNS5" id="ipv6_sec_dns5" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_Sec_DNS6" id="ipv6_sec_dns6" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_Sec_DNS7" id="ipv6_sec_dns7" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_Sec_DNS8" id="ipv6_sec_dns8" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
        <TD nowrap><A tabindex=-1 href="javascript:loadhelp('_IPv6_fixed','lan_ip_assign')"><B><%tcWebApi_multilingual("1","lan_setup_str")%></B></A></TD>
</TR>
<TR>
        <TD nowrap><A tabindex=-1 href="javascript:loadhelp('_IPv6_fixed','lan_ip_assign')"><%tcWebApi_multilingual("1","ip_address_assignment_str")%></A></TD>
</TR>
<TR>
        <TD nowrap colspan=2><input type="radio" name="ipv6_lan_ip_assign" id="ipv6_lan_ip_assign" value="DHCP"><%tcWebApi_multilingual("1","use_dhcp_server_str")%></TD>
</TR>
<TR>
        <TD nowrap colspan=2><input type="radio" name="ipv6_lan_ip_assign" id="ipv6_lan_ip_assign" value="Auto Config"><%tcWebApi_multilingual("1","auto_config_str")%></TD>
</TR>
<TR>
        <TD nowrap colspan=2><BR><A tabindex=-1 href="javascript:loadhelp('_IPv6_fixed','lan_ipaddr')"><%tcWebApi_multilingual("1","ipv6_address_prefix_length_str")%></A></TD>
</TR>
<TR>
	<TD nowrap colspan=2><img src=/spacer.gif width=20 height=12 border=0>
	<input type="text" name="IPv6_lan1" id="ipv6_lan1" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_lan2" id="ipv6_lan2" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_lan3" id="ipv6_lan3" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_lan4" id="ipv6_lan4" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_lan5" id="ipv6_lan5" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_lan6" id="ipv6_lan6" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_lan7" id="ipv6_lan7" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">:
	<input type="text" name="IPv6_lan8" id="ipv6_lan8" size="3" autocomplete="off" maxlength="4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkeya(event);" onkeyup="keyup_n(event,this,4);">/
	<input type="text" name="IPv6_lan_prefix" id="ipv6_lan_prefix" size="2" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num', event);" onkeyup="keyup_n(event,this,3);">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
        <TD nowrap>
        <A tabindex=-1 href="javascript:loadhelp('_IPv6_fixed','nat')"><B><%tcWebApi_multilingual("1","ipv6_filtering_str")%></B></A>
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
<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" alt="waiting" /></div>
</div>
<%tcWebApi_multilingual("2","_IPv6_fixed_help.asp")%>
</FORM>
</BODY>
</HTML>

