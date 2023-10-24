<%
If Request_Form("pppoe_setting") = "1" Then
	tcWebApi_set("WebCurSet_Entry","wan_pvc","wan_pvc")
	tcWebApi_set("Wan_PVC","ISP","ETH_Default_ISP")
	tcWebApi_set("Wan_PVC","ENCAP","ETH_Default_ENCAP")
	tcWebApi_commit("Wan_PVC")
End If
If Request_Form("auto_detc_flag") = "1" Then
	tcWebApi_get("AutoDetect_Entry","Update","h")
End If
%>
<html>

<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta http-equiv="refresh" content="5; url=BRS_03A_detcEtherInetType.asp">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<link rel="stylesheet" type="text/css" href="/style/hijack_style.css" />
<script language="javascript" type="text/javascript">
var tmp = "<%tcWebApi_get("AutoDetect_Entry","ReadEthFile","h")%>";
var checking_result = "<%If tcWebApi_get("AutoDetect_Entry","DetectAction","h") <> "N/A" then tcWebApi_get("AutoDetect_Entry","DetectAction","s") end if%>";
var connect_type = "<%If tcWebApi_get("AutoDetect_Entry","ConnectType","h") <> "N/A" then tcWebApi_get("AutoDetect_Entry","ConnectType","s") end if%>";


function loadvalue()
{
	var cf = document.forms[0];
	if(checking_result=="1")
	{
			if(connect_type=="STATUS_PLUG_OFF")
			{
				location.href="/cgi-bin/BRS_03A_A_noWan.asp";
			}
			else if(connect_type=="STATUS_DHCP")
			{
				cf.action="/cgi-bin/BRS_04_B_checkNet.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
				cf.submit();
				//location.href="/cgi-bin/BRS_04_B_checkNet.asp";
			}
			else if(connect_type=="STATUS_PPPOE" )
			{
				location.href="/cgi-bin/BRS_03A_B_pppoe.asp";
			}
			else
			{
				location.href="/cgi-bin/BRS_03A_E_IP_problem.asp";
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
	cf.action="/cgi-bin/WIZ_sel_ether.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
	cf.submit();
}
</script>
</head>

<body onLoad="loadvalue();">
<form method="post" action="/cgi-bin/BRS_03A_detcInetType.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type="hidden" name="submit_flag" value="ether_hijack_dhcp" />
<input type="hidden" name="cancel_detwan_flag" value="0" />
<input type="hidden" name="TransMode" value="Ethernet" />
<input type="hidden" name="wan_pvc" value="10" />
<INPUT type=hidden name=Active value="Yes">
<input type=hidden name=ETH_Default_ISP value="0">
<input type=hidden name=ETH_Default_NATENABLE value="Enable">
<input type=hidden name=ETH_Default_ENCAP value="1483 Bridged IP LLC">
<input type=hidden name=ETH_Default_DEFAULTROUTE value="Yes">
<input type=hidden name=ETH_Default_Mac_Assign value="0">


<div class="wizard_content_div">

	<div class="wizard_words_div">
			<h1><%tcWebApi_multilingual("1","bh_detecting_connection_str")%></h1>
			<p><%tcWebApi_multilingual("1","bh_plz_wait_process_str")%></p>
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

</div>

</body>

</html>
