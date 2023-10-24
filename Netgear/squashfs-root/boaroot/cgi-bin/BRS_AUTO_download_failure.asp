
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
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
	}
}

function func_exit()
{
	var next_page = "http://www.netgear.com/success/generic.aspx";
	var winoptions = "width=960,height=800,menubar=yes,scrollbars=yes,toolbar=yes,status=yes,location=yes,resizable=yes";
	window.open(next_page,null,winoptions);
}

var failure_str= "<%tcWebApi_multilingual("0","failure_str")%>";
if(failure_str=="")
	failure_str="Failure";
	
var firmware_could_not_download_str= "<%tcWebApi_multilingual("0","firmware_could_not_download_str")%>";
if(firmware_could_not_download_str=="")
	firmware_could_not_download_str="Firmware could not be downloaded from the NETGEAR server. Please check your Internet connection.";
	
</script>

<body bgcolor="#ffffff" onload="loadvalue();">
<div class="page_title"><script>document.write(failure_str);</script></div>

<div id="main" class="main">
	<img src="/liteblue.gif" width="100%" height="12" />
	<div align="center">
		<br />
		<b><script>document.write(firmware_could_not_download_str);</script></b>
	</div>
	<img src="/liteblue.gif" width="100%" height="12" />
	<div id="cancel_btn" align="center">
		<input type="button" class="cancel_bt" name="Cancel" value="Quit" onclick="func_exit();" />
	</div>
</div>
</body>
</html>
