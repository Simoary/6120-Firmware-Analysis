<%
if request_Form("submit_flag") = "macClone" then
	tcWebApi_set("Wan_PVC","Mac_Assign","WAN_MAC_ASSIGN")
	if request_Form("WAN_MAC_ASSIGN") = "2" then
		tcWebApi_set("Wan_PVC","Mac_Spoofing","Spoofmac")
	else
		tcWebApi_set("Wan_PVC","Mac_Spoofing","MacSpoofingValue") 
	end if	
	
	tcWebApi_commit("DslDefault_Common") 
end if
%>	
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/bas_ether.js"></script>
<title><%tcWebApi_multilingual("1","glbstr_title")%></title>
<meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/BRS_03A_H_macClone.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="macClone">
<input type=hidden name=wanType value="0">
<input type=hidden name=DNSproxy value="Yes">
<input type=hidden name=dnsTypeRadio value="0">
<input type=hidden name=NATEnable value="Enable">
<input type=hidden name=ENCAP value="">
<input type=hidden name=wan_TCPMSS value="0">
<input type=hidden name=wan_TCPMTU value="0">
<input type=hidden name=WAN_DefaultRoute value="Yes">
<input type=hidden name=WAN_MAC_ASSIGN value="0">
<input type=hidden name=DNSASSIGN>
<input type=hidden name=connection_time_start value="0">

<div id="title" class="page_title"><%tcWebApi_multilingual("1","internet_setup_str")%></div>
<script>
var error_invalid_ip_address_str="<%tcWebApi_multilingual("1","error_str")%>: <%tcWebApi_multilingual("1","invalid_str")%><%tcWebApi_multilingual("1","error_invalid_ip_address_str")%>";
var error_invalid_ip_subnet_mask_str="<%tcWebApi_multilingual("1","error_str")%>: <%tcWebApi_multilingual("1","error_invalid_ip_subnet_mask_str")%>";
var error_invalid_gateway_ip_address_str="<%tcWebApi_multilingual("1","error_str")%>: <%tcWebApi_multilingual("1","invalid_str")%><%tcWebApi_multilingual("1","error_invalid_gateway_ip_address_str")%>";
var error_invalid_primary_dns_str="<%tcWebApi_multilingual("1","error_invalid_primary_dns_str")%>";
var error_invalid_secondard_dns_str="<%tcWebApi_multilingual("1","error_invalid_secondard_dns_str")%>";
var alert_invalid_subnetmask_str="<%tcWebApi_multilingual("1","alert_invalid_subnetmask_str")%>";
var alert_invalid_ipaddress_str="<%tcWebApi_multilingual("1","alert_invalid_ipaddress_str")%>";
var alert_invalid_gw_str="<%tcWebApi_multilingual("1","alert_invalid_gw_str")%>";
var alert_invalid_gw_same_subnet_str="<%tcWebApi_multilingual("1","alert_invalid_gw_same_subnet_str")%>";
var alert_dns_address_be_specified_str="<%tcWebApi_multilingual("1","alert_dns_address_be_specified_str")%>";
var alert_lan_wan_not_be_same_subnet_str="<%tcWebApi_multilingual("1","alert_lan_wan_not_be_same_subnet_str")%>";
var alert_invalid_mac_str="<%tcWebApi_multilingual("0","invalid_mac_str")%>";


var wan_curr_mac="<%if tcWebApi_get("Wan_PVC","Mac_Spoofing","h") <> "N/A"  then tcWebApi_get("Wan_PVC","Mac_Spoofing","s") end if%>";
var wan_factory_mac="<%if tcWebApi_get("Lan_Entry0","MAC","h") <> "N/A"  then tcWebApi_get("Lan_Entry0","MAC","s") end if%>";
var client_ip="<%if tcWebApi_get("Lan_Entry0","Client_IP","h") <> "N/A"  then tcWebApi_get("Lan_Entry0","Client_IP","s") end if%>";
var ether_get_mac_assign= "<%if tcWebApi_get("Wan_PVC","Mac_Assign","h") <> "N/A"  then tcWebApi_get("Wan_PVC","Mac_Assign","s") end if%>";
var wan_remote_mac="<%if tcWebApi_get("Lan_Entry0","Client_MAC","h") <> "N/A"  then tcWebApi_get("Lan_Entry0","Client_MAC","s") end if%>";
var ether_get_this_mac="";
var gui_region="English";
var netgear_region=(top.netgear_region == "") ? "WW" : top.netgear_region;
//var dns_third_flag=(top.dns_third_flag == 1 && gui_region == "Russian" && (netgear_region == "WW" || netgear_region == "RU")) ? 1 : 0 ;


function loadvalue()
{	
	
	
	var form=document.forms[0];	

	<% if request_Form("submit_flag") = "macClone" then %>
		form.action="/cgi-bin/BRS_03A_detcInetType.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
		form.submit();
	<%end if%>
	
	//MAC Spoofing		
	if (ether_get_mac_assign == '0')
	{
		form.MACAssign[0].checked = true;
		form.Spoofmac.disabled=true;
	}
	else if (ether_get_mac_assign == '1')
	{
		form.MACAssign[1].checked = true;
		form.Spoofmac.disabled=true;
	}
	else
	{
		form.MACAssign[2].checked = true;
	}
	
	//form.Spoofmac.value = wan_curr_mac;
        aye_setMAC(ether_get_mac_assign);
	form.MacSpoofingValue.value =form.Spoofmac.value;

}

function aye_setMAC(n)
{
	var form=document.forms[0];		
	if (n == '0')
	{
		form.Spoofmac.value=wan_factory_mac;
		form.Spoofmac.disabled=true;
		form.MacSpoofingValue.value=wan_factory_mac;
	}	
	else if (n == '1')
	{
		form.Spoofmac.value=wan_remote_mac.toUpperCase();
		form.Spoofmac.disabled=true;
		form.MacSpoofingValue.value=wan_remote_mac.toUpperCase();
	}	
	else
	{
		
		if(wan_curr_mac != "00:11:22:33:44:55"){
			form.Spoofmac.value=wan_curr_mac;
			form.MacSpoofingValue.value=wan_curr_mac;
		}
		else{
			form.Spoofmac.value=wan_factory_mac;
			form.MacSpoofingValue.value=wan_factory_mac;
		}

		form.Spoofmac.disabled=false;
	}	
}
function click_next()
{
	var cf=document.forms[0];	
	if(cf.MACAssign[0].checked)
		cf.WAN_MAC_ASSIGN.value="0";
	else if	(cf.MACAssign[1].checked)
		cf.WAN_MAC_ASSIGN.value="1";
	else
		cf.WAN_MAC_ASSIGN.value="2";
		
	if (cf.MACAssign[2].checked )
    {
        the_mac=cf.Spoofmac.value;
        if(the_mac.indexOf(":")==-1 && the_mac.length=="12")
        {
            var tmp_mac=the_mac.substr(0,2)+":"+the_mac.substr(2,2)+":"+the_mac.substr(4,2)+":"+the_mac.substr(6,2)+":"+the_mac.substr(8,2)+":"+the_mac.substr(10,2);
            cf.Spoofmac.value = tmp_mac;
        }
        else if ( the_mac.split("-").length == 6 )
        {
            var tmp_mac = the_mac.replace(/-/g,":");
            cf.Spoofmac.value=tmp_mac;
        }
        if(maccheck_multicast(cf.Spoofmac.value) == false)
            return false;
    }

	cf.Spoofmac.value = cf.Spoofmac.value.toUpperCase();
	
	cf.submit();
}
</script>


<input type="hidden" name="MacSpoofingValue">
<input type="hidden" name="FastWeb" value="1">
<input type="hidden" name="auto_detc_flag" value="1">




<table id="MAC_Spoofing" style="display: " border="0" cellspacing="3" width="100%">
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_ether','localaddress')"><B>Router MAC Address</B></A>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="MACAssign" id="mac_assign_type" value="0" onClick="aye_setMAC(0)">Use Default Address
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="MACAssign" id="mac_assign_type" value="1" onClick="aye_setMAC(1)">Use Computer MAC Address
	</TD>
</TR>
<TR>
	<TD nowrap>
	<input type="radio" name="MACAssign" id="mac_assign_type" value="2" onClick="aye_setMAC(2)">Use This MAC Address
	</TD>
	<TD nowrap align=right>
	<input type="text" value="" name="Spoofmac" id="spoof_mac" maxlength="17" size="20" onKeyPress="return getkey('mac',event)">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR><TD nowrap align=center>

<input class="short_common_bt" type="button" name="Next" id="next" value="<%tcWebApi_multilingual("0","glbstr_next")%>" onClick="click_next()">
</TD></TR>
</table>




<%tcWebApi_multilingual("2","_BAS_ether_help.asp")%>
</FORM>
</BODY>
</HTML>
