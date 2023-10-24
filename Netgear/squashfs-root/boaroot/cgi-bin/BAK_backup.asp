<%
	if request_Form("postflag") = "1" then
		'tcWebApi_set("System_Entry","upgrade_fw","HTML_HEADER_TYPE")
		'tcWebApi_CommitWithoutSave("System_Entry")
		tcWebApi_set("AyeSystem_Entry","Type","HTML_HEADER_TYPE")
		tcWebApi_CommitWithoutSave("AyeSystem_Entry")
	end if
	if request_Form("backup_flag") = "1" then
		tcWebApi_set("BackupConfig_Entry","ProfuctName","product_name")
		tcWebApi_commit("BackupConfig_Entry")
	end if
%>

<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/backup.js"></script>
<script language=javascript type=text/javascript src="/aye_utils.js"></script>
<title><%tcWebApi_multilingual("1","glbstr_title")%></title>
<meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>


<BODY onload="frmLoad()" bgcolor=#ffffff>
<FORM action="/cgi-bin/restore" method="post" enctype="multipart/form-data">
<!--<FORM action="/cgi-bin/restore" method="post" enctype="multipart/form-data" target="id_iframe">-->
<iframe style="display: none" id="id_iframe" name="id_iframe" src="about:blank"></iframe>
<INPUT TYPE="HIDDEN" NAME="postflag">
<INPUT TYPE="HIDDEN" NAME="backup_flag">
<INPUT TYPE="HIDDEN" NAME="product_name">
<INPUT TYPE="HIDDEN" NAME="HTML_HEADER_TYPE" VALUE="3">
<div id="page_title" class="page_title" style="display:none"><%tcWebApi_multilingual("1","backup_settings_str")%></div>
<div id="main" class="main" style="display:none">
<script>
var wds_endis_fun='0';
var wds_endis_fun_a="0";
var wds_repeater_basic='0';
var wds_repeater_basic_a="0";
var endis_wl_radio='1';
var endis_wla_radio='1';
var ts = "<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";

function backup_settings()
{
	cf=document.forms[0];
        cf.target = "id_iframe";
	var filename = '<%if TCWebAPI_get("SkuId_Entry", "ProductName", "h") <> "N/A" then TCWebAPI_staticGet("SkuId_Entry", "ProductName", "s")  end if %>';

	cf.product_name.value = filename;
	cf.backup_flag.value = "1";
	cf.action="/cgi-bin/BAK_backup.asp?id="+ts;
	cf.submit();
}

function check_restore()
{
	cf=document.forms[0];
	if (cf.mtenRestoreCfg.value.length == 0)
	{
		alert(filename_cannot_blank_str);
		return false;
	}
	
	var filestr=cf.mtenRestoreCfg.value;
	var file_format=filestr.substr(filestr.lastIndexOf(".")+1);
	if (file_format!="cfg")
	{
		alert(please_assign_the_correct_file_str+"cfg");
		return false;
	}
	
	if (confirm(warning_restoring_settings_str))
	{	
		cf.action="/cgi-bin/BAK_backup.asp?id="+ts;
		top_left_nolink();
		top.enable_action=0;
		cf.postflag.value = "1" ;
		cf.submit();
	}
	else 
		return false;
}

function frmLoad()
{
<% if request_Form("backup_flag") = "1" then %>
	var filename = '<%if TCWebAPI_get("SkuId_Entry", "ProductName", "h") <> "N/A" then TCWebAPI_staticGet("SkuId_Entry", "ProductName", "s")  end if %>';
	//var filename = 'D3600'
	var cfg = '/NETGEAR_'+ filename +'.cfg';
	var code = 'location.assign("' + cfg + '")';
	eval(code);
<%end if%>
<% if request_Form("postflag") = "1" then %>
	<%
	if tcWebApi_get("System_Entry","upgrade_fw_status","h") = "FAIL" then
		asp_Write("if(1){")
	else
		asp_Write("if(0){")
	end if
	%>
	    // invalid config file
		var toptitle_div = document.getElementById("page_title");
		var main_div = document.getElementById("main");
		var pls_wait_div = document.getElementById("pls_wait_div");
		
		toptitle_div.style.display = "none";
		main_div.style.display = "none";
		pls_wait_div.style.display = "";
		alert(please_select_correct_str);
		
		var cf = document.forms[0];
		cf.postflag.value = "0";
		cf.action="/cgi-bin/BAK_backup.asp?id="+ts;
	    cf.submit();
		//updateProgress();
	}
	else 
	{
		var toptitle_div = document.getElementById("page_title");
		var main_div = document.getElementById("main");
		var pls_wait_div = document.getElementById("pls_wait_div");
		
		toptitle_div.style.display = "none";
		main_div.style.display = "none";
		pls_wait_div.style.display = "";
		aye_utils_updateProgress(159,0,"index.asp",0); //aye_utils_updateProgress(delay time,char count start,back to page,forms[index])
	}
<%else%>	
	var toptitle_div = document.getElementById("page_title");
	var main_div = document.getElementById("main");
	var pls_wait_div = document.getElementById("pls_wait_div");
	
	toptitle_div.style.display = "";
	main_div.style.display = "";
	pls_wait_div.style.display = "none";
<%end if%>
}

var revert_to_factory_str="<%tcWebApi_multilingual("1","revert_to_factory_str")%>";
var loading_the_factory_default_str="<%tcWebApi_multilingual("1","loading_the_factory_default_str")%>";
var are_you_sure_str="<%tcWebApi_multilingual("1","are_you_sure_str")%>";
var update_settings_str="<%tcWebApi_multilingual("1","update_settings_str")%>";
var filename_cannot_blank_str="<%tcWebApi_multilingual("1","filename_cannot_blank_str")%>";
var please_assign_the_correct_file_str="<%tcWebApi_multilingual("1","please_assign_the_correct_file_str")%>";
var please_assign_the_correct_file_str1="<%tcWebApi_multilingual("1","please_assign_the_correct_file_str1")%>";
var warning_restoring_settings_str="<%tcWebApi_multilingual("1","warning_restoring_settings_str")%>";
var please_select_correct_str="<%tcWebApi_multilingual("1","please_select_correct_str")%>";

</script>
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>


<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_backup','save')"><B><%tcWebApi_multilingual("1","save_a_copy_str")%></B></A>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2 align=center>
	<input class="short_common_bt" type="button" name="Backup" id="backup" value="<%tcWebApi_multilingual("0","glbstr_backup")%>" onClick="backup_settings()">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_backup','restore')"><B><%tcWebApi_multilingual("1","restore_saved_settings_str")%></B></A>
	</TD>
</TR>
<TR>
	<TD nowrap>
	<input type="FILE" name="mtenRestoreCfg" id="restore_cfg" value="" size="40" maxlength="128">
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2 align=center>
	<input class="short_common_bt" type="submit" name="mtenRestore" id="restore" value="<%tcWebApi_multilingual("0","glbstr_restore")%>" onClick="check_restore();return false;">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_backup','revert')"><B><%tcWebApi_multilingual("1","revert_to_factory_str")%></B></A>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2 align=center>
	<input class="short_common_bt" type="button" name="defaults" id="erase" value="<%tcWebApi_multilingual("0","glbstr_erase")%>" onClick=location.href="BAK_factory.asp";>
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</TABLE>
</div>

<div id="pls_wait_div" style="display:none">
<table border="0" cellpadding="0" cellspacing="3" width="100%">
<tr>
        <td align="left"><h1><%tcWebApi_multilingual("1","please_wait_form_two_minutes_str")%></h1></td>
		
        <td nowrap><input type="text" name="progress" class="reboot1bar" size="60"  value=""></td>
		<tr/>
		<TD colspan="2"><img src="/liteblue.gif" width=100% height="12"></TD>
</tr>
</table>
</div>	
<%tcWebApi_multilingual("2","_backup_help.asp")%>
</FORM>
</BODY>
</HTML>
