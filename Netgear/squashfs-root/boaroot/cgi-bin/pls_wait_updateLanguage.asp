<%
    if request_Form("submit_flag") = "change_language" then
        tcWebApi_get("AutoUpgrade_Entry","Download_fileinfo","h")
    end if
%>

<html>
<head>
<title></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<META http-equiv="refresh" content="3; url=pls_wait_updateLanguage.asp">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<link rel="stylesheet" href="style/form.css" />
<style type="text/css"> 
.prgbar1 { font-family:Arial; padding:0px; height: 20px; width: 280px; font-weight: bolder; font-size: 10pt; border: 1px solid; border-color: #09c; color: #0000FF}  
</style>
<script language="javascript" type="text/javascript">
function goto_home_page()
{
	var ts = "<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
	var cf = document.forms[0];
	
	if( top.location.href.indexOf("adv_index.asp") != -1 )
	{
		cf.action="/cgi-bin/adv_index.asp?id=" + ts;
		//top.location.href="adv_index.asp";	
	}
	else{
		cf.action="/cgi-bin/index.asp?id=" + ts;
		//top.location.href="index.asp";	
	}
	cf.target = "_top";
	cf.gui_language.value="<%tcWebApi_get("LanguageSwitch_Entry","GUI_Region","s")%>";
	cf.submit();
}

<% if request_Form("submit_flag") = "change_language" then %>
	var status =2;
<%else%>
	var status = "<%tcWebApi_get("AutoUpgrade_Entry","WgetResult","s")%>";
<%end if%>

function loadvalue()
{
	if(status==0) //fail to download fileinfo.txt
	{
		alert("<%tcWebApi_multilingual("1","no_internet_connection_str")%>");
		goto_home_page();	
	}
	else if(status==1) //success
	{
		setTimeout("pageRedirect()", 1000);
	}
}
function pageRedirect()
{	
	var form = document.forms[0];
	form.submit();
}
</script>
</head>
<body bgcolor="#ffffff" onload="loadvalue()">
<div id="main" class="main">
<form method="POST" action="/cgi-bin/pls_wait_updateLanguage2.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
	<input type=hidden name=submit_flag value="change_language">
	<input type=hidden name=gui_language value="">
	<div id="downloading_div">
		<div><img src="/liteblue.gif" width=100% height="12" /></div><br />
		<div align="left"><%tcWebApi_multilingual("1","please_wait_for_updating_lang_str")%>...</div><br />
		<div><img src="/liteblue.gif" width=100% height="12" /></div>
	</div>
</form>
</div>
</body>
</html>
