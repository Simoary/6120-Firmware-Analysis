
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/plc_dev_config.js"></script>
<script language=javascript type=text/javascript src="/plc_dev_class.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/PLC_wait_scan.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="plc_dev_config">

<div class="page_title">Advanced Settings</div>
<div id="main" class="main">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<script>


var ts='99043736';

var qos_mac_num=0;

var qos_port_num=0;


/*---------PLC device-----------*/
/*
	Model_name, MAC, IP, FW_VERSION, Linkrate, Led_status, Reset_status, DAK, Dev_type, DAK_password, record_status.
*/
var plc_avail_dev_num = 0;


//Bug 22008
var devices_set = new Array();
loadDevices();

function loadvalue()
{
	var i;
	var cf = document.forms[0];

	if(plc_avail_dev_num == 1)
		cf.select_dev.checked = true;
	else if(plc_avail_dev_num > 1)
	{
		for(i=0; i<plc_avail_dev_num; i++)
		{
			cf.select_dev[i].checked = true;
		}
	}

	check_DAK_status();
}
</script>

<input type="hidden" name="plc_qos_mac_flag" value="">
<input type="hidden" name="plc_qos_mac_select" value="">
<input type="hidden" name="plc_qos_port_flag" value="">
<input type="hidden" name="plc_qos_port_select" value="">
<input type="hidden" name="plc_dev_cfg_info" value="">
<input type="hidden" name="plc_dev_select_num" value="">
<input type="hidden" name="plc_dev_cfg_mac" value="">

<TR><TD colspan="2" align="left"><h2>Security</h2></TD></TR>
<TR><TD nowrap align="left" colspan="2"><b>Please enter the Device Password before setting the Encryption Key :</b></TD></TR>
<TR><TD colspan="2"><img src=/spacer.gif width=20 height=12 border=0></TD></TR>
<TR><TD colspan="2" align="center">
	<TABLE class=tables border=0 cellpadding="4" cellspacing="0" width="80%">
	<TR class=table_header>
		<TD nowrap align="center" width="15%">&nbsp; </TD>
		<TD nowrap align="center" width="15%"><span class="subhead">#</span></TD>
		<TD nowrap align="center" width="20%"><span class="subhead">Model</span></TD>
		<TD nowrap align="center" width="30%"><span class="subhead">MAC Address</span></TD>
		<TD nowrap align="center"><span class="subhead">Password</span></TD>
	</TR>
	<script>
	var i;
	for(i=1; i<=plc_avail_dev_num; i++)
	{
            if( i%2== 0 )
                    document.write("<TR class=\"even_line\">");
            else
                    document.write("<TR class=\"odd_line\">");
		document.write('<TD nowrap align="center"><input type="checkbox" name="select_dev" value="1" onClick="return check_DAK_status();"></TD>');
		document.write('<TD nowrap align="center"><span class="subhead">'+i+'</span></TD>');
		document.write('<TD nowrap align="center">'+devices_set[i].Model_name+'</TD>');
		document.write('<TD nowrap align="center">'+devices_set[i].MAC+'</TD>');
		document.write('<TD nowrap align="center">');

		//local device or has been recorded, no need to get modification from user.
		if(devices_set[i].Dev_type == "1" || devices_set[i].Record_status == "1")
		{
			document.write('<input type="text" name="DAK" style="width:240px; border:none;" readonly onfocus="this.blur()" value="xxxx-xxxx-xxxx-xxxx">');
		}
		else if(devices_set[i].Dev_type == "0" && devices_set[i].Record_status == "0")
		{
			document.write('<input type="text" name="DAK" style="width:240px;" maxlength="19" onKeyPress="return getkey(\'hostname\', event);">');
		}
		document.write('</TD></TR>');
	}
	</script>
	</TABLE>
</TD>
</TR>
<TR><TD colspan="2"><img src=/spacer.gif width=20 height=12 border=0></TD></TR>
<TR><TD colspan="2"><img src=/spacer.gif width=20 height=12 border=0></TD></TR>
<TR><TD colspan="2" align="center">
	<TABLE border="0" cellpadding="4" cellspacing="0" width="80%">
	<TR>
        	<TD nowrap align="right" nowrap="nowrap" width="35%"><b>Create a new Encryption Key :</b></TD>
        	<TD nowrap align="center"><input type="text" size="50%" name="NMK" value="" maxlength="64" onKeyPress="return getkey('num_letter', event);"></TD>
	</TR>
	<TR>
		<TD align="right" nowrap="nowrap" width="35%"><b>OR :</b></TD>
		<TD align="center" nowrap="nowrap">
		<input class="long_common_bt" type="button" name="creat_default_key"  value="Use default Encryption Key" onClick="return create_default_NMK();">
		</TD>
	</TR>
	</TABLE>
</TD>
</TR>
<TR><TD colspan="2"><img src=/spacer.gif width=20 height=12 border=0></TD></TR>
<TR>
	<TD nowrap colspan="2" align="center">
	<input class="cancel_bt" type="button" name="Cancel" value="Cancel" onClick='location.href="PLC_wait_scan.asp";'>&nbsp;&nbsp;
	<input class="apply_bt" type="submit" name="apply" value="Apply" onClick="return plc_device_config(document.forms[0]);">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR><TD colspan="2" align="left"><h2>QoS</h2></TD></TR>
<TR><TD nowrap align="left" colspan="2"><b>Setting 1: by the destination MAC address</b></TD></TR>
<TR><TD colspan="2"><img src=/spacer.gif width=20 height=12 border=0></TD></TR>
<TR><TD colspan="2" align="center">
	<TABLE class=tables border=0 cellpadding="2" cellspacing="0" width="80%">
	<TR class=table_header>
		<TD nowrap align="center" width="10%">&nbsp;</TD>
		<TD nowrap align="center" width="10%"><span class="subhead">#</span></TD>
		<TD nowrap align="center"><span class="subhead">Priority</span></TD>
		<TD nowrap align="center" width="60%"><span class="subhead">Destination MAC Address</span></TD>
	</TR>
	<script>
	if(qos_mac_num > 0)
	{
		var i;
		for(i=1; i<=qos_mac_num; i++)
		{
			var qos_mac_each = eval('qos_mac_Array' + i);
			var each_info = qos_mac_each.split(' ');
			   if( i%2== 0 )
                    document.write("<TR class=\"even_line\">");
            else
                    document.write("<TR class=\"odd_line\">");
			document.write('<TD nowrap align="center"><input type="radio" name="qos_mac_select"></TD>');
			document.write('<TD nowrap align="center"><span class="subhead">'+i+'</span></TD>');
			document.write('<TD nowrap align="center">'+each_info[0]+'</TD>');
			document.write('<TD nowrap align="center">'+each_info[1]+'</TD></TR>');
		}
	}	
	</script>
	</TABLE>
</TD></TR>
<TR>
	<TD nowrap colspan="2" align="center">
	<input class="add_bt"  type="submit" name="add" value="Add" onClick='return check_qos_mac("add");'>
	<input class="edit_bt" type="submit" name="edit" value="Edit" onClick='return check_qos_mac("edit");'>
	<input class="delete_bt" type="submit" name="delete" value="Delete" onClick='return check_qos_mac("delete");'>
	</TD>
</TR>
<TR><TD colspan="2"><img src=/spacer.gif width=20 height=12 border=0></TD></TR>
<TR><TD nowrap align="left" colspan="2"><b>Setting 2: by the TCP/UDP Port number</b></TD></TR>
<TR><TD colspan="2"><img src=/spacer.gif width=20 height=12 border=0></TD></TR>
<TR><TD align="center" colspan="2">
	<TABLE class=tables border=0 cellpadding="2" cellspacing="0" width="80%">
	<TR class=table_header>
		<TD nowrap align="center" width="10%">&nbsp;</TD>
		<TD nowrap align="center" width="10%"><span class="subhead">#</span></TD>
		<TD nowrap align="center"><span class="subhead">Priority</span></TD>
		<TD nowrap align="center" width="60%"><span class="subhead">Destination Port Number</span></TD>
	</TR>
	<script>
	if(qos_port_num > 0)
	{
		var i;
		for(i=1; i<=qos_port_num; i++)
		{
			var qos_port_each = eval('qos_port_Array' + i);
			var each_info = qos_port_each.split(' ');
			   if( i%2== 0 )
                    document.write("<TR class=\"even_line\">");
            else
                    document.write("<TR class=\"odd_line\">");
			document.write('<TD nowrap align="center"><input type="radio" name="qos_port_select"></TD>');
			document.write('<TD nowrap align="center"><span class="subhead">'+i+'</span></TD>');
			document.write('<TD nowrap align="center">'+each_info[0]+'</TD>');
			document.write('<TD nowrap align="center">'+each_info[1]+'</TD></TR>');
		}
	}
	</script>
	</TABLE>
</TD></TR>
<TR>
	<TD nowrap colspan="2" align="center">
	<input class="add_bt" type="submit" name="add" value="Add" onClick='return check_qos_port("add");'>
	<input class="edit_bt" type="submit" name="edit" value="Edit" onClick='return check_qos_port("edit");'>
	<input class="delete_bt" type="submit" name="delete" value="Delete" onClick='return check_qos_port("delete");'>
	</TD>
</TR>
<TR><TD colspan="2"><img src=/spacer.gif width=20 height=12 border=0></TD></TR>
<TR>
	<TD nowrap colspan="2" align="center">
	<input class="cancel_bt" type="button" name="Cancel" value="Cancel" onClick='location.href="PLC_wait_scan.asp";'>&nbsp;&nbsp;
	<input class="apply_bt" type="submit" name="apply" value="Apply" onClick="return plc_qos_config(document.forms[0]);">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</TABLE>

</div>

</FORM>
</BODY>
</HTML>
