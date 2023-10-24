<%
if request_Form("Type") = "0" then
	tcWebApi_set("Utelnetd_Entry","Active","ACTIVE")
	tcWebApi_commit("Utelnetd_Entry")
elseif request_Form("Type") = "1" then
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
var check_hwid_valid="<%tcWebApi_get("SkuId_Entry","SKUID_Check","s")%>";
if(check_hwid_valid!="Success")
	alert("Error hwid and region in your flash!!!! Please fix it!");

var productname="<%tcWebApi_get("SkuId_Entry","ProductName","s")%>";	
var wifi5gmode="<%tcWebApi_get("SkuId_Entry","WiFi5GMode","s")%>";

if(wifi5gmode!="0" && wifi5gmode!="1")
	alert("wifi5gmode is wrong. Please fix it!!! Otherwise maybe will always reset to debug!");

if(productname=="D6000"||productname=="D6010")	
{
	if(wifi5gmode=="0")
		alert("wifi5gmode is wrong. Please fix it!!!");
}	
else if(productname=="D3600"||productname=="D3610")	
{
	if(wifi5gmode=="1")
		alert("wifi5gmode is wrong. Please fix it!!!");
}
	
function submit_debugmode(enable)
{
	var cf = document.forms[0];
	cf.Type.value="0";	
	if(enable==1)
	{
		cf.ACTIVE.value="Yes";
		alert("Warning: It will disable ThinClient!");
	}
	else
		cf.ACTIVE.value="No";
	cf.submit();	
}	

function submit_advdebug(enable)
{
	var cf = document.forms[0];
	cf.Type.value="1";
	if(enable==1)
	{
		cf.ACTIVE.value="1";
		alert("Start sniffer packet and log system information.");
	}
	else if(enable==0)
		cf.ACTIVE.value="0";
	else if(enable==2)
	{
		alert("REMINDER: You have go to step 4 to stop this debug process, the system could crash if log is full.");
		cf.ACTIVE.value="2";
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
	<TD nowrap><font color="red">If the device can’t detect your DSL or DSL not stable, please follows the steps to collect the debug log.<br/>
	The log will collect the ADSL line quantity, ADSL line sync up status.
</font></TD>
</TR>
<TR>
	<TD nowrap><B>Step 1 : </B></TD>
	<TD nowrap>Plug your ADSL line into “ADSL” port on the device and wait 30 seconds for device sync with your ISP </TD>
</TR>
<TR>
	<TD nowrap><B>Step 2 :</B></TD>
	<TD nowrap>click “start” button <input type="button" value="Start" onClick="submit_advdebug(2)"></TD>
</TR>
<TR>
	<TD nowrap><B>Step 3 : </B></TD>
	<TD nowrap>Wait for 5 minutes to collect your ADSL single.</TD>
</TR>
<TR>
	<TD nowrap><B>Step 4 :</B></TD>
	<TD nowrap>click “stop” button to stop debug log. <input type="button" value="Stop" onClick="submit_advdebug(0)"> <font color="red">[REMINDER: If you don’t stop this process, the system could crash when log is full ]</font>  </TD>
</TR>
<TR>
	<TD nowrap><B>Step 5 :</B></TD>
	<TD nowrap><a href="/ayedebug.log"> Download Log(Click Me) </a></TD>
</TR>
<TR>
	<TD nowrap><B>Step 6 : </B></TD>
	<TD nowrap> <font color="red"> Please copy all information on the new page and send the log to beta forum for debug.</font></TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</table>
</form>
</BODY>
</HTML>
