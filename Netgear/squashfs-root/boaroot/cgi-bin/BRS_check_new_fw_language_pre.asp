<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>
<BODY bgcolor=#ffffff onLoad="func_submit()">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1><%tcWebApi_multilingual("1","firmware_upgrade_assistant_str")%></h1></td></tr>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<TR><TD><BR>
<script>
function func_submit()
{
	var ts = "<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
	var cf=document.forms[0];
	cf.submit_flag.value="Download_fileinfo";	
	cf.action="/cgi-bin/BRS_AUTO_search.asp?id="+ts;
	cf.submit();
}	
</script>
<BR></TD></TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<form>
<input type="hidden" name="submit_flag" value="auto_upgrade_check" />
<input type="hidden" name="ClearWgetResult" value="2" />
</form>
</TABLE>
</BODY>
</HTML>
