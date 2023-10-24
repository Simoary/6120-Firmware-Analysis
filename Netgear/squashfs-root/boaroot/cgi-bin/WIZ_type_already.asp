
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>


<BODY bgcolor=#ffffff>
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1>Setup Wizard</h1></td></tr>

<TR><TD nowrap colspan=2><B>You already have a valid Internet connection.</H1><BR>Do you still want to continue with the Smart Setup Wizard?</B></TD></TR>
<TR><TD colSpan=2></TD></TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2 align=center>
	<input type="button" name="Yes" value="Yes" onClick="click_yes()">&nbsp;&nbsp;&nbsp;
	<input type="button" name="No" value="&nbsp;No&nbsp;" onClick="location.href='BAS_basic.asp';">
	</TD>
</TR>
</TABLE>

<script>
function click_yes()
{
	var select_basic='1';
	var select_type='0';
	var wan_select ='0';
	
	if ( select_basic == '1')
	{
		if (wan_select == '1')
			location.href = "WIZ_static.asp";
		else
			location.href = "WIZ_dhcp.asp";
	}
	else 
	{
		if(select_type == '0')
			location.href = "WIZ_pppoe.asp";
		else if(select_type == '1')
			location.href = "WIZ_pptp.asp";
		else
			location.href = "WIZ_bpa.asp";
	}
}
</script>

</BODY>
</HTML>
