<html>

<head>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<link rel="stylesheet" type="text/css" href="/style/hijack_style.css" />
<link rel="stylesheet" type="text/css" href="/style/hijack_03A_E_IP_problem.css" />
<script language="javascript" type="text/javascript" src="/script/brs_hijack.js"></script>
</head>

<body>
<form method="post" action="/cgi-bin/BRS_03A_detcInetType.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type="hidden" name="submit_flag" value="wizard_detwan" />
<input type="hidden" name="auto_detc_flag" value="1"/>
<input type="hidden" name="detect_mode" value="1"/>
<!--bug 22145 add hijack_toBasic-->

<script language="javascript" type="text/javascript">var ts="48367336";</script>
<script>
function modemCycleChoice()
{
	var forms = document.getElementsByTagName("form");
        var cf = forms[0];

	var choices_div = document.getElementById("choices_div");
	var choices = choices_div.getElementsByTagName("input");

	if(choices[0].checked || choices[1].checked){
		<%if tcWebApi_staticGet("Wan_Common","TransMode","h") = "Ethernet" then%>
			cf.action="/cgi-bin/BRS_03A_detcEtherInetType.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
		<%end if%>
		cf.submit();
		//this.location.href = "/cgi-bin/BRS_03A_detcInetType.asp";
	}
	else if(choices[2].checked)
		this.location.href = "/cgi-bin/BRS_03A_E_IP_problem_staticIP.asp";
	else
	{
		alert(bh_select_an_option_str);
		return false;
	}

	return true;
}
var bh_select_an_option_str="<%tcWebApi_multilingual("1","bh_select_an_option_str")%>";
</script>
<div class="wizard_content_div">

	<div id="text_div" class="wizard_words_div">
		<h1 class="h1_red"><%tcWebApi_multilingual("1","bh_no_internet_ip_str")%></h1>
	
		<p><%tcWebApi_multilingual("1","bh_genie_cannot_find_ip_str")%></p>
		<p><%tcWebApi_multilingual("1","bh_genie_cannot_find_ip_reason1_str")%></p>
		<p class="desc_text"><%tcWebApi_multilingual("1","bh_genie_cannot_find_ip_reason1_desc_str")%></p>
		<p><%tcWebApi_multilingual("1","bh_genie_cannot_find_ip_reason2_str")%></p>
		<p class="desc_text"><%tcWebApi_multilingual("1","bh_genie_cannot_find_ip_reason2_desc_str")%></p>
		<div id="choices_div">
			<div class="radio_div">
				<input type="radio" name="cycle_modem_choice" id="cycle_modem_choice" value="0" /><%tcWebApi_multilingual("1","bh_select_no_IP_option1_str")%>
			</div>
			<div class="radio_div">
				<input type="radio" name="cycle_modem_choice" id="cycle_modem_choice" value="1" /><%tcWebApi_multilingual("1","bh_select_no_IP_option2_str")%>
			</div>
			<div class="radio_div">
				<input type="radio" name="cycle_modem_choice" id="cycle_modem_choice" value="2" /><%tcWebApi_multilingual("1","bh_select_no_IP_option3_str")%>
			</div>
		</div>
	</div>

       <!--bug 222145 add a new button-->
       <div id="allBtns_div" class="wizard_buttons_div" align="right">

               <!--div id="btnsContainer_div1" class="buttons_img_div" align="center">
                       <img src="/image/ca_purple_long_button.gif" />
                       <div class="buttons_words_div">manual_config_connection</div>
               </div-->

               <div id="btnsContainer_div2" class="buttons_img_div" align="center" onclick="return  modemCycleChoice();">

			<img src="/image/ca-little-purple-button.gif" />
			<div class="buttons_words_div" name="Next" id="next"><%tcWebApi_multilingual("0","glbstr_next")%></div>
		</div>
	</div>
	
</div>

</form>
</body>

</html>
