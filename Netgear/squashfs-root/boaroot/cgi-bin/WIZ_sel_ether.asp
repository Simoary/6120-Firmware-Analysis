<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body bgcolor="#ffffff" >
<form method="post" action="/cgi-bin/BRS_03A_detcEtherInetType.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type="hidden" name="submit_flag" value="wizard_detwan">



<div id="title" class="page_title"><%tcWebApi_multilingual("1","title_str")%></div>

<div id="main" class="main">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
<input type="hidden" name="auto_detc_flag" value="1"/>
<input type="hidden" name="physic_line_status" />
<input type="hidden" name="detect_mode" value="1"/>
<input type="hidden" name="pppoe_setting" value="0"/>
<input type="hidden" name="wan_pvc" value="10" />
<input type=hidden name=ETH_Default_ISP value="0">
<input type=hidden name=ETH_Default_ENCAP value="1483 Bridged IP LLC">

<script>
wan_phy_mode="adsl";
var connetc_type = "<% if tcWebApi_get("Wan_PVC","ISP","h") <> "N/A" then tcWebApi_get("Wan_PVC","ISP","s") end if%>";
var hw_link_type = "<%tcWebApi_get("AutoUpgrade_Entry","HW_link_status","s")%>";
var adsl_country = [
["1","Australia"],
["2","India"],
["3","New Zealand"],
["4","Singapore"],
["5","Philippine"],
["6","Hongkong"],
["7","Malaysia"],
["8","Indonesia"],
["9","Vietnam"],
["10","Thailand"],
["11","China"],
["12","Austria"],
["13","Belgium"],
["14","Czech Republic"],
["15","Denmark"],
["16","France"],
["17","Finland"],
["18","Germany"],
["19","Hungary"],
["20","Italy"],
["21","Portugal"],
["22","Netherlands "],
["23","Poland"],
["24","Russia"],
["25","Saudi Arabia"],
["26","Spain"],
["27","Sweden"],
["28","Switzerland"],
["29","Turkey"],
["30","Brazil"],
["31","United Kingdom"],
["32","Canada"],
["33","United States"],
["34","Other"]
];

function click_next()
{
	if (document.forms[0].WANDetc[0].checked == true)
	{
			if(hw_link_type==0)
			{
				document.forms[0].physic_line_status.value = 0;
			}
			if(connetc_type==2)
			{
				document.forms[0].pppoe_setting.value = 1;
				//document.getElementById("title").style.display = "none";
				document.getElementById("main").style.display = "none";
				document.getElementById("waiting_bar").style.display = "";
				setTimeout(function(){document.getElementById("loading_img").src=document.getElementById("loading_img").src},1);
				
			}
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
			location.href="/cgi-bin/BAS_ether.asp";
		}
	}	
}
</script>
<script>

var netgear_region="<%tcWebApi_get("SkuId_Entry","Region","s")%>";



</script>
<input type="hidden" name="default_flag" value="0" />

<TR><TD nowrap><B><%tcWebApi_multilingual("1","setup_part1_str")%></B></TD></TR>
<TR><TD nowrap><B><%tcWebApi_multilingual("1","setup_part2_str")%></B></TD></TR>
<TR><TD nowrap><INPUT type="radio"  checked name="WANDetc" id="wan_detect_type" value="AutoDetc"><%tcWebApi_multilingual("0","glbstr_yes")%></TD></TR>
<TR><TD nowrap><INPUT type="radio" name="WANDetc" id="wan_detect_type" value="MyDetc"><%tcWebApi_multilingual("1","mydetc_str")%></TD></TR>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
<TR><TD nowrap align=center>

<input class="short_common_bt" type="button" name="Next" id="next" value="<%tcWebApi_multilingual("0","glbstr_next")%>" onClick="click_next()">
</TD></TR>

</TABLE>

</div>

<div id="waiting_bar" style="display:none">
<div  align="center"><BR><BR><TR><TD align="center"><B><%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%></B></TD></TR><BR><BR></div>
<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" id="loading_img" alt="waiting" /></div>
</div>


<%tcWebApi_multilingual("2","_Wizard_setup_help.asp")%>

</FORM>
</BODY>
</HTML>
