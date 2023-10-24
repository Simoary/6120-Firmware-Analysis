<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body bgcolor="#ffffff" >
<form method="post" action="/cgi-bin/BRS_03A_detcInetType.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type="hidden" name="submit_flag" value="wizard_detwan">
<input type="hidden" name="detect_mode" value="2"/>
<input type="hidden" name="auto_detc_flag" value="1"/>


<div class="page_title"><%tcWebApi_multilingual("1","title_str")%></div>

<div id="main" class="main">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>
<script>
function click_next()
{
	if (document.forms[0].WANDetc[0].checked == true)
	{
		document.forms[0].submit();
	}
	else{
		if(parent.menu_internet=="pppoe")
			location.href="/cgi-bin/BAS_pppoe.asp";
		else if(parent.menu_internet=="pppoa")
			location.href="BAS_pppoa.asp";	
		else if(parent.menu_internet=="pptp")
			location.href="/cgi-bin/BAS_pptp.asp";
		else if(parent.menu_internet=="l2tp")
			location.href="/cgi-bin/BAS_l2tp.asp";
		else
		{
			//document.forms[0].default_flag.value = "1";
			//location.href="/cgi-bin/BRS_success.asp";
			//document.forms[0].action="/cgi-bin/WIZ_sel.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
			//document.forms[0].submit();
			location.href="/cgi-bin/BAS_ether.asp";
		}
	}	
}
</script>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
<TR><TD nowrap><B><%tcWebApi_multilingual("1","setup_part1_str")%></B></TD></TR>
<TR><TD nowrap><INPUT type="radio"  checked name="WANDetc" id="wan_detect_type" value="AutoDetc"><%tcWebApi_multilingual("1","mydetc1_str")%></TD></TR>
<TR><TD nowrap><INPUT type="radio" name="WANDetc" id="wan_detect_type" value="MyDetc"><%tcWebApi_multilingual("1","mydetc_str")%></TD></TR>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
<TR><TD nowrap align=center>

<input class="short_common_bt" type="button" name="Next" id="next" value="<%tcWebApi_multilingual("0","glbstr_next")%>" onClick="click_next()">
</TD></TR>
</TABLE>
</FORM>
</BODY>
</HTML>