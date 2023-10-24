
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/upgrade.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<!--% body_header("_upgrade", "tools_update.asp", "auto_upgrade_check") %-->
<BODY onLoad="loadvalue();">
<div class="page_title"><%tcWebApi_multilingual("1","firmware_update_str")%></div>
<div id="main" class="main">
<FORM method="POST" action="/cgi-bin/tools_update.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<INPUT type=hidden name=submit_flag value="auto_upgrade_check">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<script>

var filename_null_str="<%tcWebApi_multilingual("1","filename_null_str")%>";
var correct_file_str="<%tcWebApi_multilingual("1","correct_file_str")%>";
var frimware_upgrade_str="<%tcWebApi_multilingual("1","frimware_upgrade_str")%>";
var ts="78015456"

function loadvalue()
{
	var autoup = '1';
	var cf = document.forms[0];

	cf.action = "/apply.cgi?/tools_update.asp timestamp=" + ts;
/*	if (autoup == '0')
		cf.enable.checked = false;
	else
		cf.enable.checked = true; */
}
var netgear_module="WNDR3800";
var netgear_region=top.netgear_region;
var netgear_ver="V1.0.0.13";
</script>

<input type="hidden" name="auto_check_for_upgrade">
<TR>
	<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_upgrade','check')"><B><%tcWebApi_multilingual("1","internet_check_str")%></B></A></TD>
	<TD nowrap>
	<input class="short_common_bt" type="button" name="Check" value="Check" onclick="click_check();">
	</TD>
</TR>
<!--TR>
	<TD nowrap colspan=2>
	<input type="checkbox" name="enable" value=1 onclick="check_if_show();"><B><%tcWebApi_multilingual("1","check_version_str")%></B>
	</TD>
</TR-->
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</FORM>
<FORM method="post" action="/upgrade_check.cgi" target=formframe enctype="multipart/form-data">
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_upgrade','locate')"><B><%tcWebApi_multilingual("1","locate_upgrade_str")%></B></A>
	</TD>
</TR>
<TR><TD nowrap><input name="mtenFWUpload" type="file" size="32"></TD></TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
        <TD nowrap colspan=2 align=center>
        <input class="cancel_bt" type='reset' name="Cancel" value='Cancel' onClick='location.href="tools_update.asp";'>&nbsp;&nbsp;
        <input class="apply_bt" type=submit name="Upgrade" value="Upload" onClick='return clickUpgrade(document.forms[1])'>
        </TD>
</TR>

</TABLE>
</FORM>
</div>
<%tcWebApi_multilingual("2","_upgrade_help.asp")%>
</BODY>
</script>
</HTML>
