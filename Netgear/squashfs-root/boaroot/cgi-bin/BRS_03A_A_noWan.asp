<html>

<head>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="/style/hijack_style.css" />
<script language="javascript" type="text/javascript" src="/script/brs_hijack.js"></script>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body>
<script>
var hijack_process="1";
</script>
<form method="post" action="/cgi-bin/BRS_03A_detcInetType.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type="hidden" name="submit_flag" value="wizard_detwan" />
<input type="hidden" name="detect_mode" value="1"/>

<script>
function clickRetry()
{
	document.getElementById("no_wan").style.display="none";
	document.getElementById("please_wait").style.display="";
	showFirmVersion("none");

	/* to fix bug22377: change the refresh time from 15 seconds to 30 seconds. wan lan conflict need time to change ip address*/
	/*if( hijack_process == "1" )
	{
        	if( location.href.indexOf("www.routerlogin.net") == -1 )
			setTimeout("top.location.href='http://www.routerlogin.net/BRS_index.htm';", 30000);
        	else
			setTimeout("top.location.href='http://www.routerlogin.com/BRS_index.htm';", 30000);
	}
	else
	{
		if( location.href.indexOf("www.routerlogin.net") == -1 )
			setTimeout("top.location.href='http://www.routerlogin.net/adv_index.htm';", 30000);
		else
			setTimeout("top.location.href='http://www.routerlogin.com/adv_index.htm';", 30000);
	}*/
	//location.href="BRS_03A_detcInetType.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
	<%if tcWebApi_staticGet("Wan_Common","TransMode","h") = "Ethernet" then%>
				document.forms[0].action="/cgi-bin/BRS_03A_detcEtherInetType.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
	<%end if%>
	document.forms[0].submit();
	return true;
}
</script>
<div id="no_wan" class="wizard_content_div">
<input type="hidden" name="auto_detc_flag" value="1"/>

	<div class="wizard_words_div">
		
			<h1 class="h1_red"><%tcWebApi_multilingual("1","bh_no_cable_str")%></h1>
			<p><%tcWebApi_multilingual("1","bh_wizard_setup_nowan_check_str")%></p>
			<p><%tcWebApi_multilingual("1","bh_click_try_again_str")%></p>
		
	</div>
	
	<div class="wizard_buttons_div" align="center">

		<div id="btnsContainer_div" class="buttons_img_div"  align="center" onclick='return clickRetry();'>
			<img src="/image/ca-little-purple-button.gif" />
			<div id="btn_div" class="buttons_words_div"><%tcWebApi_multilingual("1","bh_try_again_str")%></div>
		</div>
	
	</div>

</div>
<div id="please_wait" class="wizard_content_div" style="display: none">

        <div class="wizard_words_div">
                <h1><%tcWebApi_multilingual("1","bh_detecting_connection_str")%></h1>
				<p><%tcWebApi_multilingual("1","bh_plz_wait_process_str")%></p>

                <div class="waiting_img_div" align="center">
                        <img src="/image/wait30.gif" alt="waiting" />
                </div>

        </div>

</div>


</form>
</body>

</html>
