<%
	if request_Form("submit_flag") = "1" then
		tcWebApi_set("Wan_PVC","Active","Active")
		tcWebApi_set("Wan_PVC","ISP","wanType")
		TCWebApi_set("Wan_PVC","NATENABLE","NATEnable")
		tcWebApi_set("Wan_PVC","DEFAULTROUTE","WAN_DefaultRoute")
		tcWebApi_set("Wan_PVC","MTU","wan_TCPMTU")
		tcWebApi_set("Wan_PVC","MSS","wan_TCPMSS")
		tcWebApi_set("Wan_PVC","Mac_Assign","WAN_MAC_ASSIGN")
		tcWebApi_set("Wan_PVC","Mac_Spoofing","MacSpoofingValue") 
		
		if tcWebApi_get("Wan_Common","TransMode","h") = "ATM" then
			tcWebApi_set("Wan_PVC","QOS","AdslQoS")
			tcWebApi_set("Wan_PVC","VPI","AdslVpi")
			tcWebApi_set("Wan_PVC","VCI","AdslVci")
			tcWebApi_set("Wan_PVC","ENCAP","ENCAP")
		end if
		
		tcWebApi_set("Wan_PVC","IPADDR","ether_ipaddr")
		tcWebApi_set("Wan_PVC","NETMASK","ether_subnet")
		tcWebApi_set("Wan_PVC","GATEWAY","ether_gateway")
		tcWebApi_set("Dproxy_Entry","type","DNSASSIGN")
		tcWebApi_set("Dproxy_Entry","Primary_DNS","ether_dnsaddr1")
		tcWebApi_set("Dproxy_Entry","Secondary_DNS","ether_dnsaddr2")
		tcWebApi_commit("Wan_PVC")
		tcWebApi_commit("Dproxy_Entry")
	end if
%>

<html>

<head>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<link rel="stylesheet" type="text/css" href="/style/hijack_style.css" />
<link rel="stylesheet" type="text/css" href="/style/hijack_03A_E_IP_problem_staticIP_A_inputIP.css" />
<script language="javascript" type="text/javascript" src="/script/brs_hijack.js"></script>
<script language="javascript" type="text/javascript" src="/script/funcs.js"></script>
<script language="javascript" type="text/javascript">
var lan_ip = "<%If tcWebApi_get("Lan_Entry","IP","h") <> "N/A" then tcWebApi_get("Lan_Entry","IP","s") end if%>";
var lan_subnet = "<%If tcWebApi_get("Lan_Entry","netmask","h") <> "N/A" then tcWebApi_get("Lan_Entry","netmask","s") end if%>";
</script>

</head>

<body onload="frmLoad()">
<form method="post" action="/cgi-bin/BRS_03A_E_IP_problem_staticIP_A_inputIP.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type="hidden" name="submit_flag" value="0" />
<script>

function frmLoad()
{
	<%if request_Form("submit_flag") = "1" then%>
		<%tcWebApi_staticGet("AutoDetect_Entry","Ping_Flag","h")%>
	
		setTimeout("redirect_to_checkping()",5000);
		var mainContent_div = document.getElementById("mainContent_div");
		var allBtns_div = document.getElementById("allBtns_div");
		var waiting_bar = document.getElementById("waiting_bar");
	
		allBtns_div.style.display = "none";
		mainContent_div.style.display = "none";
		waiting_bar.style.display = "";
	<%end if%>
	
	<%if request_Form("ping_finish") = "1" then%>
		var forms = document.getElementsByTagName("form");
		var cf = forms[0];
		var wan_status =  "<%tcWebApi_staticGet("AutoDetect_Entry","getResult","s")%>";
		if(wan_status=="1")
		{
			cf.action="/cgi-bin/BRS_success.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
			cf.submit();
		}
		else
		{
			location.href="/cgi-bin/BRS_05_networkIssue.asp";
		}	
	<%end if%>			
}

function checkStaticIP()
{
	var forms = document.getElementsByTagName("form");
	var cf = forms[0];

	if(check_static_ip_mask_gtw()==false)
		return false;
	if(check_ether_samesubnet()==false)
		return false;
	if(check_static_dns(true)==false)
		return false;

	cf.submit_flag.value="1";
	cf.wan_TCPMSS.value=parseInt(cf.wan_TCPMTU.value,10)-40;
	
	var mainContent_div = document.getElementById("mainContent_div");
	var allBtns_div = document.getElementById("allBtns_div");
	var waiting_bar = document.getElementById("waiting_bar");
	
	mainContent_div.style.display = "none";
	allBtns_div.style.display = "none";
	waiting_bar.style.display = "";

	cf.submit();
	return true;
}
function check_static_ip_mask_gtw()
{
	var ether_ipaddr = document.getElementById("ip_address");
	var ether_subnet = document.getElementById("subnet_mask");
	var ether_gateway = document.getElementById("gateway");

	if(checkipaddr(ether_ipaddr.value)==false || is_sub_or_broad(ether_ipaddr.value, ether_ipaddr.value, ether_subnet.value) == false)
	{
		alert(bh_invalid_ip_str);
		return false;
	}
	if(checksubnet(ether_subnet.value)==false)
	{
		alert(bh_invalid_mask_str);
		return false;
	}
	if(checkgateway(ether_gateway.value)==false)
	{
		alert(bh_invalid_gateway_str);
		return false;
	}
	if(isGateway(ether_ipaddr.value,ether_subnet.value,ether_gateway.value)==false)
	{
		alert(bh_invalid_gateway_str);
		return false;
	}
	if(isSameIp(ether_ipaddr.value, ether_gateway.value) == true)
	{
		alert(bh_invalid_gateway_str);
		return false;
	}
	if(isSameSubNet(ether_ipaddr.value,ether_subnet.value,ether_gateway.value,ether_subnet.value) == false)
	{
		alert(bh_same_subnet_ip_gtw_str);
		return false;
	}
	
	return true;
}
function check_ether_samesubnet()
{
	var ether_ipaddr = document.getElementById("ip_address");
	var ether_subnet = document.getElementById("subnet_mask");
	var ether_gateway = document.getElementById("gateway");
	
	if(isSameSubNet(ether_ipaddr.value,ether_subnet.value,lan_ip,lan_subnet) == true)
	{
		alert(bh_same_lan_wan_subnet_str);
		return false;
	}
	if(isSameSubNet(ether_ipaddr.value,lan_subnet,lan_ip,lan_subnet) == true)
	{
		alert(bh_same_lan_wan_subnet_str);
		return false;
	}
	if(isSameSubNet(ether_ipaddr.value,ether_subnet.value,lan_ip,ether_subnet.value) == true)
	{
		alert(bh_same_lan_wan_subnet_str);
		return false;
	}
	if(isSameIp(ether_ipaddr.value,lan_ip) == true)
	{
		alert(bh_same_lan_wan_subnet_str);
		return false;
	}
	document.forms[0].ether_ipaddr.value = ether_ipaddr.value;
	document.forms[0].ether_subnet.value = ether_subnet.value;
	document.forms[0].ether_gateway.value = ether_gateway.value;
	return true;
}

function check_static_dns(wan_assign)
{
	var ether_ipaddr = document.getElementById("ip_address");
	var ether_dnsaddr1 = document.getElementById("prefferd_dns");
	var ether_dnsaddr2 = document.getElementById("alternate_dns");

	if( check_DNS(ether_dnsaddr1.value,ether_dnsaddr2.value,wan_assign,ether_ipaddr.value))
	{
		document.forms[0].ether_dnsaddr1.value = ether_dnsaddr1.value;
		document.forms[0].ether_dnsaddr2.value = ether_dnsaddr2.value;
		return true;
	}
	else
		return false;
}


function redirect_to_checkping()
{
	var forms = document.getElementsByTagName("form");
	var cf = forms[0];
	cf.action="/cgi-bin/BRS_04_B_checkNet_ping.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
	cf.submit();
}

var bh_info_mark_ip_str="<%tcWebApi_multilingual("1","bh_info_mark_ip_str")%>";
var bh_info_mark_mask_str="<%tcWebApi_multilingual("1","bh_info_mark_mask_str")%>";
var bh_constatus_defgtw_str="<%tcWebApi_multilingual("1","bh_constatus_defgtw_str")%>";
var bh_preferred_dns_str="<%tcWebApi_multilingual("1","bh_preferred_dns_str")%>";
var bh_alternate_dns_str="<%tcWebApi_multilingual("1","bh_alternate_dns_str")%>";
var bh_invalid_ip_str="<%tcWebApi_multilingual("1","bh_invalid_ip_str")%>";
var bh_invalid_mask_str="<%tcWebApi_multilingual("1","bh_invalid_mask_str")%>";
var bh_invalid_gateway_str="<%tcWebApi_multilingual("1","bh_invalid_gateway_str")%>";
var bh_same_subnet_ip_gtw_str="<%tcWebApi_multilingual("1","bh_same_subnet_ip_gtw_str")%>";
var bh_same_lan_wan_subnet_str="<%tcWebApi_multilingual("1","bh_same_lan_wan_subnet_str")%>";
var dns_must_specified_str="<%tcWebApi_multilingual("1","dns_must_specified_str")%>";
var invalid_primary_dns_str="<%tcWebApi_multilingual("1","invalid_primary_dns_str")%>";
var invalid_second_dns_str="<%tcWebApi_multilingual("1","invalid_second_dns_str")%>";
</script>

<input type="hidden" name="wan_pvc" value="0" />
<input type="hidden" name="Active" value="Yes" />
<input type="hidden" name="wanType" value="1" />
<input type="hidden" name="NATEnable" value="Enable" />
<input type="hidden" name="WAN_DefaultRoute" value="Yes" />

<input type="hidden" name="ether_dnsaddr1"/>
<input type="hidden" name="ether_dnsaddr2"/>
<input type="hidden" name="ether_ipaddr"/>
<input type="hidden" name="ether_subnet"/>
<input type="hidden" name="ether_gateway"/>
<input type=hidden name=wan_TCPMSS value="1460">
<input type=hidden name=wan_TCPMTU value="<%if TCWebAPI_get("AutoDetect_Entry", "detecting_mtu", "h") <> "0" then TCWebAPI_staticGet("AutoDetect_Entry", "detecting_mtu", "s") else asp_Write("1500") end if %>">
<input type=hidden name=WAN_MAC_ASSIGN value="0">
<input type=hidden name=MacSpoofingValue value="<%if tcWebApi_get("Lan_Entry0","MAC","h") <> "N/A"  then tcWebApi_get("Lan_Entry0","MAC","s") end if%>";>
<input type=hidden name=DNSASSIGN value="1">
<input type=hidden name=ping_flag value="static">
<INPUT type=hidden name=AdslVpi value="<%if TCWebAPI_get("AutoDetect_Entry", "VPI", "h") <> "N/A" then TCWebAPI_staticGet("AutoDetect_Entry", "VPI", "s") else asp_Write("0") end if %>">
<INPUT type=hidden name=AdslVci value="<%if TCWebAPI_get("AutoDetect_Entry", "VCI", "h") <> "N/A" then TCWebAPI_staticGet("AutoDetect_Entry", "VCI", "s") else asp_Write("33") end if %>">
<INPUT type=hidden name=ENCAP value="<%if TCWebAPI_get("AutoDetect_Entry", "Encapsulation", "h") = "VC" then if TCWebAPI_get("AutoDetect_Entry", "ConnectType", "h") = "STATUS_PPPOA" then asp_Write("PPPoA VC-Mux") else asp_Write("PPPoE VC-Mux") end if else if TCWebAPI_get("AutoDetect_Entry", "ConnectType", "h") = "STATUS_PPPOA" then asp_Write("PPPoA LLC") else asp_Write("PPPoE LLC") end if end if%>">
<INPUT type=hidden name=AdslQoS value="ubr">
<input type=hidden name=default_flag value="1" />

<div class="wizard_content_div">

	<div class="wizard_words_div">
			<h1><%tcWebApi_multilingual("1","bh_fix_ip_setting_str")%></h1>
			<div id="mainContent_div">
				<p><%tcWebApi_multilingual("1","bh_enter_ip_setting_str")%></p>
				<div id="IP_addr" class="input_left_div" align="right"><%tcWebApi_multilingual("1","bh_info_mark_ip_str")%></div>
				
				<div class="input_img_div">
					<input type="text" align="right" id="ip_address" maxlength="15" name="ip_address" class="input_text" onkeypress ="return getkey('ipaddr', event)"/>
				</div>

				<div id="Sub_mask" class="input_left_div" align="right"><%tcWebApi_multilingual("1","bh_info_mark_mask_str")%></div>
				
				<div class="input_img_div">
					<input type="text" align="right" id="subnet_mask" maxlength="15" name="subnet_mask" class="input_text" onkeypress ="return getkey('ipaddr', event)"/>
				</div>
				
				<div id="Gateway" class="input_left_div" align="right"><%tcWebApi_multilingual("1","bh_constatus_defgtw_str")%></div>
				
				<div class="input_img_div">
					<input type="text" align="right" id="gateway" maxlength="15" name="gateway" class="input_text" onkeypress ="return getkey('ipaddr', event)"/>
				</div>
				
				<div id="preDNS" class="input_left_div" align="right"><%tcWebApi_multilingual("1","bh_preferred_dns_str")%></div>
				
				<div class="input_img_div">
					<input type="text" align="right" id="prefferd_dns" maxlength="15" name="preferred_dns" class="input_text" onkeypress ="return getkey('ipaddr', event)"/>
				</div>
				
				<div id="alteDNS" class="input_left_div" align="right"><%tcWebApi_multilingual("1","bh_alternate_dns_str")%></div>
				
				<div class="input_img_div">
					<input type="text" align="right" id="alternate_dns" maxlength="15" name="alternate_dns" class="input_text" onkeypress ="return getkey('ipaddr', event)"/>
				</div>
				
				<div style="clear:both"></div>
			</div>
		
	</div>
	
	<div id="allBtns_div" class="wizard_buttons_div" align="right">
		<div id="btnsContainer_div" class="buttons_img_div" onclick='return checkStaticIP();'>
			<img src="/image/ca-little-purple-button.gif" />
			<div id="btn_text_div" class="buttons_words_div" align="center"><%tcWebApi_multilingual("0","glbstr_next")%></div>
			
		</div>	
	</div>
	
	<div id="waiting_bar" style="display:none">
		<div  align="center"><BR><BR><TR><TD align="center"><B><%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%></B></TD></TR><BR><BR></div>
		<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" alt="waiting" /></div>
	</div>
	
</div>

</form>
</body>

</html>
