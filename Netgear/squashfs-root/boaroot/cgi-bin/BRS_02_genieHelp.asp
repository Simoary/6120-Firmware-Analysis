<%
if request_Form("default_flag") = "1" then
	tcWebApi_set("Account_Entry0", "firstuse","default_flag")    
elseif request_Form("default_flag") = "0" then
	tcWebApi_set("LanguageSwitch_Entry","Language_New_Selection","lang_new_selection")
	tcWebApi_set("LanguageSwitch_Entry","Browser_Language","lang_browser")
	tcWebApi_set("LanguageSwitch_Entry","Language_Auto_Switch_Flag","lang_firstcheck")
	tcWebApi_commit("LanguageSwitch_Entry")   
end if

if request_Form("cancel_detwan_flag") = "1"  then
	tcWebApi_set("AutoDetect_Entry", "cancel_flag","cancel_detwan_flag") 
	tcWebApi_commit("AutoDetect_Entry")
end if
%>
<html>

<head>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="/style/hijack_style.css" />
<link rel="stylesheet" type="text/css" href="/style/hijack_02_genieHelp.css" />
<script language="javascript" type="text/javascript" src="/script/brs_hijack.js"></script>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onload="frmload()">
<form method="post" action="/cgi-bin/BRS_03A_detcInetType.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type="hidden" name="submit_flag" value="wizard_detwan" />
<input type="hidden" name="default_flag" value="0" />
<input type="hidden" name="lang_selection" value="Auto" />
<input type="hidden" name="lang_new_selection" value="Auto" />
<input type="hidden" name="lang_browser" value="" />
<input type="hidden" name="lang_firstcheck" value="1" />

<script language="javascript" type="text/javascript">
var ts="<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
var bh_config_net_connection_str="<%tcWebApi_multilingual("1","bh_config_net_connection_str")%>";
var bh_connection_further_action_str="<%tcWebApi_multilingual("1","bh_connection_further_action_str")%>";
var bh_want_genie_help_str="<%tcWebApi_multilingual("1","bh_want_genie_help_str")%>";
var bh_yes_mark_str="<%tcWebApi_multilingual("1","bh_yes_mark_str")%>";
var bh_no_genie_help_str="<%tcWebApi_multilingual("1","bh_no_genie_help_str")%>";
var bh_no_genie_help_confirm_str="<%tcWebApi_multilingual("1","bh_no_genie_help_confirm_str")%>";
var bh_have_saved_copy_str="<%tcWebApi_multilingual("1","bh_have_saved_copy_str")%>";
var bh_next_mark_str="<%tcWebApi_multilingual("1","bh_next_mark_str")%>";

/* Handle Lanuage Auto */
var first_time_check_auto="<%if tcWebApi_get("LanguageSwitch_Entry","Language_Auto_Switch_Flag","h") <> "N/A" then tcWebApi_get("LanguageSwitch_Entry","Language_Auto_Switch_Flag","s") else asp_write("0") end if%>";
var browser_lang="<%tcWebApi_get("LanguageSwitch_Entry","Browser_Language","s")%>";

<%if Request_form("default_flag") = "0" then%>
location.href = "BRS_02_genieHelp.asp";
<%end if%>
	
function frmload()
{
	if(first_time_check_auto=="0")
	{
		var cf = document.getElementsByTagName("form")[0];
	
		cf.default_flag.value = "0";
		cf.lang_browser.value = browser_lang;
		cf.action="/cgi-bin/BRS_02_genieHelp.asp?id=" + ts;
		cf.submit();
	}
	
	<%if Request_form("default_flag") = "1" then%>
	parent.location.href = "/cgi-bin/index.asp";
	<%end if%>
}

function genieHelpChecking()
{
	var choices_div = document.getElementById("choices_div");
	var choices = choices_div.getElementsByTagName("input");

	var forms = document.getElementsByTagName("form");
	var cf = forms[0];

	if(choices[0].checked)
	{
		//this.location.href = "/cgi-bin/BRS_03A_detcInetType.asp";
		<%If tcWebApi_get("Account_Entry0","firstuse","h") = "0" then %>
		this.location.href = "/cgi-bin/WIZ_sel_default.asp";
		<%else%>
		this.location.href = "/cgi-bin/WIZ_sel.asp";
		<%end if%>
	//	cf.submit();
	}
	else if(choices[1].checked)
	{
		if(confirm("<%tcWebApi_multilingual("1","bh_no_genie_help_confirm_str")%>") == false)
			return false;

		cf.default_flag.value = "1";
		cf.action="/cgi-bin/BRS_02_genieHelp.asp?id=" + ts;
		cf.submit();
		return false;
		//cf.action = "/cgi-bin/index.asp?id=" + ts;
		//cf.target = "_top";
		//cf.submit_flag.value = "hijack_toBasic";
	//	cf.submit();
		//top.location.href = "index.asp"
	}
	else if(choices[2].checked)
	{
		this.location.href = "/cgi-bin/BRS_03B_haveBackupFile.asp";
	}
	else
	{
		alert(bh_select_an_option_str);
		return false;
	}

	return true;
}

</script>

<div class="wizard_content_div">

	<div id="choices_div" class="wizard_words_div">
		<h1><%tcWebApi_multilingual("1","bh_config_net_connection_str")%></h1>
		<p><%tcWebApi_multilingual("1","bh_connection_further_action_str")%></p>
		
		<div id="choices_div" class="helpChoice_divs">
			<p><%tcWebApi_multilingual("1","bh_want_genie_help_str")%></p>
			<div class="radio_div">
				<input type="radio" name="help_choice" id="help_choice" value="0" checked="checked" /><%tcWebApi_multilingual("1","bh_yes_mark_str")%>
			</div>
			<div class="radio_div">
				<input type="radio" name="help_choice" id="help_choice" value="1" /><%tcWebApi_multilingual("1","bh_no_genie_help_str")%>
			</div>
			<!--
			<div class="radio_div">
				<input type="radio" name="help_choice" id="help_choice" value="2" /><%tcWebApi_multilingual("1","bh_have_saved_copy_str")%>
			</div>
			-->
		</div>
	</div>

	<div id="buttons_div_02" class="wizard_buttons_div" align="center">
		<div id="btnsContainer_div" class="buttons_img_div"  align="center" onClick='return genieHelpChecking();'>
			<img src="/image/ca-little-purple-button.gif" />
			<div id="btn_div" class="buttons_words_div"><%tcWebApi_multilingual("1","bh_next_mark_str")%></div>
		</div>
	</div>
	
</div>

</form>
</body>

</html>
