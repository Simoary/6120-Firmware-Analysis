
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/upgrade.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/CheckNewFW.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="auto_upgrade_check">

<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1>Checking for firmware updates</h1></td></tr>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<input type="hidden" name="auto_check_for_upgrade" >
<TR><TD colspan="2">The router is checking the NETGEAR server to see if updated firmware available for your router. <br> <br> This could take up to  90 seconds, please wait ...</TD></TR>
<TR></TR>
<TR></TR>
<TR>
	<TD nowrap colspan=2 align=center>
	<input type="text" name="progress" value="" style="color: blue" size="40">
	</TD>
</TR>
<TR></TR>
<TR></TR>
<!--TR>
	<TD nowrap colspan=2>
	<input type="checkbox" name="enable" onClick="check_if_show_auto();">Check for new version upon login
	</TD>
</TR-->
<TR></TR>
<TR></TR>
<TR>
	<TD nowrap colspan=2 align=center>
	<input type="button" class="cancel_bt" name="Cancel" value="Cancel" onClick="return clickCancel();" />
	</TD>
</TR>
</TABLE>

<script language="javascript">
var status="1";
//var autochk = '1';
function loadvalue()
{
//	parent.charcount = 0;
/*	if(autochk == '1')
		document.forms[0].enable.checked = true;
	else
		document.forms[0].enable.checked = false;*/

	updateProgress();
}

function clickCancel()
{
	if(top.location.href.indexOf("CheckNewFirmware.asp") != -1)
		close_top_window();
	else
		location.href='BAS_basic.asp';
	
	return true;
}

var pchar = "|"; // progress char
var maxchars = 60; 
var delay_time = 1000; // msecs
var charcount = parent.charcount;

function makeStr(strsize, fillchar)
{
	var temp = "";
	for (i=0; i < strsize ; i ++)
		temp = temp + fillchar;
	return temp;
}

function updateProgress()
{
	var cf = document.forms[0];

	if (charcount < 5)
	{
		charcount++;
		cf.progress.value = makeStr(charcount,pchar);
		setTimeout("updateProgress()",delay_time);
		return;
	}

	if (status == "0")
	{
		location.href="AUTO_upgrade_no_internet.asp";
		return;
	}
	else if (status == "1")
	{
		var config_status = 10000;
		if (config_status >= 10000)
			location.href="AUTO_upgrade_noversion.asp";
		else if(config_status == 9999) {
			location.href="UPG_check_version.asp";
			return;
		}
	}
	if (charcount < maxchars && ((charcount % 5) == 0) && charcount != 0 )
	{
		parent.charcount=charcount+1;
		location.href="CheckNewFW.asp";
	}
	else if (charcount < maxchars) 
	{
		charcount++;
		cf.progress.value = makeStr(charcount,pchar);
		setTimeout("updateProgress()",delay_time);
	}
	else
		location.href="CheckNewFW.asp";
}
</script>

</FORM>
</BODY>
</HTML>
