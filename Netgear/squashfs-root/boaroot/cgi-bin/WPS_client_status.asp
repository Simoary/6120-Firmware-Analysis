
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="">

<div class="page_title">Connecting to New Wireless Client</div>
<div id="main" class="main">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<script type="text/javascript">
var pchar = "|"; // progress char
var maxchars = parseInt(parent.wps_client + 40)*2;
var wps_client = parent.wps_client;
var delay_time = 500; // msecs                                      //bug16779: a half-second interval
var wps_status="0";
var wps_charcount = parseInt(parent.wps_charcount);
pin_refresh_time = parent.pin_refresh_time; //bug 23496,the result page of timeout(PIN method) doesn't appearance when loading bar reach at 100%

function loadvalue()
{
	updateProgress();
}

function makeStr(strsize, fillchar)
{
	var temp = "";
	for (i=0; i < strsize ; i ++)
		temp = temp + fillchar;
	return temp;
}
function updateProgress()
{
	client_name = top.formframe.wps_status_frame.client_name;
	var cf = document.forms[0];

	cf.progress.value = makeStr(wps_charcount,pchar);
	if (wps_charcount % 2 == 0)
		cf.wps_icon.src = "/wps_icon_on.jpg"
	else
		cf.wps_icon.src = "/wps_icon_off.jpg"

	if ( wps_charcount == maxchars || client_name  != "" )//to fix bug 25036
	{
		//if DUT get client name at once, display the progress 1 sec, and go to WPS_sucess.asp
		if(wps_charcount == wps_client)
		{
			wps_charcout++;
			setTimeout("updateProgress();",1000);
		}
		else
			top.formframe.location.href="WPS_success.asp";
	}
	else
	{
		pin_refresh_time=pin_refresh_time+1;
		if ( parent.wps_choice == 1 )
		{
			if(pin_refresh_time % 2 == 0)
				wps_charcount=wps_charcount+1;
		}
		else
			wps_charcount=wps_charcount+1;
		setTimeout("updateProgress();",delay_time);
	}
}

</script>
</HEAD>
<script>
if ( parent.wps_choice == 1 )
{
	str="<TR><TD>The client's PIN is<font size=4><B>";
	str+=" "+parent.wps_pin_num;
	str+="</B></font>.</TD></TR>";
	document.write(str);
}
</script>
<TR>
	<TD>Collecting the client's information...</TD>
</TR>
<TR>
	<TD nowrap align="center"><img name="wps_icon" src="/wps_icon_on.jpg">&nbsp;&nbsp;&nbsp;
	<input type="text" name="progress" value="" style="color: blue" size="50">
	</TD>
</TR>

<TR>
	<TD align=center>
	<input type='button' name='Cancel' value='Cancel' onClick='top.formframe.location.href="WPS_success.asp";'>
	</TD>
</TR>
</TABLE>
<iframe name="wps_status_frame" src="wps_get_status.asp" allowtransparency="true" scrolling="no" frameborder="0" ></iframe>
<input type="hidden" name="stop" value="">
<input type="hidden" name="pgbarcount" value="10">
</div>
<%tcWebApi_multilingual("2","_wps_help.asp")%>
</FORM>
</BODY>
</HTML>
