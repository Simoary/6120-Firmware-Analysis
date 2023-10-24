
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/plc_available_device.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/PLC_dev_configure.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="plc_avail_dev">

<div class="page_title">Available Devices</div>
<div id="main" class="main">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<script>

var ts='71591152';

var plc_avail_dev_num = 0;


function loadvalue()
{
}
</script>

<input type="hidden" name="plc_dev_reset_mac" value="">
<input type="hidden" name="plc_dev_led_mac" value="">
<input type="hidden" name="plc_dev_led_set" value="">

<TR><TD>
<TABLE class=tables border="1" cellpadding="2" cellspacing="0" width="100%">
<TR class=table_header>
	<TD nowrap align="center" width="15"><span class="subhead">#</span></TD>
	<TD nowrap align="center"><span class="subhead">Model</span></TD>
	<TD nowrap align="center"><span class="subhead">MAC Address</span></TD>
	<TD nowrap align="center"><span class="subhead">IP Address</span></TD>
	<TD nowrap align="center"><span class="subhead">Firmware Version</span></TD>
	<TD nowrap align="center"><span class="subhead">Quality (Mbps)</span></TD>
	<TD nowrap align="center"><span class="subhead">LED Status</span></TD>
	<TD nowrap align="center"><span class="subhead">Factory Reset</span></TD>
</TR>
<script>
if(plc_avail_dev_num > 0)
{
	var i=0;
	for(i=1; i<=plc_avail_dev_num; i++)
	{
		var str = eval("avail_dev_Array" + i);
		str = str.replace(/^\s+/g,"");
		var each_info = str.split(' ');
		var firmware_name = trans_firmware_name(each_info[3]);
		if( i%2== 0 )
                       document.write("<TR class=\"even_line\">");
               else
                       document.write("<TR class=\"odd_line\">");
		document.write('        <TD nowrap align="center">'+i+'</TD>');
		document.write('	<TD nowrap align="center">'+each_info[0]+'</TD>');
		document.write('	<TD nowrap align="center">'+each_info[1]+'</TD>');
		if(each_info[2] != "N/A")
		{
			document.write('<TD nowrap align="center"><a class="linktype" href="http://'+each_info[2]+'" target="_blank">'+each_info[2]+'</a></TD>');
		}
		else
		{
			document.write('<TD nowrap align="center">'+each_info[2]+'</TD>');
		}
		document.write('        <TD nowrap align="center">'+firmware_name+'</TD>');
		document.write('        <TD nowrap align="center">'+each_info[4]+'</TD>');
		document.write('        <TD nowrap align="center">');	
		if(each_info[5] == "1")
		{
			document.write('<input type="submit" value="Disable LED" name="model_led" onClick=\'return set_led_status("'+each_info[1]+'","off");\'></TD>');
		}
		else
		{
			document.write('<input type="submit" value="Enable LED" name="model_led" onClick=\'return set_led_status("'+each_info[1]+'","on");\'></TD>');
	}
		document.write('        <TD nowrap align="center">');
		document.write('        <input type="submit" value="Factory Reset" name="mod_reset" onClick=\'return check_dev_reset("'+each_info[1]+'");\'></TD>');
		document.write('</TR>');
	}
}
</script>
</TABLE>
</TD></TR>
<TR>
	<TD nowrap align=center>
	<input class="common_bt" type="submit" name="config" value="Advanced Settings">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap align=center>
	<input class="common_bt" type='button' name='refresh' value='Refresh' onClick='location.href="PLC_wait_scan.asp";'>
	</TD>
</TR>
</script>
</TABLE>

</div>

</FORM>
</BODY>
</HTML>
