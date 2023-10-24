
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<BODY onLoad="loadhelp('_info');loadvalue();" bgcolor=#ffffff>
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1>Router Status</h1></td></tr>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<script>
var on_mark="On"
var off_mark="Off"

var wanproto="DHCP";
var endis_wl_radio="1";
var endis_wla_radio="1";
var wds_repeater_basic="0";
var wds_repeater_basic_a="0";
var wds_endis_fun="0";
var wla_wds_endis_fun="0";
var wds_endis_ip_client="0";
var wla_wds_endis_ip_client="";
var an_router_flag = parent.an_router_flag;
var guest_router_flag=parent.guest_router_flag;
var wire_iso_flag=parent.wire_iso_flag;
var netgear_region="WW";

function loadvalue()
{
	if( guest_router_flag == 1 ){
		document.getElementById("wlanguest").style.display="";
		document.getElementById("wlanssid").style.display="";
		document.getElementById("wlanap").style.display="";
		document.getElementById("wlanbro").style.display="";
		document.getElementById("wlanallow").style.display="";
		if( wire_iso_flag == 1 ){
			document.getElementById("wlaniso").style.display="";
			document.getElementById("wliso").style.display="";
		}
	}
	else{
		document.getElementById("wlanguest").style.display="none";
		document.getElementById("wlanssid").style.display="none";
		document.getElementById("wlanap").style.display="none";
		document.getElementById("wlanbro").style.display="none";
		document.getElementById("wlanallow").style.display="none";
		document.getElementById("wlaniso").style.display="none";
		document.getElementById("wliso").style.display="none";
	}
	if( guest_router_flag == 1 && an_router_flag == 1){
		document.getElementById("wlanssid_an").style.display="";
		document.getElementById("wlanap_an").style.display="";
		document.getElementById("wlanbro_an").style.display="";
		document.getElementById("wlanallow_an").style.display="";
		if( wire_iso_flag == 1 ){
			document.getElementById("wlaniso_an").style.display="";
			document.getElementById("wliso_an").style.display="";
		}
	}
	else{
		document.getElementById("wlanssid_an").style.display="none";
		document.getElementById("wlanap_an").style.display="none";
		document.getElementById("wlanbro_an").style.display="none";
		document.getElementById("wlanallow_an").style.display="none";
		document.getElementById("wlaniso_an").style.display="none";
		document.getElementById("wliso_an").style.display="none";
	}
	if( an_router_flag == 1 ){
		document.getElementById("wlan_an").style.display="";
		document.getElementById("head_an").style.display="";
		document.getElementById("ssid_an").style.display="";
		document.getElementById("region_an").style.display="";
		document.getElementById("channel_an").style.display="";
		document.getElementById("mode_an").style.display="";
		document.getElementById("radio_an").style.display="";
		document.getElementById("broad_an").style.display="";	
		document.getElementById("title_bgn").style.display="";
		document.getElementById("wl_title_bgn").style.display="";

		/*Bug 19829, according to Spec1.9, just show the wireless repeating base station mac address.
		document.getElementById("subhead_an").style.display="";
		document.getElementById("link_an").style.display="";
		document.getElementById("strength_an").style.display="";*/
	}
	else{
		document.getElementById("wlan_an").style.display="none";
		document.getElementById("head_an").style.display="none";
		document.getElementById("ssid_an").style.display="none";
		document.getElementById("region_an").style.display="none";
		document.getElementById("channel_an").style.display="none";
		document.getElementById("mode_an").style.display="none";
		document.getElementById("radio_an").style.display="none";
		document.getElementById("broad_an").style.display="none";
		document.getElementById("title_bgn").style.display="none";
		document.getElementById("wl_title_bgn").style.display="none";
		
		/*Bug 19829, according to Spec1.9, just show the wireless repeating base station mac address.
		document.getElementById("subhead_an").style.display="none";
		document.getElementById("link_an").style.display="none";
		document.getElementById("strength_an").style.display="none";*/
	}

}
</script>
<TR>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','hard_ver')"><B>Hardware Version</B></A></TD>
	<TD nowrap>WNDR3800</TD>
</TR>
<TR>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','firv')"><B>Firmware Version</B></A></TD>
	<TD nowrap>V1.0.0.13</TD>
</TR>
<TR>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','lang_ver')"><B>GUI Language Version</B></A></TD>
	<TD nowrap>V1.0.0.77</TD>
</TR>
  
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2><A tabindex=-1 href="javascript:loadhelp('_info','lan_port')"><span class="subhead">LAN Port</span></A></TD>
</TR>
<TR>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','lanmac')"><B>MAC Address</B></A></TD>
	<TD nowrap>C4:3D:C7:98:18:F5</TD>
</TR>
<TR>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','lanip')"><B>IP Address</B></A></TD>
	<TD nowrap>192.168.1.1</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2><A tabindex=-1 href="javascript:loadhelp('_info','wireless_port')"><span class="subhead">Wireless Port</span></A></TD>
</TR>

<TR id=title_bgn>
	<TD nowrap colspan=2><B>Wireless Settings b/g/n</B></TD>
</TR>

<TR>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','wlssid')"><script>if(an_router_flag == 1) document.write("&nbsp;&nbsp;&nbsp;&nbsp;");</script><B>Name (SSID)</B></A></TD>
	<TD nowrap>NETGEAR</TD>
</TR>
<TR>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','wlregion')"><script>if(an_router_flag == 1) document.write("&nbsp;&nbsp;&nbsp;&nbsp;");</script><B>Region</B></A></TD>
	<script>
		if(netgear_region.toUpperCase() == "NA")
			document.write('<TD nowrap>Europe</TD>');
		else
			document.write('<TD nowrap>Europe</TD>');
	</script>
</TR>
<TR>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','wlchannel')"><script>if(an_router_flag == 1) document.write("&nbsp;&nbsp;&nbsp;&nbsp;");</script><B>Channel</B></A></TD>
	<TD nowrap>Auto ( 3 )</TD>
</TR>
<TR>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','wlmode')"><script>if(an_router_flag == 1) document.write("&nbsp;&nbsp;&nbsp;&nbsp;");</script><B>Mode</B></A></TD>
	<TD nowrap>Up to 130 Mbps </TD>
</TR>
<TR>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','wlradio')"><script>if(an_router_flag == 1) document.write("&nbsp;&nbsp;&nbsp;&nbsp;");</script><B>Wireless AP</B></A></TD>
	<TD nowrap><script>
		if( endis_wl_radio == "1" )
			document.write(on_mark);
		else
			document.write(off_mark);

	</script></TD>
</TR>
<TR>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','wlbroad')"><script>if(an_router_flag == 1) document.write("&nbsp;&nbsp;&nbsp;&nbsp;");</script><B>Broadcast Name</B></A></TD>
	<TD nowrap>On</TD>
</TR>
<TR id=wliso>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','wliso')"><script>if(an_router_flag == 1) document.write("&nbsp;&nbsp;&nbsp;&nbsp;");</script><B>Wireless isolation</B></A></TD>
	<TD nowrap>Off</TD>
</TR>
<!-- wireless a/n -->
<TR id=wlan_an>
        <TD nowrap colspan=2><B>Wireless Settings a/n</B></TD>
</TR>
<TR id=ssid_an>
        <TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','wlssid')">&nbsp;&nbsp;&nbsp;&nbsp;<B>Name (SSID)</B></A></TD>
        <TD nowrap>NETGEAR-5G</TD>
</TR>
<TR id=region_an>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','wlregion')">&nbsp;&nbsp;&nbsp;&nbsp;<B>Region</B></A></TD>
	<script>
		if(netgear_region.toUpperCase() == "NA")
			document.write('<TD nowrap>Europe</TD>');
		else
			document.write('<TD nowrap>Europe</TD>');
	</script>
</TR>
<TR id=channel_an>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','wlchannel')">&nbsp;&nbsp;&nbsp;&nbsp;<B>Channel</B></A></TD>
	<script>
	document.write("<TD nowrap>44(P)+48(S)</TD>");
	</script>
</TR>
<TR id=mode_an>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','wlmode')">&nbsp;&nbsp;&nbsp;&nbsp;<B>Mode</B></A></TD>
	<script>
		document.write('<TD nowrap>Up to 300 Mbps </TD>');
	</script>
</TR>
<TR id=radio_an>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','wlradio')">&nbsp;&nbsp;&nbsp;&nbsp;<B>Wireless AP</B></A></TD>
	<TD nowrap><script>
		if( endis_wla_radio == "1" )
			document.write(on_mark);
		else
			document.write(off_mark);
	</script></TD>
</TR>
<TR id=broad_an>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','wlbroad')">&nbsp;&nbsp;&nbsp;&nbsp;<B>Broadcast Name</B></A></TD>
	<TD nowrap>On</TD>
</TR>
<TR id=wliso_an>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','wliso')">&nbsp;&nbsp;&nbsp;&nbsp;<B>Wireless isolation</B></A></TD>
	<TD nowrap>Off</TD>
</TR>
<!-- end wireless a/n -->
<script>
	if( guest_router_flag == 1 ){
		document.write('<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>');
	}
</script>
<TR id=wlanguest>
	<TD nowrap colspan=2><A tabindex=-1 href="javascript:loadhelp('_info','wl_guest')"><span class="subhead">Guest Network</span></A></TD>
</TR>
<TR id=wl_title_bgn>
	<TD nowrap colspan=2><B>Wireless Settings b/g/n</B></TD>
</TR>
<TR id=wlanssid>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','wl_ssid')"><script>if(an_router_flag == 1) document.write("&nbsp;&nbsp;&nbsp;&nbsp;");</script><B>Name (SSID)</B></A></TD>
	<TD nowrap>NETGEAR-Guest</TD>
</TR>
<TR id=wlanap>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','wl_ap')"><script>if(an_router_flag == 1) document.write("&nbsp;&nbsp;&nbsp;&nbsp;");</script><B>Wireless AP</B></A></TD>
	<script>
	if ( endis_wl_radio  == "1" )
		document.write('<TD nowrap>Off</TD>');
	else
		document.write('<TD nowrap>'+off_mark+'</TD>');
	</script>
</TR>
<TR id=wlanbro>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','wl_bro')"><script>if(an_router_flag == 1) document.write("&nbsp;&nbsp;&nbsp;&nbsp;");</script><B>Broadcast Name</B></A></TD>
	<TD nowrap>On</TD>
</TR>
<TR id=wlaniso>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','wl_guest_iso')"><script>if(an_router_flag == 1) document.write("&nbsp;&nbsp;&nbsp;&nbsp;");</script><B>Wireless isolation</B></A></TD>
	<TD nowrap>Off</TD>
</TR>
<TR id=wlanallow>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','wl_allow')"><script>if(an_router_flag == 1) document.write("&nbsp;&nbsp;&nbsp;&nbsp;");</script><B>Allow guest to access My Local Network</B></A></TD>
	<TD nowrap>Off</TD>
</TR>

<TR id=head_an>
	<TD nowrap colspan=2><B>Wireless Settings a/n</B></TD>
</TR>
<TR id=wlanssid_an>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','wl_ssid')">&nbsp;&nbsp;&nbsp;&nbsp;<B>Name (SSID)</B></A></TD>
	<TD nowrap>NETGEAR-Guest</TD>
</TR>
<TR id=wlanap_an>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','wl_ap')">&nbsp;&nbsp;&nbsp;&nbsp;<B>Wireless AP</B></A></TD>
	<script>
		if ( endis_wla_radio  == "1" )
			document.write('<TD nowrap>Off</TD>');
		else
			document.write('<TD nowrap>'+off_mark+'</TD>');
	</script>
</TR>
<TR id=wlanbro_an>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','wl_bro')">&nbsp;&nbsp;&nbsp;&nbsp;<B>Broadcast Name</B></A></TD>
	<TD nowrap>On</TD>
</TR>
<TR id=wlaniso_an>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','wl_guest_iso')">&nbsp;&nbsp;&nbsp;&nbsp;<B>Wireless isolation</B></A></TD>
	<TD nowrap>Off</TD>
</TR>
<TR id=wlanallow_an>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_info','wl_allow')">&nbsp;&nbsp;&nbsp;&nbsp;<B>Allow guest to access My Local Network</B></A></TD>
	<TD nowrap>Off</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
    <TD nowrap colspan=2><span class="subhead">Wireless Repeating</span></TD>
</TR>
<TR>
        <TD nowrap><b>Base Station MAC Address</b></TD>
        <TD nowrap>
        <script>
        var basic_mac="";

        if(wds_repeater_basic == 0 && wds_endis_fun == 1)
                basic_mac = "";
        else if(wds_repeater_basic_a == 0 && wla_wds_endis_fun == 1)
                basic_mac = "";

        document.write(basic_mac);
        </script>
        </TD>
</TR>
<!---  Bug 19829, according to Spec1.9, just show the wireless repeating base station mac address.
<script>
if(endis_wl_radio == 1 && wds_repeater_basic == 0 && wds_endis_fun == 1)
{
/*
	if( wds_endis_ip_client == 1 )
		var stalist="";
	else if(endis_wla_radio == 1)
		var stalist="";
	else if(endis_wla_radio == 0)
		var stalist="";
*/
	if( endis_wla_radio == 1 && wla_wds_endis_fun == 1 
		&& wla_wds_endis_ip_client == 0 &&  wds_endis_ip_client == 1 )
		var stalist="";
	else
		var stalist="";
}
else
	var stalist=""
var rssi, linkrate;
if ( stalist != "")
{
	macModeArray=stalist.split(" #@# "); //macModeArray[0]:mac, macModeArray[1]:link_rate, macModeArray[2]:rssi;
	macModeInfo=macModeArray[0].split(" ");
	linkrate=macModeInfo[1];
	rssi=macModeInfo[2];
}
else
{
	linkrate=0; 
	rssi=0;
}
if ( linkrate >= 1000 )
{
	linkrate=parseInt(linkrate/1000);
	linkrate=linkrate+" Mbps";
}
else if( linkrate > 0 )
	linkrate="1 Mbps";
</script>
<TR id=link>
	<TD nowrap><b>Link Rate</b></TD>
    <TD nowrap><script>document.write(linkrate)</script></TD>	
</TR>
<TR id=strength>
    <TD nowrap><b>Signal Strength</b></TD>
    <TD nowrap>
<script>

var rssi_value=parseInt(rssi);
if(rssi_value==0)
	document.write('disconnected');
else if(rssi_value>0 && rssi_value<20)
	document.write('poor');
else if(rssi_value>=20 && rssi_value<40)
	document.write('fair');
else if(rssi_value>=40 && rssi_value<75)
	document.write('good');
else if(rssi_value>=75)
	document.write('excellent');
else
	document.write('disconnected');
</script>
    </TD>
</TR>-->

<!--a/n--> 
<!--<TR id=subhead_an>
    <TD nowrap colspan=2><span class="subhead">Wireless Repeating</span></TD>
</TR>
<script>
if(endis_wla_radio == 1 && wds_repeater_basic_a == 0 && wla_wds_endis_fun == 1)
{
/* first method
	if(endis_wl_radio == 1 &&  wds_repeater_basic == 0)
		var stalist="";
	else if(endis_wl_radio == 1 &&  wds_repeater_basic == 1)
		var stalist="";
	else if(endis_wl_radio == 0)
		var stalist="";
*/
/* second method
	if(endis_wl_radio == 1){
		if(wla_wds_endis_ip_client == 1)
			var stalist="";
		else if(wds_repeater_basic == 0 && wds_endis_fun ==1)
			var stalist="";
		else
			var stalist="";
	}
	else{
		if(wla_wds_endis_ip_client == 1)
			var stalist="";
		else
			var stalist="";
	}
*/
	if(endis_wl_radio == 1 )
	{
		if(wds_repeater_basic == 0 && wds_endis_fun == 1)
			if( wds_endis_ip_client == 0 && wla_wds_endis_ip_client == 1 )
				var stalist="";
			else
				var stalist="";
		else
			if( wla_wds_endis_ip_client == 1 )
				var stalist="";
			else
				var stalist="";
	}		
	else
		var stalist="";	
}
else
	var stalist="";
var rssi, linkrate;
if ( stalist != "")
{
        macModeArray=stalist.split(" #@# "); //macModeArray[0]:mac, macModeArray[1]:link_rate, macModeArray[2]:rssi;
        macModeInfo=macModeArray[0].split(" ");
        linkrate=macModeInfo[1];
        rssi=macModeInfo[2];
}
else
{
        linkrate=0;
        rssi=0;
}
if ( linkrate >= 1000 )
{
        linkrate=parseInt(linkrate/1000);
	linkrate=linkrate+" Mbps";
}
else if( linkrate > 0 )
	linkrate="1 Mbps";
</script>
<TR id=link_an>
<TD nowrap><b>Link Rate</b></TD>
<TD nowrap><script>document.write(linkrate)</script></TD>
</TR>
<TR id=strength_an>
<TD nowrap><b>Signal Strength</b></TD>
<TD nowrap>
<script>
var rssi_value=parseInt(rssi);
if(rssi_value==0)
        document.write('disconnected');
else if(rssi_value>0 && rssi_value<20)
        document.write('poor');
else if(rssi_value>=20 && rssi_value<40)
        document.write('fair');
else if(rssi_value>=40 && rssi_value<75)
        document.write('good');
else if(rssi_value>=75)
        document.write('excellent');
else
	document.write('disconnected');
</script>
</TD>
</TR>-->
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</TABLE>
</BODY>
</HTML>

