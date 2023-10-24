<%
if request_Form("default_flag") = "1" then
	tcWebApi_set("Account_Entry0", "firstuse","default_flag")
end if
%>
<html>

<head>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<link rel="stylesheet" type="text/css" href="/style/hijack_style.css" />
<link rel="stylesheet" type="text/css" href="/style/hijack_03A_C_pptp_reenter.css" />
<script language="javascript" type="text/javascript" src="/script/brs_hijack.js"></script>
<script language="javascript" type="text/javascript" src="/script/funcs.js"></script>
</head>

<body onload="frmLoad()">
<form method="post" action="/cgi-bin/BRS_04_applySettings.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type="hidden" name="submit_flag" value="hijack_l2tp" />
<input type="hidden" name="default_flag" value="0" />

<script language="javascript" type="text/javascript">var ts="13995622";</script>

<input type="hidden" name="WANAssign" value="0" />
<input type="hidden" name="default_flag" value="0" />
<script>
<%if Request_form("default_flag") = "1" then%>
window.location.href = "/cgi-bin/index.asp";
<%end if%>
function frmLoad()
{
	document.forms[0].inputServerIP.disabled = true;

}
function manuallyConfig()
{
        if(confirm(bh_no_genie_help_confirm_str) == false)
                return false;

        var forms = document.getElementsByTagName("form");
        var cf = forms[0];

		cf.default_flag.value=1;
		cf.action="/cgi-bin/BRS_03A_F_l2tp_reenter.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
		cf.submit();
		//location.href="/cgi-bin/index.asp";

        return true;
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

//	cf.submit();
	//location.href="/cgi-bin/BRS_04_applySettings.asp";
	cf.default_flag.value = "1";
	cf.action="/cgi-bin/BRS_04_applySettings.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
	cf.submit();


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

</script>
<div class="wizard_content_div">

	<div class="wizard_words_div">
			
			<h1 class="h1_red"><%tcWebApi_multilingual("1","bh_ISP_namePasswd_error_str")%></h1>
			<p><%tcWebApi_multilingual("1","bh_enter_info_again_str")%></p>
			
			
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
                <div id="btnsContainer_div1" class="buttons_img_div" align="center" onclick='return manuallyConfig();'>
                        <img src="/image/ca_purple_long_button.gif" />
                        <div class="buttons_words_div"><%tcWebApi_multilingual("1","bh_manual_config_connection_str")%></div>
                </div>

                <div id="btnsContainer_div2" class="buttons_img_div" align="center" onclick='return checkL2TP();'>
                        <img src="/image/ca-little-purple-button.gif" />
						<div class="buttons_words_div"><%tcWebApi_multilingual("1","bh_try_again_str")%></div>
                        
                </div>

	</div>
	

</div>

</form>
</body>

</html>
