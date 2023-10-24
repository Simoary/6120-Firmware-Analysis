<%
If Request_Form("rebootFlag") = "1"  Then 
	'TCWebApi_set("System_Entry","reboot_type","rebootFlag")
    'tcWebApi_CommitWithoutSave("System_Entry")
	TCWebApi_set("AyeSystem_Entry","Type","rebootFlag")
    tcWebApi_CommitWithoutSave("AyeSystem_Entry")
End if
%>
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/aye_utils.js"></script>
<title><%tcWebApi_multilingual("1","glbstr_title")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body bgcolor="#ffffff" onLoad="aye_utils_updateProgress(159,0,'index.asp',0)"> <!--aye_utils_updateProgress(delay time,char count start,back to page,forms[index])-->
<script type="text/javascript">

</script>
<form>
<table border="0" cellpadding="0" cellspacing="3" width="100%">
<tr>
	<td nowrap align=left class="waiting"><%tcWebApi_multilingual("0","glbstr_reboot_now_str")%></td>
</tr>
<tr>
	<td nowrap align=center><input type="text" name="progress" class="reboot1bar" value=""></td>
</tr>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
</table>
</form>
</body>
</html>
