
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<META http-equiv="refresh" content="2; url=lang_search.asp">
<BODY bgcolor=#ffffff onLoad="loadhelp('_auto_upgrade');">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1>Firmware Upgrade Assistant</h1></td></tr>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<TR><TD><BR>
<script>
parent.charcount=0;
var wan_status=1;
var status=0;
if (wan_status == 1)
{
	if (status == 9999)
		location.href="UPG_check_version_hidden.asp";
	else if (status >= 10000) 
		location.href="AUTO_upgrade_no_langversion.asp";
	else
		document.write("Please wait a moment...");
}
else 
{
	location.href="AUTO_language_nowan.asp";
}
</script>
<BR></TD></TR>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<TR>
	<TD nowrap align=center> 
	<input type='button' name='Cancel' value='Cancel' onclick='location.href="tools_update.asp"'>
	</TD>
</TR>
</TABLE>
</BODY>
</HTML>
