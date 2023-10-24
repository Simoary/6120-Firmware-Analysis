<%
     if request_Form("submit_flag") = "show_statistic" then
	    tcWebApi_set("WanInfo_Entry","timeinterval","interval")
	 end if
%>
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title><%tcWebApi_multilingual("1","glbstr_title")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/RST_statistic.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="show_statistic">


<script>
var sys_uptime="<% tcWebApi_get("WanInfo_Entry","systimeup","s") %>";
var statistics_update="<% tcWebApi_get("Statistics_Entry","Statistics_Update","s") %>";
var lan_status="Link up";
var lan_txpkts="<% tcWebApi_get("Statistics_Entry","Lan_TxPkts","s") %>";
var lan_rxpkts="<% tcWebApi_get("Statistics_Entry","Lan_RxPkts","s") %>";
var lan_collisions="<% tcWebApi_get("Statistics_Entry","Lan_Collision","s") %>";
var lan_txbs="<% tcWebApi_get("Statistics_Entry","Lan_TxBs","s") %>";
var lan_rxbs="<% tcWebApi_get("Statistics_Entry","Lan_RxBs","s") %>";
var lan_systime="2590";
var wan_status="<% tcWebApi_get("Statistics_Entry","Wan_Status","s") %>";
var wan_txpkts="0";
var wan_rxpkts="0";
var wan_collisions="0";
var wan_txbs="0";
var wan_rxbs="0";
var wan_systime="<% tcWebApi_get("Statistics_Entry","Wan_Uptime","s") %>";
<%if tcWebApi_get("Wan_Common","TransMode","h") = "ATM" then%>
wan_txpkts="<% tcWebApi_get("Statistics_Entry","Adsl_TxPkts","s") %>";
wan_rxpkts="<% tcWebApi_get("Statistics_Entry","Adsl_RxPkts","s") %>";
wan_collisions="<% tcWebApi_get("Statistics_Entry","Adsl_Collision","s") %>";
wan_txbs="<% tcWebApi_get("Statistics_Entry","Adsl_TxBs","s") %>";
wan_rxbs="<% tcWebApi_get("Statistics_Entry","Adsl_RxBs","s") %>";
<%else%>
wan_txpkts="<% tcWebApi_get("Statistics_Entry","Eth_TxPkts","s") %>";
wan_rxpkts="<% tcWebApi_get("Statistics_Entry","Eth_RxPkts","s") %>";
wan_collisions="<% tcWebApi_get("Statistics_Entry","Eth_Collision","s") %>";
wan_txbs="<% tcWebApi_get("Statistics_Entry","Eth_TxBs","s") %>";
wan_rxbs="<% tcWebApi_get("Statistics_Entry","Eth_RxBs","s") %>";
<%end if%>
var bgn_status="<% tcWebApi_get("Statistics_Entry","Wlan_Status","s") %>";
var bgn_txpkts="<% tcWebApi_get("Statistics_Entry","Wlan_TxPkts","s") %>";
var bgn_rxpkts="<% tcWebApi_get("Statistics_Entry","Wlan_RxPkts","s") %>";
var bgn_collisions="<% tcWebApi_get("Statistics_Entry","Wlan_Collision","s") %>";
var bgn_txbs="<% tcWebApi_get("Statistics_Entry","Wlan_TxBs","s") %>";
var bgn_rxbs="<% tcWebApi_get("Statistics_Entry","Wlan_RxBs","s") %>";
var bgn_systime="<% tcWebApi_get("Statistics_Entry","Wlan_Uptime","s") %>";
var an_status="<% tcWebApi_get("Statistics_Entry","Wlan11ac_Status","s") %>";
var an_txpkts="<% tcWebApi_get("Statistics_Entry","Wlan11ac_TxPkts","s") %>";
var an_rxpkts="<% tcWebApi_get("Statistics_Entry","Wlan11ac_RxPkts","s") %>";
var an_collisions="<% tcWebApi_get("Statistics_Entry","Wlan11ac_Collision","s") %>";
var an_txbs="<% tcWebApi_get("Statistics_Entry","Wlan11ac_TxBs","s") %>";
var an_rxbs="<% tcWebApi_get("Statistics_Entry","Wlan11ac_RxBs","s") %>";
var an_systime="<% tcWebApi_get("Statistics_Entry","Wlan11ac_Uptime","s") %>";
var lan_status0="<% tcWebApi_get("Statistics_Entry","Lan1_Status","s") %>";
var lan0_systime = "<% tcWebApi_get("Statistics_Entry","Lan1_Uptime","s") %>";
var lan_status1="<% tcWebApi_get("Statistics_Entry","Lan2_Status","s") %>";
var lan1_systime = "<% tcWebApi_get("Statistics_Entry","Lan2_Uptime","s") %>";
var lan_status2="<% tcWebApi_get("Statistics_Entry","Lan3_Status","s") %>";
var lan2_systime = "<% tcWebApi_get("Statistics_Entry","Lan3_Uptime","s") %>";
var lan_status3="<% tcWebApi_get("Statistics_Entry","Lan4_Status","s") %>";
var lan3_systime = "<% tcWebApi_get("Statistics_Entry","Lan4_Uptime","s") %>";
var productname = "<%tcWebApi_get("SkuId_Entry","ProductName","s")%>";

var timereset="0";
<%if tcWebApi_get("WanInfo_Entry","timeinterval","h") = "N/A" then%>
timereset="5";
<%else%>
timereset="<% tcWebApi_get("WanInfo_Entry","timeinterval","s") %>";
<%end if%>

if (timereset == "")
	timereset="5";

if( timereset != "0")
	document.write('<META http-equiv="refresh" content="'+timereset+'; url=RST_statistic.asp">');

var logs_checkbox_flag = 1;
var thank_login_flag = 0;
var host_name="WNDR3800";
var usb_router_flag = 1; 
var readyShareSupportedLevel = 7; 
var an_router_flag = 1;
var wireless_schedule_flag = 1;
var guest_router_flag = 1;
var traffic_router_flag=1;
var qos_router_flag=1;
var multi_lang_router_flag=1;
var wds_router_flag=1;
var video_router_flag=1;
var transmit_router_flag=1;
var pppoe_mac_router_flag=1;
var ddns_oray_router_flag=0;
var ddns_wildcards_flag=0;
var dfs_channel_router_flag=0;
var russian_ppp_flag=0;
var russian_pppoe_flag=0;
var l2tp_flag=1;
var igmp_flag=1;
var pppoe_intranet_flag=1;
var dns_third_flag=1;
var tr069_router_flag=0;
var block_sites_flag=1;
var ipv6_flag=1;
var mode_is_300=1;
var is_vc_release=0;
var vpn_show_flag=1;
var router_type="RangeMax(TM)";
var max_bandwidth=1000;
var wire_iso_flag=1;
var bigpond_flag=0;
var apmode_flag=1;
var tivo_flag=0;
var auto_conn_flag=1;
var bridge_iptv_flag=1;
var parental_ctrl_flag=1;
var dfs_channel2_router_flag=1;
var new_multiple_lang=1;

</script>
<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap><B><%tcWebApi_multilingual("1","system_time_str")%></B>&nbsp;
<script>
var uptime=sys_uptime;
var new_time=change_sec_to_time(uptime);
document.write(new_time);
</script>
	</TD>
</TR>
<TR>
	<TD nowrap>
	<TABLE id="SystemStatus" border=1 cellpadding=2 cellspacing=0 width=100%>
	<TR> 
	<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","port_str")%></span></TD>
	<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","status_str")%></span></TD>
	<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","txpkt_str")%></span></TD>
	<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","rxpkt_str")%></span></TD>
	<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","collision_str")%></span></TD>
	<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","tx_bs_str")%></span></TD>
	<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","rx_bs_str")%></span></TD>
	<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","up_time_str")%></span></TD>
	</TR>
	<TR> 
	<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","wan_str")%></span></TD>
	<TD nowrap align=center><span class="ttext"><script>
	if (wan_status != "Link down")
		document.write(wan_status);
	else
		document.write("<%tcWebApi_multilingual("1","link_down_str")%>");
	</script></span></TD>
	<TD nowrap align=center><span class="ttext"><script>document.write(wan_txpkts)</script></span></TD>
	<TD nowrap align=center><span class="ttext"><script>document.write(wan_rxpkts)</script></span></TD>
	<TD nowrap align=center><span class="ttext"><script>document.write(wan_collisions)</script></span></TD>
	<TD nowrap align=center><span class="ttext"><script>document.write(wan_txbs)</script></span></TD>
	<TD nowrap align=center><span class="ttext"><script>document.write(wan_rxbs)</script></span></TD>
	<TD nowrap align=center><span class="ttext">
<script>
	if (wan_status != "Link down")
	{
		var uptime=wan_systime;
		var new_time=change_sec_to_time(uptime);
		document.write(new_time);
	}
	else
		document.write("00:00:00");
</script>	
	</span></TD>
	</TR>
	<TR>
	<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","lan_str")%>1</span></TD>
	<TD nowrap align=center><span class="ttext"><script>
	if (lan_status0 != "Link down")
		document.write(lan_status0);
	else
		document.write("<%tcWebApi_multilingual("1","link_down_str")%>");
	</script></span></TD>
	<TD nowrap align=center rowspan=4><span class="ttext"><script>document.write(lan_txpkts)</script></span></TD>
	<TD nowrap align=center rowspan=4><span class="ttext"><script>document.write(lan_rxpkts)</script></span></TD>
	<TD nowrap align=center rowspan=4><span class="ttext"><script>document.write(lan_collisions)</script></span></TD>
	<TD nowrap align=center rowspan=4><span class="ttext"><script>document.write(lan_txbs)</script></span></TD>
	<TD nowrap align=center rowspan=4><span class="ttext"><script>document.write(lan_rxbs)</script></span></TD>
	<TD nowrap align=center><span class="ttext">
<script>
	if (lan_status0 != "Link down")
	{
		var uptime=lan0_systime;
		var new_time=change_sec_to_time(uptime);
		document.write(new_time);
	}
	else
		document.write("00:00:00");
</script>
	</span></TD>
	</TR>
	<TR>
	<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","lan_str")%>2</span></TD>
	<TD nowrap align=center><span class="ttext"><script>
	if (lan_status1 != "Link down")
		document.write(lan_status1);
	else
		document.write("<%tcWebApi_multilingual("1","link_down_str")%>");	
	</script></span></TD>
	<TD nowrap align=center><span class="ttext">
<script>
	if (lan_status1 != "Link down")
	{
		var uptime=lan1_systime;
		var new_time=change_sec_to_time(uptime);
		document.write(new_time);
	}
	else
		document.write("00:00:00");
</script>
	</span></TD>
	</TR>
	<TR>
	<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","lan_str")%>3</span></TD>
	<TD nowrap align=center><span class="ttext"><script>
	if (lan_status2 != "Link down")
		document.write(lan_status2);
	else
		document.write("<%tcWebApi_multilingual("1","link_down_str")%>");
	</script></span></TD>
	<TD nowrap align=center><span class="ttext">
<script>
	if (lan_status2 != "Link down")
	{
		var uptime=lan2_systime;
		var new_time=change_sec_to_time(uptime);
		document.write(new_time);
	}
	else
		document.write("00:00:00");
</script>		
	</span></TD>
	</TR>
	<TR>
	<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","lan_str")%>4</span></TD>
	<TD nowrap align=center><span class="ttext"><script>
	if (lan_status3 != "Link down")
		document.write(lan_status3)
	else
		document.write("<%tcWebApi_multilingual("1","link_down_str")%>");
	</script></span></TD>
	<TD nowrap align=center><span class="ttext">
<script>
	if (lan_status3 != "Link down")
	{
		var uptime=lan3_systime;
		var new_time=change_sec_to_time(uptime);
		document.write(new_time);
	}
	else
		document.write("00:00:00");
</script>	
	</span></TD>
	</TR>
	<TR>
	<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","wlan_str")%> <script>if(an_router_flag == 1) document.write("b/g/n");</script></span></TD>
	<TD nowrap align=center><span class="ttext"><script>
	if (bgn_status != "Link down")
		document.write(bgn_status);
	else
		document.write("<%tcWebApi_multilingual("1","link_down_str")%>");
	</script></span></TD>
	<TD nowrap align=center><span class="ttext"><script>document.write(bgn_txpkts)</script></span></TD>
	<TD nowrap align=center><span class="ttext"><script>document.write(bgn_rxpkts)</script></span></TD>
	<TD nowrap align=center><span class="ttext"><script>document.write(bgn_collisions)</script></span></TD>
	<TD nowrap align=center><span class="ttext"><script>document.write(bgn_txbs)</script></span></TD>
	<TD nowrap align=center><span class="ttext"><script>document.write(bgn_rxbs)</script></span></TD>
	<TD nowrap align=center><span class="ttext">
<script>
	if (bgn_status != "Link down")
	{
		var uptime=bgn_systime;
		var new_time=change_sec_to_time(uptime);
		document.write(new_time);
	}
	else
		document.write("00:00:00");
</script>
	</span></TD>
	</TR>
<script>
if(an_router_flag == 1){

	document.write('<TR>');
	if(productname.substr(0,3) == "D36")
		document.write('<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","wlan_str")%> a/n');
	else
		document.write('<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","wlan_str")%> a/n/ac');
	if (an_status != "Link down")
	        document.write('<TD nowrap align=center><span class="ttext">'+an_status+'</span></TD>');
	else
		document.write('<TD nowrap align=center><span class="ttext"><%tcWebApi_multilingual("1","link_down_str")%></span></TD>');
        document.write('<TD nowrap align=center><span class="ttext">'+an_txpkts+'</span></TD>');
        document.write('<TD nowrap align=center><span class="ttext">'+an_rxpkts+'</span></TD>');
        document.write('<TD nowrap align=center><span class="ttext">'+an_collisions+'</span></TD>');
        document.write('<TD nowrap align=center><span class="ttext">'+an_txbs+'</span></TD>');
        document.write('<TD nowrap align=center><span class="ttext">'+an_rxbs+'</span></TD>');
        document.write('<TD nowrap align=center><span class="ttext">');

        if (an_status != "Link down")
        {
                var uptime=an_systime;
                var new_time=change_sec_to_time(uptime);
                document.write(new_time);
        }
        else
                document.write("00:00:00");

        document.write('</span></TD>');
        document.write('</TR>');
}
</script>	
	</TABLE>
	</TD>
</TR>
<script>
	if (wan_status != "Link down")
{
document.write('<TR>');
document.write('<TD nowrap>');
document.write('	<TABLE id="SystemStatus" border=1 cellpadding=2 cellspacing=0 width=100%>');
document.write('	<TR> ');
document.write('	<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","adsl_link_str")%></span></TD>');
document.write('	<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","downstream_str")%></span></TD>');
document.write('	<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","upstream_str")%></span></TD>');
document.write('	</TR>');
document.write('	<TR> ');
document.write('	<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","link_rate_str")%></span></TD>');
document.write('	<TD nowrap align=center><span class="thead"><% tcWebApi_get("Info_Adsl","DataRateDown","s") %></span></TD>');
document.write('	<TD nowrap align=center><span class="thead"><% tcWebApi_get("Info_Adsl","DataRateUp","s") %></span></TD>');
document.write('	</TR>');
document.write('	<TR> ');
document.write('	<TD nowrap align=center><span class="thead">Line Attenuation</span></TD>');
document.write('	<TD nowrap align=center><span class="thead"><% tcWebApi_get("Info_Adsl","AttenDown","s") %></span></TD>');
document.write('	<TD nowrap align=center><span class="thead"><% tcWebApi_get("Info_Adsl","AttenUp","s") %></span></TD>');
document.write('	</TR>');
document.write('	<TR> ');
document.write('	<TD nowrap align=center><span class="thead">Noise Margin</span></TD>');
document.write('	<TD nowrap align=center><span class="thead"><% tcWebApi_get("Info_Adsl","SNRMarginDown","s") %></span></TD>');
document.write('	<TD nowrap align=center><span class="thead"><% tcWebApi_get("Info_Adsl","SNRMarginUp","s") %></span></TD>');
document.write('	</TR>');
	
document.write('</TABLE>');
document.write('</TD>');
document.write('</TR>');
}
</script>
</TABLE>
<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<TR>
	<TD nowrap><B><%tcWebApi_multilingual("1","poll_interval_str")%> :</B>
<script>
if (timereset != "0")
	document.write("<input TYPE=TEXT NAME=interval id=timeset SIZE=5 MAXLENGTH=5 VALUE="+timereset+" onKeyPress=\"return getkey('num',event)\"> (secs)");
else
	document.write("<input TYPE=TEXT NAME=interval id=timeset SIZE=5 MAXLENGTH=5 VALUE='' onKeyPress=\"return getkey('num', event)\"> (secs)");
</script>
	</TD>
	<TD nowrap>
	<input class="common_bt" TYPE="button" NAME="SetIntvl" id="set_interval" VALUE="<%tcWebApi_multilingual("1","set_interval_str")%>" WIDTH="80" onClick="reset_time();">
	<input class="common_bt" TYPE="button" NAME="Stop" id="stop" VALUE="<%tcWebApi_multilingual("1","stop_str")%>" WIDTH="80" onClick="stop_time();">
	</TD>
</TR>
</TABLE>
<script>
function reset_time()
{
	cf=document.forms[0];
	if( cf.interval.value == "")
	{
		cf.interval.value = "5";
	}
	var interval=cf.interval.value;
	if(!(interval > 4 && interval < 86401))
	{
		alert("<%tcWebApi_multilingual("1","valid_range_str")%>");
		return false;
	}
	cf.submit();
}

function stop_time()
{
	cf=document.forms[0];
	cf.interval.value="0";
	cf.submit();
}
</script>
</FORM>
</BODY>
</HTML>
