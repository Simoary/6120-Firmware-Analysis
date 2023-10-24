<html>

<head>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<link rel="stylesheet" type="text/css" href="/style/hijack_style.css" />
<link rel="stylesheet" type="text/css" href="/style/hijack_03A_E_IP_problem_staticIP_B_macClone.css" />
<script language="javascript" type="text/javascript" src="/script/brs_hijack.js"></script>
<script language="javascript" type="text/javascript" src="/script/funcs.js"></script>
</head>

<body>
<form method="post" action="/cgi-bin/BRS_03A_E_IP_problem_staticIP_B_macClone_plzWait.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type="hidden" name="submit_flag" value="hijack_mac_clone" />
<input type="hidden" name="WAN_MAC_ASSIGN" value="0">
<script>
var alert_invalid_mac_str="<%tcWebApi_multilingual("0","invalid_mac_str")%>";
function checkMacApply()
{
	var forms = document.getElementsByTagName("form");
	var cf = forms[0];

	//set input event action
	var mac_input = document.getElementById("spoofmac");
	var the_mac = mac_input.value;

	if(the_mac.indexOf(":")==-1 && the_mac.length=="12")
	{
		var tmp_mac=the_mac.substr(0,2)+":"+the_mac.substr(2,2)+":"+the_mac.substr(4,2)+":"+the_mac.substr(6,2)+":"+the_mac.substr(8,2)+":"+the_mac.substr(10,2);
		
		mac_input.value = tmp_mac;
	}
	else if (the_mac.split("-").length == 6)
	{
		var tmp_mac = the_mac.replace(/-/g,":");
		mac_input.value = tmp_mac;
	}

	if(maccheck_multicast(mac_input.value) == false)
		return false;

	//cf.submit();
	location.href="/cgi-bin/BRS_03A_E_IP_problem_staticIP_B_macClone_plzWait.asp";
	
	return true;
}
</script>

<div class="wizard_content_div">

	<div class="wizard_words_div">

		<h1 class="h1_red"><%tcWebApi_multilingual("1","bh_no_internet_ip3_str")%></h1>
		<p><%tcWebApi_multilingual("1","bh_use_pc_mac_str")%></p>
		<p><%tcWebApi_multilingual("1","bh_mac_in_product_label_str")%></p>
		<p><%tcWebApi_multilingual("1","bh_enter_mac_str")%></p>
	
		
		<div id="mac_input_div" align="center">
		
			<input type="text" id="spoofmac" name="spoofmac" maxlength="17" class="mac_input" onkeypress ="return getkey('mac', event)" /><%tcWebApi_multilingual("1","bh_mac_format_str")%>
		</div>
	
	</div>

	<div id="buttons_div" class="wizard_buttons_div" align="right">
		<div id="btnsContainer_div" class="buttons_img_div" align="center" onclick='return 	checkMacApply();'>
			<img src="/image/ca-little-purple-button.gif" />
			<div id="btn_div" class="buttons_words_div"><%tcWebApi_multilingual("0","glbstr_next")%></div>
		</div>
	</div>
	
</div>

</form>
</body>

</html>
