<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/reservation.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title>
<meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue()" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/LAN_lan.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="reservation_edit">
<script>

var test;
<%  If Request_Form("select_edit") = "0" Then
		asp_Write("test=0;")
	elseif Request_Form("select_edit") = "1" Then	
		asp_Write("test=1;")
	elseif Request_Form("select_edit") = "2" Then
		asp_Write("test=2;")
	elseif Request_Form("select_edit") = "3" Then	
		asp_Write("test=3;")
	elseif Request_Form("select_edit") = "4" Then	
		asp_Write("test=4;")
	elseif Request_Form("select_edit") = "5" Then	
		asp_Write("test=5;")
	elseif Request_Form("select_edit") = "6" Then	
		asp_Write("test=6;")
	elseif Request_Form("select_edit") = "7" Then
		asp_Write("test=7;")
	end if
%>

function loadvalue()
{
	
	var cf=document.forms[0];
	var reservation_ipaddr;
	cf.emptyEntry.value = eval(test);
	
	switch (test)
	{
		case 0:
			reservation_ipaddr="<%tcwebApi_staticGet("Dhcpd_Entry0","IP","s")%>" ;
			cf.rsv_mac.value="<%tcwebApi_staticGet("Dhcpd_Entry0","MAC","s")%>";
			cf.dv_name.value="<%tcwebApi_staticGet("Dhcpd_Entry0","Name","s")%>";
			break;
		case 1:
			reservation_ipaddr="<%tcwebApi_staticGet("Dhcpd_Entry1","IP","s")%>" ;
			cf.rsv_mac.value="<%tcwebApi_staticGet("Dhcpd_Entry1","MAC","s")%>";
			cf.dv_name.value="<%tcwebApi_staticGet("Dhcpd_Entry1","Name","s")%>";
			break;
		case 2:
			reservation_ipaddr="<%tcwebApi_staticGet("Dhcpd_Entry2","IP","s")%>";
			cf.rsv_mac.value="<%tcwebApi_staticGet("Dhcpd_Entry2","MAC","s")%>";
			cf.dv_name.value="<%tcwebApi_staticGet("Dhcpd_Entry2","Name","s")%>";
			break;
		case 3:
			reservation_ipaddr="<%tcwebApi_staticGet("Dhcpd_Entry3","IP","s")%>";
			cf.rsv_mac.value="<%tcwebApi_staticGet("Dhcpd_Entry3","MAC","s")%>";
			cf.dv_name.value="<%tcwebApi_staticGet("Dhcpd_Entry3","Name","s")%>";
			break;
		case 4:
			reservation_ipaddr="<%tcwebApi_staticGet("Dhcpd_Entry4","IP","s")%>";
			cf.rsv_mac.value="<%tcwebApi_staticGet("Dhcpd_Entry4","MAC","s")%>";
			cf.dv_name.value="<%tcwebApi_staticGet("Dhcpd_Entry4","Name","s")%>";
			break;
		case 5:
			reservation_ipaddr="<%tcwebApi_staticGet("Dhcpd_Entry5","IP","s")%>";
			cf.rsv_mac.value="<%tcwebApi_staticGet("Dhcpd_Entry5","MAC","s")%>";
			cf.dv_name.value="<%tcwebApi_staticGet("Dhcpd_Entry5","Name","s")%>";
			break;
		case 6:
			reservation_ipaddr="<%tcwebApi_staticGet("Dhcpd_Entry6","IP","s")%>";
			cf.rsv_mac.value="<%tcwebApi_staticGet("Dhcpd_Entry6","MAC","s")%>";
			cf.dv_name.value="<%tcwebApi_staticGet("Dhcpd_Entry6","Name","s")%>";
			break;
		case 7:
			reservation_ipaddr="<%tcwebApi_staticGet("Dhcpd_Entry7","IP","s")%>";
			cf.rsv_mac.value="<%tcwebApi_staticGet("Dhcpd_Entry7","MAC","s")%>";
			cf.dv_name.value="<%tcwebApi_staticGet("Dhcpd_Entry7","Name","s")%>";
			break;
		default:
			alert(invali_resevation_edit_error);
			break;
	}
	
	var ip_array=reservation_ipaddr.split('.');
	cf.rsv_ip1.value=ip_array[0];
	cf.rsv_ip2.value=ip_array[1];
	cf.rsv_ip3.value=ip_array[2];
	cf.rsv_ip4.value=ip_array[3];
	//cf.dv_name.value= "test";
	
	
	SumEntry();
	
}

function SumEntry()
{
	var temp_value = 0 ;
	<%if tcwebApi_get("Dhcpd_Entry0","IP","h")<>"N/A" then%>
		temp_value = temp_value + 1;
	<%end if%>
	<%if tcwebApi_get("Dhcpd_Entry1","IP","h")<>"N/A" then%>
		temp_value = temp_value + 1;
	<%end if%>
	<%if tcwebApi_get("Dhcpd_Entry2","IP","h")<>"N/A" then%>
		temp_value = temp_value + 1;
	<%end if%>
	<%if tcwebApi_get("Dhcpd_Entry3","IP","h")<>"N/A" then%>
		temp_value = temp_value + 1;
	<%end if%>
	<%if tcwebApi_get("Dhcpd_Entry4","IP","h")<>"N/A" then%>
		temp_value = temp_value + 1;
	<%end if%>
	<%if tcwebApi_get("Dhcpd_Entry5","IP","h")<>"N/A" then%>
		temp_value = temp_value + 1;
	<%end if%>
	<%if tcwebApi_get("Dhcpd_Entry6","IP","h")<>"N/A" then%>
		temp_value = temp_value + 1;
	<%end if%>
	<%if tcwebApi_get("Dhcpd_Entry7","IP","h")<>"N/A" then%>
		temp_value = temp_value + 1;
	<%end if%>
	
	
	document.forms[0].sumEntry.value = temp_value;
}

var invalid_rsv_ip_str = "<%tcWebApi_multilingual("1","invalid_rsv_ip_str")%>";
var invalid_rsv_ip_duplicate_str = "<%tcWebApi_multilingual("1","invalid_rsv_ip_duplicate_str")%>";
var invalid_rsv_MAC_duplicate_str = "<%tcWebApi_multilingual("1","invalid_rsv_MAC_duplicate_str")%>";
var invalid_resevation_add_str = "<%tcWebApi_multilingual("1","invalid_resevation_add_str")%>";
var invalid_ip_str = "<%tcWebApi_multilingual("1","invalid_ip_str")%>";
var alert_invalid_mac_str="<%tcWebApi_multilingual("0","invalid_mac_str")%>";
var device_name_null_str="<%tcWebApi_multilingual("1","device_name_null_str")%>";

</script>
<div class="page_title" id="title"><%tcWebApi_multilingual("1","reservation_title_str")%></div>
<div class="fix_button" id="check_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
	<input class="cancel_bt" type="button" name="Cancel" id="cancel" value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick=location.href="LAN_lan.asp";>&nbsp;&nbsp;
	<input class="apply_bt" type="submit" name="Apply" id="apply" value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick="return check_reservation_add(document.forms[0],document.forms[0].temp_string.value)">
        </TD>
</TR>
</TABLE>
</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<INPUT type="HIDDEN" name="temp_string" value= "edit">
<INPUT type="HIDDEN" name="lanFlag" value="0">
<INPUT type="HIDDEN" name="emptyEntry" >
<INPUT type="HIDDEN" name="editflag" value="0">
<INPUT TYPE="HIDDEN" NAME="IpAddr">
<INPUT type="HIDDEN" name="sumEntry">
<input type="hidden" name="PoolSize" value="<%If tcWebApi_get("Dhcpd_Common","pool_count","h") <>"N/A" then tcWebApi_get("Dhcpd_Common","pool_count","s") end if%>">
<input type="hidden" name="reservation_ipaddr">
<input type="hidden" name="duplicated_reservation">
<input type="hidden" name="duplicated_num" value=0>
<input type="hidden" name="sysPoolStartingAddr" value="<%If tcWebApi_get("Dhcpd_Common","start","h") <>"N/A" then tcWebApi_get("Dhcpd_Common","start","s") end if%>">
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","lanip_str")%></TD>
	<TD nowrap>
	<input type="text" name="rsv_ip1" id="rsv_ipaddress1" maxLength="3" size="3" autocomplete="off" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" disabled>.
	<input type="text" name="rsv_ip2" id="rsv_ipaddress2" maxLength="3" size="3" autocomplete="off" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" disabled>.
	<input type="text" name="rsv_ip3" id="rsv_ipaddress3" maxLength="3" size="3" autocomplete="off" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" disabled>.
	<input type="text" name="rsv_ip4" id="rsv_ipaddress4" maxLength="3" size="3" autocomplete="off" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","mac_str")%></TD>
	<TD nowrap>
	<input type="text" value="" name="rsv_mac" id="rsv_mac" maxlength="17" size="20" onKeyPress="return getkey('mac',event)" disabled>
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","device_name_str")%></TD>
	<TD nowrap>
	<input type="text" name="dv_name" id="device_name" maxLength="20" size="16" onKeyPress="return getkey('ssid', event)">
	</TD>
</TR>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
</TABLE>
</div>
<div id="waiting_bar" style="display:none">
<div  align="center"><BR><BR><TR><TD align="center"><B><%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%></B></TD></TR><BR><BR></div>
<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" alt="waiting" /></div>
</div>
<%tcWebApi_multilingual("2","_lan_help.asp")%>
</FORM>
</BODY>
</HTML>
