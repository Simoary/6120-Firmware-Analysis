<%
	if request_Form("submit_flag") = "Download_firmware" then
		tcWebApi_get("AutoUpgrade_Entry","Download_firmware","h")
	end if
%>

<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<BODY bgcolor=#ffffff onLoad="onload();">
<form>
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1><%tcWebApi_multilingual("1","firmware_upgrade_assistant_str")%></h1></td></tr>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<TR><td nowrap><input type="text" name="progress" class="reboot1bar" size="60"  value=""></td><TR>

<TR><TD><BR>
<script>
//Download firmware
var status = "<%tcWebApi_get("AutoUpgrade_Entry","WgetFwResult","s")%>";//2-processing
	
if(status==0) //fail
	location.href="AUTO_download_failure.asp";
else if(status==1) //success
	location.href="AUTO_start_upgrade.asp";

var pchar = "|"; // progress char
var maxchars = 100;
var delay_time = 300; // msecs
var charcount = 0;

function makeStr(strSize, fillChar)
{
	var temp = "";
	for (i=0; i < strSize ; i ++)
		temp = temp + fillChar;
	return temp;
}

function updateProgress()
{
	var cf = document.forms[0];
	if (charcount < maxchars)
	{
		charcount ++;
		cf.progress.value = makeStr(charcount,pchar);
		setTimeout("updateProgress()",delay_time);
	}
	else
	{
		location.href="AUTO_search_fw.asp";
	}
}

function onload()
{
	updateProgress();
}
</script>
<BR></TD></TR>
<TR><TD nowrap><b><%tcWebApi_multilingual("1","the_waiting_message_str")%></B></TD></TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<TR>
	<TD nowrap align=center> 
	<input type='button' name='Cancel' value='Cancel' onclick='location.href="tools_update.asp"'>
	</TD>
</TR>
</TABLE>
</form>
</BODY>
</HTML>
