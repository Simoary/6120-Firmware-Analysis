<html>
<head>
<title><%tcWebApi_multilingual("0","glbstr_netgear_router")%> <%tcWebApi_get("SkuId_Entry","ProductName","s")%></title>
<META HTTP-EQUIV="Refresh" CONTENT="2">
<META name="description" content="D3600">
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<META http-equiv="Content-Style-Type" content="text/css">
<META http-equiv="Pragma" content="no-cache">
<META HTTP-equiv="Cache-Control" content="no-cache">
<script language=JavaScript type="text/javascript">
function changepage()
{
	var cf = document.forms[0];
	if (cf.testOK.value == "true")
		window.setTimeout("window.location.replace('http://www.netgear.com/success/generic.aspx')",2000);
	else
		window.setTimeout("window.location.replace('BAS_wtest_d.asp')",2500);        
}
</script>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" text=black onLoad="changepage()">
<form method="post">
<div align="center">
<br>
<table border="0" cellpadding="0" cellspacing="3" width="100%">
<tr>
	<td colspan="2" align="center"><b><%tcWebApi_multilingual("1","testing_internet_connection_str")%></b></td>
</tr>

<tr> <!-- RULE -->
 <TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD>
</tr>



<tr>
<td colspan="2" align="left">
 <%tcWebApi_multilingual("1","this_page_will_auto_display_str")%>
 </td></tr>

 <tr> <!-- RULE -->
 <TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD>
</tr>

 
 <tr>
 <td colspan="2" align="center"><BR>
 <input type=button name="close" value=Close Window onclick="self.close()"></td>
</tr>
</table>
 
</div>

<input type="hidden" name="testOK" value="<%if tcWebApi_staticGet("WanInfo_Entry","Active","h") = "1" then asp_write("true") else asp_write("false") end if%>">

</form>

</body>
</html>