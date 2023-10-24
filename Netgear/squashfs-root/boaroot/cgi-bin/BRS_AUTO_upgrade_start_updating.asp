<%	
	if request_Form("submit_flag") = "upgrade_firmware" then
		tcWebApi_set("AyeFwUpgrade_Entry","Active","HTML_HEADER_TYPE")
		tcWebApi_commit("AyeFwUpgrade_Entry")
	end if
%>

<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>
<script>
var pchar = "|"; // progress char
var maxchars = 106;
var delay_time = 2260; // msecs
var charcount = 0;
var sn = "<%tcWebApi_staticGet("SkuId_Entry","TE_serialnum","s")%>";

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
		if(sn == "")
			top.location.href = "http://www.netgear.com/success/generic.aspx";
		else
			top.location.href = "http://www.netgear.com/success/generic.aspx?sn="+sn;
	}
}

function onload()
{
	updateProgress();
}

var firmware_updating_str= "<%tcWebApi_multilingual("1","firmware_updating_str")%>";
if(firmware_updating_str=="")
	firmware_updating_str="Firmware Update";
</script>
<BODY bgcolor=#ffffff onLoad="onload();">

<div id="upgrade_fw">
<form ENCTYPE="multipart/form-data" METHOD="POST" action="/cgi-bin/AUTO_upgrade_start_updating.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type="hidden" name="submit_flag" value="upgrade_firmware">
<INPUT TYPE="HIDDEN" NAME="HTML_HEADER_TYPE" VALUE="1">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1><script>document.write(firmware_updating_str);</script></h1></td></tr>
<TR><td nowrap><input type="text" name="progress" class="reboot1bar" size="60"  value=""></td><TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</TABLE>
</form>
</div>

</BODY>
</HTML>
