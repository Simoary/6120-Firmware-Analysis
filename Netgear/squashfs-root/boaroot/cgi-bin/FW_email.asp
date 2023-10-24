<%
if request_Form("submit_flag") <> "" then
	tcWebApi_set("Email_Entry","Active","Active")
	if request_Form("Active") = "Yes" then
		tcWebApi_set("Email_Entry","MailServer","email_smtp_hid")
		tcWebApi_set("Email_Entry","SendTo","email_addr_hid")
		tcWebApi_set("Email_Entry","Auth","Auth")
		tcWebApi_set("Email_Entry","Username","auth_user_hid")
		tcWebApi_set("Email_Entry","Password","auth_pwd_hid")
		tcWebApi_set("Email_Entry","SmtpPort","SmtpPort_hid")
		tcWebApi_set("Email_Entry","AlertBlocksite","send_alert_immediately")
		tcWebApi_set("Email_Entry","SSL","SSL")
		tcWebApi_set("Email_Entry","Schedule_Type","cfAlert_Select")
		tcWebApi_set("Email_Entry","Schedule_Day","cfAlert_Day")
		tcWebApi_set("Email_Entry","Schedule_Time","schedule_hour")
		tcWebApi_set("Email_Entry","Domain_Name_Check","Domain_Name_Check_hid")
	end if
	tcWebApi_commit("Email_Entry")
end if	
%>
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/email.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/FW_email.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="email">

<div class="page_title"><%tcWebApi_multilingual("1","email_str")%></div>
<div class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
		<input class="cancel_bt" name="Cancel" type="submit" value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" id="cancel" onClick="location.reload();return false;">&nbsp;&nbsp;
        <input class="apply_bt" name="Apply" type="submit" value="<%tcWebApi_multilingual("0","glbstr_apply")%>" id="apply" onClick="return check_email(document.forms[0])">
		</TD>
</TR>
</TABLE>
</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>


<script>
var error_invalid_email_str="<%tcWebApi_multilingual("1","error_invalid_email_str")%>";
var invalid_username_str="<%tcWebApi_multilingual("1","invalid_username_str")%>";
var username_cannot_be_blank_str="<%tcWebApi_multilingual("1","username_cannot_be_blank_str")%>";
var invalid_password_str="<%tcWebApi_multilingual("1","invalid_password_str")%>";
var password_cannot_be_blank_str="<%tcWebApi_multilingual("1","password_cannot_be_blank_str")%>";
var error_invalid_smtp_server_address_str="<%tcWebApi_multilingual("1","error_invalid_smtp_server_address_str")%>";
var error_invalid_email_address_str="<%tcWebApi_multilingual("1","error_invalid_email_address_str")%>";
var selectnum='<%if tcWebApi_get("UrlFilterd_Entry","BlockMode","h") <> "N/A" then tcWebApi_get("UrlFilterd_Entry","BlockMode","s") end if%>';
if (selectnum=="perschedule" || selectnum=="always")
	block_sites_flag = 1;
else	
	block_sites_flag = 0;
var email_enable = "<%if tcWebApi_get("Email_Entry","Active","h") = "Yes" then asp_write("1") else asp_write("0") end if%>";
var auth_enable = "<%if tcWebApi_get("Email_Entry","Auth","h") = "LOGIN" then asp_write("1") else asp_write("0") end if%>";
var alert_block_enable = "<%if tcWebApi_get("Email_Entry","AlertBlocksite","h") = "1" then asp_write("1") else asp_write("0") end if%>";
var ssl_enable= "<%if tcWebApi_get("Email_Entry","SSL","h") = "1" then asp_write("1") else asp_write("0") end if%>";

var schedule_type="<%if tcWebApi_get("Email_Entry","Schedule_Type","h") <> "N/A" then tcWebApi_get("Email_Entry","Schedule_Type","s") else asp_write("0") end if%>";
var schedule_day="<%if tcWebApi_get("Email_Entry","Schedule_Day","h") <> "N/A" then tcWebApi_get("Email_Entry","Schedule_Day","s") else asp_write("0") end if%>";
var schedule_time="<%if tcWebApi_get("Email_Entry","Schedule_Time","h") <> "N/A" then tcWebApi_get("Email_Entry","Schedule_Time","s") else asp_write("0") end if%>";

var error_email_addr="<%tcWebApi_multilingual("1","error_invalid_email_str")%>";
var user_name_error="<%tcWebApi_multilingual("1","invalid_username_str")%>";
var user_name_null="<%tcWebApi_multilingual("1","username_cannot_be_blank_str")%>";
var password_error="<%tcWebApi_multilingual("1","invalid_password_str")%>";
var password_null="<%tcWebApi_multilingual("1","password_cannot_be_blank_str")%>";

var auth_user_display_split="";
var auth_user_display = "<%if tcWebApi_get("Email_Entry","Username","h") <> "N/A" then tcWebApi_get("Email_Entry","Username","s") end if%>";
var Domain_Name_Check_Flag = "<%if tcWebApi_get("Email_Entry","Domain_Name_Check","h") <> "N/A" then tcWebApi_get("Email_Entry","Domain_Name_Check","s") end if%>";
auth_user_display_split = auth_user_display.split('@');

function loadvalue()
{
	var cf=document.forms[0];

	if(email_enable == '1')
		cf.email_notify.checked =true;
	else
		cf.email_notify.checked =false;	
	if(auth_enable == "1")
		cf.smtp_auth.checked = true;
	else
		cf.smtp_auth.checked =false;
	if(alert_block_enable == 1)
		cf.block_site.checked = true;
	else
		cf.block_site.checked =false;
	
	if(ssl_enable == 1)
		cf.enable_ssl.checked = true;
	else
		cf.enable_ssl.checked =false;
		
	time=parseInt(schedule_time);
	if(time > 11)
	{
		time = time-12;
		cf.cfAlert_am[1].checked = true;
	}
	else
		cf.cfAlert_am[0].checked =true;
	cf.cfAlert_Select.selectedIndex=parseInt(schedule_type);
	cf.cfAlert_Day.selectedIndex=parseInt(schedule_day);
	cf.cfAlert_Hour.selectedIndex=time;
	OnAlertChange(cf);
	setAuth(cf);
	setGray(cf,0);
	
	if(block_sites_flag == 1)
	{
		document.getElementById("block_site_checkbox").style.display = "";
		document.getElementById("block_site_email_visit").style.display = "";
	}
	else
	{
		document.getElementById("block_site_checkbox").style.display = "none";
		document.getElementById("block_site_email_visit").style.display = "none";
	}
	
	if(Domain_Name_Check_Flag == "1")
		cf.auth_user.value = auth_user_display;
	else
		cf.auth_user.value = auth_user_display_split[0];
}
</script>
<input type="hidden" name="email_notify_enabled">
<input type="hidden" name="send_alert_immediately">
<input type="hidden" name="schedule_hour">
<input type="hidden" name="email_endis_auth">
<input type="hidden" name="email_addr_hid">
<input type="hidden" name="email_smtp_hid">
<input type="hidden" name="auth_user_hid">
<input type="hidden" name="auth_pwd_hid">
<input type="hidden" name="cfAlert_Select_hid">
<input type="hidden" name="cfAlert_Day_hid">
<input type="hidden" name="Active">
<input type="hidden" name="Auth">
<input type="hidden" name="SmtpPort_hid">
<input type="hidden" name="SSL">
<input type="hidden" name="Domain_Name_Check_hid">
<TR>
	<TD nowrap>
	<input type="checkbox" name="email_notify" id="email_notify" value="1" onclick="setGray(document.forms[0],1);">
	<A tabindex=-1 href="javascript:loadhelp('_FW_email','receive')"><B><%tcWebApi_multilingual("1","turn_email_notification_on_str")%></B></A>
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_FW_email','receive')"><B><%tcWebApi_multilingual("1","send_alerts_logs_str")%></B></A>
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","send_to_this_email_address_str")%>:</TD>
	<TD nowrap align=right>
	<input class="email_addr" type="text" name="email_addr" id="email_addr" value="<%if tcWebApi_get("Email_Entry","SendTo","h") <> "N/A" then tcWebApi_get("Email_Entry","SendTo","s") end if%>" size="24" maxlength="50" onKeyPress="return getkey('ssid', event)">
	</TD>
</TR>	
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","your_outgoing_mail_str")%>:</TD>
	<TD nowrap align=right>
	<input class="email_smtp" type="text" name="email_smtp" id="email_smtp" value="<%if tcWebApi_get("Email_Entry","MailServer","h") <> "N/A" then tcWebApi_get("Email_Entry","MailServer","s") end if%>" size="24" maxlength="50" onKeyPress="return getkey('ssid', event)">
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","outgoing_mail_server_port_str")%>:</TD>
	<TD nowrap align=right>
	<input class="SmtpPort" type="text" name="SmtpPort" id="SmtpPort" value="<%if tcWebApi_get("Email_Entry","SmtpPort","h") <> "N/A" then tcWebApi_get("Email_Entry","SmtpPort","s") end if%>" size="24" maxlength="50" onKeyPress="return getkey('ssid', event)">
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type=checkbox name="enable_ssl" id="enable_ssl" value=1 onclick="setAuth(document.forms[0]);"><A tabindex=-1 href="javascript:loadhelp('_FW_email','receive')"><B><%tcWebApi_multilingual("1","secure_connection_ssl_str")%></B>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type=checkbox name="smtp_auth" id="smtp_auth" value=1 onclick="setAuth(document.forms[0]);"><A tabindex=-1 href="javascript:loadhelp('_FW_email','receive')"><B><%tcWebApi_multilingual("1","my_mail_server_requires_auth_str")%></B>
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","username_str")%></TD>
	<TD nowrap align=right>
	<input class="auth_user" type="text" name="auth_user" id="auth_user" size="24" maxlength="50" onKeyPress="return getkey('ssid', event)">
	</TD>
</TR>
<TR>	
	<TD nowrap><%tcWebApi_multilingual("1","password_str")%></TD>
	<TD nowrap align=right>
	<input class="auth_pwd" type="password" name="auth_pwd" id="auth_pwd" value="<%if tcWebApi_get("Email_Entry","Password","h") <> "N/A" then tcWebApi_get("Email_Entry","Password","s") end if%>" size="24" maxlength="50" onKeyPress="return getkey('ssid', event)">
	</TD>
</TR>
<script>
if(block_sites_flag == 1)
	document.write('<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>');
</script>
<TR id="block_site_checkbox">
	<TD nowrap colspan=2>
	<input type="checkbox" name="block_site" id="alert_blocksite" value="1">
	<A tabindex=-1 href="javascript:loadhelp('_FW_email','alert')"><B><%tcWebApi_multilingual("1","send_alert_immediately_str")%></B></A>
	</TD>
</TR>	
<TR id="block_site_email_visit">
	<TD nowrap colspan=2><%tcWebApi_multilingual("1","when_someone_attemps_to_str")%></TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_FW_email','schedule')"><B><%tcWebApi_multilingual("1","send_logs_according_this_schedule_str")%></B></A>
	</TD>
</TR>	
<TR>
	<TD nowrap colspan=2>
	<select name="cfAlert_Select" id="alert_schedule_type" size="1"onChange="OnAlertChange(document.forms[0]);" disabled>
		<option value=0 selected><%tcWebApi_multilingual("1","when_log_is_full_str")%></option>
		<option value=1 ><%tcWebApi_multilingual("1","hourly_str")%></option>
		<option value=2 ><%tcWebApi_multilingual("1","daily_str")%></option>
		<option value=3 ><%tcWebApi_multilingual("1","weekly_str")%></option>
		<option value=4 ><%tcWebApi_multilingual("1","none_str")%></option>
	</select>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2><%tcWebApi_multilingual("1","day_str")%> &nbsp;
	<select name="cfAlert_Day" id="alert_day" size="1" tabindex="8" onFocus="if (AlertTimeDisabled) this.blur()" disabled>
		<option value=0 selected><%tcWebApi_multilingual("1","sunday_str")%></option>
		<option value=1 ><%tcWebApi_multilingual("1","monday_str")%></option>
		<option value=2 ><%tcWebApi_multilingual("1","tuesday_str")%></option>
		<option value=3 ><%tcWebApi_multilingual("1","wednesday_str")%></option>
		<option value=4 ><%tcWebApi_multilingual("1","thursday_str")%></option>
		<option value=5 ><%tcWebApi_multilingual("1","friday_str")%></option>
		<option value=6 ><%tcWebApi_multilingual("1","saturday_str")%></option>
	</select>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2><%tcWebApi_multilingual("1","time_str")%>
	<select name="cfAlert_Hour" id="alert_hour" size="1" tabindex="9" onFocus="if (AlertHourDisabled) this.blur()" disabled>
		<option value=0 selected>0:00</option>
		<option value=1>1:00</option>
		<option value=2>2:00</option>
		<option value=3>3:00</option>
		<option value=4>4:00</option>
		<option value=5>5:00</option>
		<option value=6>6:00</option>
		<option value=7>7:00</option>
		<option value=8>8:00</option>
		<option value=9>9:00</option>
		<option value=10>10:00</option>
		<option value=11>11:00</option>
	</select>
	<input type="radio" checked name="cfAlert_am" id="alert_am" value="am" disabled>a.m.
	<input type="radio" name="cfAlert_am" id="alert_am" value="pm" disabled>p.m.
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</TABLE>
</div>
<%tcWebApi_multilingual("2","_FW_email_help.asp")%>
</FORM>
</BODY>
</HTML>
