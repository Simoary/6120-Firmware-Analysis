
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/plc_qos_port.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/PLC_dev_configure.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="plc_qos_port_add">

<div class="page_title">Setting 2: by the TCP/UDP Port number</div>
<div class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan="2" align="center">
	<input class="cancel_bt" type="button" name="Cancel" value="Cancel" onClick='location.href="PLC_dev_configure.asp";'>&nbsp;&nbsp;
        <input class="apply_bt" type="submit" name="ok" value="OK" onClick="return check_qos_port(document.forms[0]);">
        </TD>
</TR>
</TABLE>

<div id="main" class="main_top_button">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>


<script>


var ts='36951392';

var qos_port_num=0;


var add_edit_flag = "";
var select_num = "";

function loadvalue()
{
	var cf = document.forms[0];
	if(add_edit_flag == "edit")
	{
		var str = eval('qos_port_Array' + select_num);
		var each_info = str.split(' ');

		cf.qos_port_priority.value = each_info[0];
		cf.plc_qos_port.value = each_info[1];
	}
}
</script>

<TR>
	<TD nowrap align="left" width="20%">Port</TD>
	<TD nowrap align="left"><input type="text" name="plc_qos_port" size="20" value="" maxlength="5"  onKeyPress="return getkey('num',event);">(1~65535)</TD>
</TR>
<TR>
	<TD nowrap align="left">Priority</TD>
	<TD nowrap align="left"><select name="qos_port_priority">
				<option value="Highest">Highest</option>
				<option value="High">High</option>
				<option value="Normal">Normal</option>
				<option value="Low">Low</option>
				</select>
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</TABLE>
</div>
</FORM>
</BODY>
</HTML>
