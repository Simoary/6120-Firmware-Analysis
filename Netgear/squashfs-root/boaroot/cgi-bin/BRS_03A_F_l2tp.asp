<%
if request_Form("SwitchPVCFlag") = "1" then
		tcWebApi_set("WebCurSet_Entry","wan_pvc","WANNumber")
elseif request_Form("WAN_type") <> "" then
		tcWebApi_set("WebCurSet_Entry","wan_pvc","wan_pvc")
		tcWebApi_set("WebCurSet_Entry","nat_pvc","wan_pvc")
		tcWebApi_set("Wan_Common","TransMode","TransMode")
		tcWebApi_set("Wan_PVC","Active","Active")
	
		if request_Form("ADSL_mode") <> tcWebApi_get("Adsl_Entry","MODULATIONTYPE","h") then
			tcWebApi_set("Adsl_Entry","MODULATIONTYPE","ADSL_mode")
			tcWebApi_commit("Adsl_Entry")
		end if
	
		if request_Form("WAN_type") = "1" then
			tcWebApi_set("Wan_PVC","QOS","AdslQoS")
			tcWebApi_set("Wan_PVC","VPI","AdslVpi")
			tcWebApi_set("Wan_PVC","VCI","AdslVci")
			tcWebApi_set("Wan_PVC","ENCAP","ENCAP")
		end if
		
end if
if request_Form("wan_pvc") <> "" then
		
		
		tcWebApi_set("Wan_PVC","IPVERSION","ipVerRadio")
		tcWebApi_set("Wan_PVC","ISP","WANAssign")
		TCWebApi_set("Dproxy_Entry","type","DNSAssign")
		TCWebApi_set("Wan_PVC","NATENABLE","NATEnable")
		tcWebApi_set("Wan_PVC","DEFAULTROUTE","WAN_DefaultRoute")
		
		if request_Form("WANAssign") = "1" then	
			tcWebApi_set("Wan_PVC","IPADDR","ip_address")
			tcWebApi_set("Wan_PVC","NETMASK","subnet_mask")
			tcWebApi_set("Wan_PVC","GATEWAY","gateway")
		end if
		
		if request_Form("Spoofmac") <> "" then
			tcWebApi_set("Wan_PVC","Mac_Assign","WAN_MAC_ASSIGN")
			tcWebApi_set("Wan_PVC","Mac_Spoofing","Spoofmac")
		end if	
		
		if request_Form("DNSAssign") = "1" then
			if request_Form("l2tp_dnsaddr1") <> "" then
				TCWebApi_set("Dproxy_Entry","Primary_DNS","l2tp_dnsaddr1")
			end if	
			if request_Form("l2tp_dnsaddr2") <> "" then
				TCWebApi_set("Dproxy_Entry","Secondary_DNS","l2tp_dnsaddr2")
			end if
		end if
		
		tcWebApi_set("Pptp_Entry","Active","DISABLE")
		tcWebApi_commit("Pptp_Entry")
		
		tcWebApi_set("L2tp_Entry","Active","Active")
		tcWebApi_set("L2tp_Entry","ServerIp","l2tp_serv_ip")
		TCWebApi_set("L2tp_Entry","Username","login_name")
		TCWebApi_set("L2tp_Entry","Password","passwd")
		TCWebApi_set("L2tp_Entry","Timeout","idle_timeout")
		tcWebApi_commit("L2tp_Entry")
		
		tcWebApi_commit("Wan_PVC")
		tcWebApi_commit("Dproxy_Entry")
		tcWebApi_save()
	end	if
%>
<html>

<head>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<link rel="stylesheet" type="text/css" href="/style/hijack_style.css" />
<link rel="stylesheet" type="text/css" href="/style/hijack_03A_C_pptp.css" />
<script language="javascript" type="text/javascript" src="/script/brs_hijack.js"></script>
<script language="javascript" type="text/javascript" src="/script/funcs.js"></script>
</head>

<body onload="frmLoad()">
<form method="post" action="/cgi-bin/BRS_04_applySettings.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type="hidden" name="submit_flag" value="hijack_l2tp" />

<script>
function frmLoad()
{
	document.forms[0].inputServerIP.disabled = true ;
	
	<% if request_Form("postflag") = "1" then %>
	var toptitle_div = document.getElementById("toptitle");
	var main_div = document.getElementById("allBtns_div");
	var pls_wait_div = document.getElementById("pls_wait_div");
	
	toptitle_div.style.display = "none";
	main_div.style.display = "none";
	pls_wait_div.style.display = "";
	updateProgress();
	<%else%>	
	var toptitle_div = document.getElementById("toptitle");
	var main_div = document.getElementById("allBtns_div");
	var pls_wait_div = document.getElementById("pls_wait_div");
	
	toptitle_div.style.display = "";
	main_div.style.display = "";
	pls_wait_div.style.display = "none";
	
	
	<%end if%>
}
var pchar = "||"; // progress char
var maxchars = 30; 
var delay_time = 2000; // msecs
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
		/*
		<%if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "0" then%>
		var wan_status = <%tcWebApi_staticGet("DeviceInfo_PVC","Status","s")%>;
		<%else%>
		//var wan_status = "0";
		var wan_status = "1";
		<%end if%>
		*/
		var wan_status = "1";
		if(wan_status=='1')
		{
			//location.href="/cgi-bin/BRS_success.asp";
			cf.default_flag.value = "1";
			cf.action="/cgi-bin/BRS_success.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
			cf.submit();
		}
		else
		{
			location.href="/cgi-bin/BRS_05_networkIssue.asp";
		}
	}
}
function makeStr(strSize, fillChar)
{
	var temp = "";
	for (i=0; i < strSize ; i ++)
		temp = temp + fillChar;
	return temp;
}
function checkL2TP()
{
	var forms = document.getElementsByTagName("form");
	var cf = forms[0];

	var l2tp_username = document.getElementById("inputName");
	var l2tp_passwd = document.getElementById("inputPasswd");
	var l2tp_idletime = document.getElementById("inputIdle");

	if(l2tp_username.value=="")
	{
		alert(bh_login_name_null_str);
		return false;
	}

	var i;
	for(i=0; i<l2tp_passwd.value.length; i++)
	{
		if(isValidChar(l2tp_passwd.value.charCodeAt(i))==false)
		{
			alert(bh_password_error_str);
			return false;
		}
	}
	if(l2tp_idletime.value.length <= 0)
	{
		alert(bh_idle_time_null_str);
		return false;
	}
	else if(!_isNumeric(l2tp_idletime.value))
	{
		alert(bh_invalid_idle_time_str);
		return false;
	}

	if(!checkIPaddr())
		return false;
	cf.l2tp_serv_ip.value = cf.inputServerIP.value;
	
	cf.submit();
	//location.href="BRS_04_applySettings.html";

	return true;
}

function checkIPaddr()
{
	var forms = document.getElementsByTagName("form");
        var cf = forms[0];

	var l2tp_myip = document.getElementById("inputIPaddr");
        var l2tp_gateway = document.getElementById("inputGateway");

	if(l2tp_myip.value != "")
	{
		cf.WANAssign.value = 1;
		if(checkipaddr(l2tp_myip.value)==false)
		{
			alert(bh_invalid_myip_str);
			return false;
		}
		if(l2tp_gateway.value != "" && checkgateway(l2tp_gateway.value) == false)
		{
			alert(bh_invalid_gateway_str);
			return false;
		}
		if(l2tp_gateway.value != "")
		{
			if(isSameIp(l2tp_myip.value,pptp_gateway.value) == true)
			{
				alert(bh_invalid_gateway_str);
				return false;
			}
		}
	}
	else
		cf.WANAssign.value=0;
	
	return true;
}
var bh_login_name_null_str="<%tcWebApi_multilingual("1","bh_login_name_null_str")%>";
var bh_password_error_str="<%tcWebApi_multilingual("1","bh_password_error_str")%>";
var bh_idle_time_null_str="<%tcWebApi_multilingual("1","bh_idle_time_null_str")%>";
var bh_invalid_idle_time_str="<%tcWebApi_multilingual("1","bh_invalid_idle_time_str")%>";
var bh_invalid_myip_str="<%tcWebApi_multilingual("1","bh_invalid_myip_str")%>";
var bh_invalid_gateway_str="<%tcWebApi_multilingual("1","bh_invalid_gateway_str")%>";
</script>

<INPUT TYPE="HIDDEN" NAME="postflag" VALUE="1">

<input type="hidden" name="TransMode" value="Ethernet" />
<input type="hidden" name="wan_pvc" value="10" />
<input type="hidden" name="Active" value="Yes" />
<input type="hidden" name="SwitchPVCFlag" value="0" />
<input type="hidden" name="ADSL_mode" value="Auto Sync-Up" />
<input type="hidden" name="WAN_type" value="0" />

<input type="hidden" name="ipVerRadio" value="IPv4" />
<input type="hidden" name="WANAssign" value="0" />
<input type="hidden" name="DNSAssign" value="0" />
<input type="hidden" name="NATEnable" value="Enable" />
<input type="hidden" name="WAN_DefaultRoute" value="Yes" />
<input type="hidden" name="DISABLE" value="No" />
<input type="hidden" name="WAN_MAC_ASSIGN" value="0" />
<input type="hidden" name="Spoofmac" value="<%if tcWebApi_get("Lan_Entry0","MAC","h") <> "N/A"  then tcWebApi_get("Lan_Entry0","MAC","s") end if%>" />
<input type="hidden" name="l2tp_serv_ip" value="0" />
<input type="hidden" name="default_flag" value="0" />


<div class="wizard_content_div">

	<div class="wizard_words_div" id="toptitle">
		
			<h1><%tcWebApi_multilingual("1","bh_l2tp_connection_str")%></h1>
			<p><%tcWebApi_multilingual("1","bh_enter_info_below_str")%></p>
			
			<div id="mainContent_div">
				
				<div id="loginName" class="input_left_div" align="right"><%tcWebApi_multilingual("1","bh_pppoe_login_name_str")%></div>
				
				<div class="input_img_div">
					<!--img src="/image/ca_text_pic.gif" /-->
					<input type="text" id="inputName" align="right" maxlength="60" name="login_name" class="input_text" onkeypress ="return getkey('ssid', event)"/>
				</div>
				
				<div id="passwd" class="input_left_div" align="right"><%tcWebApi_multilingual("1","bh_ddns_passwd_str")%></div>
				
				<div class="input_img_div">
					<!--img src="/image/ca_text_pic.gif" /-->
					<input type="password" id="inputPasswd" align="right" maxlength="16" name="passwd" class="input_text" onkeypress ="return getkey('ssid', event)"/>
				</div>

				<div id="idleTimeout" class="input_left_div" align="right"><%tcWebApi_multilingual("1","bh_basic_pppoe_idle_str")%></div>
				
				<div class="input_img_div">
					<!--img src="/image/ca_text_pic.gif" /-->
					<input type="text" align="right" id="inputIdle" maxlength="5" name="idle_timeout" class="input_text" value="5" onkeypress ="return getkey('num', event)"/>
				</div>
				
				<div id="IP_addr" class="input_left_div" align="right"><%tcWebApi_multilingual("1","bh_info_mark_ip_str")%></div>
				
				<div class="input_img_div">
					<!--img src="/image/ca_text_pic.gif" /-->
					<input type="text" align="right" id="inputIPaddr" maxlength="15" name="ip_address" class="input_text" onkeypress ="return getkey('ipaddr', event)"/>
				</div>
				
				<div id="subnet_mask" class="input_left_div" align="right"><%tcWebApi_multilingual("1","bh_info_mark_mask_str")%></div>
				
				<div class="input_img_div">
					<!--img src="/image/ca_text_pic.gif" /-->
					<input type="text" align="right" id="inputSubnetMask" name="subnet_mask" class="input_text" onkeypress ="return getkey('ipaddr', event)"/>
				</div>	
				
				<div id="serverIP" class="input_left_div" align="right"><%tcWebApi_multilingual("1","bh_basic_pptp_servip_str")%></div>
				
				<div class="input_img_div">
					<!--img src="/image/ca_text_pic.gif" /-->
					<input type="text" align="right" id="inputServerIP" name="serverip" class="input_text" value="172.16.164.140"/>
				</div>
				
				<div id="Gateway" class="input_left_div" align="right"><%tcWebApi_multilingual("1","bh_sta_routes_gtwip_str")%></div>
				
				<div class="input_img_div">
					<!--img src="/image/ca_text_pic.gif" /-->
					<input type="text" align="right" id="inputGateway" maxlength="15" name="gateway" class="input_text" onkeypress ="return getkey('ipaddr', event)"/>
				</div>

				<div style="clear:both"></div>
			</div>
		
	</div>
	
	<div id="allBtns_div" class="wizard_buttons_div" align="right">
		<div id="btnsContainer_div" class="buttons_img_div" onclick='return checkL2TP();'>
			<img src="/image/ca-little-purple-button.gif" />
			<div id="btn_text_div" class="buttons_words_div" align="center"><%tcWebApi_multilingual("0","glbstr_next")%></div>
			
		</div>	
	</div>
	<div class="wizard_words_div" id="pls_wait_div" style="display:none">
			
			<h1><%tcWebApi_multilingual("1","bh_apply_connection_str")%></h1>
			<p><%tcWebApi_multilingual("1","bh_plz_waite_apply_connection_str")%></p>
			
			<tr>
			<td nowrap><input type="text" name="progress" class="reboot1bar" size="60"  value=""></td>
			</tr>
			
			<!--
			<TD colspan="2"><img src="/liteblue.gif" width=100% height="12"></TD>
			<div id="applySettings_wait" class="waiting_img_div" align="center">
				<img src="/image/wait30.gif" alt="waiting" />
			</div>
			-->
	</div>

</div>

</form>
</body>

</html>
