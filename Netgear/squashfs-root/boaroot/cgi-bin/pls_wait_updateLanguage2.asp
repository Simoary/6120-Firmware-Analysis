<%
    if request_Form("submit_flag") = "change_language" then
        tcWebApi_get("AutoUpgrade_Entry","Download_language","h")
    end if
%>

<html>
<head>
<title></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<META http-equiv="refresh" content="5; url=pls_wait_updateLanguage2.asp">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<link rel="stylesheet" href="style/form.css" />
<style type="text/css"> 
.prgbar1 { font-family:Arial; padding:0px; height: 20px; width: 280px; font-weight: bolder; font-size: 10pt; border: 1px solid; border-color: #09c; color: #0000FF}  
</style>
<script language="javascript" type="text/javascript">
function goto_home_page()
{
	if( top.location.href.indexOf("adv_index.asp") != -1 )
	{
		top.location.href="adv_index.asp";	
	}
	else{
		top.location.href="index.asp";	
	}
}

<% if request_Form("submit_flag") = "change_language" then %>
	var status =2;
<%else%>
    //Download language
	var status = "<%tcWebApi_get("AutoUpgrade_Entry","WgetLangResult","s")%>";
<%end if%>


function loadvalue()
{
	if(status==0) //fail
	{
		alert("<%tcWebApi_multilingual("1","the_router_failed_to_download_str")%>");
		goto_home_page();	
	}
	else if(status==1) //success
	{
		goto_home_page();
	}
}
</script>
</head>
<body bgcolor="#ffffff" onload="loadvalue()">
<div id="main" class="main">
<form>
	<input type=hidden name=submit_flag value="change_language">
	<div id="downloading_div">
		<div><img src="/liteblue.gif" width=100% height="12" /></div><br />
		<div align="left"><%tcWebApi_multilingual("1","please_wait_for_updating_lang_str")%>...</div><br />
		<div><img src="/liteblue.gif" width=100% height="12" /></div>
	</div>
</form>
</div>
</body>
</html>
