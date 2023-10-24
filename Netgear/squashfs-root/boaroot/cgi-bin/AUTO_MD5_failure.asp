
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<script language="javascript" type="text/javascript">
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
		setTimeout("goback()", 4000);
	}
}

function goback()
{
	if(top.hidden_upgrade)  //if top.hidden_upgrade exits, top is CheckNewFirmware.asp
		this.location.href = "CheckNewFW_upgrade.asp";
	else
		this.location.href = "tools_update.asp";
}
</script>

<body bgcolor="#ffffff" onload="loadvalue();">
<div class="page_title">Failure</div>

<div id="main" class="main">
	<img src="/liteblue.gif" width="100%" height="12" />
	<div align="center">
		<br />
		<b>Md5 checksum error!</b>
	</div>
	<img src="/liteblue.gif" width="100%" height="12" />
	<div id="few_seconds" align="center">
		This page will automatically return to the previous page in a few seconds...
	</div>
	<div id="cancel_btn" align="center">
		<input type="button" class="cancel_bt" name="Cancel" value="Quit" onclick="top.window.close();" />
	</div>
</div>
</body>
</html>
