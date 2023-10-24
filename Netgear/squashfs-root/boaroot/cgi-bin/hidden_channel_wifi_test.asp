
<html><head><link rel="stylesheet" href="/style/form.css">
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/hidden_channel_wifi_test.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="wifi_ntgr_hidden_channel">


<script>
var hidden_channel_flag="1";
var wl_get_channel="1000";
function loadvalue()
{
	var form=document.forms[0];
	if( hidden_channel_flag == 1 )
		form.wifi_chan[0].checked = true;
	else if( hidden_channel_flag == 2 )
		form.wifi_chan[1].checked = true;
	else
		form.wifi_chan[2].checked = true;
}
function click_apply()
{
	var form=document.forms[0];
	if(form.wifi_chan[0].checked == true)
	{
		form.hidd_chan.value=1;
		if(wl_get_channel == 0)
			form.hidd_simple_mod.value=6;
		else
		{
			if(wl_get_channel > 6)
				form.hidd_simple_mod.value=5;
			else
				form.hidd_simple_mod.value=3;
		}
	}
	else if(form.wifi_chan[1].checked == true)
	{
		form.hidd_chan.value=2;
		if(wl_get_channel == 0)
			form.hidd_simple_mod.value=6;
		else
		{
			if(wl_get_channel > 7)
				form.hidd_simple_mod.value=5;
			else
				form.hidd_simple_mod.value=3;
		}
	}
	else
	{
		form.hidd_chan.value=3;
		if(wl_get_channel == 0)
			form.hidd_simple_mod.value=6;
		else
		{
			if(wl_get_channel > 4)
				form.hidd_simple_mod.value=5;
			else
				form.hidd_simple_mod.value=3;
		}
	}
	form.submit();
}
</script>
<input type="hidden" name="hidd_chan">
<input type="hidden" name="hidd_simple_mod">
<table>
<tr><td>Secondary Channel Option</td></tr>
<tr>
<td><input type=radio name="wifi_chan" value="1">Default mode </td>
</tr>
<tr>
<td><input type=radio name="wifi_chan" value="2">Plus mode </td>
</tr>
<tr>
<td><input type=radio name="wifi_chan" value="3">Minus mode</td>
</tr>
<tr>
<td align=center><input type='button' name="Apply" value='Apply' onClick='click_apply()'>&nbsp;<input type='button' name="Cancel" value='Cancel' onClick='location.href="hidden_channel_wifi_test.asp";'>
</tr>
</table>
</form>
</body>
</html>
