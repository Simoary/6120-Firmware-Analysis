
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/tr069.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/tr069.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="tr069">

<div class="page_title">TR-069 client - Configuration</div>
<div class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<tr>
<td nowrap colspan=2 align=center>
<input class="common_bt"  type="submit" name="kike" value="Kick (Send Inform)" onClick="return check_tr069(document.forms[0],1)"> &nbsp;
<input class="cancel_bt" type='reset' name='Cancel' value='Cancel' onClick='location.href="tr069.asp";'>&nbsp;
<input class="apply_bt" type="submit" name="Apply" value="Apply" onClick="return check_tr069(document.forms[0],0)">
</td>
</tr>
</TABLE>
</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>


<script>
var get_enable_tr069="";
var get_inform_enable="";
var get_inform_interval="";
var get_acs_url="";
var get_acs_name="";
var get_acs_password="";
var get_con_port="";
var get_con_name="";
var get_con_pass="";
/*
get_kick=( get cwmp_set_kick)

#if [ "" != "no" ]; then
#        set cwmp_set_kick="no"
#       oc  commit
#fi

*/

function loadvalue()
{
	var form=document.forms[0];
	if ( get_enable_tr069 == "1" )
		form.enable_tr069.checked = true;
	else
		form.enable_tr069.checked = false;

	if ( get_inform_enable == "1" )
		form.inform_enable[0].checked = true;
	else
		form.inform_enable[1].checked = true;

	form.interval.value=get_inform_interval;
	form.acs_url.value=get_acs_url;
	form.acs_name.value=get_acs_name;
	form.acs_password.value=get_acs_password;
	form.con_port.value=get_con_port;
	form.con_name.value=get_con_name;
	form.con_password.value=get_con_pass;
		 
}
</script>
<input type="hidden" name="hidden_enable_tr069">
<input type="hidden" name="set_kick">
<tr><td nowrap colspan=2><input type="checkbox"  name="enable_tr069" value="0"><b>Turn TR069 On </b></a></td></tr>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<tr>
    <td nowrap>Inform Enable:</td>
    <td nowrap> 
        <input type="radio" name="inform_enable" value="1" >Enable&nbsp;
        <input type="radio" name="inform_enable" value="0" >Disable
    </td>
</tr>
<tr>
	<td nowrap>Inform Interval:</td>
	<td nowrap><input type="text" name="interval" size="20" maxlength="60"></td>
</tr>
<tr>
	<td nowrap>ACS URL:</td>
	<td nowrap><input type="text" name="acs_url" size="40" maxlength="60"></td>
</tr>
<tr>
	<td nowrap>ACS User Name:</td>
	<td nowrap><input type="text" name="acs_name" size="20" maxlength="60"></td>
</tr>
<tr>
	<td nowrap>ACS Password:</td>
	<td nowrap><input type="password" name="acs_password" size="20" maxlength="60"></td>
</tr>
<tr>
<TD>&nbsp; </TD><TD>&nbsp;</TD>
</tr>
<tr>
	<td nowrap>Connection Request Port:</td>
	<td nowrap><input type="text" name="con_port" size="40" maxlength="60"></td>
</tr>
<tr>
	<td nowrap>Connection Request User Name:</td>
	<td nowrap><input type="text" name="con_name" size="20" maxlength="60"></td>
</tr>
<tr>
	<td nowrap>Connection Request Password:</td>
	<td nowrap><input type="password" name="con_password" size="20" maxlength="60"></td>
</tr>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</table>
</div>
<%tcWebApi_multilingual("2","_TR069_help.asp")%>
</FORM>
</BODY>
</HTML>
