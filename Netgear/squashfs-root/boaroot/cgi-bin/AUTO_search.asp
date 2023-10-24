<%
	if request_Form("submit_flag") = "Download_fileinfo" then
		tcWebApi_get("AutoUpgrade_Entry","Download_fileinfo","h")
	end if
%>

<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<META http-equiv="refresh" content="2; url=AUTO_search.asp">
<BODY bgcolor=#ffffff onLoad="loadhelp('_auto_upgrade');">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1><%tcWebApi_multilingual("1","firmware_upgrade_assistant_str")%></h1></td></tr>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<TR><TD><BR>
<script>
	<% if request_Form("submit_flag") = "Download_fileinfo" then %>
	var status =2;
	<%else%>
	//Download fileinfo.txt
	var status = "<%tcWebApi_get("AutoUpgrade_Entry","WgetResult","s")%>";
	<%end if%>

	if(status==0) //fail
		location.href="AUTO_language_nowan.asp";
	else if(status==1) //success
		location.href="AUTO_upgrade_process.asp";
	else if(status==2) //processing
		document.write("<%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%>");
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
