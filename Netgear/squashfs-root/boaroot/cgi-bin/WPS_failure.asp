<%
	TCWebApi_set("Info_WLan","WPSActiveStatus","wps_stop")
    TCWebApi_set("WLan_Entry","WPSMode","wps_stop")
	TCWebApi_set("Info_WLan11ac","WPSActiveStatus","wps_stop")
	TCWebApi_set("WLan11ac_Entry","WPSMode","wps_stop")
    tcWebApi_commit("WLan_Entry")
	tcWebApi_commit("WLan11ac_Entry")
%>
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="">

<div class="page_title"><%tcWebApi_multilingual("1","failure_str")%></div>
<div id="main" class="main">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>
 
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>


<script>
wps_charcount = parent.wps_charcount;
if(parent.wps_cancel_button == 1)
    var wps_status= 5;
else
    var wps_status="<%If tcWebApi_get("Info_WLan","wlanWPSStatus","h") <> "N/A" then tcWebApi_get("Info_WLan","wlanWPSStatus","s") end if%>";
var wds_endis_fun ="0";
var wds_repeater_basic="0";
var endis_wl_radio="1";
var wps_now_configured="5";
var wps_an_now_configured="5";

var T_minutes = "2";
if ( parent.wps_choice == 1 )
	T_minutes="4";
else
	T_minutes="2";
		
function loadvalue()
{
	top.enable_action=1;

}
</script>
</TABLE>
<TABLE width="100%" border="0" cellspacing="0" cellpadding="4">
<script>
if (wps_status == "WPS Process Fail" && parent.wps_choice == 1)         //client's PIN is not correct
{
	document.write("<TR><TD align=center><font color=#ff0000><B><%tcWebApi_multilingual("1","clients_pin_not_correct_str")%></B></font></TD></TR>");
	document.write("<TR><TD align=center><B><%tcWebApi_multilingual("1","fail_add_wireless_str")%></B></TD></TR>");
}
else if (wps_status == "Idle")    // timeout
{
	document.write("<TR><TD name=message id=message align=center><font color=#ff0000><B><%tcWebApi_multilingual("1","wps_procedure_timeout_str")%></B></font></TD></TR>");
	document.write("<TR><TD align=center><B><%tcWebApi_multilingual("1","fail_add_wireless_client_in_str")%>" + T_minutes + "<%tcWebApi_multilingual("1","minutes_str")%> <%tcWebApi_multilingual("1","check_client_support_wps_str")%></B></TD></TR>");
}
else if (wps_status == 5)    // user push cancel button
{
	document.write("<TR><TD align=center><font color=#ff0000><B><%tcWebApi_multilingual("1","wps_procedure_cancel_str")%></B></font></TD></TR>");
	document.write("<TR><TD align=center><B><%tcWebApi_multilingual("1","fail_add_wireless_str")%></B></TD></TR>");
}
else if(wps_status == "WPS Process Fail" && parent.wps_choice == 0)
{
	document.write("<TR><TD align=center><font color=#ff0000><B><%tcWebApi_multilingual("1","detect_more_client_str")%></B></font></TD></TR>");
	document.write("<TR><TD align=center><B><%tcWebApi_multilingual("1","fail_add_wireless_str")%></B></TD></TR>");
}
else
{
	document.write("<TR><TD name=message id=message align=center><font color=#ff0000><B><%tcWebApi_multilingual("1","wps_procedure_timeout_str")%></B></font></TD></TR>");
	document.write("<TR><TD align=center><B><%tcWebApi_multilingual("1","fail_add_wireless_client_in_str")%>" + T_minutes + "<%tcWebApi_multilingual("1","minutes_str")%> <%tcWebApi_multilingual("1","check_client_support_wps_str")%></B></TD></TR>");
}
//if ((parent.wps_endis_configured == 1 && wps_status == 1)||(parent.wps_an_endis_configured == 1 && wps_status == 1 ))
if ( (( parent.wps_endis_configured == 1 && wps_now_configured == 5 ) || ( parent.wps_an_endis_configured == 1 && wps_an_now_configured == 5 )) && wps_status == 1 )
	document.write("<TR><TD align=center><font color=#ff0000><%tcWebApi_multilingual("1","wireless_setting_change_str")%></font></TD></TR>");

function go2url()
{
//	if ((parent.wps_endis_configured == 1 && wps_status == 1)||(parent.wps_an_endis_configured == 1 && wps_status == 1 ))
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
//if ((parent.wps_endis_configured == 1 && wps_status == 1)||(parent.wps_an_endis_configured == 1 && wps_status == 1 ))
if ( (( parent.wps_endis_configured == 1 && wps_now_configured == 5 ) || ( parent.wps_an_endis_configured == 1 && wps_an_now_configured == 5 )) && wps_status == 1 )
	document.write("<TR><TD align=center><%tcWebApi_multilingual("1","check_new_wireless_str")%></TD></TR>");
else
	document.write("<TR><TD align=center><%tcWebApi_multilingual("1","go_back_wifi_protected_str")%></TD></TR>");
</script>	
<TR>
	<TD align=center>
	<input class="short_common_bt" type="button" name="OK" id="ok" value="<%tcWebApi_multilingual("0","glbstr_ok")%>" onClick="go2url();">
	</TD>
</TR>	
</TABLE>

</div>
<%tcWebApi_multilingual("2","_wps_help.asp")%>
</FORM>
</BODY>
</HTML>
