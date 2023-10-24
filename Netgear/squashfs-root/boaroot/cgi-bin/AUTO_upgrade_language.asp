<%	
	if request_Form("submit_flag") <> "" then
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
var pchar = "|"; // progress char
var maxchars = 106;
var delay_time = 500; // msecs
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
		top.location.href="index.asp";
}

function onload()
{
	updateProgress();
}
</script>
<BODY bgcolor=#ffffff onLoad="onload();">

<div id="upgrade_fw">
<form>
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1><%tcWebApi_multilingual("0","glbstr_update_settings_str")%></h1></td></tr>
<TR><td nowrap><input type="text" name="progress" class="reboot1bar" size="60"  value=""></td><TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</TABLE>
</form>
</div>

</BODY>
</HTML>
