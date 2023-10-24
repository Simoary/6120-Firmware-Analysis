<%
	'tcWebApi_set("System_Entry","reboot_type","HTML_HEADER_TYPE")
	'tcWebApi_CommitWithoutSave("System_Entry")
	TCWebApi_set("AyeSystem_Entry","Type","HTML_HEADER_TYPE")
    tcWebApi_CommitWithoutSave("AyeSystem_Entry")
%>

<HTML>
<HEAD>
<TITLE></TITLE>
<LINK rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/aye_utils.js"></script>
<META http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<script type="text/javascript">

</script>
</HEAD>
<BODY bgcolor="#ffffff" onLoad="aye_utils_updateProgress(159,0,'index.asp',0)"> <!--aye_utils_updateProgress(delay time,char count start,back to page,forms[index])-->
<FORM>
<TABLE border="0" cellpadding="0" cellspacing="3" width="100%">
<TR>
	<TD align="left"><H1><%tcWebApi_multilingual("1","update_settings_str")%></H1></TD>
	<TD nowrap>
	<input type="text" name="progress" class="reboot1bar" value="">
	</TD>
</TR>
<TR>
	<TD colspan="2"><img src="/liteblue.gif" width=100% height="12"></TD>
</TR>
</BODY>
</HTML>
