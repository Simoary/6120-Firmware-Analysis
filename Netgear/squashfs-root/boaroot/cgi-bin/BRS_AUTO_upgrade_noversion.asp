
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<script language="javascript" type="text/javascript">
var sn = "<%tcWebApi_staticGet("SkuId_Entry","TE_serialnum","s")%>";

function loadvalue()
{
	if(top.hidden_upgrade)
	{
		document.getElementById("few_seconds").style.display = "none";
		document.getElementById("cancel_btn").style.display = "";
	}
	else
	{
		document.getElementById("few_seconds").style.display = "";
		document.getElementById("cancel_btn").style.display = "none";
		//setTimeout("goback()", 4000);
	}
}

function goback()
{
	if(top.hidden_upgrade)  //if top.hidden_upgrade exits, top is CheckNewFirmware.asp
		this.location.href = "CheckNewFW_upgrade.asp";
	else
		this.location.href = "tools_update.asp";
}

function func_cancel()
{
	if(sn == "")
		top.location.href = "http://www.netgear.com/success/generic.aspx";
	else
		top.location.href = "http://www.netgear.com/success/generic.aspx?sn="+sn;
}

var firmware_version_check_str= "<%tcWebApi_multilingual("1","firmware_version_check_str")%>";
if(firmware_version_check_str=="")
	firmware_version_check_str="Firmware Version Check";
	
var no_new_firmware_str= "<%tcWebApi_multilingual("1","no_new_firmware_str")%>";
if(no_new_firmware_str=="")
	no_new_firmware_str="No new firmware version available.";	
</script>

<body bgcolor="#ffffff" onload="loadvalue();">
<div class="page_title"><script>document.write(firmware_version_check_str);</script></div>

<div id="main" class="main">
	<img src="/liteblue.gif" width="100%" height="12" />
	<div align="center">
		<br /><b><script>document.write(no_new_firmware_str);</script></b>
	</div>
	<img src="/liteblue.gif" width="100%" height="12" />
	<div id="cancel_btn" align="center">
		<input type="button" class="cancel_bt" name="cancel" value="Quit" onclick="func_cancel();" />
	</div>
</div>
</body>
</html>
