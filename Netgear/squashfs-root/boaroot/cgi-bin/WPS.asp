



<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/WPS_status.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe name="wpsmdoeForm">
<input type=hidden name=submit_flag value="wps">

<div class="page_title" id="title"><%tcWebApi_multilingual("1","add_wps_client_str")%></div>
<div id="main" class="main">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>
 
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<input type="hidden" name="wps_in_progress" value="0">
<input type="hidden" name="wps_mode" value="1">
<input type="hidden" name="wps5g_mode" value="1">
<input type="hidden" name="wps_configure" value="2">
<input type="hidden" name="wps_start" value="1">
<input type="hidden" name="wps_button_push" value="0">
<input type="hidden" name="hidden_wlan_id" value="0">

<TR>
	<TD nowrap><B><%tcWebApi_multilingual("1","setup_method_str")%></B></TD>
</TR>
<TR>
	<TD nowrap>
	<input type=radio name="WPS_type" id="wps_type" checked value="Push Button"><%tcWebApi_multilingual("1","push_button_str")%></TD>
</TR>
<TR>
	<TD><P style='margin-left:15pt'><%tcWebApi_multilingual("1","press_physical_push_button_str")%></P></TD>
</TR>
<TR>
	<TD colspan=3>
	<P class=MsoNormal align=center style='margin:0cm;margin-bottom:.0001pt;text-align:center'>
	<span lang=EN-US style='font-size:9.0pt;font-family:Arial'>
	<input type="button" name="wps_button" id="wps_button" style="background:url(/wps_icon_on.jpg) no-repeat center center; width:50px; height:30px;" onClick="disableButton();" />
	</span>
	</P>
	</TD>
</TR>   
<TR>
	<TD nowrap align=left>
	<input type=radio name="WPS_type" id="wps_type" value="PIN Number" onClick="location.href='WPS_pin.asp'"><%tcWebApi_multilingual("1","pin_number_str")%>
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</table>

<script language="javascript">
parent.wps_charcount=0;
top.wps_process=0;
function loadvalue()
{
	var cf = document.forms[0];
	if (cf.wps_in_progress.value == "1") {
		cf.WPS_type[0].disabled = true;
		cf.WPS_type[1].disabled = true;
		cf.wps_button.disabled = true;
	} else {
		cf.WPS_type[0].disabled = false;
		cf.WPS_type[1].disabled = false;
		cf.wps_button.disabled = false;
	}
}
function disableButton()
{
	var cf = document.forms[0];
	cf.WPS_type[0].disabled = true;
	cf.WPS_type[1].disabled = true;
	cf.wps_button.disabled = true;
	top.enable_action=0;
	parent.wps_choice=0;
	parent.wps_pin_num="";
	document.getElementById("title").style.display="none";
	document.getElementById("main").style.display="none";
	document.getElementById("waiting_bar").style.display="";
	document.wpsmdoeForm.submit();

}
</script>
</div>
<div id="waiting_bar" style="display:none">
<div  align="center"><BR><BR><TR><TD align="center"><B><%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%></B></TD></TR><BR><BR></div>
<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" alt="waiting" /></div>
</div>
<%tcWebApi_multilingual("2","_wps_help.asp")%>
</FORM>
</BODY>
</HTML>
