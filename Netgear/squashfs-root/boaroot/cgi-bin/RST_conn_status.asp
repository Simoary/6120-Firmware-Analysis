<%
        tcWebApi_set("WebCurSet_Entry","dev_pvc","DvInfo_PVC")
        tcWebApi_set("WebCurSet_Entry","dev_pvc_ext","DvInfo_PVC_Ext")
        If Request_Form("Saveflag")="1" then
                tcWebApi_set("DeviceInfo_PVC","DispConnBtnType","DipConnFlag")
                If Request_Form("Dipflag")="1" then
                        tcWebApi_set("DeviceInfo_PVC","DispBtnType","Dipflag")
                        tcWebApi_commit("DeviceInfo_PVC")
                elseif Request_Form("Dipflag")="2" then
                        tcWebApi_set("DeviceInfo_PVC","DispBtnType","Dipflag")
                        tcWebApi_commit("DeviceInfo_PVC")
                elseif Request_Form("Dipflag")="3" then
                        tcWebApi_set("DeviceInfo_PVC","DispBtnType","Dipflag")
                        tcWebApi_set("DeviceInfo_PVC","IP6DispBtnType","Dipflag")
                        tcWebApi_commit("DeviceInfo_PVC")
                elseif Request_Form("Dipflag")="4" then
                        tcWebApi_set("DeviceInfo_PVC","DispBtnType","Dipflag")
                        tcWebApi_set("DeviceInfo_PVC","IP6DispBtnType","Dipflag")
                        tcWebApi_commit("DeviceInfo_PVC")
                END If
                If Request_Form("DipConnFlag")="1" then
                        tcWebApi_set("DeviceInfo_PVC","DispConnBtnType","DipConnFlag")
                        tcWebApi_commit("DeviceInfo_PVC");
                elseif Request_Form("DipConnFlag")="2" then
                        tcWebApi_set("DeviceInfo_PVC","DispConnBtnType","DipConnFlag")
                        tcWebApi_commit("DeviceInfo_PVC");
                END If

                tcWebApi_set("Info_Dongle","ManualDialUp","DongleConnFlag")
                If Request_Form("DongleConnFlag")="1" then
                        tcWebApi_set("Info_Dongle","ManualDialUp","DongleConnFlag")
                        tcWebApi_commit("Dongle_Entry");
                elseif Request_Form("DongleConnFlag")="2" then
                        tcWebApi_set("Info_Dongle","ManualDialUp","DongleConnFlag")
                        tcWebApi_commit("Dongle_Entry");
                END If

        END If
%>





<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_netgear_router")%> <%tcWebApi_get("SkuId_Entry","ProductName","s")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<META http-equiv="refresh" content="10; url=RST_conn_status.asp">
<body bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/RST_conn_status.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="connect_status">
<input type="hidden" name="Saveflag" VALUE="0">
<input type="hidden" name="Dipflag" value="0">
<INPUT TYPE="HIDDEN" NAME="DipConnFlag" VALUE="0">
<INPUT TYPE="HIDDEN" NAME="DongleConnFlag" VALUE="0">
<INPUT TYPE="HIDDEN" NAME="Saveflag_reget" VALUE="0">
<INPUT TYPE="HIDDEN" NAME="DvInfo_PVC" VALUE="0">
<INPUT TYPE="HIDDEN" NAME="DvInfo_PVC_Ext" VALUE="0">
<div id="title" class="page_title"><%tcWebApi_multilingual("1","connection_status_str")%></div>
<div id="main" class="main">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<input type="hidden" name="endis_connect" value="1">
<INPUT type="hidden" name="ACTIVE_VALUE" value="Yes">
<INPUT type="hidden" name="DeACTIVE_VALUE" value="No">

<script>
var test='<%tcWebApi_get("WanInfo_Entry","Update","h")%>';
var info_get_wanproto="<% if tcWebApi_get("WanInfo_Entry","Connetion","h") <> "" then tcWebApi_staticGet("WanInfo_Entry","Connetion","s")  end if %>";
var confirm_to_re_establish_str="<%tcWebApi_multilingual("1","confirm_to_re_establish_str")%>";
var ip_get_check="<%tcWebApi_staticGet("WanInfo_Entry","Active","s")%>";
var mode="<% if tcWebApi_get("Wan_Common","TransMode","h") <> "" then tcWebApi_get("Wan_Common","TransMode","s")  end if %>";

<%if Request_Form("Saveflag_reget")="1" then%>
	reloadvalue(2);
<%elseif Request_Form("Saveflag_reget")="2" then%>
	reloadvalue(3);
<%elseif Request_Form("Saveflag_reget")="3" then%>
	reloadvalue(4);
<%elseif Request_Form("Saveflag_reget")="4" then%>
	reloadvalue(5);
<%elseif Request_Form("Saveflag_reget")="5" then%>
	reloadvalue(6);
<%end if%>

function reloadvalue(count)
{
	cf=document.forms[0];
	cf.Saveflag_reget.value = count;
	document.getElementById("title").style.display = "none";
	document.getElementById("main").style.display = "none";
	setTimeout("display_waiting_bar()",500);
}

function display_waiting_bar()
{
	document.getElementById("waiting_bar").style.display = "";	
	setTimeout(function(){document.getElementById("loading_img").src=document.getElementById("loading_img").src},10);
	setTimeout("redirect()",2000);
}

function redirect()
{
	cf=document.forms[0];
	var tmp_Saveflag_reget = cf.Saveflag_reget.value;
	
	if(info_get_wanip == "0.0.0.0" && tmp_Saveflag_reget != "6")	
	cf.submit();
	else
	location.href= '/cgi-bin/RST_conn_status.asp';
}

function AddDays(newdate,DaysToAdd,sec_time) 
{
	var newdate=new Date(newdate);
	DaysToAdd=DaysToAdd/24;
	var newtimems=newdate.getTime()+(sec_time*1000);
	newdate.setTime(newtimems);
	newday=newdate.toString();
	day_array=newday.split(' ');
	if(isIE())	
		newday=day_array[0]+' '+day_array[1]+' '+day_array[2]+' '+day_array[3]+' '+day_array[5];
	else
		newday=day_array[0]+' '+day_array[1]+' '+day_array[2]+' '+day_array[4]+' '+day_array[3];
	return newday;
}
function renewrelease(ip){
  //Display Wait Bar
  document.getElementById("title").style.display = "none";
  document.getElementById("main").style.display = "none";
  document.getElementById("waiting_bar").style.display = "";	
  setTimeout(function(){document.getElementById("loading_img").src=document.getElementById("loading_img").src},10000);
  cf=document.forms[0];
  cf.Dipflag.value = ip;
  cf.Saveflag.value = 1;
  cf.DipConnFlag.value = 0;
  
  if( mode == "ATM")
  cf.DvInfo_PVC.value = 0;
  else
  cf.DvInfo_PVC.value = 10;
  
  if(ip == "1")
  cf.Saveflag_reget.value = 1;
  
  cf.submit();
}
function reconnect(flag){

  if(flag == 2 && !confirm(confirm_to_re_establish_str))
   return false;

  //Display Wait Bar
  document.getElementById("title").style.display = "none";
  document.getElementById("main").style.display = "none";
  document.getElementById("waiting_bar").style.display = "";	
  setTimeout(function(){document.getElementById("loading_img").src=document.getElementById("loading_img").src},10000);
  cf=document.forms[0];
  cf.DipConnFlag.value = flag;
  cf.Saveflag.value = 1;
  
  if( mode == "ATM")
  cf.DvInfo_PVC.value = 0;
  else
  cf.DvInfo_PVC.value = 10;
  
  if(flag == "1")
  cf.Saveflag_reget.value = 1;
  
  cf.submit();
}
function dongle_reconnect(flag){
  //Display Wait Bar
  document.getElementById("title").style.display = "none";
  document.getElementById("main").style.display = "none";
  document.getElementById("waiting_bar").style.display = "";	
  setTimeout(function(){document.getElementById("loading_img").src=document.getElementById("loading_img").src},10000);
  cf=document.forms[0];
  cf.DongleConnFlag.value = flag;
  cf.Saveflag.value = 1;
  
  if( mode == "ATM")
  cf.DvInfo_PVC.value = 0;
  else
  cf.DvInfo_PVC.value = 10;
  
  if(flag == "1")
  cf.Saveflag_reget.value = 1;
  
  cf.submit();
}


function change_time_type(time)
{
        var sec = time;
        var sec = parseInt(sec);
		
	var minute_sec = sec%3600;
	if(minute_sec != sec)
		var day_hour = (sec - minute_sec)/3600;
	else
		var day_hour = 0;

	var hour = day_hour%24;
	if(hour != day_hour)
		var day = (day_hour - hour)/24;
	else
		var day = 0;

	var sec_sec = minute_sec%60;
	if(sec_sec != minute_sec)
		var minute = (minute_sec - sec_sec)/60;
	else
		var minute = 0;
	

	day = day.toString();
	hour = hour.toString();
	minute = minute.toString();

        var new_time=day+" days, "+hour+" hours, "+minute+" minutes ";
        return new_time;
	
}
</script>
</TABLE>
<TABLE border=1 cellpadding=2 cellspacing=0 width=100%>
<script>
var info_get_wanip="<% if tcWebApi_staticGet("WanInfo_Entry","Active","h") = "1" then tcWebApi_staticGet("WanInfo_Entry","IP","s") else asp_Write("0.0.0.0") end if%>";
var info_get_wanmask="<% if tcWebApi_staticGet("WanInfo_Entry","Active","h") = "1" then tcWebApi_staticGet("WanInfo_Entry","Mask","s") else asp_Write("0.0.0.0") end if%>";
var info_get_gateway="<% if tcWebApi_staticGet("WanInfo_Entry","Active","h") = "1" then tcWebApi_staticGet("WanInfo_Entry","Gateway","s") else asp_Write("0.0.0.0") end if%>";
var info_get_dns1="<% if tcWebApi_staticGet("WanInfo_Entry","Active","h") = "1" then tcWebApi_staticGet("WanInfo_Entry","DNS1","s") end if%>";
var info_get_dns2="<BR/><% if tcWebApi_staticGet("WanInfo_Entry","Active","h") = "1" then tcWebApi_staticGet("WanInfo_Entry","DNS2","s") end if%>";
var ppp_uptime="<% if tcWebApi_staticGet("WanInfo_Entry","Active","h") = "1" then tcWebApi_staticGet("WanInfo_Entry","connection_time","s") else asp_Write("0") end if%>";
var bpa_uptime="0";
var traffic_disable_wan="<% if tcWebApi_staticGet("TrafficHijack_Entry","Reach_limit_to_block_wan","h") = "1" then tcWebApi_staticGet("TrafficHijack_Entry","Reach_limit_to_block_wan","s") else asp_Write("0") end if%>";

var internet_type="1";
var netgear_region="WW";
var gui_region="English";
//var dns_third_flag=(top.dns_third_flag == 1 && gui_region == "Russian" && (netgear_region == "WW" || netgear_region == "RU")) ? 1 : 0 ;
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
//fix bug 25223
var info_get_dns3="<BR/>172.16.1.86";

if (info_get_wanproto == "DHCP")
{
	var wan_dhcp_server="<% if tcWebApi_staticGet("WanInfo_Entry","Active","h") = "1" then tcWebApi_staticGet("WanInfo_Entry","wan_dhcp_server","s") else asp_Write("0.0.0.0") end if%>";
	var dhcpc_lease_obtain="<% if tcWebApi_staticGet("WanInfo_Entry","Active","h") = "1" then tcWebApi_staticGet("WanInfo_Entry","dhcpc_lease_obtain","s") else asp_Write("") end if%>";
	var dhcpc_lease_time="<% if tcWebApi_staticGet("WanInfo_Entry","Active","h") = "1" then tcWebApi_staticGet("WanInfo_Entry","dhcpc_lease_time","s") else asp_Write("infinity lease") end if%>";
	var dhcpc_wan_status="100M/Full";

	if( dhcpc_lease_time == "" || dhcpc_lease_time == "infinity lease" )
		dhcpc_lease_time = "infinity lease" ;
	else
		dhcpc_lease_time = parseInt(dhcpc_lease_time);
	
	if( dhcpc_lease_obtain == "" )
		dhcpc_lease_obtain = "0";

	dhcpc_lease_obtain = parseInt(dhcpc_lease_obtain);
	
	if( dhcpc_lease_time == "infinity lease" ){
		var obtian_time="infinity lease";
		var lease_time="infinity lease";
	}
	else{
		var obtian_time=change_time_type(dhcpc_lease_time);
	
		var now_time="<% if tcWebApi_staticGet("WanInfo_Entry","Active","h") = "1" then tcWebApi_staticGet("WanInfo_Entry","show_uptime","s") else asp_Write("0") end if%>";
		if( (now_time - dhcpc_lease_obtain) > dhcpc_lease_time )
			var lease_sec = 0;
		else
			var lease_sec=dhcpc_lease_time - now_time + dhcpc_lease_obtain;
		var lease_time=change_time_type(lease_sec);
	}

	if ( dhcpc_wan_status == "Link down" || dhcpc_wan_status == "" )
		info_get_wanip="0.0.0.0";

	if (info_get_wanip != "0.0.0.0")
	{
		document.write("<TR><TD nowrap><B><%tcWebApi_multilingual("1","ip_addr_str")%></B></TD><TD nowrap> "+info_get_wanip+"</TD></TR>");
		document.write("<TR><TD nowrap><B><%tcWebApi_multilingual("1","subnet_mask_str")%></B></TD><TD nowrap> "+info_get_wanmask+"</TD></TR>");
		document.write("<TR><TD nowrap><B><%tcWebApi_multilingual("1","default_gateway_str")%></B></TD><TD nowrap> "+info_get_gateway+"</TD></TR>");
		document.write("<TR><TD nowrap><B><%tcWebApi_multilingual("1","dhcp_server_str")%></B></TD><TD nowrap> "+wan_dhcp_server+"</TD></TR>");
		document.write("<TR><TD nowrap><B><%tcWebApi_multilingual("1","dns_server_str")%></B></TD><TD nowrap> "+info_get_dns1+"<BR>"+info_get_dns2);
		//if(dns_third_flag == 1 && internet_type == "1" )
		//	document.write("<BR>" + info_get_dns3);
		document.write("</TD></TR>");
		document.write("<TR><TD nowrap><B><%tcWebApi_multilingual("1","lease_obtained_str")%></B></TD><TD nowrap>"+obtian_time+"</TD></TR>");
		document.write("<TR><TD nowrap><B><%tcWebApi_multilingual("1","lease_expires_str")%></B></TD><TD nowrap> "+lease_time+"</TD></TR>");
	}
	else
	{
		document.write("<TR><TD nowrap><B><%tcWebApi_multilingual("1","ip_addr_str")%></B></TD><TD nowrap> 0.0.0.0</TD></TR><TR><TD nowrap><B><%tcWebApi_multilingual("1","subnet_mask_str")%></B></TD><TD nowrap> 0.0.0.0</TD></TR><TR><TD nowrap><B><%tcWebApi_multilingual("1","default_gateway_str")%></B></TD><TD nowrap> 0.0.0.0</TD></TR><TR><TD nowrap><B><%tcWebApi_multilingual("1","dhcp_server_str")%></B></TD><TD nowrap> 0.0.0.0</TD></TR><TR><TD nowrap><B><%tcWebApi_multilingual("1","dns_server_str")%></B></TD><TD nowrap> 0.0.0.0</TD></TR><TR><TD nowrap><B><%tcWebApi_multilingual("1","lease_obtained_str")%></B></TD><TD nowrap>----</TD></TR><TR><TD nowrap><B><%tcWebApi_multilingual("1","lease_expires_str")%></B></TD><TD nowrap>----</TD></TR>");
	}
}
else if (info_get_wanproto == "PPPoE" || info_get_wanproto == "PPPoA")
{

	if (info_get_wanip !="0.0.0.0" && <%tcWebApi_staticGet("Wan_Common","InternetDemandLED","s")%>)
	{
		var new_time=change_sec_to_time(ppp_uptime);
		document.write("<TR><TD nowrap><B><%tcWebApi_multilingual("1","con_time_str")%></B></TD><TD nowrap>  "+new_time+"</TD></TR>");
		document.write("<TR><TD nowrap><B><%tcWebApi_multilingual("1","con_status_str")%></B></TD><TD nowrap>  <%tcWebApi_multilingual("1","connected_str")%> </TD></TR>");
		document.write("<TR><TD nowrap><B><%tcWebApi_multilingual("1","negotiation_str")%></B></TD><TD nowrap>  <%tcWebApi_multilingual("1","success_str")%></TD></TR><TR><TD nowrap><B><%tcWebApi_multilingual("1","authentication_str")%></B></TD><TD nowrap>  <%tcWebApi_multilingual("1","success_str")%></TD></TR>");
		document.write("<TR><TD nowrap><B><%tcWebApi_multilingual("1","ip_addr_str")%></B></TD><TD nowrap>  "+info_get_wanip+"</TD></TR>");
		document.write("<TR><TD nowrap><B><%tcWebApi_multilingual("1","subnet_mask_str")%></B></TD><TD nowrap>  "+info_get_wanmask+"</TD></TR>");
	}
	else
		document.write("<TR><TD nowrap><B><%tcWebApi_multilingual("1","con_time_str")%></B></TD><TD nowrap>  00:00:00</TD></TR><TR><TD nowrap><B><%tcWebApi_multilingual("1","con_status_str")%></B></TD><TD nowrap> <%tcWebApi_multilingual("1","disconnected_str")%> </TD></TR><TR><TD nowrap><B><%tcWebApi_multilingual("1","negotiation_str")%></B></TD><TD nowrap>  ----</TD></TR><TR><TD nowrap><B><%tcWebApi_multilingual("1","authentication_str")%></B></TD><TD nowrap>  ----</TD></TR><TR><TD nowrap><B><%tcWebApi_multilingual("1","ip_addr_str")%></B></TD><TD nowrap>  0.0.0.0</TD></TR><TR><TD nowrap><B><%tcWebApi_multilingual("1","subnet_mask_str")%></B></TD><TD nowrap>  0.0.0.0</TD></TR>");
}
else if(info_get_wanproto=="pptp" || info_get_wanproto=="l2tp")
{
	if (info_get_wanip !="0.0.0.0" )
	{
		var new_time=change_sec_to_time(ppp_uptime);
		var tunnel_ip="0.0.0.0";
//		document.write("<TR><TD nowrap><B><%tcWebApi_multilingual("1","con_time_str")%></B></TD><TD nowrap> "+new_time+"</TD></TR>")
		document.write("<TR><TD nowrap><B><%tcWebApi_multilingual("1","con_status_str")%></B></TD><TD nowrap> <%tcWebApi_multilingual("1","connected_str")%> </TD></TR>");
		document.write("<TR><TD nowrap><B><%tcWebApi_multilingual("1","ip_addr_str")%></B></TD><TD nowrap> "+info_get_wanip+"</TD></TR>");
		document.write("<TR><TD nowrap><B><%tcWebApi_multilingual("1","subnet_mask_str")%></B></TD><TD nowrap> "+info_get_wanmask+"</TD></TR>");
//		document.write("<TR><TD nowrap><B>Tunnel IP</B></TD><TD nowrap> "+tunnel_ip+"</TD></TR>");
	}
	else
//		document.write("<TR><TD nowrap><B><%tcWebApi_multilingual("1","con_time_str")%></B></TD><TD nowrap> 00:00:00</TD></TR>");
		document.write("<TR><TD nowrap><B><%tcWebApi_multilingual("1","con_status_str")%></B></TD><TD nowrap> <%tcWebApi_multilingual("1","disconnected_str")%> </TD></TR><TR><TD nowrap><B><%tcWebApi_multilingual("1","ip_addr_str")%></B></TD><TD nowrap> 0.0.0.0</TD></TR><TR><TD nowrap><B><%tcWebApi_multilingual("1","subnet_mask_str")%></B></TD><TD nowrap> 0.0.0.0</TD></TR>");
//		document.write("<TR><TD nowrap><B>Tunnel IP</B></TD><TD nowrap> 0.0.0.0</TD></TR>");
}
else if (info_get_wanproto == "bigpond")
{
	if (info_get_wanip !="0.0.0.0")
	{
		var new_time=change_sec_to_time(bpa_uptime);
//		document.write("<TR><TD nowrap><B><%tcWebApi_multilingual("1","con_time_str")%></B></TD><TD nowrap> "+new_time+" </TD></TR>")
		document.write("<TR><TD nowrap><B><%tcWebApi_multilingual("1","con_status_str")%></B></TD><TD nowrap> <%tcWebApi_multilingual("1","logged_in_str")%> </TD></TR>");
		document.write("<TR><TD nowrap><B><%tcWebApi_multilingual("1","ip_addr_str")%></B></TD><TD nowrap> "+info_get_wanip+"</TD></TR>");
		document.write("<TR><TD nowrap><B><%tcWebApi_multilingual("1","subnet_mask_str")%></B></TD><TD nowrap> "+info_get_wanmask+"</TD></TR>");
	}
	else
	{
//		document.write("<TR><TD nowrap><B><%tcWebApi_multilingual("1","con_time_str")%></B></TD><TD nowrap> 00:00:00</TD></TR>");
		document.write("<TR><TD nowrap><B><%tcWebApi_multilingual("1","con_status_str")%></B></TD><TD nowrap> <%tcWebApi_multilingual("1","logged_out_str")%> </TD></TR><TR><TD nowrap><B><%tcWebApi_multilingual("1","ip_addr_str")%></B></TD><TD nowrap> 0.0.0.0</TD></TR><TR><TD nowrap><B><%tcWebApi_multilingual("1","subnet_mask_str")%></B></TD><TD nowrap> 0.0.0.0</TD></TR>");
	}
}
</script> 
</TABLE>
<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<TR>
	<TD nowrap align=center>
	<BR>
<script>
if ( info_get_wanproto == "static" )
	{}
else if( info_get_wanproto == "DHCP" ){
	document.write('<input class="common_bt" type="button" name="Release" value="<%tcWebApi_multilingual("1","release_str")%>" onclick="renewrelease(2)" >&nbsp;&nbsp;<input class="common_bt"  type="button" name="Renew" value="<%tcWebApi_multilingual("1","renew_str")%>" onclick="renewrelease(1)" >');

		if (info_get_wanip =="0.0.0.0")
        	{
                    document.forms[0].Release.disabled = true;
                }
}
else{
	if ((info_get_wanproto == "pptp" || info_get_wanproto == "PPPoE" || info_get_wanproto == "PPPoA")){
		document.write('<input class="common_bt" type="button" name="Disconnect" value="<%tcWebApi_multilingual("1","disconnect_str")%>" onclick="reconnect(2)" >&nbsp;&nbsp;<input class="common_bt"  type="button" name="Connect" value="<%tcWebApi_multilingual("1","connect_str")%>" onclick="reconnect(1)" >');
        
		if ((info_get_wanip !="0.0.0.0" && <%tcWebApi_staticGet("Wan_Common","InternetDemandLED","s")%>) || traffic_disable_wan == "1")
        	{
                    document.forms[0].Connect.disabled = true;
		    document.forms[0].Connect.className  =  "common_gray_bt";
                }
                else
                {

                    document.forms[0].Disconnect.disabled = true;
		    document.forms[0].Connect.className  =  "common_bt";
                }
	}
	else
		document.write('<input class="common_bt" type="button" name="Connect" value="<%tcWebApi_multilingual("1","connect_str")%>" onclick="dongle_reconnect(1)" >&nbsp;&nbsp;<input class="common_bt"  type="button" name="Disconnect" value="<%tcWebApi_multilingual("1","disconnect_str")%>" onclick="dongle_reconnect(2)" >');
}
</script>
	</TD>
</TR>
</TABLE>
<!--TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</TABLE-->
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<TR>
	<TD nowrap align=center>
	<input  class="common_bt" type=button name="Close Window" value="<%tcWebApi_multilingual("1","close_window_str")%>" onclick="self.close();">
	</TD>
</TR>
</TABLE>

</div>

<div id="waiting_bar" style="display:none">
<div  align="center"><BR><BR><TR><TD align="center"><B><%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%></B></TD></TR><BR><BR></div>
<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" id="loading_img" alt="waiting" /></div>
</div>

</FORM>
</BODY>
</HTML>
