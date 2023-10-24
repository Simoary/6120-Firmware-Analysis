
<html><head><title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/ping6_traceroute6_hidden_info.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="ping6">



<script>
function ping6_start()
{
	var cf=document.forms[0];
	cf.ping6_text.value=cf.ping6_addr.value;
	cf.submit();
}
function traceroute6_start()
{
	var cf=document.forms[0];
	cf.submit_flag.value="traceroute6";
	cf.traceroute6_text.value=cf.traceroute6_addr.value;
	cf.submit();
}
</script>
<input type="hidden" name="ping6_text">
<input type="hidden" name="traceroute6_text">
<table align=center>
<tr><td>ping6 to <img src=/spacer.gif width=20 height=12 border=0></td>
<td><input type="text" id="ping6_addr" value=""></td>
<td><input type="button" value="start" onclick="ping6_start()">
&nbsp;&nbsp;<input type="button" value='Refresh' onClick="location.reload();return false;"></td>
</tr>
<tr><td colspan=3>
<textarea ROWS="10" cols="90" readonly></textarea>
</td></tr> 
<tr><td>traceroute6 to <img src=/spacer.gif width=20 height=12 border=0></td>
<td><input type="text" id="traceroute6_addr" value=""></td>
<td><input type="button" value="start" onclick="traceroute6_start()">
&nbsp;&nbsp;<input type="button" value='Refresh' onClick="location.reload();return false;">
</td></tr>
<tr><td colspan=3>
<textarea ROWS="10" cols="90" readonly></textarea>
</td></tr>
</table>
</body>
</html>