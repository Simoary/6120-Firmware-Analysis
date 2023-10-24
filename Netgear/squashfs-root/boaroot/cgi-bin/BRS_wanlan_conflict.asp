<%
if request_Form("savechanged") = "1" then
	tcWebApi_set("Lan_Entry","changed","changed_flag")	
	TCWebApi_set("Prelan_Entry","Active","Prelan_Active")
	tcWebApi_commit("Prelan")
	if request_Form("dhcp_on") = "1" then
		tcWebApi_commit("Dhcpd_Common")
	end if
end if
If Request_Form("next_ip") <> "" Then
	TCWebApi_set("Lan_Entry","IP","next_ip")
	TCWebApi_set("Lan_Entry","netmask","next_mask")
	TCWebApi_set("Prelan_Entry","Active","Prelan_Active")
	tcWebApi_commit("Prelan")
	If Request_Form("next_dhcp_start") <> "" Then
		TCWebApi_set("Dhcpd_Common","start","next_dhcp_start")
        TCWebApi_set("Dhcpd_Common","pool_count","next_dhcp_count")
		tcWebApi_commit("Dhcpd_Common")
	end if
	tcWebApi_set("Wan_PVC","temp","tmp")
end if 
if request_Form("WANAssign") <> "" then
	tcWebApi_set("Wan_PVC","ISP","wanType")
	TCWebApi_set("Dproxy_Entry","type","DNSASSIGN")
	TCWebApi_set("Wan_PVC","NATENABLE","NATEnable")
	tcWebApi_set("Wan_PVC","ENCAP","ENCAP")
	tcWebApi_set("Wan_PVC","DEFAULTROUTE","WAN_DefaultRoute")
	
	if request_Form("WANAssign") = "Static" then	
		tcWebApi_set("Wan_PVC","IPADDR","ether_ipaddr")
		tcWebApi_set("Wan_PVC","NETMASK","ether_subnet")
		tcWebApi_set("Wan_PVC","GATEWAY","ether_gateway")
	end if
	
	if request_Form("Spoofmac") <> "" then
			tcWebApi_set("Wan_PVC","Mac_Assign","WAN_MAC_ASSIGN")
			tcWebApi_set("Wan_PVC","Mac_Spoofing","Spoofmac")
	end if
		
	if request_Form("DNSAssign") = "Fixed" then
		if request_Form("ether_dnsaddr1") <> "" then
			TCWebApi_set("Dproxy_Entry","Primary_DNS","ether_dnsaddr1")
		end if	
			TCWebApi_set("Dproxy_Entry","Secondary_DNS","ether_dnsaddr2")
	end if
	
	tcWebApi_commit("Wan_PVC")
	tcWebApi_commit("Dproxy_Entry")
	tcWebApi_save()
	tcWebApi_set("Wan_PVC","temp","wanType")
end if	


	if request_Form("submit_flag") <> "" then
		tcWebApi_set("Wan_PVC","ISP","wanType")
		TCWebApi_set("Dproxy_Entry","type","DNSAssign")
		TCWebApi_set("Wan_PVC","NATENABLE","NATEnable")
		TCWebApi_set("Wan_PVC","CONNECTION","CONNECTION")
		TCWebApi_set("Wan_PVC","AUTHEN","AUTHEN")
		tcWebApi_set("Wan_PVC","ENCAP","ENCAP")
		tcWebApi_set("Wan_PVC","DEFAULTROUTE","WAN_DefaultRoute") 
		tcWebApi_set("Wan_PVC","MSS","wan_TCPMSS")
		
		if request_Form("pppoe_username") <> "" then
			tcWebApi_set("Wan_PVC","USERNAME","pppoe_username")
		end if	
		if request_Form("pppoe_passwd") <> "" then
			tcWebApi_set("Wan_PVC","PASSWORD","pppoe_passwd")
		end if	
		
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
		tcWebApi_save()
		tcWebApi_set("Wan_PVC","temp","conflict_wanlan")
	end if

%>
<html>

<head>
<title><%tcWebApi_multilingual("1","glbstr_title")%></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<link rel="stylesheet" type="text/css" href="/style/hijack_style.css" />
<script language="javascript" type="text/javascript" src="/script/brs_hijack.js"></script>

<script language="javascript" type="text/javascript">

function clickContinue()
{
	/*
	if( location.href.indexOf("10.0.0.") > -1 )
		top.location.href="http://routerlogin.net";
	else if( location.href.indexOf("172.16.0.") > -1 )
		top.location.href="http://routerlogin.net";
	else if( location.href.indexOf("192.168.1.") > -1 )
		top.location.href="http://routerlogin.net";
	else if( location.href.indexOf("www.routerlogin.com") == -1 )
		top.location.href="http://routerlogin.net";
	else
		top.location.href="http://routerlogin.net";
	*/
	var loc = '';
	loc = 'http://' + document.forms[0].uiViewIPAddr.value + '/cgi-bin/index.asp';
	top.location.href= loc;
	return true;
}
</script>
</head>

<body  onload="loadvalue()">


<form method="POST" action="/cgi-bin/BRS_wanlan_conflict.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<script>
var url=window.location.toString();
var edit_parameter= url.split("?")[1].split("=")[2];
var ip_addr = edit_parameter;
var bh_important_str="<%tcWebApi_multilingual("1","bh_important_str")%>";
var bh_wanlan_conflict_info_str="<%tcWebApi_multilingual("1","bh_wanlan_conflict_info_str")%>";
var bh_continue_mark_str="<%tcWebApi_multilingual("1","bh_continue_mark_str")%>";

function redirect(){
	document.getElementById("main").style.display="";
	document.getElementById("waiting_bar").style.display="none";
}

function delay(){
	return true;
}

function loadvalue()
{

	<%
	if tcWebApi_get("Prelan_Entry","Active","h") = "Yes" then
		asp_Write("if(1){")
	else
		asp_Write("if(0){")
	end if
	%>
		setTimeout("redirect()", 50000);
		//setTimeout(function(){document.getElementById("loading_img").src=document.getElementById("loading_img").src},2);
	}
	
	
	<%
	if tcWebApi_get("Prelan_Entry","Active","h") = "Yes" then
		asp_Write("if(0){")
	else
		asp_Write("if(1){")
	end if
	%>
		var cf=document.forms[0];
		var wanlan_conflict = "<%if tcWebApi_get("Wan_PVC","temp","h") <> "N/A" then tcWebApi_get("Wan_PVC","temp","s") end if%>";
		if(wanlan_conflict=="1")
		{
			var dhcp_type = "<%If tcWebApi_get("Lan_Dhcp","type","h") <> "N/A" then tcWebApi_get("Lan_Dhcp","type","s") end if%>";
			if(ip_addr == "192.168.1.1")
			{
				cf.next_ip.value = "192.168.1.1";
				cf.next_mask.value = "255.255.255.0"
				if(dhcp_type=="1")
				{
					cf.next_dhcp_start.value = "192.168.1.2";
					cf.next_dhcp_count.value = 253;
				}
			}
			else if(ip_addr == "10.0.0.1")
			{
				cf.next_ip.value = "10.0.0.1";
				cf.next_mask.value = "255.255.255.0"
				if(dhcp_type=="1")
				{
					cf.next_dhcp_start.value = "10.0.0.2";
					cf.next_dhcp_count.value = 253;
				}
			}
			else if(ip_addr == "172.16.0.1")
			{
				cf.next_ip.value = "172.16.0.1";
				cf.next_mask.value = "255.255.255.0"
				if(dhcp_type=="1")
				{
					cf.next_dhcp_start.value = "172.16.0.2";
					cf.next_dhcp_count.value = 253;
				}
			}
			setTimeout("delay()", 2000);
			cf.submit();	
		}
	}
	
}
</script>
<input type="hidden" name="savechanged">
<input type="hidden" name="changed_flag" value="0">
<input type="hidden" name="dhcp_on" value="<%if tcWebApi_get("Lan_Dhcp","type","h") <> "N/A" then tcWebApi_get("Lan_Dhcp","type","s") end if%>">
<input type="hidden" name="next_ip">
<input type="hidden" name="next_mask">
<input type="hidden" name="next_dhcp_start">
<input type="hidden" name="next_dhcp_count">
<input type="hidden" name="tmp" value="0">
<input type="hidden" name="uiViewIPAddr" value="<%If tcWebApi_get("Lan_Entry","IP","h") <> "N/A" then tcWebApi_get("Lan_Entry","IP","s") end if%>">
<INPUT type="HIDDEN" name="Prelan_Active" value="Yes">
<div id="main" class="wizard_content_div" style="display:none">

	<div class="wizard_words_div">
		
			<script>
				document.write('<h1><h2 style="color:#ff0000;">'+bh_important_str+'</h2></h1>');
				document.write('<p>'+bh_wanlan_conflict_info_str+document.forms[0].uiViewIPAddr.value+'</p>');
			</script>
		
			

	</div>
	
	<div class="wizard_buttons_div" align="center">

		<div id="btnsContainer_div" class="buttons_img_div"  align="center" Onclick="return clickContinue();">
			<img src="/image/ca-little-purple-button.gif" />
			<script>
				document.write('<div id="btn_div" class="buttons_words_div">'+bh_continue_mark_str+'</div>');
			</script>
			<div id="btn_div" class="buttons_words_div"><!--continue--></div>
		</div>
	
	</div>

</div>
<div id="waiting_bar">
<div  align="center"><BR><BR><TR><TD align="center"><B><%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%></B></TD></TR><BR><BR></div>
<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" id="loading_img" alt="waiting" /></div>
</div>
</form>
</body>

</html>
