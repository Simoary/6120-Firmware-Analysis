
<html><head><link rel="stylesheet" href="/style/form.css">
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/hidden_channel_wifi_coexist.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="wifi_channel_coexist">


<script>
var wl_disablecoext="1";
var wl_wifi_restart_tag="";
function loadvalue()
{
	var form=document.forms[0];
	if(wl_disablecoext == 0)
		form.wifi_coexist[0].checked = true;
	else
		form.wifi_coexist[1].checked = true;
	if(wl_wifi_restart_tag == 1)
		form.wifi_rest.checked = true;
	else
		form.wifi_rest.checked = false;
}
function click_apply()
{
	var form=document.forms[0];
	if(form.wifi_coexist[0].checked == true)
		form.hidd_coexist_flag.value=0;
	else
		form.hidd_coexist_flag.value=1;
	if(form.wifi_rest.checked == true)
		form.hidd_wifi_restart_flag.value=1;
	else
		form.hidd_wifi_restart_flag.value=0;
	
	form.submit();
}
</script>
<input type="hidden" name="hidd_coexist_flag">
<input type="hidden" name="hidd_wifi_restart_flag">
<table>
<tr><td>Enable WiFi channel coexist function:</td></tr>
<tr>
<td><input type=radio name="wifi_coexist" value="0">Enable</td>
</tr>
<tr>
<td><input type=radio name="wifi_coexist" value="1">Disable</td>
</tr>
<tr>
<td><input type=checkbox name="wifi_rest">With WiFi Restart</td>
</tr>
<tr>
<td><input type='button' name="Apply" value='Apply' onClick='click_apply()'></td>
</tr>
</table>
</form>
</body>
</html>

