<%
	if request_Form("submit_flag") = "Download_firmware" then
		tcWebApi_get("AutoUpgrade_Entry","Download_firmware","h")
	end if
	
	if request_Form("UPGRADE_LANG") = "6" then
		tcWebApi_set("AyeFwUpgrade_Entry","Active","UPGRADE_LANG")
		tcWebApi_commit("AyeFwUpgrade_Entry")
	end if 
%>

<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>
<script>

<%if request_Form("submit_flag") = "Download_firmware" then%>
var status=2;
<%else%>
//Download firmware
var status = "<%tcWebApi_get("AutoUpgrade_Entry","WgetFwResult","s")%>";//2-processing
<%end if%>	
var sn = "<%tcWebApi_staticGet("SkuId_Entry","TE_serialnum","s")%>";	
	
if(status=="0") //fail
	location.href="BRS_AUTO_download_failure.asp";

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
		location.href="BRS_AUTO_search_fw.asp";
}

function onload()
{
	if(status=="1")
	{	
		var cf = document.forms[0];
		cf.submit();
	}else
		updateProgress();
}
function func_exit()
{
	/*
	var next_page = "http://www.netgear.com/success/generic.aspx";
	var winoptions = "width=960,height=800,menubar=yes,scrollbars=yes,toolbar=yes,status=yes,location=yes,resizable=yes";
	window.open(next_page,null,winoptions);
	*/
	if(sn == "")
		top.location.href = "http://www.netgear.com/success/generic.aspx";
	else
		top.location.href = "http://www.netgear.com/success/generic.aspx?sn="+sn;
}

var firmware_upgrade_assistant_str= "<%tcWebApi_multilingual("1","firmware_upgrade_assistant_str")%>";
if(firmware_upgrade_assistant_str=="")
	firmware_upgrade_assistant_str="Firmware Upgrade Assistant";
	
var router_downloading_str= "<%tcWebApi_multilingual("1","router_downloading_str")%>";
if(router_downloading_str=="")
	router_downloading_str="The router is downloading the new version now. Please wait...";	
</script>
<BODY bgcolor=#ffffff onLoad="onload();">
<form method="POST" action="/cgi-bin/BRS_AUTO_upgrade_start_updating.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="upgrade_firmware">
<input type=hidden name=HTML_HEADER_TYPE value="4">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1><script>document.write(firmware_upgrade_assistant_str);</script></h1></td></tr>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR><td nowrap><input type="text" name="progress" class="reboot1bar" size="60"  value=""></td><TR>
<TR><TD><BR>
<BR></TD></TR>
<TR><TD nowrap><b><script>document.write(router_downloading_str);</script></B></TD></TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap align=center> 
	<input type='button' name='Cancel' value='Cancel' onclick='func_exit()'>
	</TD>
</TR>
</TABLE>
</form>
</BODY>
</HTML>
