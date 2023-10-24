<%
	if request_Form("submit_flag") <> "" then
		tcWebApi_set("Wan_PVC","ISP","wanType")
		TCWebApi_set("Dproxy_Entry","type","DNSAssign")
		TCWebApi_set("Wan_PVC","NATENABLE","NATEnable")
		TCWebApi_set("Wan_PVC","CONNECTION","CONNECTION")
		TCWebApi_set("Wan_PVC","AUTHEN","AUTHEN")
		tcWebApi_set("Wan_PVC","ENCAP","ENCAP")
		tcWebApi_set("Wan_PVC","DEFAULTROUTE","WAN_DefaultRoute") 
		tcWebApi_set("Wan_PVC","MTU","wan_TCPMTU")
		tcWebApi_set("Wan_PVC","MSS","wan_TCPMSS")
		tcWebApi_set("Wan_PVC","RUNTEST","runtest")
		
		if request_Form("pppoe_username") <> "" then
			tcWebApi_set("Wan_PVC","USERNAME","pppoe_username")
		end if	
		tcWebApi_set("Wan_PVC","PASSWORD","pppoe_passwd")
		
		if request_Form("pppoe_idletime") <> "" then
			tcWebApi_set("Wan_PVC","CLOSEIFIDLE","pppoe_idletime")
		end if
		
		tcWebApi_set("Wan_PVC","PPPGETIP","wan_PPPGetIP")
		if request_Form("wan_PPPGetIP") = "Static" then
			tcWebApi_set("Wan_PVC","IPADDR","pppoe_ipaddr")
			tcWebApi_set("Wan_PVC","NETMASK","pppoe_subnet")
		end if	
		
		if request_Form("DNSAssign") = "1" then
			if request_Form("pppoe_dnsaddr1") <> "" then
				TCWebApi_set("Dproxy_Entry","Primary_DNS","pppoe_dnsaddr1")
			end if	
			TCWebApi_set("Dproxy_Entry","Secondary_DNS","pppoe_dnsaddr2")
		end if
		tcWebApi_set("Pptp_Entry","Active","DISABLE")
		tcWebApi_commit("Pptp_Entry")
		
		tcWebApi_set("L2tp_Entry","Active","DISABLE")
		tcWebApi_commit("L2tp_Entry")
		
		tcWebApi_commit("Wan_PVC")
	end if
%>	
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/bas_pppoe.js"></script>
<title><%tcWebApi_multilingual("1","glbstr_title")%></title>
<meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/BAS_pppoa.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="pppoe">
<input type=hidden name=wanType value="2">
<input type=hidden name=NATEnable value="Enable">
<input type=hidden name=wan_PPPGetIP value="Dynamic">
<input type=hidden name=AUTHEN value="AUTO">
<input type=hidden name=ENCAP value="">
<input type=hidden name=WAN_DefaultRoute value="Yes">
<input type=hidden name=wan_TCPMSS value="0">
<input type=hidden name=wan_TCPMTU value="0">
<input type=hidden name=DISABLE value="No">
<input type=hidden name=CONNECTION>
<input type=hidden name=WAN_MAC_ASSIGN value="0">

<div id="title" class="page_title"><%tcWebApi_multilingual("1","internet_setup_str")%></div>
<script>
var alert_login_name_cannot_blank_str="<%tcWebApi_multilingual("1","alert_login_name_cannot_blank_str")%>";
var alert_login_name_str="<%tcWebApi_multilingual("1","invalid_str")%><%tcWebApi_multilingual("1","alert_login_name_str")%>!";
var alert_password_cannot_blank_str="<%tcWebApi_multilingual("1","alert_password_cannot_blank_str")%>";
var alert_invalid_password_str="<%tcWebApi_multilingual("1","alert_invalid_password_str")%>";
var alert_enter_idle_time_str="<%tcWebApi_multilingual("1","alert_enter_idle_time_str")%>";
var alert_invalid_idle_time_str="<%tcWebApi_multilingual("1","alert_invalid_idle_time_str")%>";
var alert_invalid_ip_address_str="<%tcWebApi_multilingual("1","alert_invalid_ip_address_str")%>";
var alert_invalid_subnetmask_str="<%tcWebApi_multilingual("1","alert_invalid_subnetmask_str")%>";
var alert_invalid_gateway_ip_str="<%tcWebApi_multilingual("1","alert_invalid_gateway_ip_str")%>";
var alert_invalid_server_address_str="<%tcWebApi_multilingual("1","alert_invalid_server_address_str")%>";
var alert_myip_must_notbe_thesame_str="<%tcWebApi_multilingual("1","alert_myip_must_notbe_thesame_str")%>";
var alert_the_labes_should_be_63_str="<%tcWebApi_multilingual("1","alert_the_labes_should_be_63_str")%>";
var alert_invalid_service_name_str="<%tcWebApi_multilingual("1","alert_invalid_service_name_str")%>";
var alert_invalid_ipaddress_enter_again="<%tcWebApi_multilingual("1","alert_invalid_ipaddress_enter_again")%>";
var error_invalid_ip_address_str="<%tcWebApi_multilingual("1","error_invalid_ip_address_str")%>";
var error_invalid_ip_subnet_mask_str="<%tcWebApi_multilingual("1","error_invalid_ip_subnet_mask_str")%>";
var error_invalid_primary_dns_str="<%tcWebApi_multilingual("1","error_invalid_primary_dns_str")%>";
var error_invalid_secondard_dns_str="<%tcWebApi_multilingual("1","error_invalid_secondard_dns_str")%>";
var error_invalid_username_str="<%tcWebApi_multilingual("1","error_invalid_username_str")%>";
var error_invalid_password_str="<%tcWebApi_multilingual("1","error_invalid_password_str")%>";
var error_invalid_idletime_str="<%tcWebApi_multilingual("1","error_invalid_idletime_str")%>";

var maxchars = 120;
var delay_time = 300;
var charcount = 0;

var ipv6_type = "disabled";
var connection_type = "";
var lan_ip="192.168.1.1";
var lan_subnet="255.255.255.0";
var pppoe_get_ip="0.0.0.0";
var pppoe_get_wan_assign='0';
var pppoe_get_dns_assign='0';
var old_wan_type="dhcp";
var old_wan_ip=pppoe_get_ip;
var old_pppoe_wan_assign=pppoe_get_wan_assign;

var russian_pppoe_flag=parent.parent.russian_pppoe_flag;
var gui_region="English";
var netgear_region=top.netgear_region;

//add a new checkox 'Enable automatic Internet connection reset at'
var bas_auto_conn_flag="0";
var bas_conn_time_num="0";
if ( bas_conn_time_num == "" ) // to fix bug 23294
	bas_conn_time_num="0";
var auto_conn_flag=parent.parent.auto_conn_flag;
var autoconn_flag=(auto_conn_flag == 1 && ((gui_region == "German" &&  (netgear_region == "" || netgear_region.toUpperCase() == "WW")) || netgear_region.toUpperCase() == "GR")) ? 1 : 0;

var pppoe_sub_flag=(russian_pppoe_flag == 1 && (gui_region == "Russian" && (netgear_region == "" || netgear_region.toUpperCase() == "WW") || netgear_region.toUpperCase() == "RU")) ? 1 : 0;
var pppoe_myip_flag=( top.pppoe_intranet_flag == 1 && ( gui_region == "Russian" && (netgear_region == "" || netgear_region.toUpperCase() == "WW") || netgear_region.toUpperCase() == "RU")) ? 1 : 0;

var wan_factory_mac="c4:3d:c7:98:18:f6";
var wan_remote_mac="00:21:E0:29:91:42";
var pppoe_get_this_mac="";
var wanproto_type="pppoe";
var wan_mtu_now='1500';
if (pppoe_get_this_mac == "")
        pppoe_get_this_mac="C4:3D:C7:98:18:F6";

var pppoe_mac_router_flag=parent.parent.pppoe_mac_router_flag;

function change_web_format()
{
        /*if( pppoe_mac_router_flag == 1 ){
                document.getElementById("mac_head").style.display="";
		document.getElementById("mac_default").style.display="";
		document.getElementById("mac_comp").style.display="";
		document.getElementById("mac_this").style.display="";
		document.getElementById("bluebar").style.display="";
	}
        else{
                document.getElementById("mac_head").style.display="none";
		document.getElementById("mac_default").style.display="none";
		document.getElementById("mac_comp").style.display="none";
		document.getElementById("mac_this").style.display="none";
		document.getElementById("bluebar").style.display="none";
		
	}*/
	
	if( pppoe_myip_flag == 1 )
	{
                document.getElementById("intranet_myip").style.display="";
                document.getElementById("intranet_mask").style.display="";
                document.getElementById("intranet_bluebar").style.display="";
	} 
	else{
		document.getElementById("intranet_myip").style.display="none";
		document.getElementById("intranet_mask").style.display="none";
		document.getElementById("intranet_bluebar").style.display="none";
	}		
}



function loadvalue()
{
	change_web_format();

	var form=document.forms[0];

	//form.pppoe_username.value = "<% if tcWebApi_get("Wan_PVC","USERNAME","h") <> "N/A" then tcWebApi_get("Wan_PVC","USERNAME","s") end if%>";
	//form.pppoe_passwd.value = "<% if tcWebApi_get("Wan_PVC","PASSWORD","h") <> "N/A" then tcWebApi_get("Wan_PVC","PASSWORD","s") end if%>";
	
	//Decide MTU and MSS according Netgear Spec
	var current_mtu = "<%if tcWebApi_get("Wan_PVC","MTU","h") <> "N/A" then tcWebApi_get("Wan_PVC","MTU","s") end if%>";
	if(current_mtu=="" ||　current_mtu=="1500" || current_mtu=="1492")
		form.wan_TCPMTU.value="1458";
	else 
	{
		if(parseInt(current_mtu,10)>=1458)
			form.wan_TCPMTU.value="1458";
		else
			form.wan_TCPMTU.value = current_mtu;	
	}
	form.wan_TCPMSS.value = parseInt(form.wan_TCPMTU.value,10) - 40;
	
	var tmp_ssid = 'ssid';
	if( form.pppoe_passwd.value == "" )
	{
		if( get_browser() == "Firefox" )
		{
			form.pppoe_passwd.type = "text";
		}
		else
		{
			//form.pppoe_passwd.outerHTML='<input type="text" name="pppoe_passwd" maxlength="64" size="16" onFocus="this.select();" onKeyPress="return getkey(\'ssid\', event)" value="">';
			form.pppoe_passwd.outerHTML='<input class="pppoe_passwd" type="text" name="pppoe_passwd" id="pppoe_passwd" maxlength="64" size="16" onFocus="change_pppoe_password(this);" onKeyPress="return getkey('+tmp_ssid+', event)" value="<% if tcWebApi_get("Wan_PVC","PASSWORD","h") <> "N/A" then tcWebApi_get("Wan_PVC","PASSWORD","s") end if%>">';
		}
	}
	else if( get_browser() == "IE" )
	{
		//form.pppoe_passwd.outerHTML='<input type="password" name="pppoe_passwd" maxlength="64" size="16" style="width: 131px" onFocus="change_pppoe_password(this);" onKeyPress="return getkey(\'ssid\', event)" value="">';
		form.pppoe_passwd.outerHTML='<input class="pppoe_passwd" type="password" name="pppoe_passwd" id="pppoe_passwd" maxlength="64" size="16" onFocus="change_pppoe_password(this);" onKeyPress="return getkey('+tmp_ssid+', event)" value="<% if tcWebApi_get("Wan_PVC","PASSWORD","h") <> "N/A" then tcWebApi_get("Wan_PVC","PASSWORD","s") end if%>">';
	}
	
	//Dial on demand
	var dial_on_demand = "<%tcWebApi_get("Wan_PVC","CONNECTION","s")%>";
	var active = "<% if tcWebApi_staticGet("WanInfo_Entry","Active","h") <> "N/A" then tcWebApi_staticGet("WanInfo_Entry","Active","s") end if%>";
	if( active == "") active = "0";
	
	if(dial_on_demand=="Connect_Keep_Alive" || dial_on_demand=="N/A"){
		form.pppoe_dod.selectedIndex=0;
	}else if(dial_on_demand=="Connect_on_Demand"){
		form.pppoe_dod.selectedIndex=1;
		form.pppoe_idletime.value = "<%tcWebApi_get("Wan_PVC","CLOSEIFIDLE","s")%>";
	}else{
		form.pppoe_dod.selectedIndex=2;
	}
	
	//Use static IP?
	<% if tcWebApi_get("Wan_PVC","PPPGETIP","h") = "N/A" then %>
		form.WANAssign[0].checked = true;
                var pppoe_get_ip = "<% if tcWebApi_staticGet("WanInfo_Entry","Active","h") = "1" then tcWebApi_staticGet("WanInfo_Entry","IP","s") end if%>" 
                var pppoe_get_subnet = "<% if tcWebApi_staticGet("WanInfo_Entry","Active","h") = "1" then tcWebApi_staticGet("WanInfo_Entry","Mask","s") end if%>"
	<% elseif tcWebApi_get("Wan_PVC","PPPGETIP","h") = "Dynamic" then %>
		form.WANAssign[0].checked = true;
                var pppoe_get_ip = "<% if tcWebApi_staticGet("WanInfo_Entry","Active","h") = "1" then tcWebApi_staticGet("WanInfo_Entry","IP","s") end if%>" 
                var pppoe_get_subnet = "<% if tcWebApi_staticGet("WanInfo_Entry","Active","h") = "1" then tcWebApi_staticGet("WanInfo_Entry","Mask","s") end if%>"
	<%elseif tcWebApi_get("Wan_PVC","PPPGETIP","h") = "Static" then %>	
		form.WANAssign[1].checked = true;
	        var pppoe_get_ip = "<%if tcWebApi_get("Wan_PVC","IPADDR","h") <> "" then tcWebApi_get("Wan_PVC","IPADDR","s") end if%>";
	        var pppoe_get_subnet = "<%if tcWebApi_get("Wan_PVC","NETMASK","h") <> "" then tcWebApi_get("Wan_PVC","NETMASK","s") end if%>";
	<%end if%>	

	//Decide ENCAP
	var wan_type = "<%tcWebApi_get("Wan_PVC","ENCAP","s")%>";
	if(wan_type=="PPPoE LLC" || wan_type=="PPPoA LLC" || wan_type=="1483 Bridged IP LLC" || wan_type=="1483 Bridged Only LLC")
		form.ENCAP.value = "PPPoA LLC";
	else	
		form.ENCAP.value = "PPPoA VC-Mux";
        if((wan_type.search("PPPoA") != -1 && active == "1") || form.WANAssign[1].checked == true){
	    if(pppoe_get_ip!="")
	    {
	    	var ip_array=pppoe_get_ip.split('.');
	    	form.WPethr1.value=ip_array[0];
	    	form.WPethr2.value=ip_array[1];
	    	form.WPethr3.value=ip_array[2];
	    	form.WPethr4.value=ip_array[3];
	    }

	    if (pppoe_get_subnet!="")
	    {
	    	var mask_array=pppoe_get_subnet.split('.');
	    	form.WMask1.value=mask_array[0];
	    	form.WMask2.value=mask_array[1];	
	    	form.WMask3.value=mask_array[2];
	    	form.WMask4.value=mask_array[3]; 
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
		
	//DNS
	<% if tcWebApi_get("Dproxy_Entry","type","h") = "0" then %>
		form.DNSAssign[0].checked = true;
                var pppoe_get_dns1 = "<% if tcWebApi_staticGet("WanInfo_Entry","Active","h") = "1" then tcWebApi_staticGet("WanInfo_Entry","DNS1","s") end if%>";
                var pppoe_get_dns2 = "<% if tcWebApi_staticGet("WanInfo_Entry","Active","h") = "1" then tcWebApi_staticGet("WanInfo_Entry","DNS2","s") end if%>";
	<%else%>	
		form.DNSAssign[1].checked = true;
	        var pppoe_get_dns1="<%if tcWebApi_get("Dproxy_Entry","Primary_DNS","h") <> "" then tcWebApi_get("Dproxy_Entry","Primary_DNS","s") end if%>";
	        var pppoe_get_dns2="<%if tcWebApi_get("Dproxy_Entry","Secondary_DNS","h") <> "" then tcWebApi_get("Dproxy_Entry","Secondary_DNS","s") end if%>";
	<%end if%>
        if((wan_type.search("PPPoA") != -1 && active == "1") || form.DNSAssign[1].checked == true){
	    if(pppoe_get_dns1!="")
	    {
		var dns1_array=pppoe_get_dns1.split('.');

		if(dns1_array.length == 4)
		{
			form.DAddr1.value=dns1_array[0];
			form.DAddr2.value=dns1_array[1];
			form.DAddr3.value=dns1_array[2];
			form.DAddr4.value=dns1_array[3];
		}
	    }
	    if(pppoe_get_dns2!="")
	    {
		var dns2_array=pppoe_get_dns2.split('.');

		if(dns2_array.length == 4)
		{
			form.PDAddr1.value=dns2_array[0];
			form.PDAddr2.value=dns2_array[1];
			form.PDAddr3.value=dns2_array[2];
			form.PDAddr4.value=dns2_array[3];
		}
	    }
        }
		
		<% if tcWebApi_get("LiveParentalCtl_Common","Active","h") = "Yes" then %>
		if(pppoe_get_dns1!="")
	    {
		var dns1_array=pppoe_get_dns1.split('.');

		if(dns1_array.length == 4)
		{
			form.DAddr1.value=dns1_array[0];
			form.DAddr2.value=dns1_array[1];
			form.DAddr3.value=dns1_array[2];
			form.DAddr4.value=dns1_array[3];
		}
	    }
	    if(pppoe_get_dns2!="")
	    {
		var dns2_array=pppoe_get_dns2.split('.');

		if(dns2_array.length == 4)
		{
			form.PDAddr1.value=dns2_array[0];
			form.PDAddr2.value=dns2_array[1];
			form.PDAddr3.value=dns2_array[2];
			form.PDAddr4.value=dns2_array[3];
		}
	    }
		<%end if%>
		
		/*var pppoe_get_mac_assign='0';
        if(pppoe_get_mac_assign == '0')
        {
                form.MACAssign[0].checked = true;
                setMAC(form, wan_factory_mac);
        }
        else if(pppoe_get_mac_assign == '1')
        {
                form.MACAssign[1].checked = true;
                setMAC(form, wan_remote_mac);
        }
        else
        {
                form.MACAssign[2].checked = true;
                setMAC(form, pppoe_get_this_mac);
        }*/
	
	aye_show_idleout();
	aye_setIP();
	aye_setDNS();
	goTestApply();	
}
function show_idleout(form,time)
{
	if( time == 1 )
	{
		form.pppoe_idletime.disabled = false;
	}
	else
	{
		form.pppoe_idletime.disabled = true;
	}		
}
function aye_show_idleout()
{
	var form=document.forms[0];	
	if(form.pppoe_dod.selectedIndex==1)
	{
		form.pppoe_idletime.disabled = false;
	}
	else
	{
		form.pppoe_idletime.disabled = true;
		form.pppoe_idletime.value = "0";
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

function aye_setIP()
{
	var form=document.forms[0];
	if(form.WANAssign[0].checked){
		form.WPethr1.disabled=true;form.WPethr2.disabled=true;form.WPethr3.disabled=true;form.WPethr4.disabled=true;
		form.WMask1.disabled=true;form.WMask2.disabled=true;form.WMask3.disabled=true;form.WMask4.disabled=true;
		//form.WPethr1.value="";form.WPethr2.value="";form.WPethr3.value="";form.WPethr4.value="";
		//form.WMask1.value="";form.WMask2.value="";form.WMask3.value="";form.WMask4.value="";
	}else{
		form.WPethr1.disabled=false;form.WPethr2.disabled=false;form.WPethr3.disabled=false;form.WPethr4.disabled=false;
		form.WMask1.disabled=false;form.WMask2.disabled=false;form.WMask3.disabled=false;form.WMask4.disabled=false;
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
		
		if(cf.WPethr1.value==lanaddr_array[0] && cf.WPethr2.value==lanaddr_array[1] && cf.WPethr3.value==lanaddr_array[2])
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
			cf.conflict_wanlan.value=1;
			cf.action="BRS_wanlan_conflict.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>"+"&ip="+next_lanip;
			cf.submit();
			return false;
			
			
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
<input type="hidden" name="run_test" value="">
<input type="hidden" name="pppoe_ipaddr">
<input type="hidden" name="pppoe_subnet">
<input type="hidden" name="pppoe_dnsaddr1">
<input type="hidden" name="pppoe_dnsaddr2">
<input type="hidden" name="hidden_pppoe_idle_time">
<input type="hidden" name="intranet_wan_assign">
<input type="hidden" name="pppoe_myip">
<input type="hidden" name="pppoe_mask">
<input type="hidden" name="hid_mtu_value">
<input type="hidden" name="hid_pppoe_dod"><!--bug 22322:when connection mode gray out,need a hidden-value to transfer -->
<input type="hidden" name="hidden_conn_time_num">
<input type="hidden" name="hidden_auto_conn_flag">
<input type="hidden" name="lan_ip" value="<%If tcWebApi_get("Lan_Entry","IP","h") <> "N/A" then tcWebApi_get("Lan_Entry","IP","s") end if%>">
<input type="hidden" name="runtest" value="<%If tcWebApi_get("Wan_PVC","RUNTEST","h") <> "N/A" then tcWebApi_get("Wan_PVC","RUNTEST","s") else asp_write("false") end if%>">
<div id="fix_button" class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
	<input class="common_bt" type="submit" name="Test" id="test" value="<%tcWebApi_multilingual("0","glbstr_test")%>" onClick="return check_pppoe(document.forms[0],1)">&nbsp;&nbsp;
	<input class="cancel_bt" type="button" name="Cancel" id="cancel" value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick=location.href="BAS_pppoe.asp";>&nbsp;&nbsp;
    <input class="apply_bt" type="submit" name="Apply" id="apply" value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick="return check_pppoe(document.forms[0],0)">
        </TD>
</TR>
</TABLE>
</div> <!--button -->
<div id="bas_top" style="width: 625px; height: 85px; background-color: #ffffff; position: absolute; top: 50px; left: 0px;">
<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<TR><TD nowrap>
<A tabindex=-1 href="javascript:loadhelp('_BAS_pppoe','question')"><B><%tcWebApi_multilingual("1","does_your_internet_conection_str")%></B></A>
</TD></TR>
<TR>
        <TD nowrap>
        <input type="radio" name="loginreq" id="loginreq" value="yes" checked="true"><%tcWebApi_multilingual("1","yes_str")%>
        </TD>
</TR>
<TR>
        <TD nowrap>
        <input onclick='location.href="BAS_ether.asp";' type="radio" name="loginreq" id="loginreq" value="no"><%tcWebApi_multilingual("1","no_str")%>
        </TD>
</TR>
</TABLE>
</div> <!-- bas_top -->

<div id="main" class="main_bas">
<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_pppoe','isp')"><B><%tcWebApi_multilingual("1","internet_service_provider_str")%></B></A>
	</TD>
	<TD nowrap align=right>
	<select name="login_type" id="login_type" onChange="change_serv(document.forms[0])">
		<!--<option value="pptp"><%tcWebApi_multilingual("1","pptp_str")%></option>
		<option value="l2tp"><%tcWebApi_multilingual("1","l2tp_str")%></option>-->
		<option value="pppoe"><%tcWebApi_multilingual("1","pppoe_str")%></option>
		<option value="pppoa" selected><%tcWebApi_multilingual("1","pppoa_str")%></option>
	</select>
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_pppoe','login')"><B><%tcWebApi_multilingual("1","login_str")%></B></A>
	</TD>
	<TD nowrap align=right>
	<input class="pppoe_username" type="text" name="pppoe_username" id="pppoe_username" maxLength="64" size="16" value="<% if tcWebApi_get("Wan_PVC","USERNAME","h") <> "N/A" then tcWebApi_get("Wan_PVC","USERNAME","s") end if%>">
	</TD>
</TR>
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_pppoe','password')"><B><%tcWebApi_multilingual("1","password_str")%></B></A>
	</TD>
	<TD nowrap align=right>
	<input class="pppoe_passwd" type="password" name="pppoe_passwd" id="pppoe_passwd" maxlength="64" size="16" onFocus="change_pppoe_password(this);" onKeyPress="return getkey('ssid', event)" value="<% if tcWebApi_get("Wan_PVC","PASSWORD","h") <> "N/A" then tcWebApi_get("Wan_PVC","PASSWORD","s") end if%>">
	</TD>
</TR>
<TR>
	<TD>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_pppoe','serv_name')"><%tcWebApi_multilingual("1","if_required_str")%></A>
	</TD>
	<TD nowrap align=right>
	<input class="pppoe_servername" type="text" name="pppoe_servername" id="pppoe_servername" maxLength="50" size="16" onKeyPress="return getkey('ssid', event)" value="">
	</TD>
</TR>

<TR> 
	<TD>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_pppoe','conn_mode')"><B><%tcWebApi_multilingual("1","connection_mode_str")%></B></A></TD> 
	<TD align=right> 
	<select class="pppoe_dod" name="pppoe_dod" id="pppoe_dod" onchange="aye_show_idleout()"> 
		<option value="0"><%tcWebApi_multilingual("1","always_on_str")%></option>
		<option value="1"><%tcWebApi_multilingual("1","dial_on_demand_str")%></option>
		<option value="2"><%tcWebApi_multilingual("1","manually_connect_str")%></option> 
	</select>
	</TD>
</TR> 
<TR>
	<TD>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_pppoe','pppoe_idletime')"><%tcWebApi_multilingual("1","idle_timeout_str")%></A>
	</TD>
	<TD align=right>
	<input class="pppoe_idletime" type="text" name="pppoe_idletime" id="pppoe_idletime" maxLength="5" size="16">
	</TD>
</TR>
<!-- <TR id=auto_conn_play>
	<td colspan="2">
	<div id="select_div" class="enable_select">
		<input type="checkbox" name="auto_conn_24hr" value="">
			<div id="select_title"><%tcWebApi_multilingual("1","enable_automatic_internet_str")%> </div>
		<div id="select_content">
			<span id="auto_conn_time_show" class="enable_span" onClick="show_options();" >00:00</span>
			<div id="auto_conn_time" style="display:none;" onClick="select_value();">
				<li value="1">00:00</li>
				<li value="2">00:30</li>
				<li value="3">01:00</li>
				<li value="4">01:30</li>
				<li value="5">02:00</li>
				<li value="6">02:30</li>
				<li value="7">03:00</li>
				<li value="8">03:30</li>
				<li value="9">04:00</li>
				<li value="10">04:30</li>
				<li value="11">05:00</li>
				<li value="12">05:30</li>
				<li value="13">06:00</li>
				<li value="14">06:30</li>
				<li value="15">07:00</li>
				<li value="16">07:30</li>
				<li value="17">08:00</li>
				<li value="18">08:30</li>
				<li value="19">09:00</li>
				<li value="20">09:30</li>
				<li value="21">10:00</li>
				<li value="22">10:30</li>
				<li value="23">11:00</li>
				<li value="24">11:30</li>
				<li value="25">12:00</li>
				<li value="26">12:30</li>
				<li value="27">13:00</li>
				<li value="28">13:30</li>
				<li value="29">14:00</li>
				<li value="30">14:30</li>
				<li value="31">15:00</li>
				<li value="32">15:30</li>
				<li value="33">16:00</li>
				<li value="34">16:30</li>
				<li value="35">17:00</li>
				<li value="36">17:30</li>
				<li value="37">18:00</li>
				<li value="38">18:30</li>
				<li value="39">19:00</li>
				<li value="40">19:30</li>
				<li value="41">20:00</li>
				<li value="42">20:30</li>
				<li value="43">21:00</li>
				<li value="44">21:30</li>
				<li value="45">22:00</li>
				<li value="46">22:30</li>
				<li value="47">23:00</li>
				<li value="48">23:30</li>
			</div>
		</div>
	</div>
	</td>
</TR> -->
<script>
/* to fix bug 23647 */
/*var sel_div = document.getElementById("auto_conn_time");
var click_sel = 0;

for( var i = 0; i < 48; i++){
	var li_div = sel_div.getElementsByTagName("li")[i];
	li_div.onmouseover=function(){
		for(var j=0; j < 48; j++)
		{
			if( j != this.value-1)
				sel_div.getElementsByTagName("li")[j].style.background = "#FFFFFF";
			else
			{
				this.style.background="#3868ca";
				over_opt = j;
			}
		}
	};

	li_div.onclick=function() {
		document.getElementById("auto_conn_time_show").innerHTML = this.innerHTML;
		sel_div.style.display="none";
		document.forms[0].hidden_conn_time_num.value = this.value-1;
	};
}

var main_div = document.body;
main_div.onclick = function() {
	click_sel++;
	if(sel_div.style.display != "none" && click_sel != 2)
	{
		sel_div.style.display = "none";
		click_sel = 0;
		if( over_opt != -1 )
			sel_div.getElementsByTagName("li")[over_opt].style.background = "#FFFFFF";
	}
};

function show_options()
{
	var cf = document.forms[0];
	if( document.getElementById("auto_conn_time_show").className == "disable_span" )
		return false;

	sel_div.getElementsByTagName("li")[cf.hidden_conn_time_num.value].style.background = "#3868ca";
	if(sel_div.style.display == "none")
	{
		sel_div.style.display = "";
		click_sel=1;
	}
	else
	{
		sel_div.style.display = "none";
		click_sel=0;
	}
}*/
</script>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR id=intranet_myip>
        <TD nowrap>
        <A tabindex=-1 href="javascript:loadhelp('_BAS_pppoe','myip')"><B><%tcWebApi_multilingual("1","my_ip_address_str")%></B></A>
        </TD>
        <TD nowrap align=right><!--bug 22411:when manually input IP,don't click the mouse,the subnet mask can be used -->
        <input type="text" name="myip_1"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onChange="myip_update();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);myip_update();" >.
        <input type="text" name="myip_2"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onChange="myip_update();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);myip_update();">.
        <input type="text" name="myip_3"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onChange="myip_update();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);myip_update();">.
        <input type="text" name="myip_4"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onChange="myip_update();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);myip_update();">
        </TD>
</TR>
<TR id=intranet_mask>
	<TD nowrap>
        <A tabindex=-1 href="javascript:loadhelp('_BAS_pppoe','myip')"><B><%tcWebApi_multilingual("1","ip_subnet_mask_str")%></B></A>
        <TD nowrap align=right>
        <input type="text" name="mymask_1"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
        <input type="text" name="mymask_2"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
        <input type="text" name="mymask_3"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
        <input type="text" name="mymask_4"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
        </TD>
</TR>
<TR id=intranet_bluebar><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<TR>
       <TD nowrap colspan=2>
       <A tabindex=-1 href="javascript:loadhelp('_BAS_pppoe','InternetIP')"><B><%tcWebApi_multilingual("1","internet_ip_address_str")%></B></A>
       </TD>
</TR>
<TR>
       <TD nowrap colspan=2>
       <input type="radio" name="WANAssign" id="wan_assign_type" value="Dynamic" onClick="aye_setIP()"><%tcWebApi_multilingual("1","get_dynamic_str")%>
       </TD>
</TR>
<TR>
       <TD nowrap colspan=2>
       <input type="radio" name="WANAssign" id="wan_assign_type" value="Fixed" onClick="aye_setIP()"><%tcWebApi_multilingual("1","use_static_ip_str")%>
       </TD>
</TR>
<TR>
        <TD nowrap><img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","ip_address_str")%></TD>
        <TD nowrap align=right>
        <input type="text" name="WPethr1"  id="wan_ipaddress1" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
        <input type="text" name="WPethr2"  id="wan_ipaddress2" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
        <input type="text" name="WPethr3"  id="wan_ipaddress3" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
        <input type="text" name="WPethr4"  id="wan_ipaddress4" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
        </TD>
</TR>

<TR id=pppoe_sub>
        <TD nowrap><img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","ip_subnet_mask_str")%></TD>
        <TD nowrap align=right>
        <input type="text" name="WMask1"  id="wan_netmask1" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
        <input type="text" name="WMask2"  id="wan_netmask2" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
        <input type="text" name="WMask3"  id="wan_netmask3" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
        <input type="text" name="WMask4"  id="wan_netmask4" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
        </TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_pppoe','DNSaddress')"><B><%tcWebApi_multilingual("1","domain_name_server_str")%></B></A>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="DNSAssign" id="dns_assign_type" value="0" onClick="aye_setDNS()"><%tcWebApi_multilingual("1","get_auto_from_isp_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="DNSAssign" id="dns_assign_type" value="1" onClick="aye_setDNS()"><%tcWebApi_multilingual("1","use_these_dns_servers_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap><img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","primary_dns_str")%></TD>
	<TD nowrap align=right>
	<input type="text" name="DAddr1"  id="primary_dns_address1" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="DAddr2"  id="primary_dns_address2" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="DAddr3"  id="primary_dns_address3" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="DAddr4"  id="primary_dns_address4" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD>
</TR>
<TR>
	<TD nowrap><img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","secondary_dns_str")%></TD>
	<TD nowrap align=right>
	<input type="text" name="PDAddr1"  id="second_dns_address1" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="PDAddr2"  id="second_dns_address2" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="PDAddr3"  id="second_dns_address3" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="PDAddr4"  id="second_dns_address4" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</TABLE>
<table id="MAC_Spoofing" style="display: none" border="0" cellspacing="3" width="100%">
<TR id=mac_head>
        <TD nowrap colspan=2>
        <A tabindex=-1 href="javascript:loadhelp('_BAS_pppoe','localaddress')"><B><%tcWebApi_multilingual("1","router_mac_address_str")%></B></A>
        </TD>
</TR>
<TR id=mac_default>
        <TD nowrap colspan=2>
        <input type="radio" name="MACAssign" id="mac_assign_type" value="Default" onClick="setMAC(document.forms[0], wan_factory_mac)"><%tcWebApi_multilingual("1","use_default_address_str")%>
        </TD>
</TR>
<TR id=mac_comp>
        <TD nowrap colspan=2>
        <input type="radio" name="MACAssign" id="mac_assign_type" value="Computer" onClick="setMAC(document.forms[0], wan_remote_mac)"><%tcWebApi_multilingual("1","use_computer_mac_address_str")%>
        </TD>
</TR>
<TR id=mac_this>
        <TD nowrap>
        <input type="radio" name="MACAssign" id="mac_assign_type" value="Fixed" onClick="setMAC(document.forms[0], pppoe_get_this_mac)"><%tcWebApi_multilingual("1","use_this_mac_address_str")%>
        </TD>
        <TD nowrap align=right>
        <input type="text" value="" name="Spoofmac" id="spoof_mac" maxlength="17" size="20" onKeyPress="return getkey('mac',event)">
        </TD>
</TR>
<TR id=bluebar><td colspan=2><img src="/liteblue.gif" width=100% height=12></td></TR>
</table>
<table id="isNAT" border="0" cellpadding="0" cellspacing="3" width="100%">
<tbody>
<tr>
	<td><b><%tcWebApi_multilingual("1","nat_str")%></b></td>
    <td align="right">
	<input name="en_nat" id="enable_nat" value="enable" type="radio"><%tcWebApi_multilingual("1","enable_str")%>
    <input name="en_nat" id="enable_nat" value="disable" type="radio"><%tcWebApi_multilingual("1","disable_str")%>
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
 <td nowrap><input type="text" name="progress" value="" class="prgbarupdate"></td>
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
<%tcWebApi_multilingual("2","_BAS_pppoe_help.asp")%>
</FORM>
</BODY>
</HTML>
