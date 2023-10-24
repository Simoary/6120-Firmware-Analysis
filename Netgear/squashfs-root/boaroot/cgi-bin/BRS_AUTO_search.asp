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

<script>
var firmware_upgrade_assistant_str= "<%tcWebApi_multilingual("1","firmware_upgrade_assistant_str")%>";
if(firmware_upgrade_assistant_str=="")
	firmware_upgrade_assistant_str="Firmware Upgrade Assistant";
</script>	
<META http-equiv="refresh" content="2; url=BRS_AUTO_search.asp">
<BODY bgcolor=#ffffff onLoad="loadhelp('_auto_upgrade');">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1><script>document.write(firmware_upgrade_assistant_str);</script></h1></td></tr>

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
		top.location.href="http://www.netgear.com/success/generic.aspx";
	else if(status==1) //success
		location.href="BRS_AUTO_upgrade_process.asp";
	else if(status==2) //processing
		document.write("<%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%>");
		
function func_cancel()
{
	var next_page = "http://www.netgear.com/success/generic.aspx";
	var winoptions = "width=960,height=800,menubar=yes,scrollbars=yes,toolbar=yes,status=yes,location=yes,resizable=yes";
	window.open(next_page,null,winoptions);
}		
</script>
<BR></TD></TR>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<TR>
	<TD nowrap align=center> 
	<input type='button' name='Cancel' value='Cancel' onclick='func_cancel()'>
	</TD>
</TR>
</TABLE>
</BODY>
</HTML>
