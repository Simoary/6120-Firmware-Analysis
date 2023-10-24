
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/USB_NETStorage.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/USB_settings.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="usb_setting">

<div class="page_title">USB Settings</div>
<div class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR><TD colspan=2 align=center><input class="apply_bt" type="submit" name="Apply" id="apply" value=" Apply " onClick=''></TD></TR>
</TABLE>
</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>


<script language="javascript" type="text/javascript">
<!--
var show_enableUSB="0";
function loadvalue()
{
	form=document.forms[0];
	if( show_enableUSB == '0' )
		form.enableUSB[0].checked = true;
	else
		form.enableUSB[1].checked = true;	
}

-->
</script>
<TR><TD colspan=2>&nbsp;</TD></TR>	
<TR>
	<TD nowrap><b>Enable any USB Device connected to the USB port</b>
	<input type="radio" name="enableUSB" id="enable_usb" value="0" >Yes
	<input type="radio" name="enableUSB" id="enable_usb" value="1" >No</TD>
    	<TD nowrap><input class="common_bt" type="button" name="Approve" id="approve" value=" Approved Devices " onClick='location.href="USB_approved.asp";'></TD>
</TR>
<TR><TD colspan=2>&nbsp;</TD></TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100%% height=12></TD></TR>
</TABLE>
</div>
<%tcWebApi_multilingual("2","_USB_setting_help.asp")%>
</FORM>
</BODY>
</HTML>
