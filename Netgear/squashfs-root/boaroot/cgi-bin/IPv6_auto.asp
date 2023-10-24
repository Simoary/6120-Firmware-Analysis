<%
If Request_Form("ipv6_auto_detc_flag") = "1" Then
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
	
	tcWebApi_set("Wan_Common","6to4_tunnel","ipv6_tunnel_flag")
	tcWebApi_set("AutoDetect_Entry","WanIPv6Status","ipv6_auto_detc_flag")

	tcWebApi_get("AutoDetect_Entry","UpdateIPv6","h")
End If
%>
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/ipv6.js"></script>
<title> </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/IPv6_auto.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="ipv6_auto">

<div class="page_title"><%tcWebApi_multilingual("1","ipv6_str")%></div>
<div class="fix_button" id="fix_button" style="display:none">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
		<input class="common_bt" type=button name="Status Refresh" id=refresh value="<%tcWebApi_multilingual("0","glbstr_refresh")%>" onClick=location.reload();>&nbsp;&nbsp;
		<input class="cancel_bt" type=button name=Cancel id=cancel value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick='location.href="IPv6_auto.asp";'>&nbsp;&nbsp; 
        <input class="apply_bt" type=submit name=Apply id=apply value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick="return ipv6_auto_detect(document.forms[0])";>
		</TD>
</TR>
</TABLE>

</div>
<div id="main" class="main_top_button" style="display:none"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>


<script>
var alert_invalid_interfaceid_str="<%tcWebApi_multilingual("1","alert_invalid_interfaceid_str")%>";
var ipv6_address_not_avaible_str="<%tcWebApi_multilingual("1","ipv6_address_not_avaible_str")%>";
var tmp = "<%tcWebApi_get("AutoDetect_Entry","ReadIPv6File","h")%>";
var checking_result = "<%If tcWebApi_get("AutoDetect_Entry","DetectIPv6Action","h") <> "N/A" then tcWebApi_get("AutoDetect_Entry","DetectIPv6Action","s") end if%>";
var connection_type = "<%If tcWebApi_get("AutoDetect_Entry","ConnectIPv6Type","h") <> "N/A" then tcWebApi_get("AutoDetect_Entry","ConnectIPv6Type","s") end if%>";
var ipv6_ip_assign="<%if tcWebApi_get("Radvd_Entry","M_Flag","h") = "off" then asp_write("0") else asp_write("1") end if%>";
var ipv6_interface_type="<%if tcWebApi_get("Lan_Entry","IP6InterfaceEnable","h") = "1" then asp_write("1") else asp_write("0") end if%>";
var ipv6_interface_id="<%if tcWebApi_get("Lan_Entry","IP6InterfaceID","h") <> "N/A" then tcWebApi_get("Lan_Entry","IP6InterfaceID","s") else asp_write("0.0.0.0") end if%>";
var ipv6_cone_fitering="<%if tcWebApi_get("Firewall_Entry","firewall_status","h") = "1" then asp_write("0") else asp_write("1") end if%>";



var wan_port_status = "100M/Full";


if(connection_type == "Detecting...")
	ipv6_wan_ip = "";
else if(connection_type == "6to4")
	ipv6_wan_ip = "";
else if(connection_type == "Pass Through")
	ipv6_wan_ip = "Not Available";
else if(connection_type == "Auto Config")
	ipv6_wan_ip = "";
else if(connection_type == "DHCP" || connection_type == "")
	ipv6_wan_ip = "";
else
	ipv6_wan_ip = "";

var ipv6_lan_ip;
if(connection_type == "Pass Through")
	ipv6_lan_ip = "Not Available";
else
 	ipv6_lan_ip = "";

if(connection_type == "Detecting...")
	setTimeout("location.reload()", 3000);

var ipv6_wan_ip = "<%if tcWebApi_get("WanInfo_Entry","IPv6","h") <> "N/A" then tcWebApi_get("WanInfo_Entry","IPv6","s") end if%>";
var ipv6_lan_ip = "<%if tcWebApi_get("DeviceInfo_LanIP6","ManualGlobal","h") = "N/A" then tcWebApi_get("DeviceInfo_LanIP6","DynamicGlobal0","s") elseif tcWebApi_get("DeviceInfo_LanIP6","ManualGlobal","h") = "" then tcWebApi_get("DeviceInfo_LanIP6","DynamicGlobal0","h") else tcWebApi_get("DeviceInfo_LanIP6","ManualGlobal","s") end if%>";	
	
	
function loadvalue()
{
	if(checking_result=="0")
	{
		document.getElementById("fix_button").style.display = "none";
		document.getElementById("main").style.display = "none";
		document.getElementById("waiting_bar").style.display = "";
		//setTimeout("location.reload()", 3000);
		setTimeout("document.forms[0].submit()", 3000);
	}
	else
	{
		document.getElementById("fix_button").style.display = "";
		document.getElementById("main").style.display = "";
		document.getElementById("waiting_bar").style.display = "none";
	}
	var cf = document.forms[0];
	ipv6_load_common(cf);
}

function ipv6_auto_detect(cf)
{
	
	/* Hidden Info for radvd */
	if(cf.ipv6_lan_ip_assign[0].checked == true)
	{
		cf.RADVDMbit.value="on";
		//cf.RADVDEnable.value = "0";
	}
	else
	{
		cf.RADVDMbit.value="off";
	}
	
	parent.menu_ipv6_status = "AUTO";
	
	
	if( ipv6_save_common(cf) == false )
	{
			return false;
	}

	cf.ipv6_auto_detc_flag.value = 1;
	cf.submit();
}

</script>

<input type="hidden" name="ipv6_hidden_enable_interface" value="">
<input type="hidden" name="ipv6_hidden_interface_id" value="">
<input type="hidden" name="ipv6_hidden_filtering" value="">
<input type="hidden" name="ipv6_auto_detc_flag" value="0">
<input type=hidden name=DHCP6SEnable value="1">
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
<input type="hidden" name="ipv6_tunnel_flag" value="0">

<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<TR>
        <TD nowrap>
        <A tabindex=-1 href="javascript:loadhelp('_IPv6','internet')"><B><%tcWebApi_multilingual("1","internet_connection_type_str")%></B></A>
        </TD>
        <TD nowrap align=right>
        <select name="con_type" id="con_type" onChange="change_ipv6(document.forms[0].con_type.value)">
            <option value="disabled"><%tcWebApi_multilingual("1","disabled_str")%></option>
            <option value="autoDetect" selected><%tcWebApi_multilingual("1","auto_detect_str")%></option>
			<option value="autoConfig"><%tcWebApi_multilingual("1","auto_config_str")%></option>
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
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_IPv6_auto','wan_type')"><B><%tcWebApi_multilingual("1","connection_type_str")%></B></A></TD>
	<TD name="detect_result" id="detect_result" nowrap align=right>
	<script>
	if(connection_type != "STATUS_PLUG_OFF")
	{
		if(connection_type != "")
			document.write(connection_type);
		else
			document.write("DHCP/Auto Config");
	}
	else
		document.write("the Internet port is not connected");
	</script>
	</TD>
</TR>
<TR>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_IPv6_auto','wan_ipaddr')"><B><%tcWebApi_multilingual("1","routers_ipv6_address_wan_str")%></B></A></TD>
	<TD name="wan_ip" id="wan_ip" nowrap align=right><script>ipv6_write_ip(ipv6_wan_ip);</script></TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_IPv6_auto','lan_ipaddr')"><B><%tcWebApi_multilingual("1","lan_setup_str")%></B></A></TD>
</TR>
<TR>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_IPv6_auto','lan_ipaddr')"><B><%tcWebApi_multilingual("1","routers_ipv6_address_str")%></B></A></TD>
	<TD name="lan_ip" id="lan_ip" nowrap align=right><script>ipv6_write_ip(ipv6_lan_ip);</script></TD>
</TR>
<TR>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_IPv6_auto','lan_ip_assign')"><%tcWebApi_multilingual("1","ip_address_assignment_str")%></A></TD>
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
        <A tabindex=-1 href="javascript:loadhelp('_IPv6_auto','nat')"><B><%tcWebApi_multilingual("1","ipv6_filtering_str")%></B></A>
        </TD>
        <TD nowrapi align=right>
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

<%tcWebApi_multilingual("2","_IPv6_auto_help.asp")%>
</FORM>
</BODY>
</HTML>
