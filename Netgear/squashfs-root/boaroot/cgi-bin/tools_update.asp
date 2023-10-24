<%
	if request_Form("FwUpgradeAction") = "0" then
		tcWebApi_set("AyeFwUpgrade_Entry","Active","DUMMY")
		tcWebApi_set("AyeFwUpgrade_Entry","CheckFileResult","DUMMY")
		tcWebApi_commit("AyeFwUpgrade_Entry")
	elseif request_Form("FwUpgradeAction") <> "" then
		tcWebApi_set("AyeFwUpgrade_Entry","Active","FwUpgradeAction")
		tcWebApi_commit("AyeFwUpgrade_Entry")
	end if
%>
<html>
<head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/upgrade.js"></script>
<script language=javascript type=text/javascript src="/aye_utils.js"></script>
<title><%tcWebApi_multilingual("1","glbstr_title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<script>

var invalid_filename_str="<%tcWebApi_multilingual("1","invalid_str")%><%tcWebApi_multilingual("1","invalid_filename_str")%>";
var wrong_file_str="<%tcWebApi_multilingual("1","wrong_file_str")%>";
function uiDoUpdate()
{
	var form=document.uiPostUpdateForm2;
	var string4 = form.mtenFWUpload.value.search(/.bin/);

	if(form.mtenFWUpload.value=="") {
		alert(invalid_filename_str);
	}
	else{
		if (string4 >= 0) {
			form.postflag.value = "1";
			
			var page_title_div = document.getElementById("page_title_div");
			var FW_checking_div = document.getElementById("FW_checking_div"); 
			var FW_upg_div = document.getElementById("FW_upg_div");
			var pls_wait_div = document.getElementById("pls_wait_div");
			
			page_title_div.style.display = "none";
			FW_checking_div.style.display = "none";
			FW_upg_div.style.display = "none";
			pls_wait_div.style.display = "block";
			
			//updateProgress();
			form.submit();
		}
		else
			alert(invalid_filename_str);
	}
}

function start_upgrade_click()
{
	var form=document.uiPostUpdateForm3;
	form.submit();
}

function frameOnload()
{
	<%
	if tcWebApi_get("AyeFwUpgrade_Entry","CheckFileResult","h") = "Success" then
		asp_Write("if(1){")
	else
		asp_Write("if(0){")
	end if
	%>
		var page_title_div = document.getElementById("page_title_div");
		var FW_checking_div = document.getElementById("FW_checking_div"); 
		var FW_upg_div = document.getElementById("FW_upg_div");
		var pls_wait_div = document.getElementById("pls_wait_div");
			
		page_title_div.style.display = "none";
		FW_checking_div.style.display = "none";
		FW_upg_div.style.display = "none";
		pls_wait_div.style.display = "block";	
		
		<%if request_Form("FwUpgradeAction") = "2" then%>			
			start_upgrade_click();
		<%end if%>
		
		aye_utils_updateProgress(240,0,"index.asp",2); //aye_utils_updateProgress(delay time,char count start,back to page,forms[index])
	}
	
	
	//Exception handle: To restart for wrong image upgrade.
	<%
	if tcWebApi_get("AyeFwUpgrade_Entry","CheckFileResult","h") = "Fail" then
		asp_Write("if(1){")
	else
		asp_Write("if(0){")
	end if
	%>
		/*var page_title_div = document.getElementById("page_title_div");
		var FW_checking_div = document.getElementById("FW_checking_div"); 
		var FW_upg_div = document.getElementById("FW_upg_div");
		var pls_wait_div = document.getElementById("pls_wait_div");
			
		page_title_div.style.display = "none";
		FW_checking_div.style.display = "none";
		FW_upg_div.style.display = "none";
		pls_wait_div.style.display = "block";*/
		
		alert(wrong_file_str);
		var form=document.uiPostUpdateForm3;
		form.FwUpgradeAction.value="0";
		form.submit();
	}
}

var hw_link_type = "<%tcWebApi_get("AutoUpgrade_Entry","HW_link_status","s")%>";
var ts= "<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";

function newfwclick()
{
	var cf=document.forms[0];
	cf.submit_flag.value="Download_fileinfo";
	
	if(hw_link_type=="0")
		cf.action="/cgi-bin/AUTO_upgrade_no_internet.asp";
	else	
		cf.action="/cgi-bin/AUTO_search.asp?id="+ts;
	cf.submit();
}
</script>
</head>

<!--% body_header("_upgrade", "tools_update.asp", "auto_upgrade_check") %-->
<body onload="frameOnload()">
<div id="page_title_div" class="page_title" style="display:block"><%tcWebApi_multilingual("1","firmware_update_str")%></div>
<div id="main" class="main">

<div id="FW_checking_div" style="display:block">
<FORM ENCTYPE="multipart/form-data" METHOD="POST" name="uiPostUpdateForm">
<input type="hidden" name="submit_flag" value="auto_upgrade_check" />
<input type="hidden" name="ClearWgetResult" value="2" />

<div><img src="/liteblue.gif" width=100% height=12></div>

<input type="hidden" name="auto_check_for_upgrade">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<tr>
	<td nowrap><a tabindex=-1 href="javascript:loadhelp('_upgrade','check')"><b><%tcWebApi_multilingual("1","check_for_new_version_str")%></b></a></td>
	<td nowrap>
	<input class="short_common_bt" type="submit" name="Check" id="check" value="<%tcWebApi_multilingual("1","check_str")%>" onclick="newfwclick();">
	</td>
</tr>
<!--
<tr>
	<td nowrap colspan=2>
	<input type="checkbox" name="enable" value=1 onclick="check_if_show();"><b><%tcWebApi_multilingual("1","check_for_login_str")%></b>
	</td>
</tr>
-->
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</table>
</form>
</div>

<div id="FW_upg_div" style="display:block">
<FORM ENCTYPE="multipart/form-data" METHOD="POST" action="/cgi-bin/tools_update.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" name="uiPostUpdateForm2">
<INPUT TYPE="HIDDEN" NAME="postflag" VALUE="1">
<INPUT TYPE="HIDDEN" NAME="HTML_HEADER_TYPE" VALUE="2">
<INPUT TYPE="HIDDEN" NAME="FwUpgradeAction" VALUE="2">
<%if tcWebApi_get("WebCustom_Entry", "isFwNameNoChk", "h") = "Yes" then%>
<input type="hidden" name="UG_filetype" value="tclinux">
<%end if%>
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr>
	<td nowrap>
	<a tabindex=-1 href="javascript:loadhelp('_upgrade','locate')"><b><%tcWebApi_multilingual("1","locate_and_select_str")%></b></a>
	</td>
</tr>
<tr><td nowrap><input name="mtenFWUpload" id="firmware_upload" type="file" size="32"></td></tr>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<tr>
        <td nowrap colspan=2 align=center>
		<input class="cancel_bt" type="reset" name="Cancel" id="cancel" value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick=location.href="tools_update.asp";>&nbsp;&nbsp;
		<input class="apply_bt" type="button" name="Upgrade" id="upgrade" value="<%tcWebApi_multilingual("0","glbstr_upload")%>" onClick="uiDoUpdate()">
        </td>
</tr>
</table>
</form>
</div>

<div id="pls_wait_div" style="display:none">
<!--<div align="center"><br /><br /><b><%tcWebApi_multilingual("1","please_wait_str")%></b><br /><br /></div>
<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" alt="waiting" /></div> -->
<form>
<table border="0" cellpadding="0" cellspacing="3" width="100%">
<tr>
        <td align="left"><h1><%tcWebApi_multilingual("1","updating_setting_str")%></h1></td>
        <td nowrap><input type="text" name="progress" class="reboot1bar" size="60"  value=""></td>
</tr>
<tr><td colspan="2"><img src="/liteblue.gif" width=100% height="12"></td></tr>
</table>
</form>
</div>

<FORM ENCTYPE="multipart/form-data" METHOD="POST" action="/cgi-bin/tools_update.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" name="uiPostUpdateForm3">
<INPUT TYPE="HIDDEN" NAME="FwUpgradeAction" VALUE="1">
<INPUT TYPE="HIDDEN" NAME="DUMMY" VALUE="">
</form>

</div>
<%tcWebApi_multilingual("2","_upgrade_help.asp")%>
</body>
</html>
