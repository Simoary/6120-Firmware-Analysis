<%
If Request_Form("Enable_value") <> "" Then
	tcWebApi_set("Radvd_Entry","Enable","Enable_value")
	tcWebApi_set("Radvd_Entry","Mode","MODE")
	tcWebApi_set("Radvd_Entry","M_Flag","mbit_value")
	tcWebApi_set("Radvd_Entry","O_Flag","obit_value")
	tcWebApi_set("Radvd_Entry","PrefixIPv6","prefix")
	tcWebApi_set("Radvd_Entry","Prefixv6Len","prefixlen")
	tcWebApi_set("Radvd_Entry","PreferredLifetime","pltime")
	tcWebApi_set("Radvd_Entry","ValidLifetime","vltime")
	tcWebApi_set("Radvd_Entry","SendAdv","send_adv_value")
	tcWebApi_set("Radvd_Entry","MaxAdv","max_adv")
	tcWebApi_set("Radvd_Entry","MinAdv","min_adv")
	tcWebApi_set("Radvd_Entry","CurHop","cur_hop")
	tcWebApi_set("Radvd_Entry","RlTime","rltime")
	tcWebApi_set("Radvd_Entry","RTime","rtime")
	tcWebApi_set("Radvd_Entry","Retrans","retrans")
	tcWebApi_set("Radvd_Entry","MTU","mtu")
	tcWebApi_set("Radvd_Entry","H_Flag","hbit_value")
	tcWebApi_set("Radvd_Entry","L_Flag","lbit_value")
	tcWebApi_set("Radvd_Entry","A_Flag","abit_value")
	tcWebApi_set("Radvd_Entry","SendAdvWan","send_adv_wan_value")
	tcWebApi_set("Radvd_Entry","MTUWan","mtu_wan")
	tcWebApi_set("Radvd_Entry","WanPrefix","WanPrefix")
	tcWebApi_commit("Radvd_Entry")
	
	tcWebApi_set("Lan_Entry","IP6","lan6_address")
	tcWebApi_set("Lan_Entry","PREFIX6","lan6_addresslen")
	tcWebApi_commit("Lan_Entry")
End If	
%>
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/aye_utils.js"></script>
<title>Radvd Settings</title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<script>
var static_WanIP = "<%if tcWebApi_get("Wan_PVC","IPADDR6","h") <> "N/A" then tcWebApi_get("Wan_PVC","IPADDR6","s") end if%>";
var static_WanIPLen = "<%if tcWebApi_get("Wan_PVC","PREFIX6","h") <> "N/A" then tcWebApi_get("Wan_PVC","PREFIX6","s") end if%>";
var radvd_wan_prefix = aye_utils_Get_IPv6_Prefix(static_WanIP,parseInt(static_WanIPLen)) + "/" + static_WanIPLen;

function checkradvd(cf)
{
	if(static_WanIP!="")
	{
		cf.WanPrefix.value = radvd_wan_prefix;
	}	

	//Check box handle
	if(cf.Enable.checked)
		cf.Enable_value.value = "1";
	else	
		cf.Enable_value.value = "0";
		
	if(cf.send_adv.checked)
		cf.send_adv_value.value = "on";
	else	
		cf.send_adv_value.value = "off";	
		
	if(cf.mbit.checked)
		cf.mbit_value.value = "on";
	else	
		cf.mbit_value.value = "off";

	if(cf.obit.checked)
		cf.obit_value.value = "on";
	else	
		cf.obit_value.value = "off";

	if(cf.hbit.checked)
		cf.hbit_value.value = "on";
	else	
		cf.hbit_value.value = "off";

	if(cf.lbit.checked)
		cf.lbit_value.value = "on";
	else	
		cf.lbit_value.value = "off";

	if(cf.abit.checked)
		cf.abit_value.value = "on";
	else	
		cf.abit_value.value = "off";

	if(cf.send_adv_wan.checked)
		cf.send_adv_wan_value.value = "on";
	else	
		cf.send_adv_wan_value.value = "off";	
}

function radvd_enable()
{

}
</script>
<body bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/radvd_setting.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=MODE value="1">
<input type=hidden name=Enable_value value="">
<INPUT type=hidden name=send_adv_value value="">
<INPUT type=hidden name=mbit_value value="">
<INPUT type=hidden name=obit_value value="">
<INPUT type=hidden name=hbit_value value="">
<INPUT type=hidden name=lbit_value value="">
<INPUT type=hidden name=abit_value value="">
<INPUT type=hidden name=send_adv_wan_value value="">
<INPUT type=hidden name=WanPrefix value="">

<div class="page_title">Radvd Setting</div>
<div class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap align=center>
        <input class="cancel_bt" type='button' name='Cancel' value='Cancel' onClick='location.href="radvd_setting.asp";'>
		<input class="apply_bt" type="submit" name="Apply" value="Apply" onClick="return checkradvd(document.forms[0]);">
        </TD>
</TR>
</TABLE>
</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<TR>
	<TD nowrap colspan=2>
	<input type="checkbox" name="Enable"  onClick='return radvd_enable()' <%if tcWebApi_get("Radvd_Entry","Enable","h") = "1" then asp_write("checked") end if%>>
	<B>Turn Radvd On</B>
	</TD>
</TR>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
<TR><TD colspan=2><B>[ LAN Interface Setting ]</B></TD></TR>
<TR>
	<TD nowrap><B>Send Advertise:</B></TD>
	<TD nowrap><input type="checkbox" name="send_adv" <%if tcWebApi_get("Radvd_Entry","SendAdv","h") = "on" then asp_write("checked") end if%>></TD>
</TR>
<TR>
	<TD nowrap><B>Max Advertise Interval:</B></TD>
	<TD nowrap><input type="text" name="max_adv" size="8" maxlength="8" value="<%if tcWebApi_get("Radvd_Entry","MaxAdv","h") <> "N/A" then tcWebApi_get("Radvd_Entry","MaxAdv","s") end if%>"></TD>
</TR>
<TR>
	<TD nowrap><B>Min Advertise Interval:</B></TD>
	<TD nowrap><input type="text" name="min_adv" size="8" maxlength="8" value="<%if tcWebApi_get("Radvd_Entry","MinAdv","h") <> "N/A" then tcWebApi_get("Radvd_Entry","MinAdv","s") end if%>"></TD>
</TR>
<TR>
	<TD nowrap><B>Current Hop Limit:</B></TD>
	<TD nowrap><input type="text" name="cur_hop" size="8" maxlength="8" value="<%if tcWebApi_get("Radvd_Entry","CurHop","h") <> "N/A" then tcWebApi_get("Radvd_Entry","CurHop","s") end if%>"></TD>
</TR>
<TR>
	<TD nowrap><B>Router Life Time(rltime):</B></TD>
	<TD nowrap><input type="text" name="rltime" size="8" maxlength="8" value="<%if tcWebApi_get("Radvd_Entry","RlTime","h") <> "N/A" then tcWebApi_get("Radvd_Entry","RlTime","s") end if%>"></TD>
</TR>
<TR>
	<TD nowrap><B>Reachable Time(rtime):</B></TD>
	<TD nowrap><input type="text" name="rtime" size="8" maxlength="8" value="<%if tcWebApi_get("Radvd_Entry","RTime","h") <> "N/A" then tcWebApi_get("Radvd_Entry","RTime","s") end if%>"></TD>
</TR>
<TR>
	<TD nowrap><B>Retrans Time(retrans):</B></TD>
	<TD nowrap><input type="text" name="retrans" size="8" maxlength="8" value="<%if tcWebApi_get("Radvd_Entry","Retrans","h") <> "N/A" then tcWebApi_get("Radvd_Entry","Retrans","s") end if%>"></TD>
</TR>
<TR>
	<TD nowrap><B>Link MTU:</B></TD>
	<TD nowrap><input type="text" name="mtu" size="8" maxlength="8" value="<%if tcWebApi_get("Radvd_Entry","MTU","h") <> "N/A" then tcWebApi_get("Radvd_Entry","MTU","s") end if%>"></TD>
</TR>
<TR>
	<TD nowrap><B>Interface M bit:</B></TD>
	<TD nowrap><input type="checkbox" name="mbit" <%if tcWebApi_get("Radvd_Entry","M_Flag","h") = "on" then asp_write("checked") end if%>></TD>
</TR>
<TR>
	<TD nowrap><B>Interface O bit:</B></TD>
	<TD nowrap><input type="checkbox" name="obit" <%if tcWebApi_get("Radvd_Entry","O_Flag","h") = "on" then asp_write("checked") end if%>></TD>
</TR>
<TR>
	<TD nowrap><B>Interface H bit:</B></TD>
	<TD nowrap><input type="checkbox" name="hbit" <%if tcWebApi_get("Radvd_Entry","H_Flag","h") = "on" then asp_write("checked") end if%>></TD>
</TR>
<TR>
	<TD nowrap><B>Prefix:</B></TD>
	<TD nowrap><input type="text" name="prefix" size="8" maxlength="32" value="<%if tcWebApi_get("Radvd_Entry","PrefixIPv6","h") <> "N/A" then tcWebApi_get("Radvd_Entry","PrefixIPv6","s") end if%>"> / <input type="text" name="prefixlen" size="1" value="<%if tcWebApi_get("Radvd_Entry","Prefixv6Len","h") <> "N/A" then tcWebApi_get("Radvd_Entry","Prefixv6Len","s") end if%>"></TD>
</TR>
<TR>
	<TD nowrap><B>Prefix Valid Life Time(vltime):</B></TD>
	<TD nowrap><input type="text" name="vltime" size="8" maxlength="8" value="<%if tcWebApi_get("Radvd_Entry","ValidLifetime","h") <> "N/A" then tcWebApi_get("Radvd_Entry","ValidLifetime","s") end if%>"></TD>
</TR>
<TR>
	<TD nowrap><B>Prefix Preferred Life Time(pltime):</B></TD>
	<TD nowrap><input type="text" name="pltime" size="8" maxlength="8" value="<%if tcWebApi_get("Radvd_Entry","PreferredLifetime","h") <> "N/A" then tcWebApi_get("Radvd_Entry","PreferredLifetime","s") end if%>"></TD>
</TR>
<TR>
	<TD nowrap><B>Prefix L bit(On-link flag):</B></TD>
	<TD nowrap><input type="checkbox" name="lbit" <%if tcWebApi_get("Radvd_Entry","L_Flag","h") = "on" then asp_write("checked") end if%>></TD>
</TR>
<TR>
	<TD nowrap><B>Prefix A bit(Autonomous addr-conf flag):</B></TD>
	<TD nowrap><input type="checkbox" name="abit" <%if tcWebApi_get("Radvd_Entry","A_Flag","h") = "on" then asp_write("checked") end if%>></TD>
</TR>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
<TR><TD colspan=2><B>[ WAN Interface Setting ]</B></TD></TR>
<TR>
	<TD nowrap><B>Send Advertise on Wan interface:</B></TD>
	<TD nowrap><input type="checkbox" name="send_adv_wan" <%if tcWebApi_get("Radvd_Entry","SendAdvWan","h") = "on" then asp_write("checked") end if%>></TD>
</TR>
<TR>
	<TD nowrap><B>Max Advertise Interval:</B></TD>
	<TD nowrap><input type="text" name="max_adv_wan" size="8" maxlength="8" value="600" disabled></TD>
</TR>
<TR>
	<TD nowrap><B>Min Advertise Interval:</B></TD>
	<TD nowrap><input type="text" name="mix_adv_wan" size="8" maxlength="8" value="198" disabled></TD>
</TR>
<TR>
	<TD nowrap><B>Link MTU:</B></TD>
	<TD nowrap><input type="text" name="mtu_wan" size="8" maxlength="8" value="<%if tcWebApi_get("Radvd_Entry","MTUWan","h") <> "N/A" then tcWebApi_get("Radvd_Entry","MTUWan","s") end if%>"></TD>
</TR>
<TR>
	<TD nowrap><B>Prefix:</B></TD>
	<TD nowrap><script>document.write(radvd_wan_prefix);</script></TD>
</TR>
<TR>
	<TD nowrap><B>Prefix Valid Life Time(vltime):</B></TD>
	<TD nowrap><input type="text" name="vltime_wan" size="8" maxlength="8" value="2592000" disabled></TD>
</TR>
<TR>
	<TD nowrap><B>Prefix Preferred Life Time(pltime):</B></TD>
	<TD nowrap><input type="text" name="pltime_wan" size="8" maxlength="8" value="604800" disabled></TD>
</TR>
<TR>
	<TD nowrap><B>Prefix L bit(On-link flag):</B></TD>
	<TD nowrap><input type="checkbox" name="lbit_wan" checked disabled></TD>
</TR>
<TR>
	<TD nowrap><B>Prefix A bit(Autonomous addr-conf flag):</B></TD>
	<TD nowrap><input type="checkbox" name="abit_wan" checked disabled></TD>
</TR>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
<TR>
	<TD nowrap><B>LAN Interface Address(prefix length is required):</B></TD>
	<TD nowrap><input type="text" name="lan6_address" value="<%if tcWebApi_get("Lan_Entry","IP6","h") <> "N/A" then tcWebApi_get("Lan_Entry","IP6","s") end if%>" size="16" maxlength="64"> / <input type="text" name="lan6_addresslen" value="<%if tcWebApi_get("Lan_Entry","PREFIX6","h") <> "N/A" then tcWebApi_get("Lan_Entry","PREFIX6","s") end if%>" size="1" maxlength="64"></TD>
</TR>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
</TABLE>
</div>
</div>	
</form>
</BODY>
</HTML>
