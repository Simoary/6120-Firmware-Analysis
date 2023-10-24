<%
If Request_Form("adminFlag") = "1" Then
	TCWebApi_set("Account_Entry0","web_passwd","temp_pwd_new")
	TCWebApi_set("Account_Entry0","console_passwd","temp_pwd_new")
	TCWebApi_set("Account_Entry0","temp_passwd","temp_pwd_old")
	TCWebApi_set("Account_Entry0","blank_password","blank_password")
	
	tcWebApi_commit("Account_Entry0")
End If
If Request_Form("Passwd_changed") = "0" Then
	TCWebApi_set("Account_Entry0","changed","const_changed")
	tcWebApi_save()
End if
%>
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/passwd.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST"  action="/cgi-bin/PWD_password.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="passwd">

<input type="hidden" name="hidden_enable_recovery">
<input type="hidden" name="Passwd_changed" value="<%If tcWebApi_get("Account_Entry0","changed","h") <>"N/A" then tcWebApi_get("Account_Entry0","changed","s") end if%>">
<INPUT TYPE="HIDDEN" NAME="adminFlag" VALUE="0">
<INPUT TYPE="HIDDEN" NAME="const_changed" VALUE="1">

<INPUT TYPE="HIDDEN" NAME="blank_password" VALUE="0">
<INPUT TYPE="HIDDEN" NAME="temp_pwd_old" >
<INPUT TYPE="HIDDEN" NAME="temp_pwd_new" >


<script>
var rec_time="";
var gui_region="English";
var invalid_old_passwd_str="<%tcWebApi_multilingual("1","invalid_old_passwd_str")%>";
var invalid_passwd_str="<%tcWebApi_multilingual("1","invalid_passwd_str")%>";
var invalid_passwd_len_str="<%tcWebApi_multilingual("1","invalid_passwd_len_str")%>";
var invalid_passwd_confirmed_str="<%tcWebApi_multilingual("1","invalid_passwd_confirmed_str")%>";
var empty_passwd_str="<%tcWebApi_multilingual("1","empty_passwd_str")%>";
if( rec_time != "" )
{
	ec_time=change_cur_time(rec_time,gui_region);
}
function loadvalue()
{
	if(document.forms[0].Passwd_changed.value =="0")
	{
		alert(invalid_old_passwd_str);
		document.forms[0].action="/cgi-bin/PWD_password.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
		document.forms[0].submit();
	}	
}

function checkpasswd(cf)
{
	var timeout_flag=0;
	var passwd_flag=0;


	/*if(cf.sysLoginTimeOut.value != "")
	{
		timeout_flag=1;
	}*/
	if(cf.sysOldPasswd.value!="" || cf.sysNewPasswd.value!="" || cf.sysConfirmPasswd.value!="")
	{
		passwd_flag=1;
	}
	if(passwd_flag==1)
	{
		if(!parent.aye_regex_COMMONSTRING.exec(cf.sysNewPasswd.value))
		{
			//alert(invalid_passwd_str);
			//return false;
		}
		
		if (cf.sysNewPasswd.value.length == 33 || cf.sysConfirmPasswd.value.length == 33)
		{
			alert(invalid_passwd_len_str);
			return false;
		}
		if(cf.sysNewPasswd.value != cf.sysConfirmPasswd.value)
		{ 
			alert(invalid_passwd_confirmed_str);
			return false;	
		}
		//if(cf.sysOldPasswd.value != "" && cf.sysNewPasswd.value == "")
		//{
		//	alert(empty_passwd_str);
		//	return false;
		//}
		<%
		if tcWebApi_get("Account_Entry0","blank_password","h") = "1" then
			asp_Write("if(0){")
		else
			asp_Write("if(1){")
		end if
		%>
			if(cf.sysOldPasswd.value == "")
			{
				alert(invalid_old_passwd_str);
				return false;
			}
			cf.temp_pwd_old.value = cf.sysOldPasswd.value;
		}
		//blank password
		<%
		if tcWebApi_get("Account_Entry0","blank_password","h") = "1" then
			asp_Write("if(1){")
		else
			asp_Write("if(0){")
		end if
		%>
			if(cf.sysOldPasswd.value != "")
			{
				alert(invalid_old_passwd_str);
				return false;
			}
			//cf.sysOldPasswd.value = "anonymous";
			cf.temp_pwd_old.value = "anonymous";
		}
		
		if(cf.sysNewPasswd.value == "")
		{
			//cf.sysNewPasswd.value = "anonymous";
			//cf.sysConfirmPasswd.value = "anonymous";
			cf.temp_pwd_new.value = "anonymous";
			cf.blank_password.value = "1";
		}
		else
		{
			cf.temp_pwd_new.value = cf.sysNewPasswd.value;
			cf.blank_password.value = "0";
		}
		document.forms[0].adminFlag.value=1;
	}
    document.forms[0].submit();
	return true;
}
</script>
<div class="page_title"><%tcWebApi_multilingual("1","passwd_title_str")%></div>
<div class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
			<input class="cancel_bt" type="button" name="Cancel" id="cancel" value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick=location.href="PWD_password.asp";;>&nbsp;&nbsp;
			<input class="apply_bt" type="submit" name="Apply" id="apply" value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick="return checkpasswd(document.forms[0])">
        </TD>
</TR>
</TABLE>

</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>


<TR>
	<TD nowrap><%tcWebApi_multilingual("1","old_passwd_str")%></TD>
	<TD nowrap >
<!--	<input type="password" size="20" maxlength="32" name="sysOldPasswd" value="" onKeyPress="return getkey('ssid', event)"> -->
	<input type="password" size="20" maxlength="32" name="sysOldPasswd" id="sys_old_passwd" value="" >
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","new_passwd_str")%></TD>
	<TD nowrap >
<!--	<input type="password" maxLength="32" size="20" name="sysNewPasswd" onFocus="this.select();" onKeyPress="return getkey('ssid', event)"> -->
	<input type="password" maxLength="32" size="20" name="sysNewPasswd" id="sys_new_passwd" onFocus="this.select();" >
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","repeat_passwd_str")%></TD>
	<TD nowrap >
<!--	<input type="password" maxLength="32" size="20" name="sysConfirmPasswd" onFocus="this.select();" onKeyPress="return getkey('ssid', event)"> -->
	<input type="password" maxLength="32" size="20" name="sysConfirmPasswd" onFocus="this.select();"  align=right>
	</TD>
</TR>

<!-- <TR>
	<TD nowrap><%tcWebApi_multilingual("1","timeout_part1_str")%>
	<input type="text" name="sysLoginTimeOut" size="3" maxlength="3" value="<%if TCWebAPI_get("Account_Entry0", "expire_time", "h") <> "N/A" then TCWebAPI_staticGet("Account_Entry0", "expire_time", "s") end if%>" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	<%tcWebApi_multilingual("1","timeout_part2_str")%>.</TD>
</TR> -->


<!--
<TR>
	<TD nowrap colspan=2>
	<input type="checkbox" name="enable_recovery" onClick="change_password_recovery()" > Enable Password Recovery
	</TD>
</TR>
<TR id="q1">
	<TD nowrap align="right">Security Question #1*:</TD>
	<TD nowrap align="left">
	<select  name="question1" size=1 >
		<option value="0" selected>Select a question</option>
		<option value="1">What was the name of the first NETGEAR product you purchased?</option>
		<option value="2">What was the name of the first school you attended?</option>
                <option value="3">What is your oldest sister's first name?</option>
                <option value="4">What is your oldest brother's first name?</option>
                <option value="5">In what city were you born?</option>
                <option value="6">What is your grandmother's first name?</option>
                <option value="7">What is your grandfather's first name?</option>
                <option value="8">In what year (YYYY) did you graduate from high school?</option>
                <option value="9">What is the name of your first employer?</option>
	</select>
	</TD>
</TR>
<TR id="a1">
	<TD nowrap align="right">Answer*:</TD>
	<TD nowrap  align="left">
	<input type="text" maxLength="64" size="30" name="answer1" onFocus="this.select();" >
	</TD>
</TR>
<TR id="q2">
	<TD nowrap align="right">Security Question #2*:</TD>
	<TD nowrap align="left">
	<select  name="question2" size=1>
		<option value="0" selected>Select a question</option>
                <option value="1">What is your youngest sister's first name?</option>
                <option value="2">What is your youngest brother's first name?</option>
                <option value="3">What is your father's middle name?</option>
                <option value="4">What is your mother's middle name?</option>
                <option value="5">What was the first name of your first manager?</option>
                <option value="6">In what city was your mother born?</option>
                <option value="7">In what city was your father born?</option>
                <option value="8">What is your best friend's first name?</option>
	</select>
	</TD>
</TR>
<TR id="a2">
	<TD nowrap align="right">Answer*:</TD>
	<TD nowrap  align="left">
	<input type="text" maxLength="64" size="30" name="answer2" onFocus="this.select();" >
	</TD>
</TR>
<TR id="req">
        <TD nowrap align="right">*=required information</TD>
        <TD nowrap  align="left">
        </TD>
</TR>
<TR id="time">
        <TD nowrap colspan=2>
        Last time password was recovered: <b><script>document.write(rec_time)</script></b>
        </TD>
</TR>
	-->
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</TABLE>
</div>
<%tcWebApi_multilingual("2","_passwd_help.asp")%>
</FORM>
</BODY>
<!--
<script>
function loadvalue()
{
	cf = document.forms[0];

	enable_rec="";
	ques1="";
	answ1="";
	ques2="";
	answ2="";

	if( enable_rec == "1" )
		cf.enable_recovery.checked=true;
		
	else
		cf.enable_recovery.checked=false;

	change_password_recovery();

	cf.question1.value=ques1;
	cf.answer1.value=answ1;
	cf.question2.value=ques2;
	cf.answer2.value=answ2;	
}

function change_password_recovery()
{
	cf = document.forms[0];
        if( cf.enable_recovery.checked == true )
        {
                document.getElementById("q1").style.display="";
                document.getElementById("a1").style.display="";
                document.getElementById("q2").style.display="";
                document.getElementById("a2").style.display="";
		document.getElementById("req").style.display="";
                document.getElementById("time").style.display="";

        }
        else
        {
                document.getElementById("q1").style.display="none";
                document.getElementById("a1").style.display="none";
                document.getElementById("q2").style.display="none";
                document.getElementById("a2").style.display="none";
		document.getElementById("req").style.display="none";
                document.getElementById("time").style.display="none";

        }

}

</script>
-->
</HTML>
