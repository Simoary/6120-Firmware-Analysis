<%
If Request_Form("submit_flag") = "1" Then
	If Request_Form("WANCHANGED") = "1" Then
		tcWebApi_set("Wan_PVC","MTU","wan_mtu")
		if tcWebApi_get("Wan_PVC","ISP","h") = "2" then
			tcWebApi_set("Wan_PVC","MSS","wan_TCPMSS")
		end if
		
		tcWebApi_set("Wan_PVC","IGMPproxy","IGMPEnable")
		tcWebApi_commit("Wan_PVC")
		tcWebApi_save()
	End If
	
	If Request_Form("DefaultDmz_Active") <> "" Then
		tcWebApi_set("Dmz_PVC","Active","DefaultDmz_Active")
		tcWebApi_set("Dmz_PVC","DMZ_IP","dmz_ip")
		tcWebApi_commit("Dmz_PVC")
	End If
	
	If Request_Form("spi_value") <> "" Then
	    tcWebApi_set("Firewall_Entry","spi_status","spi_value")
	End if
	
	If Request_Form("firewall_value") <> "" Then
	    tcWebApi_set("Firewall_Entry","firewall_status","firewall_value")
	End if
	
	tcWebApi_commit("Firewall_Entry")
	
	If Request_Form("sipalg_value")<> "" Then
		tcWebApi_set("ALGSwitch_Entry","SIPSW","sipalg_value")
        tcWebApi_set("Alg_Entry","SiproxdEnable","sipproxy_value")
	End if
	
	If Request_Form("ipsecalg_value")<> "" Then
		tcWebApi_set("ALGSwitch_Entry","IPSECSW","ipsecalg_value")
	End if
	
	If Request_Form("pptpalg_value")<> "" Then
		tcWebApi_set("ALGSwitch_Entry","PPTPSW","pptpalg_value")
	End if
	
	If Request_Form("l2tpalg_value")<> "" Then
		tcWebApi_set("ALGSwitch_Entry","L2TPSW","l2tpalg_value")
	End if
	
	tcWebApi_commit("ALGSwitch_Entry")
    tcWebApi_commit("Alg_Entry")
	
	If Request_Form("rspToPing_value")<> "" Then
		tcWebApi_set("RemoteManager_Entry","Icmp_active","rspToPing_value")
		tcWebApi_commit("RemoteManager_Entry")
	End if
	
	If Request_Form("hid_bri_lan1") = "1" Then
	   tcWebApi_unset("PortBind_Entry")
	elseif Request_Form("hid_bri_lan1") = "0" Then
	    tcWebApi_unset("PortBind_Entry")
	elseif Request_Form("hid_bri_lan2") = "1" Then
	    tcWebApi_unset("PortBind_Entry")
	elseif Request_Form("hid_bri_lan2") = "0" Then
	    tcWebApi_unset("PortBind_Entry")
	elseif Request_Form("hid_bri_lan3") = "1" Then
	    tcWebApi_unset("PortBind_Entry")
	elseif Request_Form("hid_bri_lan3") = "0" Then
	    tcWebApi_unset("PortBind_Entry")
	elseif Request_Form("hid_bri_lan4") = "1" Then
	    tcWebApi_unset("PortBind_Entry")
	elseif Request_Form("hid_bri_lan4") = "0" Then
	    tcWebApi_unset("PortBind_Entry")
	elseif Request_Form("hid_brig_ssid1") = "1" Then
	    tcWebApi_unset("PortBind_Entry")
	elseif Request_Form("hid_brig_ssid1") = "0" Then
	    tcWebApi_unset("PortBind_Entry")
	End If

    tcWebApi_set("PortBind_Common","Active","Active_Type_No")
		
	If Request_Form("hid_bri_lan1") = "1" Then
        tcWebApi_set("PortBind_Common","Active","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p0","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p1","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p2","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p3","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p4","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p5","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p6","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p7","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p10_0","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","e1","Active_Type_Yes")
	End if
	
	If Request_Form("hid_bri_lan2") = "1" Then
        tcWebApi_set("PortBind_Common","Active","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p0","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p1","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p2","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p3","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p4","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p5","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p6","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p7","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p10_0","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","e2","Active_Type_Yes")
	End if
	
	If Request_Form("hid_bri_lan3") = "1" Then
        tcWebApi_set("PortBind_Common","Active","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p0","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p1","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p2","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p3","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p4","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p5","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p6","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p7","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p10_0","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","e3","Active_Type_Yes")
	End if
	
	If Request_Form("hid_bri_lan4") = "1" Then
        tcWebApi_set("PortBind_Common","Active","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p0","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p1","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p2","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p3","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p4","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p5","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p6","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p7","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p10_0","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","e4","Active_Type_Yes")
	End if
	
	If Request_Form("hid_brig_ssid1") = "1" Then
        tcWebApi_set("PortBind_Common","Active","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p0","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p1","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p2","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p3","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p4","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p5","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p6","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p7","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","p10_0","Active_Type_Yes")
		tcWebApi_set("PortBind_Entry","w0","Active_Type_Yes")
	End if
	tcWebApi_commit("PortBind_Entry")
End if
%>

<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/wan.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/WAN_wan.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>


<div class="page_title" id="title"><%tcWebApi_multilingual("1","wan_setup_str")%></div>
<div class="fix_button" id="check_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
	<input class="cancel_bt" type='reset' name='Cancel' value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" id='cancel' onClick='location.href="WAN_wan.asp";'> &nbsp;&nbsp;
        <input class="apply_bt" type="submit" name="Apply" value="<%tcWebApi_multilingual("0","glbstr_apply")%>" id='apply' onClick="return checkwan(document.forms[0]);">
        </TD>
</TR>
</TABLE>
</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>
<input type="hidden" name="submit_flag">

<script>
var dmz_value="<%tcWebApi_get("Dmz_PVC","Active","s")%>";
var spiEnable="<%If tcWebApi_get("Firewall_Entry","spi_status","h") <> "N/A" then tcWebApi_get("Firewall_Entry","spi_status","s") end if%>";
var rspToPing_value='<%If tcWebApi_get("RemoteManager_Entry","Icmp_active","h") <> "N/A" then tcWebApi_get("RemoteManager_Entry","Icmp_active","s") else asp_write("No") end if%>';
var nat_fitering="<% if tcWebApi_get("Firewall_Entry","firewall_status","h") = "1" then tcWebApi_get("Firewall_Entry","firewall_status","s") end if %>";

var gui_region="English";
var netgear_region=top.netgear_region;
//var show_vpn = ((parent.vpn_show_flag == 1 && gui_region == "Chinese" && (netgear_region == "" || netgear_region.toUpperCase() == "WW")) || netgear_region.toUpperCase() == "PR") ? 1 : 0;
var show_vpn = "1";
var enable_ipsec = "<%If tcWebApi_get("ALGSwitch_Entry","IPSECSW","h") <> "N/A" then tcWebApi_get("ALGSwitch_Entry","IPSECSW","s") end if%>";
var enable_pptp = "<%If tcWebApi_get("ALGSwitch_Entry","PPTPSW","h") <> "N/A" then tcWebApi_get("ALGSwitch_Entry","PPTPSW","s") end if%>";
var enable_l2tp = "<%If tcWebApi_get("ALGSwitch_Entry","L2TPSW","h") <> "N/A" then tcWebApi_get("ALGSwitch_Entry","L2TPSW","s") end if%>";

var basic_type="1";
var ppp_login_type="0";
var lan_ip = ('<%If tcWebApi_get("Lan_Entry","IP","h") <> "N/A" then tcWebApi_get("Lan_Entry","IP","s") end if%>') ;
var lan_mask = ('<%If tcWebApi_get("Lan_Entry","netmask","h") <> "N/A" then tcWebApi_get("Lan_Entry","netmask","s") end if%>') ;
var endis_sipalg="0";
var have_igmp= (top.igmp_flag == 1)?1:0;
var endis_igmp="0";
var bri_lan_tag1=<%if tcWebApi_get("PortBind_Entry", "e1", "h") = "Yes" then asp_write("1") else asp_write("0") end if%>;//bug 24622:add a new function "IPTV Port Support"
var bri_lan_tag2=<%if tcWebApi_get("PortBind_Entry", "e2", "h") = "Yes" then asp_write("1") else asp_write("0") end if%>;
var bri_lan_tag3=<%if tcWebApi_get("PortBind_Entry", "e3", "h") = "Yes" then asp_write("1") else asp_write("0") end if%>;
var bri_lan_tag4=<%if tcWebApi_get("PortBind_Entry", "e4", "h") = "Yes" then asp_write("1") else asp_write("0") end if%>;
var brig_ssid_tag1=<%if tcWebApi_get("PortBind_Entry", "w0", "h") = "Yes" then asp_write("1") else asp_write("0") end if%>;
var brig_ssid_tag2="0";
var brig_guest_ssid_tag1="0";
var brig_guest_ssid_tag2="0";
var have_bridge_iptv="0";
var old_endis_ssid_broadcast='1';
var old_wla_endis_ssid_broadcast='1';
var an_router_flag = parent.an_router_flag;
var get_endis_guestNet="0";
var get_endis_guestNet_a="0";
var old_mtu = "<%tcWebApi_get("Wan_PVC","MTU","s")%>";
var old_igmp = "<%tcWebApi_get("Wan_PVC","IGMPproxy","s")%>";
var wan_type = "<%if tcWebApi_get("Wan_PVC","ISP","h") = "N/A" then asp_write("2") else tcWebApi_get("Wan_PVC","ISP","s") end if%>";
function loadvalue()
{
	var cf = document.forms[0];
	var dmzIpAddr= "<%tcWebApi_get("Dmz_PVC","DMZ_IP","s")%>";
	if(dmzIpAddr == "N/A" || dmzIpAddr== "0.0.0.0")
		dmzIpAddr="192.168.1.";
		
	var lanIpAddr= "<%tcWebApi_get("Lan_Entry0","IP","s")%>";
	var lanIp = lanIpAddr.split(".");
	var dmzIp = dmzIpAddr.split(".");

	change_web_format();
    
	if (bri_lan_tag1 == '1')
		cf.bri_lan1.checked = true;
	else
		cf.bri_lan1.checked = false;
	if (bri_lan_tag2 == '1')
		cf.bri_lan2.checked = true;
	else
		cf.bri_lan2.checked = false;
	if (bri_lan_tag3 == '1')
		cf.bri_lan3.checked = true;
	else
		cf.bri_lan3.checked = false;
	if (bri_lan_tag4 == '1')
		cf.bri_lan4.checked = true;
	else
		cf.bri_lan4.checked = false;
	if (brig_ssid_tag1 == '1')
		cf.brig_ssid1.checked = true;
	else
	cf.brig_ssid1.checked = false;
	if (brig_ssid_tag2 == '1')
		cf.brig_ssid2.checked = true;
	else
		cf.brig_ssid2.checked = false;
	if (brig_guest_ssid_tag1 == '1')
		cf.brig_guest_ssid1.checked = true;
	else
		cf.brig_guest_ssid1.checked = false;
	if (brig_guest_ssid_tag2 == '1')
		cf.brig_guest_ssid2.checked = true;
	else
		cf.brig_guest_ssid2.checked = false;
	
	if (spiEnable == '1')
		cf.disable_spi.checked = false;
	else
		cf.disable_spi.checked = true;
	if (dmz_value == 'Yes')
	{
		cf.dmz_enable.checked = true;
		cf.dmzip1.disabled = false;
		cf.dmzip2.disabled = false;
		cf.dmzip3.disabled = false;
		cf.dmzip4.disabled = false;
	        /*cf.dmzip1.value = lanIp[0];
	        cf.dmzip2.value = lanIp[1];
	        cf.dmzip3.value = lanIp[2];
		cf.dmzip4.value = dmzIp[3];	*/
	}
	else
	{
		cf.dmz_enable.checked = false;
		cf.dmzip1.disabled = true;
		cf.dmzip2.disabled = true;
		cf.dmzip3.disabled = true;
		cf.dmzip4.disabled = true;
		/*cf.dmzip1.value = "";
		cf.dmzip2.value = "";
		cf.dmzip3.value = "";
		cf.dmzip4.value = "";*/
	}
	cf.dmzip1.value = lanIp[0];   //bug 21913:whenever the first three dmz_ip_address is the same as lan_ip_address
	cf.dmzip2.value = lanIp[1];
	cf.dmzip3.value = lanIp[2];
	cf.dmzip4.value = dmzIp[3];	
	if (rspToPing_value == 'Yes')
		cf.rspToPing.checked = true;
	else
		cf.rspToPing.checked = false;
	
	//cf.wan_mtu.value = '1500';
	
	if (nat_fitering == '1' )
		cf.NatInboundFiltering[0].checked = true;
	else
		cf.NatInboundFiltering[1].checked = true;

	/*if (endis_sipalg == '1' )
		cf.disable_sipalg.checked = true;
	else
		cf.disable_sipalg.checked = false;*/

	//MTU
	<% if tcWebApi_get("Wan_PVC","ISP","h") = "2" then%>
	cf.wan_mtu.value = "<% if tcWebApi_get("Wan_PVC","MTU","h") = "N/A" then asp_write("1492") else tcWebApi_get("Wan_PVC","MTU","s")  end if%>";
	cf.wan_TCPMSS.value = parseInt(cf.wan_mtu.value)  - 40;
	<%else%>
	cf.wan_mtu.value = "<% if tcWebApi_get("Wan_PVC","MTU","h") = "N/A" then asp_write("1500") else tcWebApi_get("Wan_PVC","MTU","s")  end if%>";
	<%end if%>
	
	//IGMP
	<% if tcWebApi_get("Wan_PVC","IGMPproxy","h") = "N/A" then %>
	cf.disable_igmp.checked = true;
	<% elseif tcWebApi_get("Wan_PVC","IGMPproxy","h") = "Yes" then %>
	cf.disable_igmp.checked = false;
	<%elseif tcWebApi_get("Wan_PVC","IGMPproxy","h") = "No" then %>	
	cf.disable_igmp.checked = true;
	<%end if%>

	if( show_vpn == 1 )
	{
		if(enable_ipsec == 'on')
			cf.enable_ipsec_passthrough[0].checked = true;
		else
			cf.enable_ipsec_passthrough[1].checked = true;
		if(enable_pptp == 'on')
			cf.enable_pptp_passthrough[0].checked = true;	
		else
			cf.enable_pptp_passthrough[1].checked = true;
		if(enable_l2tp == 'on')
			cf.enable_l2tp_passthrough[0].checked = true;		
		else
			cf.enable_l2tp_passthrough[1].checked = true;
	}
}
function change_web_format()
{
	if( show_vpn == 1 )			//show the VPN Passthrough items or not
	{
		//document.getElementById("bluebar").style.display="";
		document.getElementById("vpn_name").style.display="";
		document.getElementById("ipsec_passthrough").style.display="";
		document.getElementById("pptp_passthrough").style.display="";
		document.getElementById("l2tp_passthrough").style.display="";			 
	}
	else
	{
		//document.getElementById("bluebar").style.display="none";
		document.getElementById("vpn_name").style.display="none";
		document.getElementById("ipsec_passthrough").style.display="none";
		document.getElementById("pptp_passthrough").style.display="none";
		document.getElementById("l2tp_passthrough").style.display="none";
	}
        if( have_igmp == 1 )
        {
                document.getElementById("show_igmp").style.display="";
                document.getElementById("igmp_bluebar").style.display="";
        }
        else
        {
                document.getElementById("show_igmp").style.display="none";
                document.getElementById("igmp_bluebar").style.display="none";
        }
		if( have_bridge_iptv == 1 )
	{
		document.getElementById("bri_bluebar").style.display="";
		document.getElementById("bri_string").style.display="";
		document.getElementById("bri_lans").style.display="";
		if( old_endis_ssid_broadcast == 1 )
			document.getElementById("bri_ssid1").style.display="";
		else
			document.getElementById("bri_ssid1").style.display="none";
		if( get_endis_guestNet == 1 )
			document.getElementById("bri_guest_ssid1").style.display="";
		else
			document.getElementById("bri_guest_ssid1").style.display="none";
		if( get_endis_guestNet_a == 1 && an_router_flag == 1)
			document.getElementById("bri_guest_ssid2").style.display="";
		else
			document.getElementById("bri_guest_ssid2").style.display="none";
		if( old_wla_endis_ssid_broadcast == 1 && an_router_flag == 1)
			document.getElementById("bri_ssid2").style.display="none"; //201311281430, Tony, Disable wireless 5G settings
		else
			document.getElementById("bri_ssid2").style.display="none";
	}
	else
	{
		document.getElementById("bri_bluebar").style.display="none";
		document.getElementById("bri_string").style.display="none";
		document.getElementById("bri_lans").style.display="none";
		document.getElementById("bri_ssid1").style.display="none";
		document.getElementById("bri_ssid2").style.display="none";
		document.getElementById("bri_guest_ssid1").style.display="none";
		document.getElementById("bri_guest_ssid2").style.display="none";
	}

}
var invalid_mtu_str="<%tcWebApi_multilingual("1","invalid_mtu_str")%>";
var invalid_ip_address_str="<%tcWebApi_multilingual("1","invalid_ip_address_str")%>";
var the_dmz_ip_str="<%tcWebApi_multilingual("1","the_dmz_ip_str")%>";
var this_ip_address_str="<%tcWebApi_multilingual("1","this_ip_address_str")%>";
</script>
<input type="hidden" name="dod_value">
<input type="hidden" name="spi_value">
<input type="hidden" name="rspToPing_value">
<input type="hidden" name="dmz_ip">
<input type="hidden" name="firewall_value">
<input type="hidden" name="sipalg_value">
<input type="hidden" name="sipproxy_value">
<input type="hidden" name="l2tpalg_value">
<input type="hidden" name="ipsecalg_value">
<input type="hidden" name="pptpalg_value">
<input type="hidden" name="igmp_value" value="0">
<input type="hidden" name="hid_bri_lan1">
<input type="hidden" name="hid_bri_lan2">
<input type="hidden" name="hid_bri_lan3">
<input type="hidden" name="hid_bri_lan4">
<input type="hidden" name="hid_brig_ssid1">
<input type="hidden" name="hid_brig_ssid2">
<input type="hidden" name="hid_iptv_mask"><!-- bug 24622:add a hidden value for the new config-value(iptv_mask) -->
<input type="hidden" name="hid_iptv_show_tag">
<input type="hidden" name="hid_brig_guest_ssid1">
<input type="hidden" name="hid_brig_guest_ssid2">
<input type="hidden" name="IGMPEnable" value="Yes">
<input type="hidden" name="wan_TCPMSS" value="0">
<input type="hidden" name="WANCHANGED" value="0">
<input type="hidden" name="DefaultDmz_Active" value="0">
<input type="hidden" name="Active_Type_Yes" value="Yes">
<input type="hidden" name="Active_Type_No" value="No">

<TR>
	<TD nowrap colspan=2>
	<input type="checkbox" name="disable_spi" id="disable_spi" value="disable_spi">
	<A tabindex=-1 href="javascript:loadhelp('_WAN_wan','spi')"><B><%tcWebApi_multilingual("1","disable_port_scan_and_dos_str")%></B></A>
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap>
	<input type="checkbox" name="dmz_enable" id="dmz_enable" value="dmz_enable" onClick="checkdmzip();">
	<A tabindex=-1 href="javascript:loadhelp('_WAN_wan','dmz')"><B><%tcWebApi_multilingual("1","default_dmz_server_str")%></B></A>
	</TD>
	<TD nowrap>
	<input type="text" name="dmzip1" id="dmz_ipaddress1" size="4" maxlength="3" autocomplete="off" onFocus="this.select();" onKeyPress="return getkey('num',event)" onKeyDown="keydown(event,this);" onKeyUp="keyup(event,this);">.
	<input type="text" name="dmzip2" id="dmz_ipaddress2" size="4" maxlength="3" autocomplete="off" onFocus="this.select();" onKeyPress="return getkey('num',event)" onKeyDown="keydown(event,this);" onKeyUp="keyup(event,this);">.
	<input type="text" name="dmzip3" id="dmz_ipaddress3" size="4" maxlength="3" autocomplete="off" onFocus="this.select();" onKeyPress="return getkey('num',event)" onKeyDown="keydown(event,this);" onKeyUp="keyup(event,this);">.
	<input type="text" name="dmzip4" id="dmz_ipaddress4" size="4" maxlength="3" autocomplete="off" onFocus="this.select();" onKeyPress="return getkey('num',event)" onKeyDown="keydown(event,this);" onKeyUp="keyup(event,this);">	
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2>
	<input type="checkbox" name="rspToPing" id="response_ping" >
	<A tabindex=-1 href="javascript:loadhelp('_WAN_wan','ping')"><B><%tcWebApi_multilingual("1","respond_to_ping_on_internet_port_str")%></B></A>
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR id=show_igmp>
        <TD nowrap colspan=2>
        <input type="checkbox" name="disable_igmp" id="disable_igmp">
        <A tabindex=-1 href="javascript:loadhelp('_WAN_wan','igmp')"><B><%tcWebApi_multilingual("1","disable_igmp_proxy_str")%></B></A>
        </TD>
</TR>
<TR id=igmp_bluebar><td colspan=2><img src="/liteblue.gif" width=100% height=12></td></TR>
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_WAN_wan','mtu')"><B><%tcWebApi_multilingual("1","mtu_size_str")%></B></A><%tcWebApi_multilingual("1","in_bytes_str")%>
	</TD>
	<TD nowrap>
	<input type="text" name="wan_mtu" id="wan_mtu" size="8" maxlength="4" onKeyPress="return getkey('num',event)">
	</TD>
</TR>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_WAN_wan','nat')"><B><%tcWebApi_multilingual("1","nat_filtering_str")%></B></A>
	</TD>
	<TD nowrap>
	<input type="radio" name="NatInboundFiltering" id="nat_filtering_type" value="Secured"><%tcWebApi_multilingual("1","secured_str")%>&nbsp;
	<input type="radio" name="NatInboundFiltering" id="nat_filtering_type" value="Open"><%tcWebApi_multilingual("1","open_str")%>
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap>
	<input type="checkbox" name="disable_sipalg" id="disable_sip" value="isable_sipalg" <% if tcWebApi_get("ALGSwitch_Entry","SIPSW","h") = "off" then asp_Write("checked") end if%>>
	<A tabindex=-1 href="javascript:loadhelp('_WAN_wan','alg')"><B><%tcWebApi_multilingual("1","disable_sip_alg_str")%></B>
	</TD>
</TR>

<TR id=bluebar><td colspan=2><img src="/liteblue.gif" width=100% height=12></td></TR>

<TR id=vpn_name>
        <TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_WAN_wan','vpn')"><B><%tcWebApi_multilingual("1","vpn_passthrough_str")%></B></A>
	</TD>
</TR>
<TR id=ipsec_passthrough>
        <TD nowrap>
	<%tcWebApi_multilingual("1","ipsec_passthrough_str")%>
	</TD>
	
	<TD nowrap>
        <input type="radio" name="enable_ipsec_passthrough" value="1" ><%tcWebApi_multilingual("0","glbstr_enable")%>&nbsp;
        <input type="radio" name="enable_ipsec_passthrough" value="0" ><%tcWebApi_multilingual("0","glbstr_disable")%>
	</TD>
</TR>
<TR id=pptp_passthrough>
	<TD nowrap>
	<%tcWebApi_multilingual("1","pptp_passthrough_str")%>
	</TD>
        <TD nowrap>
        <input type="radio" name="enable_pptp_passthrough" value="1" ><%tcWebApi_multilingual("0","glbstr_enable")%>&nbsp;
        <input type="radio" name="enable_pptp_passthrough" value="0" ><%tcWebApi_multilingual("0","glbstr_disable")%>
		</TD>
</TR>
<TR id=l2tp_passthrough>
	<TD nowrap>
	<%tcWebApi_multilingual("1","l2tp_passthrough_str")%>
	</TD>
        <TD nowrap>
        <input type="radio" name="enable_l2tp_passthrough" value="1" ><%tcWebApi_multilingual("0","glbstr_enable")%>&nbsp;
        <input type="radio" name="enable_l2tp_passthrough" value="0" ><%tcWebApi_multilingual("0","glbstr_disable")%>
		</TD>
</TR>
<TR id=bri_bluebar><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<TR id=bri_string><TD colspan=2><A tabindex=-1 href="javascript:loadhelp('_WAN_wan','iptv')"><b><%tcWebApi_multilingual("1","bridge_iptv_streaming_to_str")%></b></A></TD></TR>
<TR id=bri_lans><TD colspan=2>
<input type="checkbox" name="bri_lan1">&nbsp;<b><%tcWebApi_multilingual("1","lan_str")%>-1</b>&nbsp; &nbsp; &nbsp; &nbsp;
<input type="checkbox" name="bri_lan2">&nbsp;<b><%tcWebApi_multilingual("1","lan_str")%>-2</b>&nbsp; &nbsp; &nbsp; &nbsp;
<input type="checkbox" name="bri_lan3">&nbsp;<b><%tcWebApi_multilingual("1","lan_str")%>-3</b>&nbsp; &nbsp; &nbsp; &nbsp;
<input type="checkbox" name="bri_lan4">&nbsp;<b><%tcWebApi_multilingual("1","lan_str")%>-4</b>
</TD></TR>
<TR id=bri_ssid1><TD nowrap><input type="checkbox" name="brig_ssid1">&nbsp;<b><%tcWebApi_multilingual("1","wireless_network_str")%><script> //if( an_router_flag == 1) document.write("(2.4GHz b/g/n)") 201311281430, Tony, Hide 2.4G string</script>&nbsp;<%if tcWebApi_get("WLan_Entry","SSID","h") <> "N/A" then tcWebApi_get("WLan_Entry","SSID","s") end if%></b></TD></TR>
<TR id=bri_guest_ssid1><TD nowrap><input type="checkbox" name="brig_guest_ssid1">&nbsp;<b><%tcWebApi_multilingual("1","guest_network_settings_str")%><script> if( an_router_flag == 1) document.write(" b/g/n")</script>&nbsp;NETGEAR-Guest</b></TD></TR>
<TR id=bri_ssid2><TD nowrap><input type="checkbox" name="brig_ssid2">&nbsp;<b><%tcWebApi_multilingual("1","wireless_network_5g_str")%> (5GHz a/n)&nbsp;NETGEAR</b></TD></TR>
<TR id=bri_guest_ssid2><TD nowrap><input type="checkbox" name="brig_guest_ssid2">&nbsp;<b><%tcWebApi_multilingual("1","guest_network_settings_an_str")%> a/n&nbsp;NETGEAR_Guest</b></TD></TR> 
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

</TABLE>
</div>
<div id="waiting_bar" style="display:none">
<div  align="center"><BR><BR><TR><TD align="center"><B><%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%></B></TD></TR><BR><BR></div>
<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" alt="waiting" /></div>
</div>
<%tcWebApi_multilingual("2","_WAN_wan_help.asp")%>
</FORM>
</BODY>
</HTML>
