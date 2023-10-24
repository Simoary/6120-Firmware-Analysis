
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/bas_bpa.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/BAS_update.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="wizard_bpa">

 <div class="page_title">Telstra BigPond</div>
<div class="fix_button">
    <div id="line3_1" class="common_button_short" name="Test" onClick='return check_wizard_bpa(1,"wiz");'><b>Test</b></div>
    <div id="line3_2" class="cancel_button" name="Cancel" onClick='location.href="WLG_wireless.asp";'><b>Cancel</b></div>
    <div id="line3_3" class="apply_button" name="Apply" onclick='return check_wlan("g");check_wlan("a");'><b>Apply</b></div>
</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>


<script>
var run_test="no";


var ts='81851200';
function loadvalue()
{
	var cf=document.forms[0];
	cf.bpa_username.value='';
	cf.bpa_passwd.value='';
	cf.bpa_server.value='login-server';
	goTestApply();

}
</script>
<input type="hidden" name="run_test" value="">
<input type="hidden" name="WIZ_type" value="bpa">

<TR>
	<TD nowrap><B>Login</B></TD>
	<TD nowrap>
	<input type="text" name="bpa_username" maxLength="60" size="16" onKeyPress="return getkey('ssid', event)" value="">
	</TD>
</TR>
<TR>
	<TD nowrap><B>Password</B></TD>
	<TD nowrap>
	<input type="password" name="bpa_passwd" size="16" maxlength="50" onFocus="this.select();" onKeyPress="return getkey('ssid', event)" value="">
	</TD>
</TR>
<TR>
	<TD nowrap><b>Idle Timeout</b> (In Minutes)</TD>
	<TD nowrap>
	<input type="text" name="bpa_idletime" maxLength="5" size="16" value="5" onKeyPress="return getkey('num', event)">
	</TD>
</TR>
<TR>
	<TD nowrap><B>Authentication Server</B></TD>
	<TD nowrap>
	<input type="text" name="bpa_server" maxLength="128" size="16" value="" onKeyPress="return getkey('ssid', event)">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<!--TR>
	<TD nowrap colspan=2 align=center>
	<input type='submit' name='Apply' value='Apply' onClick='return check_wizard_bpa(0,"wiz");'>
	<input type='button' name='Cancel' value='Cancel' onClick='location.href="BAS_basic.asp";'>
	<input type='submit' name='Test' value='Test' onClick='return check_wizard_bpa(1,"wiz");'>
	</TD>
</TR-->
</TABLE>
</div>
</FORM>
</BODY>
</HTML>
