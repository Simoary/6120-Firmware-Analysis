<%
IF request_Form("IPVERSION") <> "" then
	/* Use second PVC for IPv6 */
	if tcWebApi_get("Wan_Common","TransMode","h") = "ATM" then	
		tcWebApi_set("WebCurSet_Entry","wan_pvc","NUMBER_ONE")
		tcWebApi_set("WebCurSet_Entry","nat_pvc","NUMBER_ONE")
		tcWebApi_set("WebCurSet_Entry","wan_pvc_ext","NUMBER_ZERO")
		tcWebApi_set("WebCurSet_Entry","nat_pvc_ext","NUMBER_ZERO")
	else
		tcWebApi_set("WebCurSet_Entry","wan_pvc","NUMBER_TEN")
		tcWebApi_set("WebCurSet_Entry","nat_pvc","NUMBER_TEN")
		tcWebApi_set("WebCurSet_Entry","wan_pvc_ext","NUMBER_ONE")
		tcWebApi_set("WebCurSet_Entry","nat_pvc_ext","NUMBER_ONE")
	end if
	tcWebApi_set("Wan_Common","6to4_tunnel","ipv6_tunnel_flag")
	tcWebApi_set("Wan_PVC","Active","DISABLE_STRING_NO")
	tcWebApi_commit("Wan_PVC")
	
	tcWebApi_set("AutoDetect_Entry","WanIPv6Status","ipv6_auto_detc_flag")
End if
%>	
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/ipv6.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/IPv6_disabled.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="ipv6_con_type">
<input type=hidden name=IPVERSION value="IPv4">
<input type=hidden name=NUMBER_ZERO value="0">
<input type=hidden name=NUMBER_ONE value="1">
<input type=hidden name=NUMBER_TEN value="10">
<input type=hidden name=DISABLE_STRING_NO value="No">
<input type="hidden" name="ipv6_auto_detc_flag" value="0">
<input type="hidden" name="ipv6_tunnel_flag" value="0">

<script>
function submit_disable()
{
	parent.menu_ipv6_status = "Disable";
	var cf=document.forms[0];
	document.getElementById("fix_button").style.display = "none";
	document.getElementById("main").style.display = "none";
	document.getElementById("waiting_bar").style.display = "";
	cf.submit();
}
</script>

<div class="page_title"><%tcWebApi_multilingual("1","ipv6_str")%></div>
<div id="fix_button" class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
		<input class="cancel_bt" type=button name=Cancel id="cancel" value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick='location.href="IPv6_disabled.asp";'>&nbsp;&nbsp;
        <input class="apply_bt" type=button name=Apply id="apply" value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick="submit_disable()">        
        </TD>
</TR>
</TABLE>
</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<!--<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>-->

<script>
var ipv6_address_not_avaible_str="<%tcWebApi_multilingual("1","ipv6_address_not_avaible_str")%>";
</script>

<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<TR>
        <TD nowrap>
        <A tabindex=-1 href="javascript:loadhelp('_IPv6','internet')"><B><%tcWebApi_multilingual("1","internet_connection_type_str")%></B></A>
        </TD>
        <TD nowrap align=right>
        <select name="con_type" id="con_type" onChange="change_ipv6(document.forms[0].con_type.value)">
            <option value="disabled" selected><%tcWebApi_multilingual("1","disabled_str")%></option>
            <option value="autoDetect"><%tcWebApi_multilingual("1","auto_detect_str")%></option>
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
<!--TR>
	<TD nowrap colspan=2 align=center>
	<input type='submit' name='Apply' value='Apply'>&nbsp;&nbsp;
	<input type='button' name='Cancel' value='Cancel' onClick='location.href="IPv6_disabled.asp";'>
		<input class="cancel_bt" type='button' name='Cancel' value='Cancel' onClick='location.href="IPv6_disabled.asp";'>&nbsp;&nbsp;
        <input class="apply_bt" type='submit' name='Apply' value='Apply' >
	</TD>
</TR-->
</TABLE>
</div>
<div id="waiting_bar" style="display:none">
<div  align="center"><BR><BR><TR><TD align="center"><B><%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%></B></TD></TR><BR><BR></div>
<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" alt="waiting" /></div>
</div>
<%tcWebApi_multilingual("2","_IPv6_help.asp")%>
</FORM>
</BODY>
</HTML>
