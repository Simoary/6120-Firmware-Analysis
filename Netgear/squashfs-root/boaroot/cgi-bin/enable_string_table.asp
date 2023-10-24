
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/enable_string_table.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="enable_change_string">

<div class="page_title">Enable String</div>
<div class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
        <input class="cancel_bt" type='reset' name='Cancel' value='Cancel' onClick='location.href="enable_string_table.asp";'>&nbsp;
	<input class="apply_bt" type="submit" name="Apply" value="Apply" onClick="return click_apply(document.forms[0]);">
        </TD>
</TR>
</TABLE>

</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>


<script>
var enable_str="1";
function loadvalue()
{
	var cf = document.forms[0];
	if( enable_str == "1" )
		cf.change_string.checked = true;
	else
		cf.change_string.checked = false;

//	top.topframe.location.reload();
}
function click_apply()
{
	var cf = document.forms[0];
	if( cf.change_string.checked == true )
		cf.string_enabled.value = "1";
	else
		cf.string_enabled.value = "0";

}
</script>
<input type="hidden" name="string_enabled" value="">
<TR><TD nowrap colspan=2>
<input type="checkbox" name="change_string" value="1"><B>Enable change language</B>
</TD></TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</TABLE>
</div>
<%tcWebApi_multilingual("2","_upgrade_help.asp")%>
</FORM>
</BODY>
</HTML>
