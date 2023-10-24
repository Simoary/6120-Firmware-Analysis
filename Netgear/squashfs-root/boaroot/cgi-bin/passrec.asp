<%
if request_Form("submit_flag") <> "" then
	tcWebApi_set("Pwdrecovery_Entry","temp_flag","submit_flag")
end if
%>


<HTML><HEAD>
<title>Router Password Recovery</title>
<META http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<LINK rel="stylesheet" href="/style/form.css">
<!--<script language=javascript type=text/javascript src="/funcs.js"></script> -->

<STYLE type="text/css">
TR{ FONT-FAMILY: Arial;}
}
</STYLE>
</HEAD>

<BODY >
<FORM method="POST"  action="/cgi-bin/passwordrecovered.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<script>
var router_password_recovery_str="<%tcWebApi_multilingual("1","router_password_recovery_str")%>";
var recovered_succes_str="<%tcWebApi_multilingual("1","recovered_succes_str")%>";
var router_admin_username_str="<%tcWebApi_multilingual("1","router_admin_username_str")%>";
var you_can_login_str="<%tcWebApi_multilingual("1","you_can_login_str")%>";

var username="";
var web_passwd="";

var if_submit_flag="<%if tcWebApi_get("Pwdrecovery_Entry","temp_flag","h") = "result" then asp_write("1") else asp_write("0") end if %>";	
if(if_submit_flag == "1")
{	
	username="<%tcWebApi_get("Account_Entry0","username","s")%>";
	web_passwd="<%tcWebApi_get("Account_Entry0","web_passwd","s")%>";
}

</script>

<TABLE width="100%" border=0 cellpadding=0 cellspacing=3>
<TR><TD colSpan=2><H1><script>document.write(router_password_recovery_str)</script></H1></TD></TR>
<TR><TD colSpan=2></TD></TR>
<TR><TD colSpan=2><script>document.write(recovered_succes_str)</script></TD></TR>
<TR><TD colSpan=2>&nbsp;</TD></TR>
<TR>
	<TD nowrap align="right" style="width: 150px;"><script>document.write(router_admin_username_str)</script>:</TD>
	<TD nowrap align="left"> <script> document.write(username) </script></TD>
</TR>
<TR>
	<TD nowrap align="right" style="width: 150px;">Router Admin Password :</TD>
	<TD nowrap align="left"> <script> document.write(web_passwd) </script></TD>
</TR>
<TR><TD colSpan=2>&nbsp;</TD></TR>

<TR><TD colSpan=2><script>document.write(you_can_login_str)</script></TD></TR>
<TR><TD colSpan=2>&nbsp;</TD></TR>

<TR>
	<TD nowrap colspan=2 align=left>
		<input class="cancel_bt" type="button" name="exit" id="exit" value="<%tcWebApi_multilingual("0","glbstr_exit")%>" onclick="window.close()" />&nbsp;&nbsp;
		<input class="apply_bt" type="button" name="relogin" id="relogin" value="<%tcWebApi_multilingual("0","glbstr_relogin")%>" onClick='location.href="http://routerlogin.net";' />
	 </TD>
</TR>
</TABLE>
</FORM>
</BODY>

</HTML>

