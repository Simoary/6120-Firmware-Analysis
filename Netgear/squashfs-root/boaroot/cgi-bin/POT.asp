
<html><head><link rel="stylesheet" href="/style/form.css">
<title><%tcWebApi_multilingual("0","glbstr_netgear_router")%> <%tcWebApi_get("SkuId_Entry","ProductName","s")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>


<script>
//var pot_ntpst = "10:07:42, Mar 15st, 2011";
//var pot_stamac = "00-00-00-00-00-00";
var pot_value  = "<%tcWebApi_get("Pot_Entry","Pot_Value","s")%>";  // set POT_Value,Pot_Time,Pot_Mac value and get Pot_Value
var pot_ntpst  = "<%tcWebApi_get("Pot_Entry","Pot_Time","s")%>";   // get Pot_Time for GMT Time
var pot_stamac = "<%tcWebApi_get("Pot_Entry","Pot_Mac","s")%>";    // get Pot_Mac
</script>

<BODY bgcolor=#FFFFFF>

<table border="0">
<TR>
	<TD nowrap><B>POT : </B></TD>
	<TD nowrap> &nbsp;<script>document.write(pot_value)</script> &nbsp;min</TD>
</TR>
<tr>
	<td nowrap><B><script>document.write("NTP synchronized date/time: ")</script></B></td>
	<td nowrap><script>document.write(pot_ntpst)</script></td>
</tr>
<tr>
	<td nowrap><B><script>document.write("MAC address of 1st STA connected: ")</script></B></td>
	<td nowrap><script>document.write(pot_stamac)</script></td>
</tr>
</table>
</BODY>
</HTML>
