<%
If Request_Form("auto_detc_flag") = "1" Then
	If Request_Form("selected_country") <> "" Then
		tcWebApi_set("DslDefault_Common","NowSelect","selected_country")
		tcWebApi_set("DslDefault_Common","ISP","selected_isp")
		If Request_Form("selected_country_number") <> "-1" Then
			tcWebApi_set("DslDefault_Common","CountryNumber","selected_country_number")
		End If
		If Request_Form("selected_isp_number") <> "-1" Then
			tcWebApi_set("DslDefault_Common","ISPnumber","selected_isp_number")
		End If
		
	End If
	If Request_Form("detect_mode") <> "" Then
		tcWebApi_set("AutoDetect_Entry","detecting_mode","detect_mode")
	End If
	If Request_Form("FastWeb") <> "" Then
		tcWebApi_set("DslDefault_Common","FastWeb","FastWeb")
	End If
	tcWebApi_get("AutoDetect_Entry","Update","h")
End If
%>
<html>

<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta http-equiv="refresh" content="5; url=BRS_03A_detcInetType.asp">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<link rel="stylesheet" type="text/css" href="/style/hijack_style.css" />
<script language="javascript" type="text/javascript">
var tmp = "<%tcWebApi_get("AutoDetect_Entry","ReadFile","h")%>";
var checking_result = "<%If tcWebApi_get("AutoDetect_Entry","DetectAction","h") <> "N/A" then tcWebApi_get("AutoDetect_Entry","DetectAction","s") end if%>";
var connect_type = "<%If tcWebApi_get("AutoDetect_Entry","ConnectType","h") <> "N/A" then tcWebApi_get("AutoDetect_Entry","ConnectType","s") end if%>";
var detecting_proto = "<%If tcWebApi_get("AutoDetect_Entry","detecting_status","h") <> "N/A" then tcWebApi_get("AutoDetect_Entry","detecting_status","s") end if%>";
var detecting_PVCs = "<%If tcWebApi_get("AutoDetect_Entry","detecting_PVCs","h") <> "N/A" then tcWebApi_get("AutoDetect_Entry","detecting_PVCs","s") end if%>";
var detecting_full_scan_percent = "<%If tcWebApi_get("AutoDetect_Entry","full_scan_percent","h") <> "N/A" then tcWebApi_get("AutoDetect_Entry","full_scan_percent","s") end if%>";
var detect_mode = "<%If tcWebApi_get("AutoDetect_Entry","detecting_mode","h") <> "N/A" then tcWebApi_get("AutoDetect_Entry","detecting_mode","s") end if%>";
var country = "<%If tcWebApi_get("DslDefault_Common","NowSelect","h") <> "N/A" then tcWebApi_get("DslDefault_Common","NowSelect","s") end if%>";
var isp = "<%If tcWebApi_get("DslDefault_Common","ISP","h") <> "N/A" then tcWebApi_get("DslDefault_Common","ISP","s") end if%>";
var fastweb = "<%If tcWebApi_get("DslDefault_Common","FastWeb","h") <> "N/A" then tcWebApi_get("DslDefault_Common","FastWeb","s") end if%>";


function loadvalue()
{
	var cf = document.forms[0];
	if(checking_result=="1")
	{
		if(detect_mode == "1" )
		{
			if(connect_type=="STATUS_PLUG_OFF")
			{
				location.href="/cgi-bin/BRS_03A_A_noWan.asp";
			}
			else if(connect_type=="STATUS_DHCP")
			{
				cf.action="/cgi-bin/BRS_04_B_checkNet.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
				cf.submit();
			}
			else if(connect_type=="STATUS_PPPOE" || connect_type=="STATUS_PPPOA")
			{
				location.href="/cgi-bin/BRS_03A_B_pppoe.asp";
			}
			else if(connect_type=="STATUS_IPOA" )
			{
				location.href="/cgi-bin/BRS_03A_E_IP_problem_IPoA_A_inputIP.asp";
			}
			else
			{/*
				if(country=="Italy" && isp=="Fastweb" && fastweb=="0"){
					location.href="/cgi-bin/BRS_03A_H_macClone.asp";
				}
				else if(country=="Italy" && isp=="Fastweb" && fastweb=="1"){
					location.href="/cgi-bin/BRS_05_networkIssue.asp";
				}
				else*/
					location.href="/cgi-bin/BRS_03A_G_fullscan.asp";
			}
		}
		else
		{
			if(connect_type=="STATUS_PLUG_OFF")
			{
				location.href="/cgi-bin/BRS_03A_A_noWan.asp";
			}
			else if(connect_type=="STATUS_DHCP")
			{
				cf.action="/cgi-bin/BRS_04_B_checkNet.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
				cf.submit();
			}
			else if(connect_type=="STATUS_PPPOE" || connect_type=="STATUS_PPPOA")
			{
				location.href="/cgi-bin/BRS_03A_B_pppoe.asp";
			}
			else
			{
				location.href="/cgi-bin/BRS_03A_E_IP_problem.asp";
			}
		}
		
		
	}
	<%If Request_Form("physic_line_status") = "0" Then%>
	location.href="/cgi-bin/BRS_03A_A_noWan.asp";
	<%End If%>
}

function cancel_detwan()
{
	var cf = document.forms[0];
	cf.cancel_detwan_flag.value = "1";
	cf.action="/cgi-bin/BRS_02_genieHelp.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
	cf.submit();
}
</script>
</head>

<body onLoad="loadvalue();">
<form method="post" action="/cgi-bin/BRS_03A_detcInetType.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type="hidden" name="submit_flag" value="hijack_dhcp" />
<input type="hidden" name="cancel_detwan_flag" value="0" />
<input type="hidden" name="TransMode" value="ATM" />
<input type="hidden" name="wan_pvc" value="0" />
<INPUT type=hidden name=Active value="Yes">
<input type=hidden name=DSL_Default_ISP value="0">
<input type=hidden name=DSL_Default_NATENABLE value="Enable">
<input type=hidden name=DSL_Default_ENCAP value="1483 Bridged IP LLC">
<input type=hidden name=DSL_Default_DEFAULTROUTE value="Yes">
<input type=hidden name=DSL_Default_Mac_Assign value="0">
<INPUT type=hidden name=AdslVpi value="<%if TCWebAPI_get("AutoDetect_Entry", "VPI", "h") <> "N/A" then TCWebAPI_staticGet("AutoDetect_Entry", "VPI", "s") else asp_Write("0") end if %>">
<INPUT type=hidden name=AdslVci value="<%if TCWebAPI_get("AutoDetect_Entry", "VCI", "h") <> "N/A" then TCWebAPI_staticGet("AutoDetect_Entry", "VCI", "s") else asp_Write("33") end if %>">


<div class="wizard_content_div">

	<div class="wizard_words_div">
			<%if tcWebApi_staticGet("AutoDetect_Entry","detecting_mode","h") <> "2" then%>
			<h1><%tcWebApi_multilingual("1","bh_detecting_connection_str")%></h1>
			<p><%tcWebApi_multilingual("1","bh_plz_wait_process_str")%></p>
			<%else%>
			<h1><%tcWebApi_multilingual("1","bh_detecting_connection_str")%></h1>
			<p><%tcWebApi_multilingual("1","bh_detecting_connection_full_str")%></p>
			<p><%tcWebApi_multilingual("1","bh_plz_wait_process_full_str")%></p>
			<%end if%>
			<script>document.write('VPI/VCI : '+detecting_PVCs+'&nbsp;'+detecting_proto+'&nbsp;')</script>
			<%if tcWebApi_staticGet("AutoDetect_Entry","full_scan_percent","h") <> "N/A" then%>
			<script>document.write('&nbsp;'+detecting_full_scan_percent+'\%')</script>
			<%End if%>
		<div class="waiting_img_div" align="center">
			<img src="/image/wait30.gif" alt="waiting" />
		</div>
		
	</div>
	
	<div id="buttons_div_02" class="wizard_buttons_detc_div" align="center">
		<div id="btnsContainer_div" class="buttons_detc_img_div"  align="center" onClick='cancel_detwan();'>
			<img src="/image/ca-little-purple-button.gif" />
			<div id="btn_div" class="buttons_detc_words_div"><%tcWebApi_multilingual("0","glbstr_cancel")%></div>
			</div>
	</div>
<!--
<div style="color: red;">
<%tcWebApi_multilingual("1","demo_str")%><br/>
<a href="BRS_03A_B_pppoe.asp"><%tcWebApi_multilingual("1","ppp_str")%></a><br/>
<a href="BRS_03A_C_pptp.asp"><%tcWebApi_multilingual("1","pptp_str")%></a><br/>
<a href="BRS_03A_F_l2tp.asp"><%tcWebApi_multilingual("1","l2tp_str")%></a><br/>
<a href="BRS_04_B_checkNet_ping.asp"><%tcWebApi_multilingual("1","dhcp_str")%></a><br/>
<a href="BRS_03A_E_IP_problem.asp"><%tcWebApi_multilingual("1","IP_problem_str")%></a><br/>
<a href="BRS_03A_A_noWan.asp"><%tcWebApi_multilingual("1","noWan_str")%></a>
</div>
-->
</div>

</body>

</html>
