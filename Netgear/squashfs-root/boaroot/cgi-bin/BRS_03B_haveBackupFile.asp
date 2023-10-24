<%
	if request_Form("postflag") = "1" then
		tcWebApi_set("System_Entry","upgrade_fw","HTML_HEADER_TYPE")
		tcWebApi_CommitWithoutSave("System_Entry")
	end if	
%>
<html>

<head>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<link rel="stylesheet" type="text/css" href="/style/hijack_style.css" />
<link rel="stylesheet" type="text/css" href="/style/hijack_03B_haveBackupFile.css" />
<link rel="stylesheet" type="text/css" href="/style/form.css" />
<script language="javascript" type="text/javascript" src="/script/brs_hijack.js"></script>
<script language="javascript" type="text/javascript" src="/script/funcs.js"></script>
</head>

<body onload="frmLoad()">
<form action="NETGEAR_WNDR3700.cfg" method="post" enctype="multipart/form-data">
<INPUT TYPE="HIDDEN" NAME="postflag" VALUE="1">
<INPUT TYPE="HIDDEN" NAME="HTML_HEADER_TYPE" VALUE="2">
<script>
var pchar = "||"; // progress char
var maxchars = 60; 
var delay_time = 2000; // msecs
var charcount = 0; 
var bh_ask_for_restore_str="<%tcWebApi_multilingual("1","bh_ask_for_restore_str")%>";
var bh_filename_null_str="<%tcWebApi_multilingual("1","bh_filename_null_str")%>";
var bh_not_correct_file_str="<%tcWebApi_multilingual("1","bh_not_correct_file_str")%>";
function frmLoad()
{
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
	
	change_style_for_safari();
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
		parent.location.href="/cgi-bin/index.asp";
	}
}
function makeStr(strSize, fillChar)
{
	var temp = "";
	for (i=0; i < strSize ; i ++)
		temp = temp + fillChar;
	return temp;
}
function retoreSettings()
{
	var forms = document.getElementsByTagName("form");
	var cf = forms[0];

	var file_upgrade = document.getElementById("file_upgrade");
	var filestr = file_upgrade.value;
	
	if(filestr.length == 0)
	{
		alert(bh_filename_null_str);
		return false;
	}
	var file_format = filestr.substr(filestr.lastIndexOf(".") + 1);
	if(file_format != "cfg")
	{
		alert(bh_not_correct_file_str+"cfg");
		return false;
	}

	if(confirm(bh_ask_for_restore_str))
	{
		//cf.action="/cgi-bin/BRS_03B_haveBackupFile_fileRestore.asp";
		cf.action="/cgi-bin/BRS_03B_haveBackupFile.asp";
		cf.submit();
	}
	else
		return false;
}

function change_style_for_safari()
{
	if(get_browser() == "Safari")
		document.getElementById("file_upgrade").className = "file_input_style_safari";
}
function goBack()
{
	this.location.href = "/cgi-bin/BRS_02_genieHelp.asp";
	
	return true;
}
</script>
<div class="wizard_content_div">

	<div id="toptitle" class="wizard_words_div">
	
		<h1><%tcWebApi_multilingual("1","bh_settings_restoration_str")%></h1>
		<p><%tcWebApi_multilingual("1","bh_browser_file_str")%></p>

		<div class="file_input_div">
			<input type="file" id="file_upgrade" name="file_upgrade" class="file_input_style" size="60%" />
		</div>
	
	</div>

	<div id="allBtns_div" class="wizard_buttons_div" align="center">
	
	<input class="short_common_bt" type='button' name='back' id="back" value="<%tcWebApi_multilingual("0","glbstr_back")%>" onClick='return goBack();'>
	<input class="short_common_bt" type='button' name='back' id="back" value="<%tcWebApi_multilingual("0","glbstr_next")%>" onClick='return retoreSettings();'>
	<!--
		<div id="btnsContainer_div1" class="buttons_img_div" align="center" onclick='return goBack();'>
			<img src="/image/ca-little-purple-button.gif" />
			<div class="buttons_words_div"><%tcWebApi_multilingual("0","glbstr_back")%></div>
			
		</div>
		<div class="buttons_split"></div>
		<div id="btnsContainer_div2" class="buttons_img_div" align="center" onclick='return retoreSettings();'>
			<img src="/image/ca-little-purple-button.gif" />
			<div class="buttons_words_div"><%tcWebApi_multilingual("0","glbstr_next")%></div>
			
		</div>
	-->
	</div>
	<div id="pls_wait_div" style="display:none">
	<table border="0" cellpadding="0" cellspacing="3" width="100%">
	<tr>
			<td align="left"><h1><%tcWebApi_multilingual("1","please_wait_form_two_minutes_str")%></h1></td>
			
			<!--
			<td align="left"><h1>please_wait_form_two_minutes_str</h1></td>
			-->
			<tr/>
			<td nowrap><input type="text" name="progress" class="reboot1bar" size="60"  value=""></td>
			<tr/>
			<TD colspan="2"><img src="/liteblue.gif" width=100% height="12"></TD>
	</tr>
	</table>
	</div>
</div>

</form>
</body>

</html>
