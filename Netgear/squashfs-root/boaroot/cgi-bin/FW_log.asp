<%
	if request_Form("submit_flag") = "logs_send" then
		tcWebApi_set("Email_Entry","SendLogManually","SENDLOG")
		tcWebApi_commit("Email_Entry")
	elseif request_Form("submit_flag") = "logs_clear" then
		tcWebApi_set("Syslog_Entry","LogClear","CLEARLOG")
		tcWebApi_commit("Syslog_Entry")
	elseif request_Form("submit_flag") = "logs_apply" then
		tcWebApi_set("Syslog_Entry","Log_allow","hidden_log_site")
		tcWebApi_set("Syslog_Entry","Log_block","hidden_log_block")
		tcWebApi_set("Syslog_Entry","Log_connect_web","hidden_log_conn")
		tcWebApi_set("Syslog_Entry","Log_router_operation","hidden_log_router")
		tcWebApi_set("Syslog_Entry","Log_dosport","hidden_log_dosport")
		tcWebApi_set("Syslog_Entry","Log_portforward","hidden_log_port")
		tcWebApi_set("Syslog_Entry","Log_wireless","hidden_log_wire")
		tcWebApi_set("Syslog_Entry","Log_connect_reset","hidden_log_conn_reset")
		tcWebApi_set("Syslog_Entry","Log_wireless_schedule","hidden_log_wire_sched")
		tcWebApi_commit("Syslog_Entry")
	end if
%>

<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/logs.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/FW_log.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="logs">
<input type=hidden name=SENDLOG value="1">
<input type=hidden name=CLEARLOG value="1">

<div class="page_title">Logs</div>
<div class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
        <input class="common_bt" type="button" name="Refresh" id="action_refresh" value="<%tcWebApi_multilingual("0","glbstr_refresh")%>" onClick=location.href="FW_log.asp">&nbsp;&nbsp;
        <input class="common_bt" type="submit" name="Clear Log" id="action_clear" value="<%tcWebApi_multilingual("1","clear_log_str")%>" onclick="return check_logs_clear(document.forms[0])">&nbsp;&nbsp;
        <input class="common_bt" type="submit" name="Send Log" id="action_send" value="<%tcWebApi_multilingual("1","send_log_str")%>" onclick="return check_logs_send(document.forms[0])">&nbsp;&nbsp;
	<input class="apply_bt" type="submit" name="Apply" id="apply" value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick="return check_log_apply(document.forms[0])">
        </TD>
</TR>
</TABLE>

</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>
 

<script language="javascript">
var email_get_notify = "<%if tcWebApi_get("Email_Entry","Active","h") = "Yes" then asp_write("1") else asp_write("0") end if%>";
var log_get_site = "<%if tcWebApi_get("Syslog_Entry","Log_allow","h") <> "N/A" then tcWebApi_get("Syslog_Entry","Log_allow","s") end if%>";
var log_get_block = "<%if tcWebApi_get("Syslog_Entry","Log_block","h") <> "N/A" then tcWebApi_get("Syslog_Entry","Log_block","s") end if%>";
var log_get_conn = "<%if tcWebApi_get("Syslog_Entry","Log_connect_web","h") <> "N/A" then tcWebApi_get("Syslog_Entry","Log_connect_web","s") end if%>";
var log_get_router = "<%if tcWebApi_get("Syslog_Entry","Log_router_operation","h") <> "N/A" then tcWebApi_get("Syslog_Entry","Log_router_operation","s") end if%>";
var log_get_dosport = "<%if tcWebApi_get("Syslog_Entry","Log_dosport","h") <> "N/A" then tcWebApi_get("Syslog_Entry","Log_dosport","s") end if%>";
var log_get_port = "<%if tcWebApi_get("Syslog_Entry","Log_portforward","h") <> "N/A" then tcWebApi_get("Syslog_Entry","Log_portforward","s") end if%>";
var log_get_wire = "<%if tcWebApi_get("Syslog_Entry","Log_wireless","h") <> "N/A" then tcWebApi_get("Syslog_Entry","Log_wireless","s") end if%>";
//bug 24992:add two checkbox
var log_get_conn_reset = "<%if tcWebApi_get("Syslog_Entry","Log_connect_reset","h") <> "N/A" then tcWebApi_get("Syslog_Entry","Log_connect_reset","s") end if%>";
var log_get_wire_sched= "<%if tcWebApi_get("Syslog_Entry","Log_wireless_schedule","h") <> "N/A" then tcWebApi_get("Syslog_Entry","Log_wireless_schedule","s") end if%>";
var cur_time="<%tcWebApi_get("DeviceInfo","cur_time","s")%>";
var gui_region="English";
var sunday_str="<%tcWebApi_multilingual("1","sunday_str")%>";
var monday_str="<%tcWebApi_multilingual("1","monday_str")%>";
var tuesday_str="<%tcWebApi_multilingual("1","tuesday_str")%>";
var wednesday_str="<%tcWebApi_multilingual("1","wednesday_str")%>";
var thursday_str="<%tcWebApi_multilingual("1","thursday_str")%>";
var friday_str="<%tcWebApi_multilingual("1","friday_str")%>";
var saturday_str="<%tcWebApi_multilingual("1","saturday_str")%>";
cur_time=change_cur_time(cur_time,gui_region);

var ts="<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
var logs_checkbox_flag = parent.logs_checkbox_flag;

function checkbox_show()
{
	if(logs_checkbox_flag == 1)
	{
		document.getElementById("logs_1").style.display="";
		document.getElementById("logs_2").style.display="";
		document.getElementById("logs_3").style.display="";
		document.getElementById("logs_4").style.display="";
		document.getElementById("logs_5").style.display="";
		document.getElementById("logs_6").style.display="";
		document.getElementById("logs_7").style.display="";
		document.getElementById("logs_8").style.display="none";
		document.getElementById("logs_9").style.display="none";
		document.getElementById("logs_10").style.display="";
	}
	else
	{
		document.getElementById("logs_1").style.display="none";
		document.getElementById("logs_2").style.display="none";
		document.getElementById("logs_3").style.display="none";
		document.getElementById("logs_4").style.display="none";
		document.getElementById("logs_5").style.display="none";
		document.getElementById("logs_6").style.display="none";
		document.getElementById("logs_7").style.display="none";
		document.getElementById("logs_8").style.display="none";
		document.getElementById("logs_9").style.display="none";
		document.getElementById("logs_10").style.display="none";
	}
}

function loadvalue()
{
	var form=document.forms[0];
	
	checkbox_show();
	
	if(log_get_site=='1')
		form.log_site[0].checked = true;
	else
		form.log_site[0].checked = false;
	if(log_get_block=='1')
		form.log_block.checked = true;
	else
		form.log_block.checked = false;
	if(log_get_conn=='1')
		form.log_conn.checked = true;
	else
		form.log_conn.checked = false;
	if(log_get_router=='1')
		form.log_router.checked = true;
	else
		form.log_router.checked = false;
	if(log_get_dosport=='1')
		form.log_dosport.checked = true;
	else
		form.log_dosport.checked = false;
	if(log_get_port=='1')
		form.log_port.checked = true;
	else
		form.log_port.checked = false;
	if(log_get_wire=='1')
		form.log_wlan.checked = true;
	else
		form.log_wlan.checked = false;
	if(log_get_conn_reset=='1')
		form.log_conn_reset.checked = true;
	else
		form.log_conn_reset.checked = false;
	if(log_get_wire_sched=='1')
		form.log_wire_sched.checked = true;
	else
		form.log_wire_sched.checked = false;
}
</script>
<input type="hidden" name="hidden_log_site">
<input type="hidden" name="hidden_log_block">
<input type="hidden" name="hidden_log_conn">
<input type="hidden" name="hidden_log_router">
<input type="hidden" name="hidden_log_dosport">
<input type="hidden" name="hidden_log_port">
<input type="hidden" name="hidden_log_wire">
<input type="hidden" name="hidden_log_conn_reset">
<input type="hidden" name="hidden_log_wire_sched">
<TR>
	<TD name="current_time" id="current_time" nowrap colspan=2 align=center><B><%tcWebApi_multilingual("1","current_time_str")%>: <script>document.write(cur_time)</script></B></TD>
</TR>
<TR>
	<TD nowrap colspan=2 align=center height=450>
	<!--<textarea NAME="log_detail" id="log_detail" ROWS="20" cols="60" WRAP="vitural" readonly>
</textarea>-->
    <iframe src="/cgi-bin/status_log2.cgi" allowtransparency="true" height="100%" width="100%" frameborder="0"></iframe>	
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR id=logs_1>
	<TD nowrap colspan=2>
	<input type="checkbox" name="log_site" id="alog_site" value="1"><%tcWebApi_multilingual("1","access_allow_str")%>	
	</TD>
</TR>
<TR id=logs_2>
	<TD nowrap colspan=2>
	<input type="checkbox" name="log_block" id="log_site" value="1"><%tcWebApi_multilingual("1","access_block_str")%>	
	</TD>
</TR>
<TR id=logs_3>
	<TD nowrap colspan=2>
	<input type="checkbox" name="log_conn" id="log_conn" value="1"><%tcWebApi_multilingual("1","connect_router_str")%>		
	</TD>
</TR>
<TR id=logs_4>
	<TD nowrap colspan=2>
	<input type="checkbox" name="log_router" id="log_router" value="1"><%tcWebApi_multilingual("1","router_operation_str")%>	
	</TD>
</TR>
<TR id=logs_5>
	<TD nowrap colspan=2>
	<input type="checkbox" name="log_dosport" id="log_dosport" value="1"><%tcWebApi_multilingual("1","dos_attack_str")%>	
	</TD>
</TR>
<TR id=logs_6>
	<TD nowrap colspan=2>
	<input type="checkbox" name="log_port" id="log_fwd" value="1"><%tcWebApi_multilingual("1","port_forward_str")%>
	</TD>
</TR>
<TR id=logs_7>
	<TD nowrap colspan=2>
	<input type="checkbox" name="log_wlan" id="log_wlan" value="1"><%tcWebApi_multilingual("1","wireless_access_str")%>	
	</TD>
</TR>
<TR id=logs_8>
	<TD nowrap colspan=2>
	<input type="checkbox" name="log_conn_reset" value="1"><%tcWebApi_multilingual("1","auto_internet_str")%>	
	</TD>
</TR>
<TR id=logs_9>
	<TD nowrap colspan=2>
	<input type="checkbox" name="log_wire_sched" value="1"><%tcWebApi_multilingual("1","turn_off_wirelss_str")%>	
	</TD>
</TR>
<TR id=logs_10>
	<TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD>
</TR>
</TABLE>
</div>
<%tcWebApi_multilingual("2","_CF_log_help.asp")%>
</form>
</body>
</html>
