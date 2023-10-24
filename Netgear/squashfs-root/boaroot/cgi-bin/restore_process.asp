<HTML><HEAD>
<LINK rel="stylesheet" type="text/css" href="/style/hijack_style.css">
<TITLE>NETGEAR Router WNDR3700 </TITLE><META http-equiv=content-type content='text/html; charset=UTF-8'>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
<style>
H1 {
	FONT-WEIGHT: bold; FONT-SIZE: 16px; COLOR: #9d98ff; FONT-FAMILY: Arial, Helvetica, Geneva, Swiss, SunSans-Regular, sans-serif
}
</style>
<script>
var restore_status="0";
var wds_endis_fun="0";
var wds_endis_fun_a="0";
var wds_repeater_basic="0";
var wds_repeater_basic_a="0";
var endis_wl_radio="1";
var endis_wla_radio='1';
if (restore_status == "0" || restore_status == "1")
	document.write('<META http-equiv="refresh" content="1; url=restore_process.asp">');
</script>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>
<BODY bgcolor=#ffffff>
<FORM method="POST" action="/cgi-bin/pls_wait_reboot.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">

<script>
var ts="98962136"
</script>
<div id="h1_head" style="display:none"><TR><TD align=left><H1>Failure</H1></TD></TR></div>
<div id="msg" align="center"><BR><BR><TR><TD align="center"><B>Please wait a moment...</B></TD></TR><BR><BR></div>
<div id="wait" class="waiting_img_div" align="center"><img src="/image/wait30.gif" alt="waiting" /></div>
<div id="auto_return"></div>

<input type=hidden name=submit_flag value="reboot">
<div id="auto_return"></div>
<script>
function getObj(name)
{
	if (document.getElementById)
	{
		return document.getElementById(name);
	}
	else if (document.all)
	{
		return document.all[name];
	}
	else if (document.layers)
	{
		return document.layers[name];
	}
}

function show_reboot()
{
	document.forms[0].action="/cgi-bin/pls_wait_reboot.asp timestamp="+ts+"";
	document.forms[0].submit();
}

function goback()
{
	location.href="BAK_backup.asp";
}

function show_error()
{
	document.getElementById("h1_head").style.display="";
	getObj("msg").innerHTML="<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>" + 
				"<center><TR><TD><B>Please select correct configuration file.</B><BR><BR></TD></TR></center>" +
				"<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>";
	getObj("wait").innerHTML="";
	getObj("auto_return").innerHTML="";
	getObj("auto_return").innerHTML="<center><TR><TD>This page will automatically return to the previous page in a few seconds...<BR><BR></TD></TR></center>";
}

function show_wait()
{
	document.getElementById("h1_head").style.display="none";
	getObj("msg").innerHTML="";
	getObj("msg").innerHTML="<BR><BR><TR><TD align=\"center\"><B>Please wait a moment...</B></TD></TR><BR><BR>";
	getObj("wait").innerHTML="";
	getObj("wait").innerHTML="<img src=\"image/wait30.gif\" alt=\"waiting\" />"
	getObj("auto_return").innerHTML=""
}

if (restore_status == "2" )
{
	show_error();
	top.enable_action=1;

        top.topframe.location.href="top.asp";	

	setTimeout("goback()",3000);
}
else if ( restore_status == "3" )
{
	show_reboot();
}
else
{
	show_wait();
}
</script>
</BODY>
</HTML>
