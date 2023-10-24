<%
If Request_Form("PortForwarding_SubmitFlag") = "1" then
	tcWebApi_set("WebCurSet_Entry","nat_pvc","origin_pvc")	
	if Request_Form("select_entry_num") <> "N/A" Then
			tcWebApi_set("WebCurSet_Entry","virServ_id","select_entry_num")
			if Request_Form("del_flag") = "1" Then
				tcWebApi_unset("VirServer_PVC_Entry")
			else
				if Request_Form("edit_flag") = "1" Then
					tcWebApi_unset("VirServer_PVC_Entry")
				end if
				
				if Request_Form("service_add_flag") = "1" Then
					tcWebApi_set("VirServer_PVC_Entry","Name","hidden_service_name")
					
					tcWebApi_set("VirServer_PVC_Entry","STARTPORT","hidden_external_portstart")
					tcWebApi_set("VirServer_PVC_Entry","ENDPORT","hidden_external_portend")
					tcWebApi_set("VirServer_PVC_Entry","LOCAL_SPORT","hidden_internal_portstart")
					tcWebApi_set("VirServer_PVC_Entry","LOCAL_EPORT","hidden_internal_portend")
					tcWebApi_set("VirServer_PVC_Entry","PROTOCOL","hidden_protocol")
					tcWebApi_set("VirServer_PVC_Entry","LOCALIP","service_ip")
					tcWebApi_set("VirServer_PVC_Entry","LANIP_ADDRESS","lanip_address")
					tcWebApi_set("VirServer_PVC_Entry","PREFIX_IP","Prefix_IP")
				else
					tcWebApi_set("VirServer_PVC_Entry","Name","portname")
					tcWebApi_set("VirServer_PVC_Entry","STARTPORT","port_start")
					tcWebApi_set("VirServer_PVC_Entry","ENDPORT","port_end")
					tcWebApi_set("VirServer_PVC_Entry","LOCAL_SPORT","hidden_port_int_start")
					tcWebApi_set("VirServer_PVC_Entry","LOCAL_EPORT","hidden_port_int_end")
					tcWebApi_set("VirServer_PVC_Entry","PROTOCOL","srvtype")
					tcWebApi_set("VirServer_PVC_Entry","LOCALIP","service_ip")
					tcWebApi_set("VirServer_PVC_Entry","LANIP_ADDRESS","lanip_address")
					tcWebApi_set("VirServer_PVC_Entry","PREFIX_IP","Prefix_IP")
				end if
			
				
				
			
				
			end if
			tcWebApi_set("WebCurSet_Entry","nat_pvc","origin_pvc")			
			tcWebApi_commit("WebCurSet_Entry")
			tcWebApi_commit("VirServer_PVC_Entry")
	end if 
end if  
%>

<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>


<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/forwarding.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">

<div class="page_title"><%tcWebApi_multilingual("1","portforward_title_str")%></div>

<div id="main" class="main"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>



<script>
var alert_the_router_can_support_20_str="<%tcWebApi_multilingual("1","the_router_can_support_20_str")%>";
var alert_invalid_start_end_port_str="<%tcWebApi_multilingual("1","invalid_start_end_port_str")%>";
var alert_invalid_start_port_str="<%tcWebApi_multilingual("1","invalid_start_port_str")%>";
var alert_invalid_end_port_str="<%tcWebApi_multilingual("1","invalid_end_port_str")%>";
var alert_invalid_end_port_1_str="<%tcWebApi_multilingual("1","invalid_end_port_1_str")%>";
var alert_invalid_service_name_str="<%tcWebApi_multilingual("1","invalid_service_name_str")%>";
var alert_duplicate_service_name_str="<%tcWebApi_multilingual("1","duplicate_service_name_str")%>";
var alert_invalid_ip_str="<%tcWebApi_multilingual("1","invalid_ip_str")%>";
var alert_same_as_lanip_str="<%tcWebApi_multilingual("1","same_as_lanip_str")%>";
var alert_invalid_port_used_str="<%tcWebApi_multilingual("0","invalid_port_used_str")%>";

var upnp_list="<%tcWebApi_get("Upnpd_Entry","DATA","s")%>";
var serv_array=[
["TCP","20","21","20","21","FTP","1"],
["TCP","80","80","80","80","HTTP","1"],
["TCP","23566","23566","23566","23566","ICUII","1"],
["TCP","6670","6670","6670","6670","IP_Phone","1"],
["TCP","1720","1720","1720","1720","NetMeeting","1"],
["TCP","119","119","119","119","News","1"],
["TCP","1723","1723","1723","1723","PPTP","1"],
["TCP/UDP","27960","27960","27960","27960","QuakeII/III","1"],
["TCP/UDP","6970","7170","6970","7170","Real-Audio","1"],
["TCP","23","23","23","23","Telnet","1"]
];

var pvc = <%tcWebApi_get("WebCurSet_Entry","nat_pvc","s")%>;
if (pvc == "10")
{
var table_Data = [
["1","<%tcwebApi_staticGet("VirServer_PVC10_Entry0","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry0","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry0","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry0","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry0","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry0","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry0","LOCALIP","s")%>"],
["2","<%tcwebApi_staticGet("VirServer_PVC10_Entry1","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry1","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry1","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry1","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry1","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry1","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry1","LOCALIP","s")%>"],
["3","<%tcwebApi_staticGet("VirServer_PVC10_Entry2","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry2","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry2","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry2","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry2","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry2","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry2","LOCALIP","s")%>"],
["4","<%tcwebApi_staticGet("VirServer_PVC10_Entry3","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry3","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry3","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry3","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry3","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry3","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry3","LOCALIP","s")%>"],
["5","<%tcwebApi_staticGet("VirServer_PVC10_Entry4","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry4","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry4","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry4","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry4","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry4","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry4","LOCALIP","s")%>"],
["6","<%tcwebApi_staticGet("VirServer_PVC10_Entry5","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry5","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry5","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry5","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry5","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry5","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry5","LOCALIP","s")%>"],
["7","<%tcwebApi_staticGet("VirServer_PVC10_Entry6","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry6","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry6","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry6","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry6","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry6","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry6","LOCALIP","s")%>"],
["8","<%tcwebApi_staticGet("VirServer_PVC10_Entry7","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry7","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry7","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry7","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry7","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry7","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry7","LOCALIP","s")%>"],
["9","<%tcwebApi_staticGet("VirServer_PVC10_Entry8","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry8","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry8","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry8","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry8","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry8","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry8","LOCALIP","s")%>"],
["10","<%tcwebApi_staticGet("VirServer_PVC10_Entry9","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry9","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry9","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry9","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry9","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry9","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry9","LOCALIP","s")%>"],
["11","<%tcwebApi_staticGet("VirServer_PVC10_Entry10","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry10","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry10","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry10","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry10","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry10","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry10","LOCALIP","s")%>"],
["12","<%tcwebApi_staticGet("VirServer_PVC10_Entry11","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry11","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry11","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry11","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry11","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry11","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry11","LOCALIP","s")%>"],
["13","<%tcwebApi_staticGet("VirServer_PVC10_Entry12","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry12","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry12","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry12","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry12","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry12","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry12","LOCALIP","s")%>"],
["14","<%tcwebApi_staticGet("VirServer_PVC10_Entry13","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry13","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry13","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry13","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry13","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry13","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry13","LOCALIP","s")%>"],
["15","<%tcwebApi_staticGet("VirServer_PVC10_Entry14","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry14","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry14","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry14","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry14","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry14","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry14","LOCALIP","s")%>"],
["16","<%tcwebApi_staticGet("VirServer_PVC10_Entry15","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry15","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry15","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry15","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry15","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry15","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry15","LOCALIP","s")%>"],
["17","<%tcwebApi_staticGet("VirServer_PVC10_Entry16","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry16","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry16","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry16","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry16","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry16","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry16","LOCALIP","s")%>"],
["18","<%tcwebApi_staticGet("VirServer_PVC10_Entry17","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry17","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry17","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry17","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry17","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry17","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry17","LOCALIP","s")%>"],
["19","<%tcwebApi_staticGet("VirServer_PVC10_Entry18","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry18","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry18","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry18","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry18","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry18","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry18","LOCALIP","s")%>"],
["20","<%tcwebApi_staticGet("VirServer_PVC10_Entry19","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry19","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry19","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry19","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry19","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry19","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC10_Entry19","LOCALIP","s")%>"]
];
}
else
{
var table_Data = [
["1","<%tcwebApi_staticGet("VirServer_PVC0_Entry0","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry0","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry0","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry0","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry0","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry0","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry0","LOCALIP","s")%>"],
["2","<%tcwebApi_staticGet("VirServer_PVC0_Entry1","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry1","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry1","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry1","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry1","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry1","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry1","LOCALIP","s")%>"],
["3","<%tcwebApi_staticGet("VirServer_PVC0_Entry2","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry2","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry2","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry2","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry2","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry2","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry2","LOCALIP","s")%>"],
["4","<%tcwebApi_staticGet("VirServer_PVC0_Entry3","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry3","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry3","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry3","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry3","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry3","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry3","LOCALIP","s")%>"],
["5","<%tcwebApi_staticGet("VirServer_PVC0_Entry4","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry4","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry4","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry4","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry4","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry4","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry4","LOCALIP","s")%>"],
["6","<%tcwebApi_staticGet("VirServer_PVC0_Entry5","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry5","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry5","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry5","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry5","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry5","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry5","LOCALIP","s")%>"],
["7","<%tcwebApi_staticGet("VirServer_PVC0_Entry6","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry6","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry6","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry6","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry6","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry6","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry6","LOCALIP","s")%>"],
["8","<%tcwebApi_staticGet("VirServer_PVC0_Entry7","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry7","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry7","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry7","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry7","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry7","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry7","LOCALIP","s")%>"],
["9","<%tcwebApi_staticGet("VirServer_PVC0_Entry8","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry8","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry8","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry8","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry8","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry8","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry8","LOCALIP","s")%>"],
["10","<%tcwebApi_staticGet("VirServer_PVC0_Entry9","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry9","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry9","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry9","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry9","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry9","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry9","LOCALIP","s")%>"],
["11","<%tcwebApi_staticGet("VirServer_PVC0_Entry10","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry10","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry10","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry10","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry10","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry10","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry10","LOCALIP","s")%>"],
["12","<%tcwebApi_staticGet("VirServer_PVC0_Entry11","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry11","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry11","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry11","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry11","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry11","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry11","LOCALIP","s")%>"],
["13","<%tcwebApi_staticGet("VirServer_PVC0_Entry12","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry12","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry12","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry12","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry12","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry12","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry12","LOCALIP","s")%>"],
["14","<%tcwebApi_staticGet("VirServer_PVC0_Entry13","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry13","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry13","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry13","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry13","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry13","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry13","LOCALIP","s")%>"],
["15","<%tcwebApi_staticGet("VirServer_PVC0_Entry14","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry14","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry14","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry14","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry14","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry14","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry14","LOCALIP","s")%>"],
["16","<%tcwebApi_staticGet("VirServer_PVC0_Entry15","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry15","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry15","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry15","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry15","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry15","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry15","LOCALIP","s")%>"],
["17","<%tcwebApi_staticGet("VirServer_PVC0_Entry16","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry16","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry16","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry16","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry16","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry16","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry16","LOCALIP","s")%>"],
["18","<%tcwebApi_staticGet("VirServer_PVC0_Entry17","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry17","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry17","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry17","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry17","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry17","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry17","LOCALIP","s")%>"],
["19","<%tcwebApi_staticGet("VirServer_PVC0_Entry18","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry18","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry18","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry18","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry18","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry18","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry18","LOCALIP","s")%>"],
["20","<%tcwebApi_staticGet("VirServer_PVC0_Entry19","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry19","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry19","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry19","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry19","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry19","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC0_Entry19","LOCALIP","s")%>"]
];
}
var table_Data_trigger = [
    ["1","<%tcwebApi_staticGet("portTriggering_Entry0","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry0","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry0","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry0","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry0","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry0","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry0","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry0","Service_User","s")%>"],
    ["2","<%tcwebApi_staticGet("portTriggering_Entry1","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry1","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry1","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry1","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry1","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry1","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry1","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry1","Service_User","s")%>"],
    ["3","<%tcwebApi_staticGet("portTriggering_Entry2","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry2","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry2","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry2","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry2","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry2","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry2","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry2","Service_User","s")%>"],
    ["4","<%tcwebApi_staticGet("portTriggering_Entry3","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry3","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry3","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry3","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry3","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry3","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry3","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry3","Service_User","s")%>"],
    ["5","<%tcwebApi_staticGet("portTriggering_Entry4","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry4","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry4","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry4","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry4","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry4","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry4","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry4","Service_User","s")%>"],
    ["6","<%tcwebApi_staticGet("portTriggering_Entry5","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry5","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry5","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry5","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry5","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry5","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry5","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry5","Service_User","s")%>"],
    ["7","<%tcwebApi_staticGet("portTriggering_Entry6","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry6","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry6","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry6","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry6","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry6","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry6","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry6","Service_User","s")%>"],
    ["8","<%tcwebApi_staticGet("portTriggering_Entry7","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry7","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry7","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry7","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry7","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry7","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry7","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry7","Service_User","s")%>"],
    ["9","<%tcwebApi_staticGet("portTriggering_Entry8","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry8","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry8","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry8","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry8","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry8","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry8","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry8","Service_User","s")%>"],
    ["10","<%tcwebApi_staticGet("portTriggering_Entry9","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry9","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry9","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry9","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry9","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry9","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry9","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry9","Service_User","s")%>"],
    ["11","<%tcwebApi_staticGet("portTriggering_Entry10","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry10","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry10","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry10","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry10","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry10","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry10","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry10","Service_User","s")%>"],
    ["12","<%tcwebApi_staticGet("portTriggering_Entry11","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry11","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry11","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry11","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry11","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry11","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry11","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry11","Service_User","s")%>"],
    ["13","<%tcwebApi_staticGet("portTriggering_Entry12","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry12","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry12","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry12","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry12","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry12","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry12","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry12","Service_User","s")%>"],
    ["14","<%tcwebApi_staticGet("portTriggering_Entry13","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry13","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry13","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry13","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry13","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry13","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry13","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry13","Service_User","s")%>"],
    ["15","<%tcwebApi_staticGet("portTriggering_Entry14","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry14","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry14","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry14","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry14","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry14","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry14","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry14","Service_User","s")%>"],
    ["16","<%tcwebApi_staticGet("portTriggering_Entry15","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry15","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry15","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry15","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry15","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry15","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry15","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry15","Service_User","s")%>"],
    ["17","<%tcwebApi_staticGet("portTriggering_Entry16","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry16","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry16","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry16","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry16","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry16","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry16","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry16","Service_User","s")%>"],
    ["18","<%tcwebApi_staticGet("portTriggering_Entry17","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry17","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry17","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry17","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry17","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry17","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry17","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry17","Service_User","s")%>"],
    ["19","<%tcwebApi_staticGet("portTriggering_Entry18","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry18","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry18","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry18","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry18","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry18","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry18","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry18","Service_User","s")%>"],
    ["20","<%tcwebApi_staticGet("portTriggering_Entry19","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry19","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry19","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry19","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry19","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry19","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry19","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry19","Service_User","s")%>"]
];

function loadvalue()
{
	parent.TriggerorForward = "forward";
	var cf=document.forms[0];
	var addr_array = new Array();
	addr_array = lan_ip.split('.');
	cf.Prefix_IP.value = addr_array[0]+'.'+addr_array[1]+'.'+addr_array[2]+'.0/24';
	nextEntry();
}

function show_servip()
{
	var cf=document.forms[0];
	var lanip_array=new Array();
	lanip_array=lan_ip.split('.');
	cf.SV_IP1.value=lanip_array[0];
	cf.SV_IP2.value=lanip_array[1];
	cf.SV_IP3.value=lanip_array[2];
}

function nextEntry()
{
	var first_flag = 0;
	var free_rule = 0;
	var input_rule = 0;

	for(var z=0;z<table_Data.length;z++)
	{
		if(table_Data[z][2]!="N/A")
		{
			free_rule+=1;
		}
		else
		{
			if(first_flag == 0)
			{
				input_rule = z;
				first_flag = 1;
			}
		}
		
	}

	if (free_rule > document.forms[0].PortForward_CanUseNum.value)
	{
		alert(full_rules_str);
		return true;
	}
	else
	{
		document.forms[0].nextEntry.value = input_rule;
		document.forms[0].sumEntry.value = free_rule;
	}
	
	
	return false;
}


function check_forwarding_edit(cf)
{
	if (cf.sumEntry.value == 0)
	{
		location.href="edit_fail.asp";
		return false;
	}
	var count_select=0;
	var select_num;
	if (cf.sumEntry.value == 1)
	{
		if(cf.RouteSelect.checked == true)
		{
			count_select++;
			select_num=parseInt(cf.RouteSelect.value);
		}
	}
	else for(i=0;i<cf.sumEntry.value;i++)
		if(cf.RouteSelect[i].checked == true)
		{
			count_select++;
			select_num=parseInt(cf.RouteSelect[i].value);
			break;
		}
	if(count_select==0)
	{
		location.href="edit_fail.asp";
		return false;
	}
	else
	{
		cf.select_edit.value=select_num;
		//cf.submit_flag.value="forwarding_editnum";
		cf.edit_name.value = table_Data[select_num][1];
		cf.edit_ip.value = table_Data[select_num][7];
		cf.edit_esport.value = table_Data[select_num][2];
		cf.edit_eeport.value = table_Data[select_num][3];
		cf.edit_protocol.value = table_Data[select_num][6];
		cf.edit_isport.value = table_Data[select_num][4];
		cf.edit_ieport.value = table_Data[select_num][5];

		
	//	cf.action="/apply.cgi?/forwarding_edit_wait.htm timestamp="+ts;
	//	return true;
	}
	location.href="forwarding_edit.asp?index="+cf.select_edit.value+";"+cf.edit_name.value+";"+cf.edit_protocol.value+";"+cf.edit_esport.value+";"+cf.edit_eeport.value+";"+cf.edit_isport.value+";"+cf.edit_ieport.value+";"+cf.edit_ip.value;
	return false;
}




function check_forwarding_del(cf)
{
	if (cf.sumEntry.value == 0 )
	{
		location.href="del_fail.asp";
		return false;
	}
	var count_select=0;
	var select_num;
	if (cf.sumEntry.value == 1)
	{
		if(cf.RouteSelect.checked == true)
		{
			count_select++;
			select_num=parseInt(cf.RouteSelect.value);
		}
	}
	else for(i=0;i<cf.sumEntry.value;i++)
		if(cf.RouteSelect[i].checked == true)
		{
			count_select++;
			select_num=parseInt(cf.RouteSelect[i].value);
		}
	if(count_select==0)
	{
		location.href="del_fail.asp";
		return false;
	}
	else
	{
		cf.select_entry_num.value=select_num;
		cf.del_flag.value = 1;
		//cf.submit_flag.value="forwarding_del";
		cf.PortForwarding_SubmitFlag.value = 1;
		cf.submit();
		return true;
	}
}

function check_list_length(forward_num)
{
	var flag1720=0;
	for(var i=0;i<forward_num;i++)
	{
		
		if(table_Data[i][2]=="N/A")
			flag1720=1;
	}
	if(flag1720 == 0)
	{	
		if(forward_num==20)
		{
			alert(full_rules_str);
			return false;
		}
	}
	else
	{
		if(forward_num>=21)
		{
			alert(full_rules_str);
			return false;
		}
	}
}

function Check_add(cf)     
{
	nextEntry();
	cf.select_entry_num.value = cf.nextEntry.value;
	cf.serflag.value=0;
	if(check_list_length(cf.sumEntry.value)==false)
		return false;
	cf.service_ip.value=cf.SV_IP1.value+'.'+cf.SV_IP2.value+'.'+cf.SV_IP3.value+'.'+cf.SV_IP4.value;
	if(checkipaddr(cf.service_ip.value)==false || is_sub_or_broad(cf.service_ip.value, lan_ip, lan_subnet) ==false)
	{
		alert(invalid_ip_str);
		return false;
	}
	cf.service_ip.value = address_parseInt(cf.service_ip.value);
	if(isSameSubNet(cf.service_ip.value,lan_subnet,lan_ip,lan_subnet)== false)
	{
		alert(same_as_lanip_str);
		return false;
	}
	if(isSameIp(cf.service_ip.value,lan_ip) == true)
	{
		alert(invalid_ip_str);
		return false;    
	}
	var selectService=cf.svs_gm.options[cf.svs_gm.selectedIndex].value;
	var s = cf.svs_gm.selectedIndex;
	for(i=0;i<cf.PortForward_CanUseNum.value;i++)
	{
		if(serv_array[s][5]==table_Data[i][1])
		{
			alert(duplicate_service_name_str);
			return false;
		}
	}
	var input_ip=cf.service_ip.value;
	cf.hidden_protocol.value = serv_array[s][0];
	cf.hidden_external_portstart.value = serv_array[s][1];
	cf.hidden_external_portend.value = serv_array[s][2];
	cf.hidden_internal_portstart.value = serv_array[s][3];
	cf.hidden_internal_portend.value = serv_array[s][4];
	cf.hidden_service_name.value = serv_array[s][5];

	var input_sername=serv_array[s][5];
	var input_sertype=serv_array[s][0];
	var input_external_start_port=serv_array[s][1];
	var input_external_end_port=serv_array[s][2];
	var input_internal_start_port=serv_array[s][3];
	var input_internal_end_port=serv_array[s][4];
	
	//port_forwarding
	var forward_array_num = 20;
	var trigger_array_num = 20;
        var upnp_array_num =  "<%TCWebAPI_get("Upnpd_Entry", "Rule_number", "s")%>";
        var pattern = /[N\/A]{1,}/;
        var flag = pattern.test(upnp_array_num);
	var forwarding_ip="";
	var triggeringip="";
        if(!flag)
          upnp_array_num =  <%TCWebAPI_get("Upnpd_Entry", "Rule_number", "s")%>;
	for(i=0;i<forward_array_num;i++)
	{
		sertype=table_Data[i][6];
		ext_startport=table_Data[i][2];
		ext_endport=table_Data[i][3];
		int_startport=table_Data[i][4];
		int_endport=table_Data[i][5];
		forwarding_ip=table_Data[i][7];
//		serflag=each_info[7];
		if( table_Data[i][1] == "N/A" )
                    continue;
//		if(sertype=="UDP"&&serflag=="1")
		if(sertype=="UDP")
		{
		}
		else if (sertype=="TCP/UDP"||sertype==input_sertype||input_sertype=="TCP/UDP")
		{
		    if (!(parseInt(ext_endport)<parseInt(input_external_start_port)||parseInt(input_external_end_port)<parseInt(ext_startport)) || !(parseInt(int_endport)<parseInt(input_internal_start_port)||parseInt(input_internal_end_port)<parseInt(int_startport)) && input_ip == forwarding_ip)
 			{
				alert(alert_invalid_port_used_str);
				return false;
			}		
		}
	}	
	//port_triggering	
	for(i=0;i<trigger_array_num;i++)
	{
		constart_port=table_Data_trigger[i][5];	
		conend_port=table_Data_trigger[i][6];	
		triggeringip=table_Data_trigger[i][7];
		if( table_Data_trigger[i][1] == "N/A" )
                    continue;
		if (!(parseInt(conend_port)<parseInt(input_external_start_port)||parseInt(input_external_end_port)<parseInt(constart_port) ) || !(parseInt(conend_port)<parseInt(input_internal_start_port)||parseInt(input_internal_end_port)<parseInt(constart_port) ) && input_ip == triggeringip)
 		{
			alert(alert_invalid_port_used_str);
			return false;
		}
	}
	//upnp
	var upnp_list_array = new Array();  
	
	var upnp_list_array=upnp_list.split("@&#35;$&#38;*! ");
	var upnp_active_array = new Array();  
	var upnp_protocal_array = new Array(); 
	var upnp_int_array = new Array(); 
	var upnp_ext_array = new Array(); 	
	var upnp_ip_array = new Array(); 	
	var p=0;
		
	if(upnp_list != "")
	{
		for(i=0;i<upnp_list_array.length-1;i++)
		{
			var each_info=upnp_list_array[i].split(';');
			upnp_int=each_info[2];
			upnp_ext=each_info[3];
			upnp_ip=each_info[4];
			if ((!( parseInt(upnp_ext)<parseInt(input_external_start_port) || parseInt(input_external_end_port)<parseInt(upnp_int) ) && input_ip != upnp_ip) || (!( parseInt(upnp_ext)<parseInt(input_internal_start_port) || parseInt(input_internal_end_port)<parseInt(upnp_int) ) && input_ip != upnp_ip))
			{
				alert(alert_invalid_port_used_str);
				return false;
			}
		}
	}	

	//check USB ready share port
	if( usb_router_flag == 1)
	{
		if(check_readyshare_port(input_external_start_port, input_external_end_port, "WAN") == false || check_readyshare_port(input_internal_start_port, input_internal_end_port, "WAN") == false)
		{
			alert(alert_invalid_port_used_str);
			return false;
		}
	}

	
	//check with remote
	if ((!(parseInt(remote_port)<parseInt(input_external_start_port)||parseInt(input_external_end_port)<parseInt(remote_port)) && remote_port!="") || (!(parseInt(remote_port)<parseInt(input_internal_start_port)||parseInt(input_internal_end_port)<parseInt(remote_port)) && remote_port!=""))
	{
		alert(alert_invalid_port_used_str);
		return false;
	}		
	
	if(cf.hidden_service_name.value=="NetMeeting")
		cf.serflag.value=1;
	else
		cf.serflag.value=0;

	cf.PortForwarding_SubmitFlag.value = 1;
	cf.service_add_flag.value =1;
	//cf.submit_flag.value="forwarding_hidden_add";
	cf.submit();
	return true;
}

var is_ftp = 1;

var show_enableHTTP="0";
var show_enableHvia="1";
var show_HTTP_via_port="80";
var show_enableFTP="<%if tcWebApi_get("Ftp_Entry","LanAccess","h") = "Yes" then asp_write("1") else asp_write("0") end if%>";
var show_enableFvia="<%if tcWebApi_get("Ftp_Entry","WanAccess","h") = "Yes" then asp_write("1") else asp_write("0") end if%>";
var show_FTP_via_port="<%if tcWebApi_get("Ftp_Entry","WanPort","h") <> "N/A" then tcWebApi_get("Ftp_Entry","WanPort","s") else asp_write("21") end if%>";
var usb_router_flag=parent.usb_router_flag;

var lan_ip=('<%If tcWebApi_get("Lan_Entry","IP","h") <> "N/A" then tcWebApi_get("Lan_Entry","IP","s") end if%>') ;
var lan_subnet=('<%If tcWebApi_get("Lan_Entry","netmask","h") <> "N/A" then tcWebApi_get("Lan_Entry","netmask","s") end if%>') ;
var remote_port="<%if TCWebAPI_get("RemoteManager_Entry", "Port", "h") <> "N/A" then TCWebAPI_staticGet("RemoteManager_Entry", "Port", "s") else asp_Write("8443") end if %>";
var endis_remote='<%if TCWebAPI_get("RemoteManager_Entry", "Activate", "h") <> "Yes" then asp_Write("0") else asp_Write("1") end if %>';
var endis_upnp='<%if TCWebAPI_get("Upnpd_Entry", "Active", "h") <> "Yes" then asp_Write("0") else asp_Write("1") end if %>';
var ts='95744096';

function setButtonClass(str,id)
{
  var words_len = document.getElementById(id);
  
  if(id == "edit" || id == "delete")
  {
	if( str.length >=15 )
	{
		words_len.className = words_len.className +"_little";
	}
  }
  else
  {
      if( str.length >=20 )
	{
		words_len.className = words_len.className +"_little";
	}
  }
}

var full_rules_str="<%tcWebApi_multilingual("1","full_rules_str")%>";
var invalid_start_end_port_str="<%tcWebApi_multilingual("1","invalid_start_end_port_str")%>";
var invalid_start_port_str="<%tcWebApi_multilingual("1","invalid_start_port_str")%>";
var invalid_end_port_str="<%tcWebApi_multilingual("1","invalid_end_port_str")%>";
var invalid_end_port_1_str="<%tcWebApi_multilingual("1","invalid_end_port_1_str")%>";
var invalid_service_name_str="<%tcWebApi_multilingual("1","invalid_service_name_str")%>";
var duplicate_service_name_str="<%tcWebApi_multilingual("1","duplicate_service_name_str")%>";
var invalid_ip_str="<%tcWebApi_multilingual("1","invalid_ip_str")%>";
var same_as_lanip_str="<%tcWebApi_multilingual("1","same_as_lanip_str")%>";
</script>

<input type="hidden" name="tmp_ftp_port" value="2121">
<input type="hidden" name="select_edit">
<input type="hidden" name="select_del">
<input type="hidden" name="hidden_service_name">
<input type="hidden" name="hidden_protocol">
<input type="hidden" name="hidden_external_portstart"><!-- fix bug 21344 change forwarding page -->
<input type="hidden" name="hidden_external_portend">
<input type="hidden" name="hidden_internal_portstart">
<input type="hidden" name="hidden_internal_portend">
<input type="hidden" name="service_ip">
<input type="hidden" name="serflag">
<input type="hidden" name="real_select">
<input type="hidden" name="hidden_same_range" value="1"><!-- to fix bug 25114 -->

<INPUT type="HIDDEN" name="nextEntry">
<INPUT type="HIDDEN" name="sumEntry">
<INPUT type="hidden" name="PortForward_CanUseNum" value="20">
<INPUT type="HIDDEN" name="NAT_PVC" value="10">
<INPUT type="hidden" name="PortForwarding_SubmitFlag" >
<input type="hidden" name="edit_name">
<input type="hidden" name="edit_ip">
<input type="hidden" name="edit_esport">
<input type="hidden" name="edit_eeport">
<input type="hidden" name="edit_protocol">
<input type="hidden" name="edit_isport">
<input type="hidden" name="edit_ieport">
<input type="hidden" name="del_flag">
<input type="hidden" name="service_add_flag">
<input type="hidden" name="select_entry_num">
<INPUT type="HIDDEN" name="origin_pvc" value="<%if TCWebAPI_get("WebCurSet_Entry", "nat_pvc", "h") <> "N/A" then TCWebAPI_staticGet("WebCurSet_Entry", "nat_pvc", "s") end if %>">
<input type="hidden" name="lanip_address" value="<%If tcWebApi_get("Lan_Entry","IP","h") <> "N/A" then tcWebApi_get("Lan_Entry","IP","s") end if%>">
<input type="hidden" name="Prefix_IP">
<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_FW_forward','select')">
	<B><%tcWebApi_multilingual("1","select_service_type_str")%></B>
	
	</A></TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="serv_type" id="serv_type" checked value="pf"><%tcWebApi_multilingual("1","portforward_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="serv_type" id="serv_type" value="pt" onclick="doPortChange(1)"><%tcWebApi_multilingual("1","porttrigger_str")%>
	</TD>
</TR>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_FW_forward','setup')">
	<B><%tcWebApi_multilingual("1","service_name_str")%></B>
	</A></TD>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_FW_forward','setup')">
	<B><%tcWebApi_multilingual("1","service_ip_str")%></B>
	</A></TD>	
</TR>
<TR>
	<TD nowrap>
	<select name="svs_gm" id="svs_gm" size="1">
	<option value="FTP"><%tcWebApi_multilingual("1","service_ftp_str")%></option>
	<option value="HTTP"><%tcWebApi_multilingual("1","service_http_str")%></option>
	<option value="ICUII"><%tcWebApi_multilingual("1","service_icuii_str")%></option>
	<option value="IP_Phone"><%tcWebApi_multilingual("1","service_ipphone_str")%></option>
	<option value="NetMeeting"><%tcWebApi_multilingual("1","service_netmeeting_str")%></option>
	<option value="News"><%tcWebApi_multilingual("1","service_news_str")%></option>
	<option value="PPTP"><%tcWebApi_multilingual("1","service_pptp_str")%></option>
	<option value="QuakeII/III"><%tcWebApi_multilingual("1","service_quake_str")%></option>
	<option value="Real-Audio"><%tcWebApi_multilingual("1","service_realaudio_str")%></option>
	<option value="Telnet"><%tcWebApi_multilingual("1","service_telnet_str")%></option>
	
	</select>
	</TD>
	<TD nowrap>
	<input type="text" name="SV_IP1" id="server_ipaddress1" size="3" autocomplete="off" maxlength="3" readonly onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="SV_IP2" id="server_ipaddress2" size="3" autocomplete="off" maxlength="3" readonly onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="SV_IP3" id="server_ipaddress3" size="3" autocomplete="off" maxlength="3" readonly onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="SV_IP4" id="server_ipaddress4" size="3" autocomplete="off" maxlength="3"  onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	<input class="add_bt"  type="submit" name="Add" id="server_add" value="<%tcWebApi_multilingual("0","glbstr_add")%>" onClick="return Check_add(document.forms[0]);">
	</TD>
</TR>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2>
	<TABLE name="PortForwarding" id="pf_record" class="tables" cellpadding="6" cellspacing="0" width="100%">
	<TR class=table_header >
		<TD nowrap align=center width="6%">&nbsp;	 	</TD>
		<TD nowrap align=center width="6%"><span class="subhead"># </span></TD>
		<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","service_name_str")%></span></TD>
		<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","ES_port_str")%></span></TD>
		<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","EE_port_str")%></span></TD>
		<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","IS_port_str")%></span></TD>
		<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","IE_port_str")%></span></TD>
		<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","internal_ip_str")%></span></TD>
		
		
	</TR>
		<script>
var array_num=1;

for(var i=0;i<table_Data.length;i++)
{
	check_tmp = "";
	if(table_Data[i][2]=="N/A")
		continue;
		
	
	document.write('<TR><TD nowrap align=center><input type="radio" name="RouteSelect" id="inbound_select" value="'+i+'"></TD><TD nowrap align=center><span class="subhead">'+array_num+'</span></TD><TD nowrap align=center>'+table_Data[i][1]+'</TD><TD nowrap align=center>'+table_Data[i][2]+'</TD><TD nowrap align=center>'+table_Data[i][3]+'</TD><TD nowrap align=center>'+table_Data[i][4]+'</TD><TD nowrap align=center>'+table_Data[i][5]+'</TD><TD nowrap align=center>'+table_Data[i][7]+'</TD></TR>');
	
	array_num++;
}
		</script>
	</TABLE>
	</TD>
</TR>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2 align=center>
	<input class="edit_bt" id=edit type="submit" name="Edit Service" id="inbound_edit" value="<%tcWebApi_multilingual("1","edit_service_str")%>" onClick="return check_forwarding_edit(document.forms[0]);">
	<input class="delete_bt" id=delete type="submit" name="Delete Service" id="inbound_delete" value="<%tcWebApi_multilingual("1","del_service_str")%>" onClick="return check_forwarding_del(document.forms[0]);">
	
	<BR><BR>
	<script>
	var edit_service_str="<%tcWebApi_multilingual("1","edit_service_str")%>";
	var del_service_str="<%tcWebApi_multilingual("1","del_service_str")%>";
	var add_service_str="<%tcWebApi_multilingual("1","add_service_str")%>";

	document.write('<input class="long_add_bt" id=add_long  type="submit" name="Add Custom Service" id="inbound_add" value="<%tcWebApi_multilingual("1","add_service_str")%>" onClick="check_maxNumAdd(document.forms[0],document.forms[0].sumEntry.value,20,\'<%tcWebApi_multilingual("1","the_router_can_support_20_str")%>\',\'forwarding_add.asp\');return false;">');
	setButtonClass(edit_service_str,"edit");
	setButtonClass(del_service_str,"delete");
	setButtonClass(add_service_str,"add_long");
	</script>
	</TD>
</TR>  
</TABLE>
</div>
<%tcWebApi_multilingual("2","_FW_forward_help.asp")%>
</FORM>
<script>show_servip();</script>
</BODY>
</HTML>
