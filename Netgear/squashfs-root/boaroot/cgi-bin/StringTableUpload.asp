<%
	if request_Form("postflag") = "1" then
		tcWebApi_set("System_Entry","upgrade_fw","HTML_HEADER_TYPE")
        tcWebApi_CommitWithoutSave("System_Entry")
	end if
%>
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/upgrade.js"></script>
<title><%tcWebApi_multilingual("1","glbstr_title")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<div class="page_title" id="title"><%tcWebApi_multilingual("1","gui_language_str")%></div>
<div id="main" class="main">
<script>
<%if Request_Form("postflag")="1" then%>
	reloadvalue();
<%end if%>
var filename_null_str="<%tcWebApi_multilingual("1","filename_null_str")%>";
var correct_file_str="<%tcWebApi_multilingual("1","correct_file_str")%>";
var netgear_module=<%tcWebApi_get("SkuId_Entry","ProductName","s")%>;
var netgear_region=top.netgear_region;
var netgear_ver="V1.0.0.13";

function reloadvalue()
{
	cf=document.forms[0];
	document.getElementById("title").style.display = "none";
	document.getElementById("main").style.display = "none";
	setTimeout("display_waiting_bar()",500);
}

function display_waiting_bar()
{
	document.getElementById("waiting_bar").style.display = "";	
	setTimeout(function(){document.getElementById("loading_img").src=document.getElementById("loading_img").src},10);
	setTimeout("redirect()",5000);
}

function redirect()
{
	location.href= '/cgi-bin/index.asp';
}

</script>
<body onLoad="" bgcolor=#ffffff>
<table width=100% border=0 cellpadding=0 cellspacing=3>
<!--TR><TD colSpan=2><H1>GUI Language Update</H1></TD></TR-->
<TR><TD colSpan=2></TD></TR>
<TR><td colspan=2><img src="/liteblue.gif" width=100% height=12></td></TR>
<!--<form method="post" action="/cgi-bin/StringTableUpload.asp" enctype="multipart/form-data">-->
<FORM ENCTYPE="multipart/form-data" METHOD="POST" action="/cgi-bin/StringTableUpload.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<INPUT TYPE="HIDDEN" NAME="postflag" VALUE="1">
<INPUT TYPE="HIDDEN" NAME="HTML_HEADER_TYPE" VALUE="2">
<INPUT TYPE="HIDDEN" NAME="Saveflag_reget" VALUE="0">
<TR><td nowrap><b><%tcWebApi_multilingual("1","select_language_str")%></b></TD></TR>
<TR><td nowrap> <input name="filename" type="file" size="32"></TD></TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<td nowrap colspan=2 align=center>
	<input class="cancel_bt" type='button' value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick='location.href="index.asp";'>&nbsp;&nbsp;
     <input class="apply_bt" type=submit  value="<%tcWebApi_multilingual("0","glbstr_upload")%>" onClick='return clickUpgradeLanguage(document.forms[0])'>
  </TR>
</TABLE>
</div>
<div id="waiting_bar" style="display:none">
<div  align="center"><BR><BR><TR><TD align="center"><B><%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%></B></TD></TR><BR><BR></div>
<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" id="loading_img" alt="waiting" /></div>
</div>
</FORM>
</HTML>
