<%
if TCWebApi_get("Info_WLan","wlanWPSStatus","h") = "In progress" then
   TCWebApi_set("Info_WLan","WPSActiveStatus","wps_stop")
end if
TCWebApi_set("WLan_Entry","WPSMode","wps_stop")
tcWebApi_commit("WLan_Entry")
if TCWebApi_get("Info_WLan11ac","wlanWPSStatus","h") = "In progress" then
   TCWebApi_set("Info_WLan11ac","WPSActiveStatus","wps_stop")
end if
TCWebApi_set("WLan11ac_Entry","WPSMode","wps_stop")
tcWebApi_commit("WLan11ac_Entry")
%>
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title><%tcWebApi_multilingual("1","glbstr_title")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/WPS_success.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="">

<div class="page_title"><%tcWebApi_multilingual("1","success_str")%></div>
<div id="main" class="main">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<script>
var wds_endis_fun ="0";
var wds_repeater_basic="0";
var endis_wl_radio="1";
var wps_status="";
var client_name="<%If tcWebApi_get("Info_WLan","wlanWPSDeviceName","h") <> "N/A" then tcWebApi_get("Info_WLan","wlanWPSDeviceName","s") end if%>";
var client_mac="<%If tcWebApi_get("Info_WLan","wlanWPSDeviceMac","h") <> "N/A" then tcWebApi_get("Info_WLan","wlanWPSDeviceMac","s") end if%>";
client_mac = client_mac.split(" ");
var wps_now_configured="5";
var wps_an_now_configured="5";
function loadvalue()
{
	top.enable_action=1;
}
</script>
</TABLE>
<TABLE width="100%" border="0" cellspacing="0" cellpadding="4">
<TR>
<script>
	if(client_name == "")
		document.write('<TD align=center><B><%tcWebApi_multilingual("1","wireless_client_str")%> <%tcWebApi_multilingual("1","add_network_success_str")%></B></TD>');
	else
		document.write('<TD align=center><B><%tcWebApi_multilingual("1","wireless_client_str")%>\''+client_name+'\'('+ client_mac[1] + ') <%tcWebApi_multilingual("1","add_network_success_str")%></B></TD>');
</script>
</TR>
<script>
//if (( parent.wps_endis_configured == 1 && wps_status == 1 ) || ( parent.wps_an_endis_configured == 1 && wps_status == 1))
if ( (( parent.wps_endis_configured == 1 && wps_now_configured == 5 ) || ( parent.wps_an_endis_configured == 1 && wps_an_now_configured == 5 )) && wps_status == 1 )
	document.write("<TR><TD align=center><font color=#ff0000><%tcWebApi_multilingual("1","wireless_setting_change_str")%></font></TD></TR>");

function go2url()
{
//	if (( parent.wps_endis_configured == 1 && wps_status == 1 ) || ( parent.wps_an_endis_configured == 1 && wps_status == 1))
if ( (( parent.wps_endis_configured == 1 && wps_now_configured == 5 ) || ( parent.wps_an_endis_configured == 1 && wps_an_now_configured == 5 )) && wps_status == 1 )
		location.href="WLG_wireless.asp";
	else
		location.href="WPS.asp";
}
</script>
</TABLE>
<TABLE width="100%" border="0" cellspacing="3" cellpadding="0">
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</TABLE>
<TABLE width="100%" border="0" cellspacing="0" cellpadding="4">
<script>
//if (( parent.wps_endis_configured == 1 && wps_status == 1 ) || ( parent.wps_an_endis_configured == 1 && wps_status == 1))
if ( (( parent.wps_endis_configured == 1 && wps_now_configured == 5 ) || ( parent.wps_an_endis_configured == 1 && wps_an_now_configured == 5 )) && wps_status == 1 )
	document.write("<TR><TD align=center><%tcWebApi_multilingual("1","wireless_setting_change_str")%> <%tcWebApi_multilingual("1","check_new_wireless_str")%></TD></TR>");
else
	document.write("<TR><TD align=center><%tcWebApi_multilingual("1","wireless_setting_change_str")%> <%tcWebApi_multilingual("1","go_back_wifi_protected_str")%></TD></TR>");
</script>
<TR>
	<TD align=center>
	<input class="short_common_bt" type="button" name="OK" value="OK" onClick="go2url();">
	</TD>
</TR>	
</TABLE>

</div>
<%tcWebApi_multilingual("2","_wps_help.asp")%>
</FORM>
</BODY>
</HTML>
