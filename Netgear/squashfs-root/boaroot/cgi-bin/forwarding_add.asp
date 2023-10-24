
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/forwarding.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="forwarding_add">

<div class="page_title"><%tcWebApi_multilingual("1","custom_service_str")%></div>

<div class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
			<input class="cancel_bt" type="button" name="Cancel" id="cancel" value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick=location.href="forwarding.asp";>&nbsp;&nbsp;
			<input class="apply_bt" type="submit" name="Apply" id="apply" value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick="return check_forwarding_add(document.forms[0])">
        </TD>
</TR>
</TABLE>

</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>


<script>
var alert_invalid_port_used_str="<%tcWebApi_multilingual("0","invalid_port_used_str")%>";

var upnp_list="<%tcWebApi_get("Upnpd_Entry","DATA","s")%>";

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
	var cf=document.forms[0];
	var addr_array = new Array();
	addr_array = lan_ip.split('.');
	cf.Prefix_IP.value = addr_array[0]+'.'+addr_array[1]+'.'+addr_array[2]+'.0/24';
	nextEntry();
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

function check_list_length(forward_num)
{
	var flag1720=0;
	for(i=1;i<=forward_num;i++)
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

var lan_ip="<%tcWebApi_get("Lan_Entry","IP","s")%>";
var lan_subnet="<%tcWebApi_get("Lan_Entry","netmask","s")%>";
var endis_remote='<%if TCWebAPI_get("RemoteManager_Entry", "Activate", "h") <> "Yes" then asp_Write("0") else asp_Write("1") end if %>';
var endis_upnp='<%if TCWebAPI_get("Upnpd_Entry", "Active", "h") <> "Yes" then asp_Write("0") else asp_Write("1") end if %>';
var remote_port="<%if TCWebAPI_get("RemoteManager_Entry", "Port", "h") <> "N/A" then TCWebAPI_staticGet("RemoteManager_Entry", "Port", "s") else asp_Write("8443") end if %>";

function check_port(cf)
{
	// check port	
	if(cf.port_start.value==""||cf.port_end.value==""||cf.internal_port_start.value==""||cf.internal_port_end.value=="")
	{
		alert(invalid_start_end_port_str);
		return false;
	}
	txt=parseInt(cf.port_start.value,10);
	if( isNaN(txt) )
	{
		alert(invalid_start_port_str);
		return false;
	}
	cf.port_start.value=txt;
	txt=parseInt(cf.port_end.value,10);
	if(isNaN(txt))
	{
		alert(invalid_end_port_str);
		return false;
	}
	cf.port_end.value=txt;
	txt=parseInt(cf.internal_port_start.value,10);
	if( isNaN(txt) )
	{
		alert(invalid_start_port_str);
		return false;
	}
	cf.internal_port_start.value=txt;
	txt=parseInt(cf.internal_port_end.value,10);
	if(isNaN(txt))
	{
		alert(invalid_end_port_str);
		return false;
	}
	cf.internal_port_end.value=txt;
	if(parseInt(cf.port_start.value)<1||parseInt(cf.port_start.value)>65534||parseInt(cf.internal_port_start.value)<1||parseInt(cf.internal_port_start.value)>65534)
	{
		alert(invalid_start_port_str);
		return false;
	}
	if(parseInt(cf.port_end.value)<1||parseInt(cf.port_end.value)>65534||parseInt(cf.internal_port_end.value)<1||parseInt(cf.internal_port_end.value)>65534)
	{
		alert(invalid_end_port_str);
		return false;
	}
	if(parseInt(cf.port_end.value)<parseInt(cf.port_start.value) || parseInt(cf.internal_port_end.value)<parseInt(cf.internal_port_start.value))
	{
		alert(invalid_end_port_1_str);
		return false;
	}
	cf.port_start.value=port_range_interception(cf.port_start.value);
	cf.port_end.value=port_range_interception(cf.port_end.value);
	cf.internal_port_start.value=port_range_interception(cf.internal_port_start.value);
	cf.internal_port_end.value=port_range_interception(cf.internal_port_end.value);
	return true;
}

function check_forwarding_add(cf,flag)
{
  cf.internal_port_end.value = parseInt(cf.internal_port_start.value)+(parseInt(cf.port_end.value)-parseInt(cf.port_start.value));

	if(cf.same_range.checked == true){
		cf.hidden_port_range.value ="1";
		cf.hidden_port_int_start.value = port_range_interception(cf.port_start.value);
		cf.hidden_port_int_end.value = port_range_interception(cf.port_end.value);
	}
	else
	{
		cf.hidden_port_range.value ="0";
		cf.hidden_port_int_start.value = port_range_interception(cf.internal_port_start.value);
		cf.hidden_port_int_end.value = port_range_interception(cf.internal_port_end.value);
	}
	cf.serflag.value=0;
	if ( check_list_length(cf.sumEntry.value) == false)
		return false;
	txt=cf.portname.value;
	if(txt=="")
	{
		alert(invalid_service_name_str);
		return false;
	}
	for(i=0;i<cf.portname.value.length;i++)
	{
		if(isValidChar_space(cf.portname.value.charCodeAt(i))==false)
		{
			alert(invalid_service_name_str);
			return false;
		}
	}
	//cf.portname.value=cf.portname.value.replace(/ /g, "&harr;");	
	for(i=0;i<cf.PortForward_CanUseNum.value;i++)
	{
		
			if(table_Data[i][1]==cf.portname.value)
			{
				alert(duplicate_service_name_str);
				return false;
			}
		
	}
	if(check_port(cf)==false)
		return false;
	cf.service_ip.value=cf.server_ip1.value+'.'+cf.server_ip2.value+'.'+cf.server_ip3.value+'.'+cf.server_ip4.value;		
	if(checkipaddr(cf.service_ip.value)==false || is_sub_or_broad(cf.service_ip.value, lan_ip, lan_subnet) == false)
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
	
	
	var input_ext_start_port=cf.port_start.value;
	var input_ext_end_port=cf.port_end.value;
	var input_int_start_port=cf.inter_start.value;
	var input_int_end_port=cf.internal_port_end.value;
	var input_sertype=cf.srvtype.value;
	var input_ip=cf.service_ip.value;
	var forwarding_ip="";
	//port_forwarding
	var forward_array_num = 20;
	var trigger_array_num = 20;
	var upnp_array_num = <%TCWebAPI_get("Upnpd_Entry", "Rule_number", "s")%>;

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
		if(input_sertype=="UDP") 
		{
			if (!(parseInt(ext_endport)<parseInt(input_ext_start_port)||parseInt(input_ext_end_port)<parseInt(ext_startport)) || !(parseInt(int_endport)<parseInt(input_int_start_port)||parseInt(input_int_end_port)<parseInt(int_startport)))
 				{
					if ( (sertype == "TCP/UDP" || sertype == "UDP") && forwarding_ip==input_ip )
					{
						alert(alert_invalid_port_used_str);
						return false;
					}
				}
		}
		else if (input_sertype=="TCP/UDP")
		{
				if (!(parseInt(ext_endport)<parseInt(input_ext_start_port)||parseInt(input_ext_end_port)<parseInt(ext_startport)) || !(parseInt(int_endport)<parseInt(input_int_start_port)||parseInt(input_int_end_port)<parseInt(int_startport)))
 				{
					if ( (sertype == "TCP/UDP" || sertype == "TCP" || sertype == "UDP") && forwarding_ip==input_ip )
					{
						alert(alert_invalid_port_used_str);
						return false;
					}
				}	
		}
		else if (input_sertype=="TCP")
		{
				if (!(parseInt(ext_endport)<parseInt(input_ext_start_port)||parseInt(input_ext_end_port)<parseInt(ext_startport)) || !(parseInt(int_endport)<parseInt(input_int_start_port)||parseInt(input_int_end_port)<parseInt(int_startport)))
 				{
					if ( (sertype == "TCP/UDP" || sertype == "TCP") && forwarding_ip==input_ip )
					{
						alert(alert_invalid_port_used_str);
						return false;
					}
				}	
		}
	}	

	//port_triggering	
	for(i=0;i<trigger_array_num;i++)
	{
		triggeringip=table_Data_trigger[i][7];
		consertype=table_Data_trigger[i][4];
		constart_port=table_Data_trigger[i][5];	
		conend_port=table_Data_trigger[i][6];	
		if( table_Data_trigger[i][1] == "N/A" )
                    continue;

		if (!(parseInt(conend_port)<parseInt(input_ext_start_port)||parseInt(input_ext_end_port)<parseInt(constart_port) ) || !(parseInt(conend_port)<parseInt(input_int_start_port)||parseInt(input_int_end_port)<parseInt(constart_port) ))
 		{
			if ( (consertype == "TCP/UDP" || input_sertype == "TCP/UDP" || input_sertype == consertype) && (triggeringip != "any" && input_ip != triggeringip ))
			{
				alert(alert_invalid_port_used_str);
				return false;
			}
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
			upnp_protocal=each_info[1];
			upnp_int=each_info[2];
			upnp_ext=each_info[3];
			upnp_ip=each_info[4];
			if (!( parseInt(upnp_ext)<parseInt(input_ext_start_port) || parseInt(input_ext_end_port)<parseInt(upnp_int) ) || !( parseInt(upnp_ext)<parseInt(input_int_start_port) || parseInt(input_int_end_port)<parseInt(upnp_int) ))
			{
				if ( (upnp_protocal == "TCP/UDP" || input_sertype == "TCP/UDP" || input_sertype == upnp_protocal) && input_ip != upnp_ip )
				{

					alert(alert_invalid_port_used_str);
					return false;
				}
			}
		}
	}

	//check USB ready share port, only use TCP
	if( usb_router_flag == 1)
	{
		if(input_sertype != "UDP")
		{
			if(check_readyshare_port(input_ext_start_port, input_ext_end_port, "WAN") == false || check_readyshare_port(input_int_start_port, input_int_end_port, "WAN") == false)
			{
				alert(alert_invalid_port_used_str);
				return false;
			}
		}
	}

	//check with remote, only use TCP
	if(endis_remote=="1" && cf.srvtype.value != "UDP" ) //15873: remote only use TCP 
	{
		if ((!(parseInt(remote_port)<parseInt(input_ext_start_port)||parseInt(input_ext_end_port)<parseInt(remote_port)) && remote_port!="") || (!(parseInt(remote_port)<parseInt(input_int_start_port)||parseInt(input_int_end_port)<parseInt(remote_port)) && remote_port!=""))
 		{
			alert(alert_invalid_port_used_str);
			return false;
		}		
	}
	//enable ntp, only use UDP
	if( (parseInt(input_ext_start_port)<=123 && parseInt(input_ext_end_port)>=123 && endis_ntp == "1" && cf.srvtype.value != "TCP") || (parseInt(input_int_start_port)<=123 && parseInt(input_int_end_port)>=123 && endis_ntp == "1" && cf.srvtype.value != "TCP"))
	{
		alert(alert_invalid_port_used_str);
		return false;
	}
	//enable upnp, only use UDP
	if((parseInt(input_ext_start_port)<=1900 && parseInt(input_ext_end_port)>=1900 && endis_upnp == "1" && cf.srvtype.value != "TCP") || (parseInt(input_int_start_port)<=1900 && parseInt(input_int_end_port)>=1900 && endis_upnp == "1" && cf.srvtype.value != "TCP"))
	{
		alert(alert_invalid_port_used_str);
		return false;
	}
/*
	//enable bigpond   15873: bigpond only use UDP
	if( (parseInt(input_ext_start_port)<=5050 && parseInt(input_ext_end_port)>=5050 && info_get_wanproto == "bigpond" && cf.srvtype.value != "TCP") || (parseInt(input_int_start_port)<=5050 && parseInt(input_int_end_port)>=5050 && info_get_wanproto == "bigpond" && cf.srvtype.value != "TCP"))
 	{
		alert(invalid_port_used);
		return false;
	}

	if (cf.srvtype.value=="TCP"||cf.srvtype.value=="TCP/UDP")
        {
				if ((parseInt(cf.port_end.value)>="1720"&&parseInt(cf.port_start.value)<="1720") || (parseInt(cf.internal_port_end.value)>="1720"&&parseInt(cf.inter_start.value)<="1720"))
                        cf.serflag.value=1;
                else
                        cf.serflag.value=0;
        }
	*/
	cf.add_flag.value = 1;
	cf.select_entry_num.value = cf.nextEntry.value;
	cf.PortForwarding_SubmitFlag.value = 1;
	cf.submit();
	return true;
}

function int_port_value()
{
	var cf=document.forms[0];
	if(cf.same_range.checked == true){
		cf.internal_port_start.value = cf.port_start.value;
		cf.internal_port_end.value = cf.port_end.value;
	}
	else{
		if(_isNumeric(cf.internal_port_start.value) && cf.internal_port_start.value != "")
			cf.internal_port_end.value = (cf.internal_port_start.value*1)+((cf.port_end.value-cf.port_start.value)*1);
		else
			cf.internal_port_end.value = "";
	}
}



/* to fix bug 25114
var port_flag="";
function loadvalue()//fix bug 21344 change forwarding page
{
	var cf=document.forms[0];
	if(port_flag == "1"){
		cf.same_range.checked = true;
		cf.inter_start.disabled = true;
		cf.internal_port_end.disabled = true;
	}
	else{
		cf.same_range.checked = false;
		cf.inter_start.disabled = false;
		cf.internal_port_end.disabled = false;
	}
}*/
function portrange_value()
{
	var cf=document.forms[0];
	if(cf.same_range.checked == true){
		cf.internal_port_start.disabled = true;
		cf.internal_port_end.disabled = true;
		document.getElementById("inter_start").style.color="grey";
		document.getElementById("inter_end").style.color="grey";
	}
	else{
		cf.internal_port_start.disabled = false;
		cf.internal_port_end.disabled = false;
		document.getElementById("inter_start").style.color="black";
		document.getElementById("inter_end").style.color="black";
	}
	int_port_value();
}

var forward_array_num=0;

var trigger_array_num=0;

var upnp_array_num=0;


var is_ftp = 1;

var show_enableHTTP="0";
var show_enableHvia="1";
var show_HTTP_via_port="80";
var show_enableFTP="<%if tcWebApi_get("Ftp_Entry","LanAccess","h") = "Yes" then asp_write("1") else asp_write("0") end if%>";
var show_enableFvia="<%if tcWebApi_get("Ftp_Entry","WanAccess","h") = "Yes" then asp_write("1") else asp_write("0") end if%>";
var show_FTP_via_port="<%if tcWebApi_get("Ftp_Entry","WanPort","h") <> "N/A" then tcWebApi_get("Ftp_Entry","WanPort","s") else asp_write("21") end if%>";
var usb_router_flag=parent.usb_router_flag;

var attach_device_list="<%tcWebApi_showFile("/var/netscan_lists")%>";
var attach_array=attach_device_list.split(' @#$&*! ');
var attach_array_len=0;//init
var attach_ip_array = new Array();
var attach_mac_array = new Array();
var attach_name_array = new Array();
var p=0;
 
var attach_dev_num=0



var deviceIP_name_num=0

 
if(attach_device_list != "")
{
	attach_array_len = attach_array.length -1;
	for(i=0;i<attach_array_len;i++)
	{
		var each_info=attach_array[i].split(' ');
		if(each_info.length>2)
		{
			attach_ip_array[p]=each_info[0];
			attach_mac_array[p]=each_info[1];
			if (each_info[2].length>0)
			{
				 attach_name_array[p]=each_info[2];
			}
			else
			{
				attach_name_array[p]="----";
			}
		}
		else
		{
			
			attach_ip_array[p]=each_info[0];
			attach_mac_array[p]=each_info[1];
			attach_name_array[p]="----";
			
		}
		if(attach_ip_array[p] == "<unknown>")
		{
			attach_ip_array[p]="&lt;Unknown&gt;"
		}
		if(attach_mac_array[p] == "<unknown>")
		{
			attach_mac_array[p]="&lt;Unknown&gt;"
		}
 
		if(attach_name_array[p] == "<unknown>" || attach_name_array[p] == "&lt;unknown&gt;" || attach_name_array[p] == "----" )
		{
			for( t=0; t<deviceIP_name_num; t++)
			{
				var dev_name = eval ( 'deviceIP_name' + t );
				var dev_name_array = dev_name.split(' ');
				if( attach_ip_array[p] == dev_name_array[0] )
				{
					attach_name_array[p] = dev_name_array[1];
				}
			}
		}
 
		//if( attach_mac_array[p].toUpperCase() == "".toUpperCase().replace(/-/g,":")&& (attach_name_array[p] == "<unknown>" || attach_name_array[p] == "&lt;unknown&gt;" || attach_name_array[p] == "----" ) )
		//{
		//	attach_name_array[p] = "";
		//}
 
		if(attach_name_array[p] == "<unknown>") 
		{
			attach_name_array[p]="&lt;Unknown&gt;"
		}
		p++;
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

<input type="hidden" name="serflag">
<input type="hidden" name="service_ip">
<input type="hidden" name="hidden_portname">
<input type="hidden" name="hidden_port_range">
<input type="hidden" name="hidden_port_int_start">
<input type="hidden" name="hidden_port_int_end">

<INPUT type="HIDDEN" name="nextEntry">
<INPUT type="HIDDEN" name="sumEntry">
<INPUT type="hidden" name="PortForward_CanUseNum" value="20">
<INPUT TYPE="HIDDEN" NAME="editnum">
<input type="hidden" name="select_entry_num">
<INPUT type="HIDDEN" name="NAT_PVC" value="10">
<INPUT type="HIDDEN" name="origin_pvc" value="<%if TCWebAPI_get("WebCurSet_Entry", "nat_pvc", "h") <> "N/A" then TCWebAPI_staticGet("WebCurSet_Entry", "nat_pvc", "s") end if %>">
<INPUT type="hidden" name="PortForwarding_SubmitFlag" >
<input type="hidden" name="add_flag">
<input type="hidden" name="lanip_address" value="<%If tcWebApi_get("Lan_Entry","IP","h") <> "N/A" then tcWebApi_get("Lan_Entry","IP","s") end if%>">
<input type="hidden" name="Prefix_IP">

<TR>
	<TD nowrap><%tcWebApi_multilingual("1","service_name_str")%></TD>
	<TD nowrap>
	<input type="text" name="portname" id="port_name" size="20" maxlength="30">
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","protocol_str")%></TD>
	<TD nowrap> 
	<select NAME="srvtype" id="srvtype" size="1" >
		<option value="TCP/UDP" selected><%tcWebApi_multilingual("1","tcp_udp_str")%></option>
		<option value="TCP" selected><%tcWebApi_multilingual("1","tcp_str")%></option>
		<option value="UDP" selected><%tcWebApi_multilingual("1","udp_str")%></option>
		
		
	</select>
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","ES_port_str")%></TD>

	<TD nowrap>
	<input type="text" name="port_start" id="port_start" size="7" maxlength="5" onMouseOut="int_port_value()" onKeyUp="int_port_value()" onKeyPress="return getkey('num', event)">(1~65534)
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","EE_port_str")%></TD>

	<TD nowrap>
	<input type="text" name="port_end" id="port_end" size="7" maxlength="5" onMouseOut="int_port_value()" onKeyUp="int_port_value()" onKeyPress="return getkey('num', event)">(1~65534)
	</TD>
</TR>
<TR>
	<TD nowrap>
	<input type="checkbox" name="same_range" id="same_range" value="same_range" checked onClick="portrange_value()"><%tcWebApi_multilingual("1","same_port_range_str")%>
	</TD>
</TR>
<!--TR id="inter_start"-->
<TR >
	<TD nowrap><%tcWebApi_multilingual("1","IS_port_str")%></TD>
	
	<TD  nowrap>
	<input id="inter_start" type="text" name="internal_port_start" id="inter_start" size="7" maxlength="5" onKeyPress="return getkey('num', event)" onMouseOut="int_port_value()" onKeyUp="int_port_value()" disabled="disabled">(1~65534)
	</TD>
</TR>
<TR >
	<TD nowrap><%tcWebApi_multilingual("1","IE_port_str")%></TD>

	<TD  nowrap>
	<input id="inter_end" type="text" name="internal_port_end" readonly size="7" maxlength="5" style="border:none" onKeyPress="return getkey('num', event)" disabled="disabled">
 	</TD>
</TR>
<script>
document.getElementById("inter_start").style.color="grey";
document.getElementById("inter_end").style.color="grey";
</script>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","internal_ip_str")%></TD>
	
	<TD nowrap>
	<input type="text" name="server_ip1" id="server_ip1" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="server_ip2" id="server_ip2" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="server_ip3" id="server_ip3" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="server_ip4" id="server_ip4" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD>
</TR>
<TR>
<TD></TD>
<TD nowrap><B><%tcWebApi_multilingual("1","sel_curr_device_str")%></B></TD>

</TR>
<TR>
<TD></TD>
<TD nowrap colspan=2>
	<TABLE id="AttachedDevice" border=1 cellpadding=2 cellspacing=0 width=100%>
	<TR>
		<TD nowrap align=center><span class="subhead"> &nbsp; </span></TD>
		<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","ip_str")%></span></TD>
		<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","device_name_str")%></span></TD>
	</TR>
<script>
var num = 0;
	for(i=0;i<attach_array_len;i++)	
	{
		document.write('<TR><TD nowrap align=center><input type="radio" name="ipSelect" id="mac_select" value="'+num+'" onclick="ipaddr_value()"></TD><TD nowrap align=center>'+attach_ip_array[i]+'</TD><TD nowrap align=center>'+attach_name_array[i]+'</TD></TR>');
		num = num +1;
	}
function ipaddr_value()
{
	var cf=document.forms[0];
	var select_num;
	if(attach_array_len == 1)
 	{
		if(cf.ipSelect.checked == true )
		{
			select_num=parseInt(cf.ipSelect.value);
			var ipaddr_array=attach_ip_array[select_num].split('.');
			cf.server_ip1.value=ipaddr_array[0];
			cf.server_ip2.value=ipaddr_array[1];
			cf.server_ip3.value=ipaddr_array[2];
			cf.server_ip4.value=ipaddr_array[3];
		}
	}else
	{
		for(i=0;i<attach_array_len;i++)
		{
			if(cf.ipSelect[i].checked == true )
			{
				select_num=parseInt(cf.ipSelect[i].value);
				var ipaddr_array=attach_ip_array[select_num].split('.');
				cf.server_ip1.value=ipaddr_array[0];
				cf.server_ip2.value=ipaddr_array[1];
				cf.server_ip3.value=ipaddr_array[2];
				cf.server_ip4.value=ipaddr_array[3];
			}
		}
	}
}
</script>
</TABLE>
</TD>
</TR>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
</TABLE>
<script>
var lan_ip="<%tcWebApi_get("Lan_Entry","IP","s")%>";
var lan_subnet="<%tcWebApi_get("Lan_Entry","netmask","s")%>";
var remote_port="8443";
var endis_ntp="1";
var endis_upnp="1";
var info_get_wanproto="dhcp";
var lanip_array = lan_ip.split(".");
var endis_remote="0";
cf=document.forms[0];
cf.server_ip1.value=lanip_array[0];
cf.server_ip2.value=lanip_array[1];
cf.server_ip3.value=lanip_array[2];
</script>

</div>
<%tcWebApi_multilingual("2","_FW_forward_help.asp")%>
</FORM>
</BODY>
</HTML>
