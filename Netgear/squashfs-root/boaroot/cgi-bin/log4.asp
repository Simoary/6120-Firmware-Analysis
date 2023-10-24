<%
if request_Form("Type") = "0" then
	tcWebApi_set("AyeDebug_Entry","Active","ACTIVE")
	tcWebApi_commit("AyeDebug_Entry")	
end if	
%>
<html><head>
<title>NETGEAR Router <%tcWebApi_get("SkuId_Entry","ProductName","s")%></title>
<meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>
<body bgcolor=#ffffff>
<form>
<script>
function submit_advdebug(enable)
{
	var cf = document.forms[0];
	if(enable==1)
	{
		alert("REMINDER: Start debug logging...");
		cf.ACTIVE.value="3";
	}
	else
	{
		alert("REMINDER: Stop debug logging!");
		cf.ACTIVE.value="0";
	}
	cf.submit();	
}
</script>

<BODY bgcolor=#FFFFFF>
<form method="POST" action="/cgi-bin/engdebug.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=ACTIVE value="">
<input type=hidden name=Type value="0">
<table>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap><B> <font color="red">Instruction : </font></B></TD>
	<TD nowrap><font color="red">If ADSL is not very stable please follow below setps.</font></TD>
</TR>
<TR>
	<TD nowrap><B>Step 1 : </B></TD>
	<TD nowrap>Plug you USB disk into the USB port  </TD>
</TR>
<TR>
	<TD nowrap><B>Step 2 :</B></TD>
	<TD nowrap>Make sure the USB LED is light on. </TD>
</TR>
<TR>
	<TD nowrap><B>Step 3 :</B></TD>
	<TD nowrap>click “start” button to start debug<input type="button" value="Start" onClick="submit_advdebug(1)"></TD>
</TR>
<TR>
	<TD nowrap><B>Step 4 :</B></TD>
	<TD nowrap>Start testing. </TD>
</TR>
<TR>
	<TD nowrap><B>Step 5 :</B></TD>
	<TD nowrap>The log file will save the USB flash disk. It will have different file naming ever hours. </TD>
</TR>
<TR>
	<TD nowrap><B>Step 6 :</B></TD>
	<TD nowrap>When issue happen, please login the router to save the latest 3 log file to support team.</TD>
</TR>
<TR>
	<TD nowrap><B>Step 7 :</B></TD>
	<TD nowrap>click “stop” button to stop debug <input type="button" value="Stop" onClick="submit_advdebug(0)"> <font color="red">[REMINDER: Please turn off the debug function to stop debug when finish the testing. ]</font>  </TD></TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</table>
</form>
</BODY>
</HTML>
