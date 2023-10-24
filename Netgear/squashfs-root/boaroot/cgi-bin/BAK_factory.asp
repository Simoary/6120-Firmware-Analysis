
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/backup.js"></script>
<title><%tcWebApi_multilingual("1","glbstr_title")%></title>
<meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/pls_wait_factory_reboot.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="factory">
<input type=hidden name=HTML_HEADER_TYPE value="2">

<div class="page_title"><%tcWebApi_multilingual("1","backup_settings_str")%></div>
<div id="main" class="main">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<script>
var wds_endis_fun='0';
var wds_repeater_basic='0';
var endis_wl_radio='1';
var ts="<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
</script>

<TR>
	<TD name="erase_message" id="erase_message" nowrap colspan=2><B><%tcWebApi_multilingual("1","loading_the_factory_default_str")%></B></TD>
</TR>
<TR>
	<TD nowrap colspan=2><BR><B><%tcWebApi_multilingual("1","are_you_sure_str")%></B></TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2 align=center>
	<input class="short_common_bt" type="submit" name="yes" id="yes" value="<%tcWebApi_multilingual("0","glbstr_yes")%>" onclick="click_yesfactory();">
	<input class="short_common_bt" type="button" name="no" id="no" value="<%tcWebApi_multilingual("0","glbstr_no")%>" onclick=location.href="BAK_backup.asp">
	</TD>
</TR>
</TABLE>
</div>

</FORM>
</BODY>
</HTML>
