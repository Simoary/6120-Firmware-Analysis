


<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/WPS_status.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="wps_pin">
<input type="hidden" name="wps_configure" value="2">
<input type="hidden" name="wps_mode" value="0">
<input type="hidden" name="wps5g_mode" value="0">
<input type="hidden" name="wps_start" value="1">
<input type="hidden" name="hidden_wlan_id" value="0">

<div class="page_title" id="title"><%tcWebApi_multilingual("1","add_wps_client_str")%></div>
<div id="main" class="main">
<TABLE width=100% border=0 cellpadding=0 cellspacing=3>
<!--TR>
	<TD colSpan=3><H1>Add WPS Client</H1></TD>
</TR-->
<TR>
	<TD colSpan=3></TD>
</TR>
<TR>
	<TD colspan=3><img src="/liteblue.gif" width=100% height=12></TD>
</TR>
<input TYPE="hidden" NAME="wps_in_progress" VALUE="0">
<TR>
	<TD nowrap><B><%tcWebApi_multilingual("1","setup_method_str")%> :</B></TD>
</TR>
<TR>
	<TD nowrap>
	<input type=radio name="WPS_type" id="WPS_type" value="Push Button" onClick="location.href='WPS.asp'"><%tcWebApi_multilingual("1","push_button_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap>
	<input type=radio name="WPS_type" id="WPS_type" value="PIN Number" checked><%tcWebApi_multilingual("1","pin_number_str")%>
	</TD>
</TR>
<TR>
	<TD colspan="3"><P style='margin-left:15pt'><%tcWebApi_multilingual("1","security_pin_str")%></P></TD>
</TR>
<TR>
	<TD><P style='margin-left:15pt'><%tcWebApi_multilingual("1","enter_clints_pin_str")%> :</P></TD>
	<TD nowrap>
	<input type="text" name="PIN" id="wps_pin" size="8" maxlength="8" value="" align="left" onFocus="this.select();" onKeyPress="return getkey('num', event)">
	</TD>
	<TD>
	<P align=center style='margin:0cm;margin-bottom:.0001pt;text-align:center'>
	<span lang=EN-US style='font-size:9.0pt;font-family:Arial'>
	<input class="short_common_bt" type="submit" name="Next" id="wps_next" value="<%tcWebApi_multilingual("0","glbstr_next")%>" onClick="if (!check_pin()) return false; submit();">&nbsp;&nbsp;
	</span>
	</P>
	</TD>	
</TR>
<TR>
	<TD colspan=3><img src="/liteblue.gif" width=100% height=12></TD>
</TR>
</table>


<script language="javascript">
<!-- hide script from old browsers
<!--
parent.wps_charcount=0;
top.wps_process=0;
function loadvalue()
{
	var cf = document.forms[0];
	if (cf.wps_in_progress.value == "1") {
		cf.WPS_type[0].disabled = true;
		cf.WPS_type[1].disabled = true;
	} else {
		cf.WPS_type[0].disabled = false;
		cf.WPS_type[1].disabled = false;
	}
}

function check_pin()
{
	var cf = document.forms[0];
	var lpin = cf.PIN.value;
	var accum = 0;

	if (lpin.length != 4 && lpin.length != 8) {
		alert("A PIN is a string of 4 or 8 digits.");
		return false;
	}

	if ( !_isNumeric(lpin) )
	{
		alert("The checksum of the PIN is not correct. Please check the PIN again.\n");
		return false;	
	}
	
	if (lpin.length == 8) {
		lpin = parseFloat(cf.PIN.value);
		accum += 3 * parseInt(lpin / 10000000) % 10;
		accum += 1 * parseInt(lpin / 1000000) % 10;
		accum += 3 * parseInt(lpin / 100000) % 10;
		accum += 1 * parseInt(lpin / 10000) % 10;
		accum += 3 * parseInt(lpin / 1000) % 10;
		accum += 1 * parseInt(lpin / 100) % 10;
		accum += 3 * parseInt(lpin / 10) % 10;
		accum += 1 * parseInt(lpin / 1) % 10;

		if (0 != (accum % 10)) {
			alert("The checksum of the PIN is not correct. Please check the PIN again.\n");
			return false;
		}
	}

	cf.Next.disabled = true;
	cf.WPS_type[0].disabled = true;
	cf.WPS_type[1].disabled = true;
	top.enable_action=0;

	parent.wps_choice=1;
	parent.wps_pin_num=document.forms[0].PIN.value;	
	
	document.getElementById("title").style.display="none";
	document.getElementById("main").style.display="none";
	document.getElementById("waiting_bar").style.display="";

	cf.submit();

	return true;
}
//-->
</script>
</div>
<div id="waiting_bar" style="display:none">
<div  align="center"><BR><BR><TR><TD align="center"><B><%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%></B></TD></TR><BR><BR></div>
<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" alt="waiting" /></div>
</div>
<%tcWebApi_multilingual("2","_wps_help.asp")%>
</FORM>
</BODY>
</HTML>
