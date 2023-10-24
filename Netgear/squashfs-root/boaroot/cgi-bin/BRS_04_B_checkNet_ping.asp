<%
IF request_Form("ping_flag") <> "" then
		tcWebApi_get("AutoDetect_Entry","Ping_Flag","h")
end if
%>
<html>

<head>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<link rel="stylesheet" type="text/css" href="/style/hijack_style.css" />
<script language="javascript" type="text/javascript" src="/script/brs_hijack.js"></script>

</head>

<body onload="frmLoad()">
<style>
.prgbar { width: 393px; }
</style>
<form method="post" action="/cgi-bin/BRS_03A_detcInetType.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type="hidden" name="submit_flag" value="wizard_detwan" />
<input type="hidden" name="detect_mode" value="1"/>
<input type="hidden" name="ping_finish" value="1"/>
<input type=hidden name="after_wait_flag" value="1">
<input type="hidden" name="ppp_double_check" />
<script>
<%if Request_form("ping_flag") = "pppoe" then%>
next_page = "/cgi-bin/BRS_03A_B_pppoe.asp";
<%elseif Request_form("ping_flag") = "pppoe_reenter" then%>
next_page = "/cgi-bin/BRS_03A_B_pppoe_reenter.asp";
<%elseif Request_form("ping_flag") = "ipoa" then%>
next_page = "/cgi-bin/BRS_03A_E_IP_problem_IPoA_A_inputIP.asp";
<%elseif Request_form("ping_flag") = "static" then%>
next_page = "/cgi-bin/BRS_03A_E_IP_problem_staticIP_A_inputIP.asp";
<%elseif Request_form("ping_flag") = "dhcp" then%>
next_page = "/cgi-bin/BRS_04_B_checkNet.asp";
<%end if%>

<%if Request_form("ppp_double_check") = "0" then%>
document.forms[0].ppp_double_check.value = "0";
<%elseif Request_form("ppp_double_check") = "1" then%>
document.forms[0].ppp_double_check.value = "1";
<%end if%>
function frmLoad()
{

	updateProgress();
	

}

var pchar = "|"; // progress char
var maxchars = 106; 
var delay_time = 200; // msecs
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
		document.forms[0].action= next_page + "?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
		document.forms[0].submit();
	}
	
}
function makeStr(strSize, fillChar)
{
	var temp = "";
	for (i=0; i < strSize ; i ++)
		temp = temp + fillChar;
	return temp;
}
</script>
<input type="hidden" name="TransMode" value="Ethernet" />
<input type="hidden" name="wan_pvc" value="10" />
<input type="hidden" name="Active" value="Yes" />
<input type="hidden" name="SwitchPVCFlag" value="0" />
<input type="hidden" name="ADSL_mode" value="Auto Sync-Up" />
<input type="hidden" name="WAN_type" value="0" />

<input type="hidden" name="ipVerRadio" value="IPv4" />
<input type="hidden" name="wanType" value="0" />
<input type="hidden" name="DNSAssign" value="0" />
<input type="hidden" name="NATEnable" value="Enable" />
<input type="hidden" name="ENCAP" value="1483 Bridged IP VC-Mux" />
<input type="hidden" name="WAN_DefaultRoute" value="Yes" />
<input type="hidden" name="WANAssign" value="dhcp" />
<input type="hidden" name="Spoofmac" value="<%if tcWebApi_get("Lan_Entry0","MAC","h") <> "N/A"  then tcWebApi_get("Lan_Entry0","MAC","s") end if%>" />


<div class="wizard_content_div">

	<div class="wizard_words_div">

		<div class="waiting_connect_div" align="center">
			<h1 class="h1_black"><%tcWebApi_multilingual("1","bh_internet_checking_str")%></h1>
		</div>
			
		<div class="reboot1bar" align="center">
			<input type="text" name="progress" size="60" class="prgbar" value="">
		</div>
		

	</div>

</div>

</form>
</body>

</html>


