<%
IF request_Form("change_wan_type") = "0" then
	TCWebApi_set("Ddns_Entry","Active","EnableDNS")
	TCWebApi_set("Ddns_Entry","SERVERNAME","sysDNSProviderlist")
	TCWebApi_set("Ddns_Entry","MYHOST","sysDNSHost")
	TCWebApi_set("Ddns_Entry","USERNAME","sysDNSUser")
	TCWebApi_set("Ddns_Entry","PASSWORD","sysDNSPassword")
	TCWebApi_set("Ddns_Entry","WILDCARD","wildcards_enabled")
  	tcWebApi_commit("Ddns_Entry")
End if	
%>


<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/ddns.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/DNS_ddns.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="ddns">

<div class="page_title"><%tcWebApi_multilingual("1","dynamic_dns_str")%></div>
<div class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
	<input class="common_bt" type="button" name="Show Status" id="show_status" value="<%tcWebApi_multilingual("0","glbstr_showstatus")%>" onClick="window_open()">&nbsp;
    <input class="cancel_bt" type="reset" name="Cancel" id="cancel" value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick="location.href='DNS_ddns.asp';">&nbsp;
	<input class="apply_bt" type="submit" name="Apply" id="apply" value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick="return click_ddns(document.forms[0]);">
        </TD>
</TR>
</TABLE>

</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>


<script>
var alert_hostname_cannot_be_blank_str="<%tcWebApi_multilingual("1","alert_hostname_cannot_be_blank_str")%>";
var alert_username_cannot_be_blank_str="<%tcWebApi_multilingual("1","alert_username_cannot_be_blank_str")%>";
var alert_password_cannot_be_blank_str="<%tcWebApi_multilingual("1","alert_password_cannot_be_blank_str")%>";
var alert_invalid_hostname_str="<%tcWebApi_multilingual("1","alert_invalid_hostname_str")%>";
var alert_invalid_username_str="<%tcWebApi_multilingual("1","alert_invalid_username_str")%>";
var alert_invalid_password_str="<%tcWebApi_multilingual("1","alert_invalid_password_str")%>";
var old_endis_ddns="<%If TCWebApi_get("Ddns_Entry","Active","h") = "Yes" then asp_Write("1") else asp_write("0") end if%>";
var old_sysDNSHost="<%If TCWebApi_get("Ddns_Entry","MYHOST","h") <> "N/A" then TCWebApi_get("Ddns_Entry","MYHOST","s") end if%>";
var old_sysDNSUser= "<%If TCWebApi_get("Ddns_Entry","USERNAME","h") <> "N/A" then TCWebApi_get("Ddns_Entry","USERNAME","s") end if%>";
var old_sysDNSPassword ="<%If TCWebApi_get("Ddns_Entry","PASSWORD","h") <> "N/A" then TCWebApi_get("Ddns_Entry","PASSWORD","s") end if%>";
var old_endis_wildcards="<%If TCWebApi_get("Ddns_Entry","WILDCARD","h") = "Yes" then asp_Write("Yes") else asp_write("No") end if%>";
var ddns_oray_router_flag=parent.ddns_oray_router_flag;
var gui_region="English"
var netgear_region=top.netgear_region;
var ddns_wildcards_flag=parent.ddns_wildcards_flag;
var dns_flag=( (ddns_oray_router_flag == 1  && gui_region == "Chinese" && (netgear_region == "" || netgear_region.toUpperCase() == "WW")) || netgear_region.toUpperCase() == "PR") ? 1 : 0;
var timestamp = "<%If TCWebApi_get("Timezone_Entry","GUITimestamp","h") <> "N/A" then TCWebApi_get("Timezone_Entry","GUITimestamp","s") end if%>";

function loadvalue()
{
	var cf = document.forms[0];

	cf.sysDNSActive.checked =<%If TCWebApi_get("Ddns_Entry","Active","h") = "Yes" then asp_Write("true") else asp_write("false") end if%>;	
	cf.sysDNSWildCard.checked = <%If TCWebApi_get("Ddns_Entry","WILDCARD","h") = "Yes" then asp_Write("true") else asp_write("false") end if%>;
}

function window_open()
{
	window.open('DNS_status_wait.asp','show_ddns','width=600,height=400,top=200,left=200,status=yes');
}

function setValue(timestamp_child) 
{
   timestamp = timestamp_child;
}

</script>
<input type="hidden" name="ddns_enabled" value="">
<input type="hidden" name="wildcards_enabled" value="">
<input type="hidden" name="change_wan_type">
<input type="hidden" name="EnableDNS" value="No">
<TR>
	<TD nowrap colspan=2>
	<input type="checkbox" name="sysDNSActive" id="sys_dnsactive">
	<A tabindex=-1 href="javascript:loadhelp('_DNS_ddns','setup')"><B><%tcWebApi_multilingual("1","use_a_dynamic_dns_str")%></B></A>
	</TD>
</TR>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<TR>
	<TD nowrap>
		<A tabindex=-1 href="javascript:loadhelp('_DNS_ddns','provider')"><B><%tcWebApi_multilingual("1","service_provider_str")%></B></A>
	</TD>
	<TD nowrap align=right>
		<select class="sysDNSProviderlist" name="sysDNSProviderlist" id="sys_dnsprovider_list">
			<option value="www.dyndns.org" >www.DynDNS.org</option>
	        <option value="www.noip.com" selected>www.noip.com</option>
		</select>
	</TD>
</TR>

<!-- 	
<TR>	
	<TD ><B>xxxxxx<%tcWebApi_multilingual("1","if_ddns_account_str")%>yyyy</B></TD>	
	<TD ><B>aaaaa<%tcWebApi_multilingual("1","service_provider_str")%>bbbb</B></TD>		
</TR>
-->


<TR>
	<TD nowrap><%tcWebApi_multilingual("1","hostname_str")%></TD>
	<TD nowrap align=right>
	<input class="sys_dnshost" type="text" name="sysDNSHost" id="sys_dnshost" size="32" maxlength="255" value="<%If TCWebApi_get("Ddns_Entry","MYHOST","h") <> "N/A" then TCWebApi_get("Ddns_Entry","MYHOST","s") end if%>" onKeyPress="return getkey('ddns_hostname',event)">
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","username_str")%></TD>
	<TD nowrap align=right>
	<input class="sys_dnsuser" type="text" name="sysDNSUser" id="sys_dnsuser" size="32" maxlength="60" value="<%If TCWebApi_get("Ddns_Entry","USERNAME","h") <> "N/A" then TCWebApi_get("Ddns_Entry","USERNAME","s") end if%>">
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","password_str")%></TD>
	<TD nowrap align=right>
	<input class="sys_dnspassword" type="password" name="sysDNSPassword" id="sys_dnspassword" onfocus="this.select();" size="32" maxlength="60" value="<%If TCWebApi_get("Ddns_Entry","PASSWORD","h") <> "N/A" then TCWebApi_get("Ddns_Entry","PASSWORD","s") end if%>">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<script>
	document.write("<TR><TD nowrap colspan=2>");
	document.write('<input type="hidden" name="sysDNSWildCard" value="1">');
	//document.write("<A tabindex=-1 href=\"javascript:loadhelp('_DNS_ddns','wildcards')\"><B>"+"<%tcWebApi_multilingual("1","use_wildcards_str")%>"+"</B></A>");
	//document.write("</TD></TR>");
	//document.write("<TR><TD colspan=2><img src=\"/liteblue.gif\" width=100% height=12></TD></TR>");
</script>
</TABLE>
</div>
<%tcWebApi_multilingual("2","_DNS_ddns_help.asp")%>
</FORM>
</BODY>
</HTML>
