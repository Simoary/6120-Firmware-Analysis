<html>

<head>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<link rel="stylesheet" type="text/css" href="/style/hijack_style.css" />
<link rel="stylesheet" type="text/css" href="/style/hijack_03A_E_IP_problem_staticIP.css" />
<script language="javascript" type="text/javascript" src="/script/brs_hijack.js"></script>
</head>

<body>

<div class="wizard_content_div">
<script>
function staticIPChoice()
{
	var choices =document.getElementsByTagName("input");

	if(choices[0].checked)
		this.location.href = "/cgi-bin/BRS_03A_E_IP_problem_staticIP_A_inputIP.asp";
	else if(choices[1].checked || choices[2].checked)
		this.location.href = "/cgi-bin/BRS_03A_E_IP_problem_staticIP_B_macClone.asp";
	else
	{
		alert(bh_select_an_option_str);
		return false;
	}
}
var bh_select_an_option_str="<%tcWebApi_multilingual("1","bh_select_an_option_str")%>";
</script>
	<div class="wizard_words_div">
		
		<h1 class="h1_red"><%tcWebApi_multilingual("1","bh_no_internet_ip2_str")%></h1>
		
		<p><%tcWebApi_multilingual("1","bh_if_have_static_ip_str")%></p>
		<p><%tcWebApi_multilingual("1","bh_select_option_str")%></p>
		
		<div id="staticIP_choices_div">
			<div class="radio_div">
				<input type="radio" name="static_ip_choice" id="static_ip_choice" value="0" /><%tcWebApi_multilingual("1","bh_yes_correct_str")%>
			</div>
			<div class="radio_div">
				<input type="radio" name="static_ip_choice" id="static_ip_choice" value="1" /><%tcWebApi_multilingual("1","bh_not_have_static_ip_str")%>
			</div>
			<div class="radio_div">
				<input type="radio" name="static_ip_choice" id="static_ip_choice" value="2" /><%tcWebApi_multilingual("1","bh_do_not_know_str")%>
			</div>
		</div>
	</div>

	<div id="buttons_div" class="wizard_buttons_div" align="right">
		<div id="btnsContainer_div" class="buttons_img_div" align="center" onclick='return 	staticIPChoice();'>
			<img src="/image/ca-little-purple-button.gif" />
			<div id="next" name="Next" class="buttons_words_div"><%tcWebApi_multilingual("0","glbstr_next")%></div>
		</div>
	</div>
		
</div>

</body>

</html>
