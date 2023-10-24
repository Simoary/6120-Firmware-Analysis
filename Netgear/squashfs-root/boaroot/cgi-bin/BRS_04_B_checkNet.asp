<%
if request_Form("submit_flag") = "ether_hijack_dhcp" then
	tcWebApi_set("Wan_Common","TransMode","TransMode")
	tcWebApi_set("WebCurSet_Entry","wan_pvc","wan_pvc")
	tcWebApi_set("WebCurSet_Entry","nat_pvc","wan_pvc")
	tcWebApi_set("Wan_PVC","Active","Active")
	
	tcWebApi_set("Wan_PVC","ISP","ETH_Default_ISP")
	tcWebApi_set("Wan_PVC","NATENABLE","ETH_Default_NATENABLE")
	tcWebApi_set("Wan_PVC","ENCAP","ETH_Default_ENCAP")
	tcWebApi_set("Wan_PVC","DEFAULTROUTE","ETH_Default_DEFAULTROUTE")
	tcWebApi_set("Wan_PVC","Mac_Assign","ETH_Default_Mac_Assign")
	tcWebApi_commit("Wan_PVC")
	tcWebApi_commit("Netscan_Common")
end if

if request_Form("submit_flag") = "hijack_dhcp" then
	tcWebApi_set("Wan_Common","TransMode","TransMode")
	tcWebApi_set("WebCurSet_Entry","wan_pvc","wan_pvc")
	tcWebApi_set("WebCurSet_Entry","nat_pvc","wan_pvc")
	tcWebApi_set("Wan_PVC","Active","Active")
	
	tcWebApi_set("Wan_PVC","VPI","AdslVpi")
	tcWebApi_set("Wan_PVC","VCI","AdslVci")
	tcWebApi_set("Wan_PVC","ISP","DSL_Default_ISP")
	tcWebApi_set("Wan_PVC","NATENABLE","DSL_Default_NATENABLE")
	tcWebApi_set("Wan_PVC","ENCAP","DSL_Default_ENCAP")
	tcWebApi_set("Wan_PVC","DEFAULTROUTE","DSL_Default_DEFAULTROUTE")
	tcWebApi_set("Wan_PVC","Mac_Assign","DSL_Default_Mac_Assign")
	
	tcWebApi_commit("Wan_PVC")
	
	tcWebApi_commit("Netscan_Common")
	
end if
%>
<html>

<head>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<link rel="stylesheet" type="text/css" href="/style/hijack_style.css" />
<script language="javascript" type="text/javascript" src="/script/brs_hijack.js"></script>
<script language="javascript" type="text/javascript">
var checking_result = "none";
</script>

</head>

<body onload="frmLoad()">
<style>
.prgbar { width: 393px; }
</style>
<form method="post" action="/cgi-bin/BRS_03A_detcInetType.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type="hidden" name="submit_flag" value="wizard_detwan" />
<input type="hidden" name="default_flag" value="0" />
<input type="hidden" name="detect_mode" value="1"/>
<input type="hidden" name="ping_flag" id="ping_flag" value="dhcp">

<script>
var pchar = "||"; // progress char
var maxchars = 15; 
var delay_time = 1000; // msecs
var charcount = 0;
var country = "<%If tcWebApi_get("DslDefault_Common","NowSelect","h") <> "N/A" then tcWebApi_get("DslDefault_Common","NowSelect","s") end if%>";
var isp = "<%If tcWebApi_get("DslDefault_Common","ISP","h") <> "N/A" then tcWebApi_get("DslDefault_Common","ISP","s") end if%>";
var fastweb = "<%If tcWebApi_get("DslDefault_Common","FastWeb","h") <> "N/A" then tcWebApi_get("DslDefault_Common","FastWeb","s") end if%>";

function frmLoad()
{
	updateProgress();
}
function updateProgress()
{
	var cf = document.forms[0];
	
	if (charcount < maxchars)
	{
		charcount ++;
		cf.progress.value = makeStr(charcount,pchar);
		setTimeout("updateProgress()",delay_time);
	}
	else
	{ 
		
			//location.href="/cgi-bin/BRS_success.asp";
			<% if request_Form("ping_finish") <> "1" then %>
				cf.action="/cgi-bin/BRS_04_B_checkNet_ping.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
				cf.submit();
				
			<%else%>
			
				<%if tcWebApi_staticGet("AutoDetect_Entry","getResult","h") <> "N/A" then%>
				var wan_status =  "<%tcWebApi_staticGet("AutoDetect_Entry","getResult","s")%>";
				<%else%>
				var wan_status = "0";
				<%end if%>
				if(wan_status=="1")
				{
					
					cf.default_flag.value = "1";
					//location.href="/cgi-bin/BRS_success.asp";
					cf.action="/cgi-bin/BRS_success.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
					cf.submit();
				}
				else{
					if(country=="Italy" && isp=="Fastweb" && fastweb=="0"){
						location.href="/cgi-bin/BRS_03A_H_macClone.asp";
					}
					else if(country=="Italy" && isp=="Fastweb" && fastweb=="1"){
						location.href="/cgi-bin/BRS_05_networkIssue.asp";
					}
					else
						location.href="/cgi-bin/BRS_05_networkIssue.asp";
				}
			
			
			
			
			
			
			
			
			
			
			
			
				//cf.default_flag.value = "1";
				//cf.action="/cgi-bin/BRS_success.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
				//cf.submit();
			<%end if%>
		
	}
}
function makeStr(strSize, fillChar)
{
	var temp = "";
	for (i=0; i < strSize ; i ++)
		temp = temp + fillChar;
	return temp;
}
</script>

<div class="wizard_content_div">

	<div class="wizard_words_div">

		<div class="waiting_connect_div" align="center">
		
			<h1 class="h1_black"><%tcWebApi_multilingual("1","bh_internet_checking_str")%></h1>
		
		</div>

		<div class="reboot1bar" align="center">
			<input type="text" name="progress" size="60" class="prgbar" value="">
		</div>

	</div>

</div>

</form>
</body>

</html>


