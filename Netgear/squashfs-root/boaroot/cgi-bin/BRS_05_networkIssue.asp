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
<link rel="stylesheet" type="text/css" href="/style/hijack_05_networkIssue.css" />
<script language="javascript" type="text/javascript" src="/script/brs_hijack.js"></script>

</head>

<body>
<form method="post" action="/cgi-bin/BRS_03A_detcInetType.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type="hidden" name="submit_flag" value="wizard_detwan" />
<input type="hidden" name="default_flag" value="0" />
<input type="hidden" name="auto_detc_flag" value="1"/>
<input type="hidden" name="detect_mode" value="1"/>
<input type="hidden" name="FastWeb" value="0">
<script>
var isp = "<%if tcWebApi_get("Wan_PVC","ISP","h") <> "N/A"  then tcWebApi_get("Wan_PVC","ISP","s") end if%>";
var Wan_PVC_ENCAP = "<%tcWebApi_get("Wan_PVC","ENCAP","s")%>";
<%if Request_form("default_flag") = "2" then%>
if(isp=="0"){
	window.location.href = "/cgi-bin/BAS_ether.asp";
}
else if(isp == "2"){
	if(Wan_PVC_ENCAP=="PPPoA LLC" ||Wan_PVC_ENCAP=="PPPoA VC-Mux")
		window.location.href = "/cgi-bin/BAS_pppoa.asp";
	else
		window.location.href = "/cgi-bin/BAS_pppoe.asp";
		
	if(Wan_Common_TransMode!="ATM")	
		window.location.href = "/cgi-bin/BAS_pppoe.asp";
		
	//window.location.href = "/cgi-bin/BAS_pppoe.asp";
}
<%end if%>


function clickNext()
{
	var choices_div = document.getElementById("choices_div");
	var choices = choices_div.getElementsByTagName("input");
	var firstuse = "<%If tcWebApi_get("Lan_Entry0","firstuse","h") <> "N/A" then tcWebApi_get("Lan_Entry0","firstuse","s") end if%>";
	var forms = document.getElementsByTagName("form");
	var cf = forms[0];
	
	if(choices[0].checked)
	{
		//showFirmVersion("none");
		//cf.submit();
		if(firstuse==1)
			location.href="/cgi-bin/WIZ_sel.asp";
		else
			location.href="/cgi-bin/WIZ_sel_default.asp";
	
		return true;
	}
	else if(choices[1].checked)
	{
		if(confirm(bh_no_genie_help_confirm_str) == false)
			return false;

		cf.default_flag.value=2;
		cf.action="/cgi-bin/BRS_05_networkIssue.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
		cf.submit();
		//top.location.href="/cgi-bin/index.asp";

		return true;
	}
}
var bh_no_genie_help_confirm_str="<%tcWebApi_multilingual("1","bh_no_genie_help_confirm_str")%>";
</script>

<script language="javascript" type="text/javascript">var ts="75476800";</script>

<div class="wizard_content_div">


	<div class="wizard_words_div">
		
		<h1 class="h1_red"><%tcWebApi_multilingual("1","bh_netword_issue_str")%></h1>
		<p><%tcWebApi_multilingual("1","bh_cannot_connect_internet_str")%></p>
		<P><B>>> If you need to register login information in order to connect to the internet, please click the following link to bring up the Login page, and then key in the login information.</B></P>
		<a href="http://www.netgear.com"><i>www.netgear.com</i></a>
		<P><B>>> If you do not need to register login information in order to connect to the internet, please click the following items:</B></P>
		<!--<p><%tcWebApi_multilingual("1","bh_plz_reveiw_items_str")%></p>-->
		
		<ul style="list-style:none">
				<li><%tcWebApi_multilingual("1","bh_cable_connection_str")%></li>
				<li><%tcWebApi_multilingual("1","bh_modem_power_properly_str")%></li>
		</ul>
		
		<div id="choices_div" class="radio_choice_divs">
			<p><%tcWebApi_multilingual("1","bh_try_again_or_manual_config_str")%></p>
			<div class="radio_div">
				<input type="radio" name="help_choice" value="0" checked="checked" /><%tcWebApi_multilingual("1","bh_yes_mark_str")%>
			</div>
			<div class="radio_div">
				<input type="radio" name="help_choice" value="1"  /><%tcWebApi_multilingual("1","bh_I_want_manual_config_str")%>
			</div>
		</div>
		
	</div>

	<div class="wizard_buttons_div" align="center">
		<div id="btnsContainer_div" class="buttons_img_div" onclick='return clickNext();'>
			<img src="/image/ca-little-purple-button.gif" />

			<div id="btn_text_div" class="buttons_words_div" align="center"><%tcWebApi_multilingual("0","glbstr_next")%></div>
			
		</div>
	</div>
	
</div>

</form>
</body>

</html>
