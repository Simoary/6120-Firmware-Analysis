<%
if request_Form("spoofmac") <> "" then
		tcWebApi_set("Wan_PVC","Mac_Assign","WAN_MAC_ASSIGN")
		tcWebApi_set("Wan_PVC","Mac_Spoofing","spoofmac")
end if
%>
<html>

<head>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<link rel="stylesheet" type="text/css" href="/style/hijack_style.css" />
<script language="javascript" type="text/javascript" src="/script/brs_hijack.js"></script>
</head>

<body onload="frmLoad()">
<form method="post" action="/cgi-bin/BRS_03A_detcInetType.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type="hidden" name="submit_flag" value="wizard_detwan" />
<input type="hidden" name="dhcp_flag" value="1" />
<input type="hidden" name="auto_detc_flag" value="1"/>
<input type="hidden" name="detect_mode" value="1"/>
<script>
function frmLoad()
{
	setTimeout("formSubmit()", 2000);
}

function formSubmit()
{
	var forms = document.getElementsByTagName("form");
	var cf = forms[0];
	<%if tcWebApi_staticGet("Wan_Common","TransMode","h") = "Ethernet" then%>
		cf.action="/cgi-bin/BRS_03A_detcEtherInetType.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
	<%end if%>
	cf.submit();
	//location.href="/cgi-bin/BRS_03A_detcInetType.asp";
}

</script>
<div class="wizard_content_div">

	<div class="wizard_words_div">

		<div class="waiting_connect_div" align="center">

			<h1 class="h1_black"><%tcWebApi_multilingual("1","bh_plz_wait_moment_str")%>
			
		</div>

		<div class="waiting_img_div" align="center">
			<img id="waiting_img" alt="waiting" src="/image/wait30.gif"/>
		</div>

	</div>

</div>

</form>
</body>

</html>


