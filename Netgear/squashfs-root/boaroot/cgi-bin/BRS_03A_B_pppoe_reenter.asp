<%
if request_Form("default_flag") = "1" then
	tcWebApi_set("Account_Entry0", "firstuse","default_flag")
end if

if request_Form("submit_flag") = "1" then
		tcWebApi_set("WebCurSet_Entry","wan_pvc","wan_pvc")
		tcWebApi_set("WebCurSet_Entry","nat_pvc","wan_pvc")
		tcWebApi_set("Wan_Common","TransMode","TransMode")
		tcWebApi_set("Wan_PVC","Active","Active")
	
		tcWebApi_set("Wan_PVC","QOS","AdslQoS")
		tcWebApi_set("Wan_PVC","VPI","AdslVpi")
		tcWebApi_set("Wan_PVC","VCI","AdslVci")
		tcWebApi_set("Wan_PVC","ENCAP","ENCAP")
		
		tcWebApi_set("Wan_PVC","ISP","wanType")
		TCWebApi_set("Wan_PVC","NATENABLE","NATEnable")
		TCWebApi_set("Wan_PVC","CONNECTION","pppoe_dod")
		if request_Form("AdslMtu") <> "0" then
			tcWebApi_set("Wan_PVC","MTU","AdslMtu")
		end if
		TCWebApi_set("Wan_PVC","AUTHEN","AUTHEN")
		tcWebApi_set("Wan_PVC","ENCAP","ENCAP")
		tcWebApi_set("Wan_PVC","DEFAULTROUTE","WAN_DefaultRoute") 
		tcWebApi_set("Wan_PVC","MSS","wan_TCPMSS")
		
		if request_Form("pppoe_name") <> "" then
			tcWebApi_set("Wan_PVC","USERNAME","pppoe_name")
		end if	
		if request_Form("pppoe_passwd") <> "" then
			tcWebApi_set("Wan_PVC","PASSWORD","pppoe_passwd")
		end if	
		
		
		tcWebApi_set("Wan_PVC","CLOSEIFIDLE","pppoe_idletime")
		
		tcWebApi_set("Wan_PVC","PPPGETIP","wan_PPPGetIP")
		
		tcWebApi_set("Pptp_Entry","Active","PPTPDISABLE")
		tcWebApi_commit("Pptp_Entry")
		
		tcWebApi_commit("Wan_PVC")
		tcWebApi_save()
end if
%>
<html>

<head>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="/style/hijack_style.css" />
<link rel="stylesheet" type="text/css" href="/style/hijack_03A_wanInput_reenter.css" />
<script language="javascript" type="text/javascript" src="/script/brs_hijack.js"></script>
<script language="javascript" type="text/javascript" src="/script/funcs.js"></script>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onload="frmLoad()">
<style>
.prgbar { width: 393px; }
</style>
<form method="post" action="/cgi-bin/BRS_03A_B_pppoe_reenter.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type="hidden" name="default_flag" value="0" />
<input type=hidden name=submit_flag value="pppoe">
<INPUT type=hidden name=TransMode value="<% if tcWebApi_get("Wan_Common","TransMode","h") <> "N/A" then tcWebApi_get("Wan_Common","TransMode","s") end if%>">
<INPUT type=hidden name=wan_pvc value="<% if tcWebApi_get("Wan_Common","TransMode","h") = "ATM" then asp_write("0") elseif tcWebApi_get("Wan_Common","TransMode","h") = "Ethernet" then asp_write("10") end if%>">
<INPUT type=hidden name=Active value="Yes">

<INPUT type=hidden name=AdslQoSPcrRate value="0">

<INPUT TYPE="HIDDEN" NAME="postflag" VALUE="1">
<input type=hidden name=wanType value="2">
<input type=hidden name=NATEnable value="Enable">
<input type=hidden name=pppoe_dod value="Connect_Keep_Alive">
<input type=hidden name=AUTHEN value="AUTO">
<input type=hidden name=WAN_DefaultRoute value="Yes">
<input type=hidden name=wan_TCPMSS value="0">
<input type=hidden name=pppoe_idletime value="">
<input type=hidden name=wan_PPPGetIP value="Dynamic">
<input type=hidden name=PPTPDISABLE value="No">
<input type=hidden name="after_wait_flag" value="0">
<input type="hidden" name="ping_flag" value="pppoe_reenter"/>
<input type="hidden" name="ppp_double_check" value="0"/>
<!--bug 22145 add hijack_toBasic-->

<script language="javascript" type="text/javascript">var ts="76706576";</script>
<script>
<%if Request_form("default_flag") = "1" then%>
parent.location.href = "/cgi-bin/index.asp";
<%end if%>
function manuallyConfig()
{
	if(confirm(bh_no_genie_help_confirm_str) == false)
		return false;

	var forms = document.getElementsByTagName("form");
	var cf = forms[0];
	

	cf.default_flag.value=1;
	//cf.action="/cgi-bin/BRS_03A_B_pppoe_reenter.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
	cf.submit();
	//location.href = "/cgi-bin/index.asp";

	return true;
}
function checkPPPoE()
{
	var forms = document.getElementsByTagName("form");
        var cf = forms[0];
	
	var pppoe_name = document.getElementById("pppoe_name");
	var pppoe_passwd = document.getElementById("inputPasswd");

	if(pppoe_name.value == "")
	{
		alert(bh_login_name_null_str);
		return false;
	}

	var i;
	for(i=0;i<pppoe_passwd.value.length;i++)
	{
		if(isValidChar(pppoe_passwd.value.charCodeAt(i))==false)
		{
			alert(bh_password_error_str);
			return false;
		}
	}

	
	var toptitle_div = document.getElementById("toptitle");
	var main_div = document.getElementById("allBtns_div");
	var pls_wait_div = document.getElementById("pls_wait_div");
	var waiting_img_div = document.getElementById("waiting_img_div");
	
	toptitle_div.style.display = "none";
	main_div.style.display = "none";
	waiting_img_div.style.display = "";
	pls_wait_div.style.display = "none";
	
	if(cf.AdslMtu.value=="0")
	{
		if(cf.ENCAP.value == "PPPoE LLC" || cf.ENCAP.value == "PPPoE VC-Mux"){
			cf.AdslMtu.value = "1492";
		}
		else{
			cf.AdslMtu.value = "1458";
		}
	}
	
	location.href="/cgi-bin/BRS_03A_B_pppoe_reenter.asp";
	cf.submit_flag.value="1";
	cf.submit();

	return true;
	
}
var pchar = "|"; // progress char
var maxchars = 106; 
var delay_time = 300; // msecs
var charcount = 0; 
function frmLoad()
{
	var toptitle_div = document.getElementById("toptitle");
	var main_div = document.getElementById("allBtns_div");
	var pls_wait_div = document.getElementById("pls_wait_div");
	var waiting_img_div = document.getElementById("waiting_img_div");
	
	toptitle_div.style.display = "none";
	main_div.style.display = "none";
	waiting_img_div.style.display = "none";
	pls_wait_div.style.display = "none";
	
	var cf = document.forms[0];
	<% if request_Form("ppp_double_check") = "0" then %>
	cf.ppp_double_check.value="0";
	<%elseif request_Form("ppp_double_check") = "1" then%>
	cf.ppp_double_check.value="1";
	<%end if%>
	
	
	<% if request_Form("after_wait_flag") = "1" then %>
	
		<% if request_Form("ping_finish") <> "1" then %>
			<%tcWebApi_staticGet("AutoDetect_Entry","Ping_Flag","h")%>
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
					<% if request_Form("ppp_double_check") = "1" then %>
						location.href="/cgi-bin/BRS_03A_B_pppoe_reenter.asp";
					<%else%>
						cf.ppp_double_check.value = "1";
						if(cf.ENCAP.value == "PPPoE LLC")
							cf.ENCAP.value = "PPPoA LLC";
						else if(cf.ENCAP.value == "PPPoE VC-Mux")
							cf.ENCAP.value = "PPPoA VC-Mux";
						else if(cf.ENCAP.value == "PPPoA VC-Mux")
							cf.ENCAP.value = "PPPoE VC-Mux";
						else if(cf.ENCAP.value == "PPPoA LLC")
							cf.ENCAP.value = "PPPoE LLC";
							
						cf.pppoe_name.value = "<%TCWebAPI_staticGet("Wan_PVC", "USERNAME", "s")%>";
						cf.pppoe_passwd.value = "<%TCWebAPI_staticGet("Wan_PVC", "PASSWORD", "s")%>";
						checkPPPoE();
						
					<%end if%>
				}
			
		<%end if%>
	<%else%>

	<% if request_Form("postflag") = "1" then %>
	/*
	var toptitle_div = document.getElementById("toptitle");
	var main_div = document.getElementById("allBtns_div");
	var pls_wait_div = document.getElementById("pls_wait_div");
	var waiting_img_div = document.getElementById("waiting_img_div");
	*/
	
	toptitle_div.style.display = "none";
	main_div.style.display = "none";
	waiting_img_div.style.display = "none";
	pls_wait_div.style.display = "";
	updateProgress();
	<%else%>	
	/*
	var toptitle_div = document.getElementById("toptitle");
	var main_div = document.getElementById("allBtns_div");
	var pls_wait_div = document.getElementById("pls_wait_div");
	var waiting_img_div = document.getElementById("waiting_img_div");
	*/
	
	toptitle_div.style.display = "";
	main_div.style.display = "";
	waiting_img_div.style.display = "none";
	pls_wait_div.style.display = "none";
	
	
	<%end if%>
	<%end if%>
}
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
		<%if tcWebApi_staticGet("WanInfo_Entry","IP","h") <> "N/A" then%>
		var wan_status =  "<%tcWebApi_staticGet("WanInfo_Entry","Active","s")%>";
		<%else%>
		var wan_status = "0";
		<%end if%>
		if(wan_status=='1')
		{
			cf.default_flag.value = "1";
			//location.href="/cgi-bin/BRS_success.asp";
			cf.action="/cgi-bin/BRS_success.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
			cf.submit();
		}
		else
		{
			location.href="/cgi-bin/BRS_03A_B_pppoe_reenter.asp";
		}
		*/
		cf.after_wait_flag.value = "1";
		cf.submit();
	}
	
}
function makeStr(strSize, fillChar)
{
	var temp = "";
	for (i=0; i < strSize ; i ++)
		temp = temp + fillChar;
	return temp;
}

var bh_no_genie_help_confirm_str="<%tcWebApi_multilingual("1","bh_no_genie_help_confirm_str")%>";
var bh_login_name_null_str="<%tcWebApi_multilingual("1","bh_login_name_null_str")%>";
var bh_password_error_str="<%tcWebApi_multilingual("1","bh_password_error_str")%>";
</script>
<input type="hidden" name="WANAssign" value="0" />
<INPUT type=hidden name=AdslVpi value="<%if TCWebAPI_get("AutoDetect_Entry", "VPI", "h") <> "N/A" then TCWebAPI_staticGet("AutoDetect_Entry", "VPI", "s") else asp_Write("0") end if %>">
<INPUT type=hidden name=AdslVci value="<%if TCWebAPI_get("AutoDetect_Entry", "VCI", "h") <> "N/A" then TCWebAPI_staticGet("AutoDetect_Entry", "VCI", "s") else asp_Write("33") end if %>">
<INPUT type=hidden name=AdslQoS value="ubr">
<INPUT type=hidden name=ENCAP value="<%if TCWebAPI_get("AutoDetect_Entry", "Encapsulation", "h") = "VC" then if TCWebAPI_get("AutoDetect_Entry", "ConnectType", "h") = "STATUS_PPPOA" then asp_Write("PPPoA VC-Mux") else asp_Write("PPPoE VC-Mux") end if else if TCWebAPI_get("AutoDetect_Entry", "ConnectType", "h") = "STATUS_PPPOA" then asp_Write("PPPoA LLC") else asp_Write("PPPoE LLC") end if end if%>">
<INPUT type=hidden name=AdslMtu value="<%if TCWebAPI_get("AutoDetect_Entry", "detecting_mtu", "h") <> "0" then TCWebAPI_staticGet("AutoDetect_Entry", "detecting_mtu", "s") else asp_Write("0") end if %>">
<div class="wizard_content_div">

	<div class="wizard_words_div" id="toptitle">
			
			<h1 class="h1_red"><%tcWebApi_multilingual("1","bh_ISP_namePasswd_error_str")%></h1>
			<p><%tcWebApi_multilingual("1","bh_enter_info_again_str")%></p>
			
			<div class="wanInput_content_div">
				
				<div id="loginName" class="wanInput_left_div" align="right"><p><%tcWebApi_multilingual("1","bh_pppoe_login_name_str")%> :</div>
				
				<div class="wanInput_Img_div">
					<img src="/image/ca_text_pic.gif" />
					<input type="text" id="pppoe_name" maxlength="64" align="right" name="pppoe_name" onkeypress ="return getkey('ssid', event)"/>
				</div>
				
				<div id="passwd" class="wanInput_left_div" align="right"><%tcWebApi_multilingual("1","bh_ddns_passwd_str")%> :</div>
				
				<div class="wanInput_Img_div">
					<img src="/image/ca_text_pic.gif" />
					<input type="text" id="inputPasswd" maxlength="16" align="right" name="pppoe_passwd" onkeypress ="return getkey('ssid', event)"/>
				</div>
				
				<div style="clear:both"></div>
			</div>
		
	</div>
	
	<div id="allBtns_div" class="wizard_buttons_div" align="right">

		<div id="btnsContainer_div1" class="buttons_img_div" align="center" onclick='return manuallyConfig();'>
			<img src="/image/ca_purple_long_button.gif" />
			<div class="buttons_words_div"><%tcWebApi_multilingual("1","bh_manual_config_connection_str")%></div>
		</div>

		<div id="btnsContainer_div2" class="buttons_img_div" align="center" onclick='return checkPPPoE();'>
			<img src="/image/ca-little-purple-button.gif" />
			<div class="buttons_words_div"><%tcWebApi_multilingual("1","bh_try_again_str")%></div>
			
		</div>

	</div>
	
	<div class="wizard_content_div" id="waiting_img_div">
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
			<td nowrap><input type="text" name="progress" class="prgbar" size="60"  value=""></td>
			</tr>

		</div>

	</div>
	

</div>

</form>
</body>

</html>
