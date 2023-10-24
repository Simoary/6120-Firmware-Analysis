
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<div class="page_title">Setup Wizard</div>
<BODY target=formframe onLoad="updateProgress();" bgcolor=#ffffff>
<FORM>

<script >
var pchar = "||"; // progress char
var maxchars = 33; 
var delay_time = 310; // msecs
var charcount = 0; 

function makeStr(strSize, fillChar)
{
	var temp = "";
	for (i = 0; i < strSize ; i++)
		temp = temp + fillChar;
	return temp;
}

function updateProgress()
{
	var cf = document.forms[0];

	if (charcount < maxchars)
	{
		if (cf.progress != null)
		{
			charcount++;
			cf.progress.value = makeStr(charcount,pchar);
			setTimeout("updateProgress()", delay_time);
		}
		else
			alert("cf.progress == NULL");
	}
	else
		location.href="WIZ_detwan.asp";
}

var status="0";
var percComplete = 0;
status = parseInt(status);
if (status >= 10000) 
{
 	if (status == 10001)
		location.href="WIZ_type_dhcp.asp";
	else if (status == 10002)
		location.href="WIZ_type_pppoe.asp";
	else if (status == 10003)
		location.href="WIZ_type_static.asp";
	else if (status == 10004)
		location.href="WIZ_type_static.asp";
	else if (status == 10005)
		location.href="WIZ_type_already.asp";
	else if (status == 10006)
		location.href="WIZ_type_bpa.asp";	
	else if(status == 10007)
		location.href="WIZ_type_pptp.asp";
	else
		location.href="WIZ_nowan.asp";
}
</script>
<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<TR>
	<!--TD nowrap><H1>Setup Wizard</H1></TD-->
	<!--TD></TD-->
	<TD nowrap align=center><input type="text" name="progress" value="" style="color: #0000ff" ></TD>
</TR>
<TR><P><TD colspan=3 align=center ><BR><B>Detecting Connection Type on Internet Port</B></TD></P></TR>
<TR><TD colspan="3" height="12"><HR color="#0099CC"></TD></TR>
<TR><TD colspan=3 align=center>Please wait a moment...</TD></TR>
</TABLE>
</FORM>
</HTML>
