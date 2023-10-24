
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/backup.js"></script>
<script type="text/javascript">
function restart()
{
	document.rebootForm.submit();
}
</script>
<title><%tcWebApi_multilingual("1","glbstr_title")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/reboot_waiting.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" name="rebootForm">
<input type=hidden name=submit_flag value="reboot">

<div class="page_title">Reboot</div>
<div id="main" class="main">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>


<tr>
	<td nowrap colspan=2><B><%tcWebApi_multilingual("1","reboot_str")%></B></td>
</tr>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
<INPUT TYPE="HIDDEN" NAME="rebootFlag" VALUE="1">
<tr>
	<td nowrap colspan=2 align=center>
	<input class="short_common_bt" type="submit" name="yes" value="Yes" onClick="restart();">
	<input class="short_common_bt" type="button" name="no" value="No" onClick="location.href='RST_status.asp'">
	</td>
</tr>
</table>
</div>

</form>
</body>
</html>
