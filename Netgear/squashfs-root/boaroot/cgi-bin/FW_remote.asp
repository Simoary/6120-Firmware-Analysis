<%
If Request_Form("remote_flag") = "1" Then
	TCWebApi_set("RemoteManager_Entry","Activate","http_rmenable")
	TCWebApi_set("RemoteManager_Entry","Type","remote_type")
	TCWebApi_set("RemoteManager_Entry","Port","http_rmport")
	TCWebApi_set("RemoteManager_Entry","RMwanIP","rmwan_ip")
	If Request_Form("remote_type") = "0" Then
		TCWebApi_set("RemoteManager_Entry","Start_ip","local_ip")
	elseif Request_Form("remote_type") = "1" Then
		TCWebApi_set("RemoteManager_Entry","Start_ip","start_ip")
		TCWebApi_set("RemoteManager_Entry","End_ip","end_ip")
	End If
	
	tcWebApi_commit("RemoteManager_Entry")
	tcWebApi_save()
End If
%>
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/remote.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title>
<meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/FW_remote.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="remote">

<div class="page_title" id="title"><%tcWebApi_multilingual("1","remote_manager_title_str")%></div>
<div class="fix_button" id="check_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
	<input class="cancel_bt" type='button' name='Cancel' id="cancle" value='<%tcWebApi_multilingual("0","glbstr_cancel")%>' onClick='location.href="FW_remote.asp";'>&nbsp;&nbsp;
        <input class="apply_bt" type='submit' name='Apply' id="apply" value='<%tcWebApi_multilingual("0","glbstr_apply")%>' onClick='return check_remote();'>
        </TD>
</TR>
</TABLE>
</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>


<script>
var forward_array_num=0;

var trigger_array_num=0;

var upnp_array_num=0;


var is_ftp = 1;

var show_enableHTTP="0";
var show_enableHvia="1";
var show_HTTP_via_port="80";
var show_enableFTP="1";
var show_enableFvia="1";
var show_FTP_via_port="21";

var endis_ntp="1";
var endis_upnp="1";
var lan_ip="<%If tcWebApi_get("Lan_Entry","IP","h") <> "N/A" then tcWebApi_get("Lan_Entry","IP","s") end if%>";
var lan_subnet="<%If tcWebApi_get("Lan_Entry","netmask","h") <> "N/A" then tcWebApi_get("Lan_Entry","netmask","s") end if%>";
var wan_ip="172.17.144.126";
var wan_subnet="255.255.254.0";
var wan_ether_wan_assign = "0";
if( wan_ether_wan_assign != '0' )
{
	var wan_ip="0.0.0.0";
	var wan_subnet="0.0.0.0";
}
var info_get_wanproto="dhcp";
var endis_remote='<%if TCWebAPI_get("RemoteManager_Entry", "Activate", "h") <> "N/A" then TCWebAPI_staticGet("RemoteManager_Entry", "Activate", "s") else asp_Write("No") end if %>';
var remote_access='<%if TCWebAPI_get("RemoteManager_Entry", "Type", "h") <> "N/A" then TCWebAPI_staticGet("RemoteManager_Entry", "Type", "s") else asp_Write("2") end if %>';
var remote_iplist="<%if TCWebAPI_get("RemoteManager_Entry", "Start_ip", "h") <> "N/A" then TCWebAPI_staticGet("RemoteManager_Entry", "Start_ip", "s") end if %>";
var remote_endip="<%if TCWebAPI_get("RemoteManager_Entry", "End_ip", "h") <> "N/A" then TCWebAPI_staticGet("RemoteManager_Entry", "End_ip", "s") end if %>";

var remote_port="<%if TCWebAPI_get("RemoteManager_Entry", "Port", "h") <> "N/A" then TCWebAPI_staticGet("RemoteManager_Entry", "Port", "s") else asp_Write("8443") end if %>";
var remote_manage_ip="<%if TCWebAPI_get("WanInfo_Entry", "IP", "h") <> "N/A" then TCWebAPI_staticGet("WanInfo_Entry", "IP", "s") else asp_Write("0.0.0.0") end if %>";

var usb_router_flag=parent.usb_router_flag;
function loadvalue()
{
	var cf = document.forms[0];
	if(endis_remote == 'Yes')
		cf.remote_mg_enable.checked= true;
	else
		cf.remote_mg_enable.checked =false;
	if(remote_access == '0')
	{
		cf.rm_access[0].checked = true;
		if(remote_iplist != "")
			var ipaddr = remote_iplist; 
		var ip_array=ipaddr.split('.');
		cf.local_ip_1.disabled = false;
		cf.local_ip_2.disabled = false;
		cf.local_ip_3.disabled = false;
		cf.local_ip_4.disabled = false;
		cf.local_ip_1.value=ip_array[0];
		cf.local_ip_2.value=ip_array[1];
		cf.local_ip_3.value=ip_array[2];
		cf.local_ip_4.value=ip_array[3];
		clearData2();
	}
	else if(remote_access == '2')
	{
		cf.rm_access[2].checked = true;
		clearData1();
	}
	else
	{
		cf.rm_access[1].checked = true;
		if(remote_iplist != "")
			var ipaddr = remote_iplist;
		//var ip_array=ipaddr.split('-');
		var start_array=ipaddr.split('.');
		var end_array=remote_endip.split('.');
		cf.start_ip_1.value = start_array[0];
		cf.start_ip_2.value = start_array[1];
		cf.start_ip_3.value = start_array[2];
		cf.start_ip_4.value = start_array[3];
		cf.fin_ip_1.value = end_array[0];
		cf.fin_ip_2.value = end_array[1];
		cf.fin_ip_3.value = end_array[2];
		cf.fin_ip_4.value = end_array[3];
		clearData3();
	}
}
var invalid_remote_ip_conflict_wan_str="<%tcWebApi_multilingual("1","warning_str")%> , <%tcWebApi_multilingual("1","invalid_remote_ip_conflict_wan_str")%>";
var invalid_remote_ip_str="<%tcWebApi_multilingual("1","invalid_remote_ip_str")%>";
var invalid_remote_ip_conflict_lan_str="<%tcWebApi_multilingual("1","invalid_remote_ip_conflict_lan_str")%>";
var invalid_remote_ip_range_str="<%tcWebApi_multilingual("1","invalid_remote_ip_range_str")%>";
var invalid_remote_port_str="<%tcWebApi_multilingual("1","invalid_remote_port_str")%>";
</script>
<input type="hidden" name="http_rmenable">
<input type="hidden" name="remote_flag" value="0">
<input type="hidden" name="remote_type" >
<input type="hidden" name="start_ip" >
<input type="hidden" name="end_ip" >
<input type="hidden" name="local_ip">
<input type="hidden" name="rmwan_ip">
<TR>
	<TD nowrap colspan=2>
	<input type="checkbox" name="remote_mg_enable" id="remote_mg_enable" value="0">
	<A tabindex=-1 href="javascript:loadhelp('_FW_remote','turnon')"><B><%tcWebApi_multilingual("1","remote_manager_turn_on_str")%></B></A>
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_FW_remote','address')"><B><%tcWebApi_multilingual("1","remote_manager_address_str")%>:</B></A></TD>
	<TD name="remote_address" id="remote_address" nowrap>
	<script>
	if(remote_manage_ip != "" && remote_manage_ip != "0.0.0.0")
		document.write("https://"+remote_manage_ip+":"+remote_port);
	else
		document.write("http://0.0.0.0:"+remote_port);
	</script>
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_FW_remote','access')"><B><%tcWebApi_multilingual("1","remote_manager_access_str")%>:</B></A>
	</TD>
</TR>
<TR>
	<TD nowrap>
	<input type="radio" name="rm_access" id="rm_access" value="ip_single" onClick="clearData2();"><%tcWebApi_multilingual("1","remote_manager_access_type1_str")%>:</TD>
	<TD nowrap align=right>	
	<input type="text" name="local_ip_1" id="local_ip_1" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="local_ip_2" id="local_ip_2" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="local_ip_3" id="local_ip_3" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="local_ip_4" id="local_ip_4" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD>
</TR>
<TR>
	<TD nowrap>
	<input type="radio" name="rm_access" id="rm_access" value="ip_range" onClick="clearData3();"><%tcWebApi_multilingual("1","remote_manager_access_type2_str")%>:</TD>
	<TD nowrap align="right"><%tcWebApi_multilingual("1","from_str")%>
	<input type="text" size="3" autocomplete="off" maxlength="3" name="start_ip_1" id="start_ip_1" value="" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" size="3" autocomplete="off" maxlength="3" name="start_ip_2" id="start_ip_2" value="" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" size="3" autocomplete="off" maxlength="3" name="start_ip_3" id="start_ip_3" value="" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" size="3" autocomplete="off" maxlength="3" name="start_ip_4" id="start_ip_4" value="" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD>
</TR>
<TR>
	<TD nowrap> &nbsp;</TD>
	<TD nowrap align="right"><%tcWebApi_multilingual("1","to_str")%>
	<input type="text" size="3" autocomplete="off" maxlength="3" name="fin_ip_1" id="fin_ip_1" value="" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" size="3" autocomplete="off" maxlength="3" name="fin_ip_2" id="fin_ip_2" value="" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" size="3" autocomplete="off" maxlength="3" name="fin_ip_3" id="fin_ip_3" value="" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" size="3" autocomplete="off" maxlength="3" name="fin_ip_4" id="fin_ip_4" value="" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="rm_access" id="rm_access" value="all" onClick="clearData1()"><%tcWebApi_multilingual("1","remote_manager_access_type3_str")%></TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_FW_remote','port')"><B><%tcWebApi_multilingual("1","remote_manager_port_str")%>:</B></A>
	</TD>
	<TD nowrap>
	<input type="text" class="num" name="http_rmport" id="http_rmport" size="6" maxlength="5" onKeyPress="return getkey('num',event)" value="<%if TCWebAPI_get("RemoteManager_Entry", "Port", "h") <> "N/A" then TCWebAPI_staticGet("RemoteManager_Entry", "Port", "s") else asp_Write("8443") end if %>" >
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</TABLE>
</div>
<div id="waiting_bar" style="display:none">
<div  align="center"><BR><BR><TR><TD align="center"><B><%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%></B></TD></TR><BR><BR></div>
<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" alt="waiting" /></div>
</div>
<%tcWebApi_multilingual("2","_FW_remote_help.asp")%>
</FORM>
</BODY>
</HTML>
