
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/Add_WPS_Client.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="">

<div class="page_title"><%tcWebApi_multilingual("1","add_wps_client_str")%></div>
<div id="main" class="main">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>
 
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<input type="hidden" name="select_edit">
<input type="hidden" name="select_del">
<script>
var wps_choice=0;
var wps_pin_num="";
var security_mode="4";
parent.wps_endis_configured="5";
parent.wps_an_endis_configured="5";
	
function loadvalue()
{
}
function go2url()
{
	location.href="WPS.asp";
}
</script>
<TR>
	<TD nowrap colspan=2><B><%tcWebApi_multilingual("1","easy_connect_wireless_str")%></B></TD>
</TR>
<TR>
	<TD><BR><%tcWebApi_multilingual("1","wireless_clients_support_wps_str")%></TD>
</TR>
<TR>
	<TD><%tcWebApi_multilingual("1","check_user_manual_str")%></TD>
</TR>
<TR>
	<TD><%tcWebApi_multilingual("1","wireless_client_not_support_wps_str")%></TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
<TR>
	<TD nowrap align=center>
	<input class="short_common_bt" type="button" name="Next" id="next" value="<%tcWebApi_multilingual("0","glbstr_next")%>" onClick="go2url();">&nbsp;&nbsp;
	</TD>
</TR>
</TABLE>

</div>	
<%tcWebApi_multilingual("2","_wps_help.asp")%>
</FORM>
</BODY>
</HTML>
