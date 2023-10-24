
<script>
function loadvalue()
{
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
	
	var lanip = ('<%If tcWebApi_get("Lan_Entry","IP","h") <> "N/A" then tcWebApi_get("Lan_Entry","IP","s") end if%>') ;
	var addr_array = new Array();
	addr_array = lanip.split('.');
	document.forms[0].rsv_ip1.value = addr_array[0];
	document.forms[0].rsv_ip2.value = addr_array[1];
	document.forms[0].rsv_ip3.value = addr_array[2];
	
}
var invalid_rsv_ip_str = "<%tcWebApi_multilingual("1","invalid_rsv_ip_str")%>";
var invalid_rsv_ip_duplicate_str = "<%tcWebApi_multilingual("1","invalid_rsv_ip_duplicate_str")%>";
var invalid_rsv_MAC_duplicate_str = "<%tcWebApi_multilingual("1","invalid_rsv_MAC_duplicate_str")%>";
var invalid_resevation_add_str = "<%tcWebApi_multilingual("1","invalid_resevation_add_str")%>";
var invalid_ip_str = "<%tcWebApi_multilingual("1","invalid_ip_str")%>";
var alert_invalid_mac_str="<%tcWebApi_multilingual("0","invalid_mac_str")%>";
var device_name_null_str="<%tcWebApi_multilingual("1","device_name_null_str")%>";

</script>
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/reservation.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title>
<meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue()" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/LAN_lan.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" >
<input type=hidden name=submit_flag value="reservation_add">

<div class="page_title" id="title"><%tcWebApi_multilingual("1","reservation_title_str")%></div>
<div class="fix_button" id="check_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
    <TD nowrap colspan=2 align=center>
	<input class="common_bt" type="reset" name="Refresh" id="refresh" value="<%tcWebApi_multilingual("0","glbstr_refresh")%>" onClick=location.href="reservation_add_wait.asp";>&nbsp;
	<input class="cancel_bt" type="button" name="Cancel" id="cancel" value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick=location.href="LAN_lan.asp";>&nbsp;
	<input class="apply_bt" type="submit" name="Add" id="add" value="<%tcWebApi_multilingual("0","glbstr_add")%>" onClick="return check_reservation_add(document.forms[0],document.forms[0].temp_string.value)"> 
    </TD>
</TR>
</TABLE>
</div>
<div id="main" class="main_top_button">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<input type="hidden" name="sysPoolStartingAddr" value="<%If tcWebApi_get("Dhcpd_Common","start","h") <>"N/A" then tcWebApi_get("Dhcpd_Common","start","s") end if%>">
<input type="hidden" name="PoolSize" value="<%If tcWebApi_get("Dhcpd_Common","pool_count","h") <>"N/A" then tcWebApi_get("Dhcpd_Common","pool_count","s") end if%>">
<INPUT type="HIDDEN" name="addflag" value="0">
<INPUT TYPE="HIDDEN" NAME="reservation_Flag" VALUE="0">
<INPUT TYPE="HIDDEN" NAME="IpAddr">
<INPUT TYPE="HIDDEN" NAME="lanFlag" VALUE="0">
<INPUT type="HIDDEN" name="emptyEntry" value="<%TcWebApi_get("Dhcpd","Empty_Entry","s")%>">
<input type="hidden" name="reservation_ipaddr">  
<input type="hidden" name="duplicated_reservation">
<input type="hidden" name="duplicated_num" value=0>
<INPUT type="HIDDEN" name="sumEntry">
<INPUT type="HIDDEN" name="temp_string" value= "add">

<input type="hidden" name="reserv_IP_0" value="<%If tcWebApi_get("Dhcpd_Entry0","IP","h") <>"N/A" then tcWebApi_get("Dhcpd_Entry0","IP","s") end if%>">
<input type="hidden" name="reserv_IP_1" value="<%If tcWebApi_get("Dhcpd_Entry1","IP","h") <>"N/A" then tcWebApi_get("Dhcpd_Entry1","IP","s") end if%>">
<input type="hidden" name="reserv_IP_2" value="<%If tcWebApi_get("Dhcpd_Entry2","IP","h") <>"N/A" then tcWebApi_get("Dhcpd_Entry2","IP","s") end if%>">
<input type="hidden" name="reserv_IP_3" value="<%If tcWebApi_get("Dhcpd_Entry3","IP","h") <>"N/A" then tcWebApi_get("Dhcpd_Entry3","IP","s") end if%>">
<input type="hidden" name="reserv_IP_4" value="<%If tcWebApi_get("Dhcpd_Entry4","IP","h") <>"N/A" then tcWebApi_get("Dhcpd_Entry4","IP","s") end if%>">
<input type="hidden" name="reserv_IP_5" value="<%If tcWebApi_get("Dhcpd_Entry5","IP","h") <>"N/A" then tcWebApi_get("Dhcpd_Entry5","IP","s") end if%>">
<input type="hidden" name="reserv_IP_6" value="<%If tcWebApi_get("Dhcpd_Entry6","IP","h") <>"N/A" then tcWebApi_get("Dhcpd_Entry6","IP","s") end if%>">
<input type="hidden" name="reserv_IP_7" value="<%If tcWebApi_get("Dhcpd_Entry7","IP","h") <>"N/A" then tcWebApi_get("Dhcpd_Entry7","IP","s") end if%>">

<input type="hidden" name="reserv_MAC_0" value="<%If tcWebApi_get("Dhcpd_Entry0","MAC","h") <>"N/A" then tcWebApi_get("Dhcpd_Entry0","MAC","s") end if%>">
<input type="hidden" name="reserv_MAC_1" value="<%If tcWebApi_get("Dhcpd_Entry1","MAC","h") <>"N/A" then tcWebApi_get("Dhcpd_Entry1","MAC","s") end if%>">
<input type="hidden" name="reserv_MAC_2" value="<%If tcWebApi_get("Dhcpd_Entry2","MAC","h") <>"N/A" then tcWebApi_get("Dhcpd_Entry2","MAC","s") end if%>">
<input type="hidden" name="reserv_MAC_3" value="<%If tcWebApi_get("Dhcpd_Entry3","MAC","h") <>"N/A" then tcWebApi_get("Dhcpd_Entry3","MAC","s") end if%>">
<input type="hidden" name="reserv_MAC_4" value="<%If tcWebApi_get("Dhcpd_Entry4","MAC","h") <>"N/A" then tcWebApi_get("Dhcpd_Entry4","MAC","s") end if%>">
<input type="hidden" name="reserv_MAC_5" value="<%If tcWebApi_get("Dhcpd_Entry5","MAC","h") <>"N/A" then tcWebApi_get("Dhcpd_Entry5","MAC","s") end if%>">
<input type="hidden" name="reserv_MAC_6" value="<%If tcWebApi_get("Dhcpd_Entry6","MAC","h") <>"N/A" then tcWebApi_get("Dhcpd_Entry6","MAC","s") end if%>">
<input type="hidden" name="reserv_MAC_7" value="<%If tcWebApi_get("Dhcpd_Entry7","MAC","h") <>"N/A" then tcWebApi_get("Dhcpd_Entry7","MAC","s") end if%>">
<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_lan','reserved')"><B><%tcWebApi_multilingual("1","reservation_table_str")%></B></A>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2><div align=center>
	<TABLE class=tables id="AddressReser" id="address_reser_table" border=0 cellpadding=2 cellspacing=0 width=100%>
	<TR class=table_header>
		<TD nowrap align=center>&nbsp;</TD>
		<TD nowrap align=center><span class="subhead">#</span></TD>
		<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","lanip_str")%></span></TD>
		<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","device_name_str")%></span></TD>
		<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","mac_str")%></span></TD>
	</TR>

<script>
var attach_device_list="<%tcWebApi_showFile("/var/netscan_lists")%>";
var attach_array=attach_device_list.split(' @#$&*! ');
var attach_ip_array = new Array();
var attach_mac_array = new Array();
var attach_name_array = new Array();
var p=0;

var lan_ip="<%tcWebApi_get("Lan_Entry","IP","s")%>";
var lan_subnet="<%tcWebApi_get("Lan_Entry","netmask","s")%>";
var lan_prefix = parent.aye_utils_GET_IPv4_Prefix(lan_ip,lan_subnet);


if(attach_device_list != "none")
{
        for(i=0;i<attach_array.length;i++)
        {
            var each_info=attach_array[i].split(' ');

            if(each_info.length>2)
            {
                attach_ip_array[p]=each_info[0];
                attach_mac_array[p]=each_info[1];
                if (each_info[2].length>0)
                {
                    attach_name_array[p]=each_info[2];
                }
                else
                {
                    attach_name_array[p]="----";
                }
            }
            else
            {
                attach_ip_array[p]=each_info[0];
                attach_mac_array[p]=each_info[1];
                attach_name_array[p]="----";
            }
            if(attach_ip_array[p] == "<unknown>")
            {
                attach_ip_array[p]="&lt;Unknown&gt;"
            }
            if(attach_mac_array[p] == "<unknown>")
            {
                attach_mac_array[p]="&lt;Unknown&gt;"
            }
            if(attach_name_array[p] == "<unknown>") 
            {
                attach_name_array[p]="&lt;Unknown&gt;"
            }
			p++;
        }
}
	
//var Dhcpd_Entry0_ip = "<%If tcWebApi_get("Dhcpd_Entry0","IP","h") <>"N/A" then tcWebApi_get("Dhcpd_Entry0","IP","s") end if%>"; 	

var tmp_attach_ip_array = new Array();
var tmp_attach_name_array = new Array();
var tmp_attach_mac_array = new Array();	

	for(i = 0; i < attach_array.length;i++)
	{	
		if(attach_ip_array[i].search(lan_prefix)!=-1)
		{
			tmp_attach_ip_array[i] = attach_ip_array[i];
			tmp_attach_name_array[i] = attach_name_array[i];
			tmp_attach_mac_array[i] = attach_mac_array[i];
			document.write('<tr class="odd_line">');
			document.write('<td TD nowrap align=center><input type="radio" name="MacSelect" id="mac_select" value="0" onclick="data_select('+ i +')"></td>');
			i++;
			document.write('<TD nowrap align=center><span class="subhead">' + i + '</span></TD>');
			i--;
			document.write('<TD nowrap align=center>' + attach_ip_array[i]   + '</TD>');
			document.write('<TD nowrap align=center>' + attach_name_array[i] + '</TD>');
			document.write('<TD nowrap align=center>' + attach_mac_array[i]  + '</TD></TR>');	
		}
	}
	
	
</script>	

	</TABLE>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2 align=center></TD>
</TR>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
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
	<input type="text" value="" name="rsv_mac" id="rsv_mac" maxlength="17" size="20" onKeyPress="return getkey('mac',event)">
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
