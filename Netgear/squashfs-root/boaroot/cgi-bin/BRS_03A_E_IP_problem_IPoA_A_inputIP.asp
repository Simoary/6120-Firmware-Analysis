<%
if request_Form("submit_flag") = "1" then
		tcWebApi_set("WebCurSet_Entry","wan_pvc","wan_pvc")
		tcWebApi_set("WebCurSet_Entry","nat_pvc","wan_pvc")
		tcWebApi_set("Wan_Common","TransMode","TransMode")
		tcWebApi_set("Wan_PVC","Active","Active")
	
		tcWebApi_set("Wan_PVC","QOS","AdslQoS")
		tcWebApi_set("Wan_PVC","VPI","AdslVpi")
		tcWebApi_set("Wan_PVC","VCI","AdslVci")
		tcWebApi_set("Wan_PVC","ENCAP","ENCAP")
		
		tcWebApi_set("Wan_PVC","IPVERSION","ipVerRadio")
		tcWebApi_set("Wan_PVC","ISP","wanType")
		TCWebApi_set("Dproxy_Entry","type","DNSASSIGN")
		TCWebApi_set("Wan_PVC","NATENABLE","NATEnable")
		tcWebApi_set("Wan_PVC","DEFAULTROUTE","WAN_DefaultRoute")
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
		
		tcWebApi_commit("Wan_PVC")
		tcWebApi_commit("Dproxy_Entry")
		tcWebApi_save()
end if
%>	

<html>

<head>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="/style/hijack_style.css" />
<link rel="stylesheet" type="text/css" href="/style/hijack_03A_E_IP_problem_staticIP_A_inputIP.css" />
<link rel="stylesheet" type="text/css" href="/style/form.css" />
<script language="javascript" type="text/javascript" src="/script/brs_hijack.js"></script>
<script language="javascript" type="text/javascript" src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/aye_utils.js"></script>


</head>

<body onload="frmLoad()">
<form method="post" action="/cgi-bin/BRS_03A_E_IP_problem_IPoA_A_inputIP.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type="hidden" name="submit_flag" value="0" />
<INPUT type=hidden name=TransMode value="ATM">
<INPUT type=hidden name=wan_pvc value="0">
<INPUT type=hidden name=Active value="Yes">

<INPUT type=hidden name=AdslQoSPcrRate value="0">

<INPUT type=hidden name=AdslQoSMbs value="">


<input type="hidden" name="WANAssign" value="Static" />
<input type=hidden name=ipVerRadio value="IPv4">
<input type=hidden name=wanType value="1">
<input type=hidden name=DNSproxy value="Yes">
<input type=hidden name=dnsTypeRadio value="0">
<input type=hidden name=NATEnable value="Enable">

<input type=hidden name=WAN_DefaultRoute value="Yes">
<input type=hidden name=WAN_MAC_ASSIGN value="0">
<input type=hidden name=DNSASSIGN>
<input type=hidden name=system_name value="<%if tcWebApi_get("Wan_PVC","HOSTNAME","h") = "N/A" then tcWebApi_get("SkuId_Entry","ProductName","s") elseif tcWebApi_get("Wan_PVC","HOSTNAME","h") = "" then tcWebApi_get("SkuId_Entry","ProductName","s") else tcWebApi_get("Wan_PVC","HOSTNAME","s") end if%>">
<input type=hidden name=domain_name value="<%if tcWebApi_get("Wan_PVC","DOMAINNAME","h") <> "N/A" then  tcWebApi_get("Wan_PVC","DOMAINNAME","s") end if%>" >
<input type="hidden" name="ether_ipaddr">
<input type="hidden" name="ether_subnet">
<input type="hidden" name="ether_gateway">
<input type="hidden" name="ether_dnsaddr1">
<input type="hidden" name="ether_dnsaddr2">
<input type="hidden" name="DNSAssign" value="1">
<input type="hidden" name="Spoofmac">
<input type="hidden" name="MacSpoofingValue">
<input type="hidden" name="runtest" value="<%If tcWebApi_get("Wan_PVC","RUNTEST","h") <> "N/A" then tcWebApi_get("Wan_PVC","RUNTEST","s") else asp_write("false") end if%>">
<input type=hidden name="after_wait_flag" value="0">
<input type="hidden" name="ping_flag" value="ipoa"/>
<input type="hidden" name="lan_ip" value="<%If tcWebApi_get("Lan_Entry","IP","h") <> "N/A" then tcWebApi_get("Lan_Entry","IP","s") end if%>">
<input type="hidden" name="default_flag">

<div class="wizard_content_div">

	<div class="wizard_words_div" id="wizard_words_div">
		
			<h1><%tcWebApi_multilingual("1","bh_ipoa_connection_str")%></h1>
			<p><%tcWebApi_multilingual("1","bh_enter_ip_setting_str")%></p>
			
			<div id="mainContent_div">
<script>
var alert_invalid_mac_str="<%tcWebApi_multilingual("0","invalid_mac_str")%>";
var wan_curr_mac="<%if tcWebApi_get("Wan_PVC","Mac_Spoofing","h") <> "N/A"  then tcWebApi_get("Wan_PVC","Mac_Spoofing","s") end if%>";
function frmLoad()
{
	var cf=document.forms[0];	
	
	
	var main_div = document.getElementById("wizard_words_div");
	var pls_wait_div = document.getElementById("pls_wait_div");
	var waiting_img_div = document.getElementById("waiting_bar");
	
	main_div.style.display = "none";
	waiting_img_div.style.display = "none";
	pls_wait_div.style.display = "none";
	
	<% if request_Form("after_wait_flag") = "1" then %>
		
		<% if request_Form("ping_finish") <> "1" then %>
		<%tcWebApi_staticGet("AutoDetect_Entry","Ping_Netgear","h")%>
		cf.action="/cgi-bin/BRS_04_B_checkNet_ping.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
		cf.submit();
		<%else%>
				<%if tcWebApi_staticGet("AutoDetect_Entry","getResult","h") <> "N/A" then%>
				var wan_status =  "<%tcWebApi_staticGet("AutoDetect_Entry","getResult","s")%>";
				<%else%>
				var wan_status = "0";
				<%end if%>
				if(wan_status=="1")
				{
					
					cf.default_flag.value = "1";
					//location.href="/cgi-bin/BRS_success.asp";
					cf.action="/cgi-bin/BRS_success.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
					cf.submit();
				}
				else
				{
					location.href="/cgi-bin/BRS_05_networkIssue.asp";
				}
		<%end if%>		
	<%else%>
		<% if request_Form("postflag") = "1" then %>
		
		main_div.style.display = "none";
		waiting_img_div.style.display = "none";
		pls_wait_div.style.display = "";
		updateProgress();
		<%else%>
		
		main_div.style.display = "";
		waiting_img_div.style.display = "none";
		pls_wait_div.style.display = "none";
		
		var wan_type = "<%tcWebApi_get("Wan_PVC","ENCAP","s")%>";
		if(wan_type.search("LLC") == -1)
		   cf.ENCAP.value = "VC";
		else
		   cf.ENCAP.value = "LLC";
		   
		cf.Spoofmac.value = wan_curr_mac;
		cf.MacSpoofingValue.value =cf.Spoofmac.value;
		
		<%end if%>
	<%end if%>
	
	
}
var pchar = "||"; // progress char
var maxchars = 40; 
var delay_time = 1000; // msecs
var charcount = 0;


function updateProgress()
{
	var cf = document.forms[0];
	
	if (charcount < maxchars)
	{
		charcount ++;
		cf.progress.value = makeStr(charcount,pchar);
		setTimeout("updateProgress()",delay_time);
	}
	else
	{ 
		cf.after_wait_flag.value = "1";
		cf.submit();
	}
	
}
/*
if (wan_phy_mode == "adsl") {
            each_info=vpc_string.split("*");

            document.write('<div id="vpi_value" class="wanInput_left_div" align="right">'+vpi+' :</div>');
            document.write('<div class="wanInput_Img_div"><img src="image/ca_text_pic.gif" />');
            document.write('<input type="text" id="inputvpi" align="right" value="'+each_info[1]+'"name="vpi" disabled/>');
            document.write('</div>');

            document.write('<div id="vci_value" class="wanInput_left_div" align="right">'+vci+' :</div>');
            document.write('<div class="wanInput_Img_div"><img src="image/ca_text_pic.gif" />');
            document.write('<input type="text" id="inputvci" align="right" value="'+each_info[2]+'"name="vci" disabled/>');
            document.write('</div>');
        
             document.write('<input type="hidden" name="det_multiplexing" value="'+each_info[3]+'"0">');            
             document.write('<input type="hidden" name="det_vpi" value="'+each_info[1]+'"0">');            
             document.write('<input type="hidden" name="det_vci" value="'+each_info[2]+'"0">');        
}*/

function check_ether(cf,check)
{
	if(check==1)
		cf.runtest.value="true";
	else
		cf.runtest.value="false";
		
	//format_IP("WPethr1", "WPethr2", "WPethr3", "WPethr4", "WMask1", "WMask2", "WMask3", "WMask4", "WGateway1", "WGateway2", "WGateway3", "WGateway4", "IPoAethr1", "IPoAethr2", "IPoAethr3", "IPoAethr4", "IPoAMask1", "IPoAMask2", "IPoAMask3", "IPoAMask4", "IPoAGateway1", "IPoAGateway2", "IPoAGateway3", "IPoAGateway4", "DAddr1", "DAddr2", "DAddr3", "DAddr4", "PDAddr1", "PDAddr2", "PDAddr3", "PDAddr4");

			cf.ether_ipaddr.value=cf.ip_address.value;
			cf.ether_subnet.value=cf.subnet_mask.value;
			cf.ether_gateway.value=cf.gateway.value;
           //cf.ether_ipaddr.value=cf.IPoAethr1.value+'.'+cf.IPoAethr2.value+'.'+cf.IPoAethr3.value+'.'+cf.IPoAethr4.value;
           //cf.ether_subnet.value=cf.IPoAMask1.value+'.'+cf.IPoAMask2.value+'.'+cf.IPoAMask3.value+'.'+cf.IPoAMask4.value;
           //cf.ether_gateway.value=cf.IPoAGateway1.value+'.'+cf.IPoAGateway2.value+'.'+cf.IPoAGateway3.value+'.'+cf.IPoAGateway4.value;
		
 
	
		cf.DNSASSIGN.value="1";
	if(check_static_dns(true)==false)
			return false;

	cf.ether_ipaddr.value = address_parseInt(cf.ether_ipaddr.value);
	cf.ether_subnet.value = address_parseInt(cf.ether_subnet.value);
	cf.ether_gateway.value = address_parseInt(cf.ether_gateway.value);
		
	
	cf.wanType.value = "1";//static
	
	if(!aye_regex_IPV4.exec(cf.ether_ipaddr.value)){ alert(error_invalid_ip_address_str); return false; }
	if(!aye_regex_MASK.exec(cf.ether_subnet.value)){ alert(error_invalid_ip_subnet_mask_str); return false; }
	if(!aye_regex_IPV4.exec(cf.ether_gateway.value)){ alert(error_invalid_gateway_ip_address_str); return false; }
	
	
	//NAT
	/*
	if(cf.en_nat[0].checked)
		cf.NATEnable.value = "Enable";
	else	
		cf.NATEnable.value = "Disable";
		
	parent.menu_internet = "ipoe";	
	*/	
	//MAC Spoofing
	/*
	if(cf.MACAssign[0].checked)
		cf.WAN_MAC_ASSIGN.value="0";
	else if	(cf.MACAssign[1].checked)
		cf.WAN_MAC_ASSIGN.value="1";
	else
		cf.WAN_MAC_ASSIGN.value="2";
	*/
	if(cf.ENCAP.value == "LLC")
	{
	      cf.ENCAP.value = "1483 Routed IP LLC(IPoA)";
	}
	else
	{
	      cf.ENCAP.value = "1483 Routed IP VC-Mux";
	}
	/*
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
	*/
	cf.Spoofmac.value = cf.Spoofmac.value.toUpperCase();
	
	check_wanlan_conflict();
	
	//Display Wait Bar
	document.getElementById("wizard_words_div").style.display = "none";
	document.getElementById("allBtns_div").style.display = "none";
	document.getElementById("waiting_bar").style.display = "";
	updateProgress();
	cf.submit_flag.value = "1";
	return true;
}

function check_static_dns( wan_assign )
{
	var cf=document.forms[0];
	cf.ether_dnsaddr1.value=cf.prefferd_dns.value;
	cf.ether_dnsaddr2.value=cf.alternate_dns.value;
	
	cf.ether_ipaddr.value=cf.ip_address.value;

	if(cf.ether_dnsaddr1.value=="...")
		cf.ether_dnsaddr1.value="";
	else
		cf.ether_dnsaddr1.value = address_parseInt(cf.ether_dnsaddr1.value);

	if(cf.ether_dnsaddr2.value=="...")
		cf.ether_dnsaddr2.value="";
	else
		cf.ether_dnsaddr2.value = address_parseInt(cf.ether_dnsaddr2.value);
	if( check_DNS(cf.ether_dnsaddr1.value,cf.ether_dnsaddr2.value,wan_assign,cf.ether_ipaddr.value))
		return true;
	else
		return false;
		
		
	if(!aye_regex_IPV4.exec(cf.ether_dnsaddr1.value)){ alert(invalid_primary_dns_str); return false; }
	if(cf.ether_dnsaddr2.value!="")
	{
		if(!aye_regex_IPV4.exec(cf.ether_dnsaddr2.value)){ alert(invalid_second_dns_str); return false; }	
	}	
}

function check_wanlan_conflict()
{
	var next_lanip;

	var cf=document.forms[0];
	
		var lanaddr_array = new Array();
		var wanaddr_array = new Array();
		lanaddr_array =cf.lan_ip.value.split('.');
		wanaddr_array =cf.ip_address.value.split('.');
		
		if( (wanaddr_array[0]==lanaddr_array[0] && wanaddr_array[1]==lanaddr_array[1] && wanaddr_array[2]==lanaddr_array[2]) || (wanaddr_array[0]==lanaddr_array[0] && wanaddr_array[1]==lanaddr_array[1] && wanaddr_array[2]==lanaddr_array[2]) )
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
var error_invalid_ip_address_str="<%tcWebApi_multilingual("1","error_str")%>: <%tcWebApi_multilingual("1","invalid_str")%><%tcWebApi_multilingual("1","error_invalid_ip_address_str")%>";
var error_invalid_ip_subnet_mask_str="<%tcWebApi_multilingual("1","error_str")%>: <%tcWebApi_multilingual("1","error_invalid_ip_subnet_mask_str")%>";
var error_invalid_gateway_ip_address_str="<%tcWebApi_multilingual("1","error_str")%>: <%tcWebApi_multilingual("1","invalid_str")%><%tcWebApi_multilingual("1","error_invalid_gateway_ip_address_str")%>";
var dns_must_specified_str="<%tcWebApi_multilingual("1","dns_must_specified_str")%>";
var invalid_primary_dns_str="<%tcWebApi_multilingual("1","invalid_primary_dns_str")%>";
var invalid_second_dns_str="<%tcWebApi_multilingual("1","invalid_second_dns_str")%>";
</script>		

<INPUT type=hidden name=AdslVpi value="<%if TCWebAPI_get("AutoDetect_Entry", "VPI", "h") <> "N/A" then TCWebAPI_staticGet("AutoDetect_Entry", "VPI", "s") else asp_Write("0") end if %>">
<INPUT type=hidden name=AdslVci value="<%if TCWebAPI_get("AutoDetect_Entry", "VCI", "h") <> "N/A" then TCWebAPI_staticGet("AutoDetect_Entry", "VCI", "s") else asp_Write("33") end if %>">
<INPUT type=hidden name=AdslQoS value="ubr">
<INPUT type=hidden name=ENCAP value="<%if TCWebAPI_get("AutoDetect_Entry", "Encapsulation", "h") = "VC" then if TCWebAPI_get("AutoDetect_Entry", "ConnectType", "h") = "STATUS_PPPOA" then asp_Write("PPPoA VC-Mux") else asp_Write("PPPoE VC-Mux") end if else if TCWebAPI_get("AutoDetect_Entry", "ConnectType", "h") = "STATUS_PPPOA" then asp_Write("PPPoA LLC") else asp_Write("PPPoE LLC") end if end if%>">						
				<div id="IP_addr" class="input_left_div" align="right"><%tcWebApi_multilingual("1","bh_info_mark_ip_str")%></div>
				<div class="input_img_div">
					<input type="text" align="right" id="ip_address" maxlength="15" name="ip_address" class="input_text" />
				</div>
				
				<div id="Sub_mask" class="input_left_div" align="right"><%tcWebApi_multilingual("1","bh_info_mark_mask_str")%></div>
				<div class="input_img_div">
					<input type="text" align="right" id="subnet_mask" maxlength="15" name="subnet_mask" class="input_text" />
				</div>
				
				<div id="Gateway" class="input_left_div" align="right"><%tcWebApi_multilingual("1","bh_constatus_defgtw_str")%></div>
				<div class="input_img_div">
					<input type="text" align="right" id="gateway" maxlength="15" name="gateway" class="input_text" />
				</div>
				
				<div id="preDNS" class="input_left_div" align="right"><%tcWebApi_multilingual("1","bh_preferred_dns_str")%></div>
				<div class="input_img_div">
					<input type="text" align="right" id="prefferd_dns" maxlength="15" name="prefferd_dns" class="input_text" />
				</div>
				
				<div id="alteDNS" class="input_left_div" align="right"><%tcWebApi_multilingual("1","bh_alternate_dns_str")%></div>
				<div class="input_img_div">
					<input type="text" align="right" id="alternate_dns" maxlength="15" name="alternate_dns" class="input_text" />
				</div>
				
				<div style="clear:both"></div>
			</div>
		
	</div>
	
	
	<div id="allBtns_div" class="wizard_buttons_div" align="right">
		<input class="short_common_bt" type='button' name='Next' id="next" value="<%tcWebApi_multilingual("0","glbstr_next")%>" onClick="return check_ether(document.forms[0],0)">
	</div>
	
	
	<div class="wizard_content_div" id="waiting_bar">
		<div class="wizard_words_div">
			<h1><%tcWebApi_multilingual("1","bh_apply_connection_str")%></h1>
			<p><%tcWebApi_multilingual("1","bh_plz_waite_apply_connection_str")%></p>
			<div class="waiting_img_div" align="center">
			<img src="/image/wait30.gif" alt="waiting" />
			</div>
		</div>
	</div>
	
	<div class="wizard_content_div" id="pls_wait_div" style="display:none">

		<div class="wizard_words_div">
			
			<h1><%tcWebApi_multilingual("1","bh_apply_connection_str")%></h1>
			<p><%tcWebApi_multilingual("1","bh_plz_waite_apply_connection_str")%></p>
			
			<tr>
			<td nowrap><input type="text" name="progress" class="reboot1bar" size="60"  value=""></td>
			</tr>

		</div>

	</div>
	
	
	
</div>

</form>
</body>

</html>
