
<html>

<head>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="/style/hijack_style.css" />
<script language="javascript" type="text/javascript" src="/script/brs_hijack.js"></script>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onload="frmLoad()">
<form method="post" action="/cgi-bin/BRS_02_genieHelp.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<script>
function frmLoad()
{
	/*
	<%if tcWebApi_staticGet("WanInfo_Entry","IP","h") <> "N/A" then%>
	var wan_status = "<%tcWebApi_staticGet("WanInfo_Entry","Active","s")%>";
	<%else%>
	var wan_status="0"
	//var wan_status = "1" //temp_setting by jim.  
	<%end if%>
	if(wan_status=='1')
	{
		//location.href="/cgi-bin/BRS_success.asp";
		document.forms[0].default_flag.value = "1";
		document.forms[0].action="/cgi-bin/BRS_success.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
		document.forms[0].submit();
	}
	else
	{*/
		<%if tcWebApi_staticGet("Account_Entry0","firstuse","h") <> "1" then%>
			location.href="/cgi-bin/BRS_02_genieHelp.asp";
		<%else%>
			<%if tcWebApi_staticGet("Wan_Common","TransMode","h") = "Ethernet" then%>
				location.href="/cgi-bin/WIZ_sel_ether.asp";
			<%else%>
				location.href="/cgi-bin/WIZ_sel.asp";
			<%end if%>
		<%end if%>
	//}
}
</script>
<input type="hidden" name="default_flag" value="0" />
<div class="wizard_content_div">

	<div class="wizard_words_div">
		
		<div class="waiting_connect_div" align="center">
			
		<%tcWebApi_multilingual("1","internet_checking_str")%>
		
		</div>
		
		<div class="waiting_img_div" align="center">
			<img src="/image/wait30.gif" alt="waiting" />
		</div>
	
	</div>

</div>
</form>
</body>

</html>
