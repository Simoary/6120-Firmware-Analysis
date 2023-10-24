<%
	if request_Form("default_flag") <> "" then
		tcWebApi_set("Account_Entry0", "firstuse","default_flag")
	end if
	
	if request_Form("WANAssign") <> "" then
		tcWebApi_set("Wan_PVC","ISP","wanType")
		TCWebApi_set("Dproxy_Entry","type","DNSASSIGN")
		TCWebApi_set("Wan_PVC","NATENABLE","NATEnable")
		tcWebApi_set("Wan_PVC","ENCAP","ENCAP")
		tcWebApi_set("Wan_PVC","DEFAULTROUTE","WAN_DefaultRoute")
		tcWebApi_set("Wan_PVC","MTU","wan_TCPMTU")
		tcWebApi_set("Wan_PVC","MSS","wan_TCPMSS")
		tcWebApi_set("Wan_PVC","RUNTEST","runtest")
		tcWebApi_set("Wan_PVC","HOSTNAME","system_name")
		tcWebApi_set("Wan_PVC","DOMAINNAME","domain_name")
		
		if request_Form("WANAssign") = "Static" then	
			tcWebApi_set("Wan_PVC","IPADDR","ether_ipaddr")
			tcWebApi_set("Wan_PVC","NETMASK","ether_subnet")
			tcWebApi_set("Wan_PVC","GATEWAY","ether_gateway")
		end if
		
		tcWebApi_set("Wan_PVC","Mac_Assign","WAN_MAC_ASSIGN")
		if request_Form("WAN_MAC_ASSIGN") = "2" then
			tcWebApi_set("Wan_PVC","Mac_Spoofing","Spoofmac")
		else
			tcWebApi_set("Wan_PVC","Mac_Spoofing","MacSpoofingValue") 
		end if	
		
		if request_Form("DNSAssign") = "1" then
			if request_Form("ether_dnsaddr1") <> "" then
				TCWebApi_set("Dproxy_Entry","Primary_DNS","ether_dnsaddr1")
			end if	
				TCWebApi_set("Dproxy_Entry","Secondary_DNS","ether_dnsaddr2")
		end if
		tcWebApi_set("WanInfo_Entry","connection_time_start","connection_time_start")
		tcWebApi_commit("Wan_PVC")
		tcWebApi_commit("Dproxy_Entry")
		tcWebApi_save()
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
<form method="POST" action="/cgi-bin/BAS_ether.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="ether">
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

var lan_ip="<%if tcWebApi_get("Lan_Entry","IP","h") <> "N/A" then tcWebApi_get("Lan_Entry","IP","s") else asp_write("192.168.1.1") end if%>";
var lan_subnet="<%if tcWebApi_get("Lan_Entry","netmask","h") <> "N/A" then tcWebApi_get("Lan_Entry","netmask","s") else asp_write("255.255.255.0") end if%>";
var old_wan_type="dhcp";
var old_wan_ip="172.17.144.126";
var old_wan_assign="0";
var wan_curr_mac="<%if tcWebApi_get("Wan_PVC","Mac_Spoofing","h") <> "N/A"  then tcWebApi_get("Wan_PVC","Mac_Spoofing","s") end if%>";
var wan_factory_mac="<%if tcWebApi_get("Lan_Entry0","MAC","h") <> "N/A"  then tcWebApi_get("Lan_Entry0","MAC","s") end if%>";
var client_ip="<%if tcWebApi_get("Lan_Entry0","Client_IP","h") <> "N/A"  then tcWebApi_get("Lan_Entry0","Client_IP","s") end if%>";
var ether_get_mac_assign= "<%if tcWebApi_get("Wan_PVC","Mac_Assign","h") <> "N/A"  then tcWebApi_get("Wan_PVC","Mac_Assign","s") end if%>";
var wan_remote_mac="<%if tcWebApi_get("Lan_Entry0","Client_MAC","h") <> "N/A"  then tcWebApi_get("Lan_Entry0","Client_MAC","s") end if%>";
var ether_get_this_mac="";
var gui_region="English";
var netgear_region=(top.netgear_region == "") ? "WW" : top.netgear_region;
//var dns_third_flag=(top.dns_third_flag == 1 && gui_region == "Russian" && (netgear_region == "WW" || netgear_region == "RU")) ? 1 : 0 ;
var dns_third_flag=top.dns_third_flag;
var wanproto_type="dhcp";
var wan_mtu_now='1500';
var select_basic="1";
var select_type="0";
var jp_multiPPPoE="";
//var have_l2tp=( (gui_region == "Russian" && top.l2tp_flag == 1 && (netgear_region.toUpperCase() == "WW")) || netgear_region.toUpperCase() == "RU") ? 1 : 0 ;
var have_l2tp = (top.l2tp_flag == 1) ? 1 : 0;
var maxchars = 120;
var delay_time = 300;
var charcount = 0;

function loadvalue()
{	
	
	/*	
	var wanlan_conflict = "<%if tcWebApi_get("Lan_Entry","changed","h") <> "N/A" then tcWebApi_get("Lan_Entry","changed","s") end if%>"
	if(wanlan_conflict=="1")
	{
		var next_lanip = "<%tcWebApi_get("Lan_Entry","IP","s")%>";
		window.location.href = "/cgi-bin/BRS_wanlan_conflict.asp?index="+wanlan_conflict+";"+next_lanip;
	}
	*/
	var form=document.forms[0];	
	var active = "<% if tcWebApi_staticGet("WanInfo_Entry","Active","h") <> "N/A" then tcWebApi_staticGet("WanInfo_Entry","Active","s") end if%>";
	if( active == "") active = "0";	
	<% if tcWebApi_get("Wan_PVC","ISP","h") = "1" then %>
            <% if tcWebApi_get("Wan_PVC","ENCAP","h") = "1483 Routed IP LLC(IPoA)" then %>
                form.WANAssign[2].checked = true;
	    <%elseif tcWebApi_get("Wan_PVC","ENCAP","h") = "1483 Routed IP VC-Mux" then %>
                form.WANAssign[2].checked = true;
            <%else%>		   
	        form.WANAssign[1].checked = true;
	    <%end if%>
            var ether_get_ip="<%tcWebApi_get("Wan_PVC","IPADDR","s")%>";
	    var ether_get_subnet="<%tcWebApi_get("Wan_PVC","NETMASK","s")%>";
	    var ether_get_gateway="<%tcWebApi_get("Wan_PVC","GATEWAY","s")%>";
	<% else %>
	    form.WANAssign[0].checked = true;
            var ether_get_ip = "<% if tcWebApi_staticGet("WanInfo_Entry","IP","h") <> "N/A" then tcWebApi_staticGet("WanInfo_Entry","IP","s") end if%>"
            var ether_get_subnet = "<% if tcWebApi_staticGet("WanInfo_Entry","Mask","h") <> "N/A" then tcWebApi_staticGet("WanInfo_Entry","Mask","s") end if%>"
            var ether_get_gateway = "<% if tcWebApi_staticGet("WanInfo_Entry","Gateway","h") <> "N/A" then tcWebApi_staticGet("WanInfo_Entry","Gateway","s") end if%>";
	<%end if%>	

	//Decide MTU and MSS according Netgear Spec
	var current_mtu = "<%if tcWebApi_get("Wan_PVC","MTU","h") <> "N/A" then tcWebApi_get("Wan_PVC","MTU","s") end if%>";
	if(current_mtu=="" ||　current_mtu=="1492" || current_mtu=="1458")
		form.wan_TCPMTU.value="1500";
	else 
	{
		if(parseInt(current_mtu,10)>=1500)
			form.wan_TCPMTU.value="1500";
		else
			form.wan_TCPMTU.value = current_mtu;	
	}
	form.wan_TCPMSS.value = parseInt(form.wan_TCPMTU.value,10) - 40;
	
	//Decide ENCAP
	var wan_type = "<%tcWebApi_get("Wan_PVC","ENCAP","s")%>";
	if(wan_type.search("LLC") == -1)
	   form.ENCAP.value = "VC";
	else
	   form.ENCAP.value = "LLC";

	if((wan_type.search("IP") != -1 && active == "1") || form.WANAssign[1].checked == true || form.WANAssign[2].checked == true){
	    if (ether_get_ip!="")
	    {
	    	var ip_array=ether_get_ip.split('.');
	    	form.WPethr1.value=ip_array[0];
	    	form.WPethr2.value=ip_array[1];
	    	form.WPethr3.value=ip_array[2];
	    	form.WPethr4.value=ip_array[3];
			
	    	form.IPoAethr1.value=ip_array[0];
	    	form.IPoAethr2.value=ip_array[1];
	    	form.IPoAethr3.value=ip_array[2];
	    	form.IPoAethr4.value=ip_array[3];
	    }
	    if (ether_get_subnet!="")
	    {
	    	var mask_array=ether_get_subnet.split('.');
	    	form.WMask1.value=mask_array[0];
	    	form.WMask2.value=mask_array[1];	
	    	form.WMask3.value=mask_array[2];
	    	form.WMask4.value=mask_array[3]; 
			
	    	form.IPoAMask1.value=mask_array[0];
	    	form.IPoAMask2.value=mask_array[1];	
	    	form.IPoAMask3.value=mask_array[2];
	    	form.IPoAMask4.value=mask_array[3];
 	    }
	    if (ether_get_gateway!="")
 	    {
            	var gtw_array=ether_get_gateway.split('.');
	    	form.WGateway1.value=gtw_array[0];
	    	form.WGateway2.value=gtw_array[1];
	    	form.WGateway3.value=gtw_array[2];
	    	form.WGateway4.value=gtw_array[3];	
			
	    	form.IPoAGateway1.value=gtw_array[0];
	    	form.IPoAGateway2.value=gtw_array[1];
	    	form.IPoAGateway3.value=gtw_array[2];
	    	form.IPoAGateway4.value=gtw_array[3];	
	    }
	}
	//NAT
	<% if tcWebApi_get("Wan_PVC","NATENABLE","h") = "N/A" then %>
		form.en_nat[0].checked = true;
	<% elseif tcWebApi_get("Wan_PVC","NATENABLE","h") = "Enable" then %>
		form.en_nat[0].checked = true;
	<%elseif tcWebApi_get("Wan_PVC","NATENABLE","h") = "Disable" then %>	
		form.en_nat[1].checked = true;
	<%end if%>	
		
	<% if tcWebApi_get("Dproxy_Entry","type","h") = "0" then %>
		form.DNSAssign[0].checked = true;
                var ether_get_dns1 = "<% if tcWebApi_staticGet("WanInfo_Entry","DNS1","h") <> "N/A" then tcWebApi_staticGet("WanInfo_Entry","DNS1","s") end if%>";
            var ether_get_dns2 = "<% if tcWebApi_staticGet("WanInfo_Entry","DNS2","h") <> "N/A" then tcWebApi_staticGet("WanInfo_Entry","DNS2","s") end if%>";
	<%else%>	
		form.DNSAssign[1].checked = true;
	        var ether_get_dns1="<%if tcWebApi_get("Dproxy_Entry","Primary_DNS","h") <> "" then tcWebApi_get("Dproxy_Entry","Primary_DNS","s") end if%>";
	        var ether_get_dns2="<%if tcWebApi_get("Dproxy_Entry","Secondary_DNS","h") <> "" then tcWebApi_get("Dproxy_Entry","Secondary_DNS","s") end if%>";
	<%end if%>	
		
	if((wan_type.search("IP") != -1 && active == "1") || form.DNSAssign[1].checked == true){
	    if (ether_get_dns1!="" && ether_get_dns1.indexOf(":")==-1) 
	    {
	    	var dns1_array=ether_get_dns1.split('.');
	    	form.DAddr1.value=dns1_array[0];
	    	form.DAddr2.value=dns1_array[1];
	    	form.DAddr3.value=dns1_array[2];
	    	form.DAddr4.value=dns1_array[3];
	    }
	    if (ether_get_dns2!="" && ether_get_dns2.indexOf(":")==-1)
	    {
	    	var dns2_array=ether_get_dns2.split('.');
	    	form.PDAddr1.value=dns2_array[0];
	    	form.PDAddr2.value=dns2_array[1];
	    	form.PDAddr3.value=dns2_array[2];
	    	form.PDAddr4.value=dns2_array[3];
	    }
	}	
	
	<% if tcWebApi_get("LiveParentalCtl_Common","Active","h") = "Yes" then %>
	if (ether_get_dns1!="" && ether_get_dns1.indexOf(":")==-1) 
	{
		var dns1_array=ether_get_dns1.split('.');
		form.DAddr1.value=dns1_array[0];
		form.DAddr2.value=dns1_array[1];
		form.DAddr3.value=dns1_array[2];
		form.DAddr4.value=dns1_array[3];
	}
	if (ether_get_dns2!="" && ether_get_dns2.indexOf(":")==-1)
	{
		var dns2_array=ether_get_dns2.split('.');
		form.PDAddr1.value=dns2_array[0];
		form.PDAddr2.value=dns2_array[1];
		form.PDAddr3.value=dns2_array[2];
		form.PDAddr4.value=dns2_array[3];
	}
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
	aye_setIP();
	aye_setDNS();
	goTestApply();
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
		form.Spoofmac.value=wan_curr_mac;
		form.Spoofmac.disabled=false;
		form.MacSpoofingValue.value=wan_curr_mac;
	}	
}

function aye_setIP()
{
	var form=document.forms[0];
	if(form.WANAssign[0].checked){
	    //Disable IPoE
		form.WPethr1.disabled=true;form.WPethr2.disabled=true;form.WPethr3.disabled=true;form.WPethr4.disabled=true;
		form.WMask1.disabled=true;form.WMask2.disabled=true;form.WMask3.disabled=true;form.WMask4.disabled=true;
		form.WGateway1.disabled=true;form.WGateway2.disabled=true;form.WGateway3.disabled=true;form.WGateway4.disabled=true;
		//form.WPethr1.value="";form.WPethr2.value="";form.WPethr3.value="";form.WPethr4.value="";
		//form.WMask1.value="";form.WMask2.value="";form.WMask3.value="";form.WMask4.value="";
		//form.WGateway1.value="";form.WGateway2.value="";form.WGateway3.value="";form.WGateway4.value="";
		
		//Disable IPoA
		form.IPoAethr1.disabled=true;form.IPoAethr2.disabled=true;form.IPoAethr3.disabled=true;form.IPoAethr4.disabled=true;
		form.IPoAMask1.disabled=true;form.IPoAMask2.disabled=true;form.IPoAMask3.disabled=true;form.IPoAMask4.disabled=true;
		form.IPoAGateway1.disabled=true;form.IPoAGateway2.disabled=true;form.IPoAGateway3.disabled=true;form.IPoAGateway4.disabled=true;
		form.IPoAethr1.value="";form.IPoAethr2.value="";form.IPoAethr3.value="";form.IPoAethr4.value="";
		form.IPoAMask1.value="";form.IPoAMask2.value="";form.IPoAMask3.value="";form.IPoAMask4.value="";
		form.IPoAGateway1.value="";form.IPoAGateway2.value="";form.IPoAGateway3.value="";form.IPoAGateway4.value="";
	}else if(form.WANAssign[1].checked){
		//Enable IPoE
		form.WPethr1.disabled=false;form.WPethr2.disabled=false;form.WPethr3.disabled=false;form.WPethr4.disabled=false;
		form.WMask1.disabled=false;form.WMask2.disabled=false;form.WMask3.disabled=false;form.WMask4.disabled=false;
		form.WGateway1.disabled=false;form.WGateway2.disabled=false;form.WGateway3.disabled=false;form.WGateway4.disabled=false;
	
		//Disable IPoA
		form.IPoAethr1.disabled=true;form.IPoAethr2.disabled=true;form.IPoAethr3.disabled=true;form.IPoAethr4.disabled=true;
		form.IPoAMask1.disabled=true;form.IPoAMask2.disabled=true;form.IPoAMask3.disabled=true;form.IPoAMask4.disabled=true;
		form.IPoAGateway1.disabled=true;form.IPoAGateway2.disabled=true;form.IPoAGateway3.disabled=true;form.IPoAGateway4.disabled=true;
		form.IPoAethr1.value="";form.IPoAethr2.value="";form.IPoAethr3.value="";form.IPoAethr4.value="";
		form.IPoAMask1.value="";form.IPoAMask2.value="";form.IPoAMask3.value="";form.IPoAMask4.value="";
		form.IPoAGateway1.value="";form.IPoAGateway2.value="";form.IPoAGateway3.value="";form.IPoAGateway4.value="";
   }else{
	    //Enable IPoA
   		form.IPoAethr1.disabled=false;form.IPoAethr2.disabled=false;form.IPoAethr3.disabled=false;form.IPoAethr4.disabled=false;
		form.IPoAMask1.disabled=false;form.IPoAMask2.disabled=false;form.IPoAMask3.disabled=false;form.IPoAMask4.disabled=false;
		form.IPoAGateway1.disabled=false;form.IPoAGateway2.disabled=false;form.IPoAGateway3.disabled=false;form.IPoAGateway4.disabled=false;
		
		//Disable IPoE
		form.WPethr1.disabled=true;form.WPethr2.disabled=true;form.WPethr3.disabled=true;form.WPethr4.disabled=true;
		form.WMask1.disabled=true;form.WMask2.disabled=true;form.WMask3.disabled=true;form.WMask4.disabled=true;
		form.WGateway1.disabled=true;form.WGateway2.disabled=true;form.WGateway3.disabled=true;form.WGateway4.disabled=true;
		form.WPethr1.value="";form.WPethr2.value="";form.WPethr3.value="";form.WPethr4.value="";
		form.WMask1.value="";form.WMask2.value="";form.WMask3.value="";form.WMask4.value="";
		form.WGateway1.value="";form.WGateway2.value="";form.WGateway3.value="";form.WGateway4.value="";
	}
}

function aye_setDNS()
{
	var form=document.forms[0];
	
	if(form.DNSAssign[0].checked){
		form.DAddr1.disabled = true;form.DAddr2.disabled = true;form.DAddr3.disabled = true;form.DAddr4.disabled = true;
		form.PDAddr1.disabled = true;form.PDAddr2.disabled = true;form.PDAddr3.disabled = true;form.PDAddr4.disabled = true;
		//form.DAddr1.value="";form.DAddr2.value="";form.DAddr3.value="";form.DAddr4.value="";
		//form.PDAddr1.value="";form.PDAddr2.value="";form.PDAddr3.value="";form.PDAddr4.value="";
	}else{
		<% if tcWebApi_get("LiveParentalCtl_Common","Active","h") = "Yes" then %>
		form.DAddr1.disabled = true;form.DAddr2.disabled = true;form.DAddr3.disabled = true;form.DAddr4.disabled = true;
		form.PDAddr1.disabled = true;form.PDAddr2.disabled = true;form.PDAddr3.disabled = true;form.PDAddr4.disabled = true;
		<%else%>
		form.DAddr1.disabled = false;form.DAddr2.disabled = false;form.DAddr3.disabled = false;form.DAddr4.disabled = false;
		form.PDAddr1.disabled = false;form.PDAddr2.disabled = false;form.PDAddr3.disabled = false;form.PDAddr4.disabled = false;
		<%end if%>
	}
}
function check_wanlan_conflict()
{
	var next_lanip;

	var cf=document.forms[0];
	if(cf.WANAssign[1].checked)
	{
		var lanaddr_array = new Array();
		lanaddr_array =cf.lan_ip.value.split('.');
		
		if( (cf.WPethr1.value==lanaddr_array[0] && cf.WPethr2.value==lanaddr_array[1] && cf.WPethr3.value==lanaddr_array[2]) || (cf.IPoAethr1.value==lanaddr_array[0] && cf.IPoAethr2.value==lanaddr_array[1] && cf.IPoAethr3.value==lanaddr_array[2]) )
		{
			var dhcp_type = "<%If tcWebApi_get("Lan_Dhcp","type","h") <> "N/A" then tcWebApi_get("Lan_Dhcp","type","s") end if%>";
			if(lanaddr_array[0]=="192" && lanaddr_array[1]=="168" && lanaddr_array[2]=="1")
			{
				next_lanip="10.0.0.1";
				
			}
			else if(lanaddr_array[0]=="10" && lanaddr_array[1]=="0" && lanaddr_array[2]=="0")
			{
				next_lanip="172.16.0.1";
				
			}
			else if(lanaddr_array[0]=="172" && lanaddr_array[1]=="16" && lanaddr_array[2]=="0")
			{
				next_lanip="192.168.1.1";
				
			}
			else
			{
				next_lanip="192.168.1.1";
				
			}
			//alert("JIMDBG_coming submit!!");
			//cf.action="BRS_wanlan_conflict.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
			cf.action="BRS_wanlan_conflict.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>"+"&ip="+next_lanip;
			cf.submit();
			return false;
			
			//return next_lanip;
		}
	}
	else
	{
		return "0.0.0.0";
	}
}
function goTestApply()
{
	<%if request_Form("submit_flag") <> "" then%>
	var winoptions = "width=640,height=480,menubar=yes,toolbar=yes,status=yes,location=yes,resizable=yes";
	if(document.forms[0].runtest.value == "true")
		window.open('BAS_wtest_d.asp','test_win',winoptions);
	<%end if%>	
}
</script>

<input type="hidden" name="conflict_wanlan">
<input type="hidden" name="change_wan_type">
<input type="hidden" name="ether_ipaddr">
<input type="hidden" name="ether_subnet">
<input type="hidden" name="ether_gateway">
<input type="hidden" name="ether_dnsaddr1">
<input type="hidden" name="ether_dnsaddr2">
<input type="hidden" name="ether_dnsaddr3">
<input type="hidden" name="hid_mtu_value">
<input type="hidden" name="lan_ip" value="<%If tcWebApi_get("Lan_Entry","IP","h") <> "N/A" then tcWebApi_get("Lan_Entry","IP","s") end if%>">
<input type="hidden" name="runtest" value="<%If tcWebApi_get("Wan_PVC","RUNTEST","h") <> "N/A" then tcWebApi_get("Wan_PVC","RUNTEST","s") else asp_write("false") end if%>">
<input type="hidden" name="MacSpoofingValue">

<div id="fix_button" class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
	<input class="common_bt" type="submit" name="Test" id="test" value="<%tcWebApi_multilingual("0","glbstr_test")%>" onClick="return check_ether(document.forms[0],1)">&nbsp;&nbsp;
	<input class="cancel_bt" type="button" name="Cancel" id="cancel" value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick=location.href="BAS_ether.asp";>&nbsp;&nbsp;
    <input class="apply_bt" type="submit" name="Apply" id="apply" value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick="return check_ether(document.forms[0],0)">
		
        </TD>
</TR>
</TABLE>
</div><!--button-->
<div id="bas_top" style="width: 625px; height: 85px; background-color: #ffffff; position: absolute; top: 50px; left: 0px;">
<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<TR><TD nowrap>
<A tabindex=-1 href="javascript:loadhelp('_BAS_ether','question')"><B><%tcWebApi_multilingual("1","does_your_internet_connection_str")%></B></A>
</TD></TR>
<TR>
        <TD nowrap>
        <input onclick='goto_basic_login_page();'  type="radio" name="loginreq" id="loginreq" value="pppoe"><%tcWebApi_multilingual("1","yes_str")%>
        </TD>
</TR>
<TR>
        <TD nowrap>
        <input onclick='' type="radio" name="loginreq" id="loginreq" value="dhcp" checked="true"><%tcWebApi_multilingual("1","no_str")%>
        </TD>
</TR>
</TABLE>
</div><!--bas_top-->
<div id="main" class="main_bas">
<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_BAS_ether','acname')"><%tcWebApi_multilingual("1","if_required_str")%></A></TD>
	<TD nowrap align=right>
	<input type="text" name="system_name" id="system_name" size="20" maxlength="60" value="<%if tcWebApi_get("Wan_PVC","HOSTNAME","h") = "N/A" then tcWebApi_get("SkuId_Entry","ProductName","s") elseif tcWebApi_get("Wan_PVC","HOSTNAME","h") = "" then tcWebApi_get("SkuId_Entry","ProductName","s") else tcWebApi_get("Wan_PVC","HOSTNAME","s") end if%>" onKeyPress="return getkey('apname',event)">
	</TD>
</TR>
<TR>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_BAS_ether','doname')"><%tcWebApi_multilingual("1","if_required_str_1")%></A></TD>
	<TD nowrap align=right>
	<input type="text" name="domain_name" id="domain_name"size="20" maxlength="60" value="<%if tcWebApi_get("Wan_PVC","DOMAINNAME","h") <> "N/A" then  tcWebApi_get("Wan_PVC","DOMAINNAME","s") end if%>" onKeyPress="return getkey( 'ddns_hostname',event)">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_ether','InternetIP')"><B><%tcWebApi_multilingual("1","internet_ip_address_str")%></B></A>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="WANAssign" id="wan_assign_type" value="dhcp" onClick="aye_setIP()"><%tcWebApi_multilingual("1","get_dynamically_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="WANAssign" id="wan_assign_type" value="Static" onClick="aye_setIP()"><%tcWebApi_multilingual("1","use_static_ip_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap><img src="/spacer.gif" width=20 height=12 border=0><%tcWebApi_multilingual("1","ip_address_str")%></TD>
	<TD nowrap align=right>
	<input type="text" name="WPethr1"  id="wan_ipaddress1" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="WPethr2"  id="wan_ipaddress2" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="WPethr3"  id="wan_ipaddress3" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="WPethr4"  id="wan_ipaddress4" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD>
</TR>
<TR>
	<TD nowrap><img src="/spacer.gif" width=20 height=12 border=0><%tcWebApi_multilingual("1","ip_subnet_mask_str")%></TD>
	<TD nowrap align=right>
	<input type="text" name="WMask1"  id="wan_netmask1" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="WMask2"  id="wan_netmask2" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="WMask3"  id="wan_netmask3" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="WMask4"  id="wan_netmask4" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD> 
</TR>
<TR>
	<TD nowrap><img src="/spacer.gif" width=20 height=12 border=0><%tcWebApi_multilingual("1","gateway_ip_address_str")%></TD>
	<TD nowrap align=right>
	<input type="text" name="WGateway1"  id="wan_gateway1" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="WGateway2"  id="wan_gateway2" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="WGateway3"  id="wan_gateway3" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="WGateway4"  id="wan_gateway4" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD>
</TR>

<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="WANAssign" id="wan_assign_type" value="Static" onClick="aye_setIP()"><%tcWebApi_multilingual("1","use_ip_over_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap><img src="/spacer.gif" width=20 height=12 border=0><%tcWebApi_multilingual("1","ip_address_str")%></TD>
	<TD nowrap align=right>
	<input type="text" name="IPoAethr1"  id="IPoAethr1" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="IPoAethr2"  id="IPoAethr2" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="IPoAethr3"  id="IPoAethr3" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="IPoAethr4"  id="IPoAethr4" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD>
</TR>
<TR>
	<TD nowrap><img src="/spacer.gif" width=20 height=12 border=0><%tcWebApi_multilingual("1","ip_subnet_mask_str")%></TD>
	<TD nowrap align=right>
	<input type="text" name="IPoAMask1"  id="IPoAMask1" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="IPoAMask2"  id="IPoAMask2" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="IPoAMask3"  id="IPoAMask3" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="IPoAMask4"  id="IPoAMask4" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD> 
</TR>
<TR>
	<TD nowrap><img src="/spacer.gif" width=20 height=12 border=0><%tcWebApi_multilingual("1","gateway_ip_address_str")%></TD>
	<TD nowrap align=right>
	<input type="text" name="IPoAGateway1"  id="IPoAGateway1" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="IPoAGateway2"  id="IPoAGateway2" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="IPoAGateway3"  id="IPoAGateway3" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="IPoAGateway4"  id="IPoAGateway4" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD>
</TR>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_ether','DNSaddress')"><B><%tcWebApi_multilingual("1","domain_name_server_str")%></B></A>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="DNSAssign" id="dns_assign_type" value="0" onClick="aye_setDNS()"><%tcWebApi_multilingual("1","get_auto_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="DNSAssign" id="dns_assign_type" value="1" onClick="aye_setDNS()"><%tcWebApi_multilingual("1","use_these_dns_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap><img src="/spacer.gif" width=20 height=12 border=0><%tcWebApi_multilingual("1","primary_dns_str")%></TD>
	<TD nowrap align=right>
	<input type="text" name="DAddr1"  id="primary_dns_address1" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="DAddr2"  id="primary_dns_address2" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="DAddr3"  id="primary_dns_address3" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="DAddr4"  id="primary_dns_address4" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD>
</TR>
<TR>
	<TD nowrap><img src="/spacer.gif" width=20 height=12 border=0><%tcWebApi_multilingual("1","secondary_dns_str")%></TD>
	<TD nowrap align=right>
	<input type="text" name="PDAddr1"  id="second_dns_address1" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="PDAddr2"  id="second_dns_address2" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="PDAddr3"  id="second_dns_address3" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="PDAddr4"  id="second_dns_address4" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">	
	</TD>
</TR>
<!--
<TR id=third_dns>
        <TD nowrap><img src="/spacer.gif" width=20 height=12 border=0><%tcWebApi_multilingual("1","third_dns_str")%></TD>
        <TD nowrap align=right>
        <input type="text" name="TDAddr1"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
        <input type="text" name="TDAddr2"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
        <input type="text" name="TDAddr3"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
        <input type="text" name="TDAddr4"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
        </TD>
</TR>-->
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</TABLE>
<table id="MAC_Spoofing" style="display: " border="0" cellspacing="3" width="100%">
<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_ether','localaddress')"><B><%tcWebApi_multilingual("1","router_mac_address_str")%></B></A>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="MACAssign" id="mac_assign_type" value="0" onClick="aye_setMAC(0)"><%tcWebApi_multilingual("1","use_defualt_address_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="MACAssign" id="mac_assign_type" value="1" onClick="aye_setMAC(1)"><%tcWebApi_multilingual("1","use_computer_mac_address_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap>
	<input type="radio" name="MACAssign" id="mac_assign_type" value="2" onClick="aye_setMAC(2)"><%tcWebApi_multilingual("1","use_this_mac_address_str")%>
	</TD>
	<TD nowrap align=right>
	<input type="text" value="" name="Spoofmac" id="spoof_mac" maxlength="17" size="20" onKeyPress="return getkey('mac',event)">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</table>
<table id="isNAT" border="0" cellpadding="0" cellspacing="3" width="100%">
<tbody>
<tr>
	<td><b><%tcWebApi_multilingual("1","nat_str")%></b></td>
    <td align="right">
	<input name="en_nat" id="enable_nat" value="Enable" type="radio"><%tcWebApi_multilingual("1","enable_str")%>
    <input name="en_nat" id="enable_nat" value="Disable" type="radio"><%tcWebApi_multilingual("1","disable_str")%>
	</td>
</tr>
<tr><td colspan="2"><img src="/liteblue.gif" height="12" width="100%"></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
</tbody></table>
</div> <!-- main -->

<div id="update_bar" class="page_title" style="display:none">
<table border="0"   width="100%">
<tr>
</tr>
<tr>
	<td align="left">
	 <h1><%tcWebApi_multilingual("1","update_settings_str")%></h1>
 </td>
 <td nowrap align="left"> &nbsp; </td>
 <td nowrap><input type="text" name="progress" value="" class="reboot1bar" ></td>
 <td nowrap align="left"> &nbsp; </td>
</tr>
<tr>
 <td colspan="4" height="12"><hr color="#0099CC"></td>
</tr>
</table>	
</div>
<div id="waiting_bar" style="display:none">
<div  align="center"><BR><BR><TR><TD align="center"><B><%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%></B></TD></TR><BR><BR></div>
<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" alt="waiting" /></div>
</div>
<%tcWebApi_multilingual("2","_BAS_ether_help.asp")%>
</FORM>
</BODY>
</HTML>
