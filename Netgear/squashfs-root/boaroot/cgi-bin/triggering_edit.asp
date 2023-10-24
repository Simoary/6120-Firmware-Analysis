
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/triggering.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="triggering_edit">
<input type=hidden name=edit_name value="edit">

<div class="page_title"></div>
<div class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
			<input class="cancel_bt" type="button" name="Cancel" id="cancel" value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick=location.href="triggering.asp";>&nbsp;&nbsp;
			<input class="apply_bt" type="submit" name="Apply" id="apply" value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick="return doSave()">
	
        </TD>
</TR>
</TABLE>
</div>
<div id="main" class="main_top_button">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1><%tcWebApi_multilingual("1","trigger_add_title_str")%></h1></td></tr>






<script>
var alert_invalid_port_used_str="<%tcWebApi_multilingual("0","invalid_port_used_str")%>";

var upnp_list="<%tcWebApi_get("Upnpd_Entry","DATA","s")%>";
var url=window.location.toString();
var is_ftp = 1;

var show_enableHTTP="0";
var show_enableHvia="1";
var show_HTTP_via_port="80";
var show_enableFTP="<%if tcWebApi_get("Ftp_Entry","LanAccess","h") = "Yes" then asp_write("1") else asp_write("0") end if%>";
var show_enableFvia="<%if tcWebApi_get("Ftp_Entry","WanAccess","h") = "Yes" then asp_write("1") else asp_write("0") end if%>";
var show_FTP_via_port="<%if tcWebApi_get("Ftp_Entry","WanPort","h") <> "N/A" then tcWebApi_get("Ftp_Entry","WanPort","s") else asp_write("21") end if%>";
var usb_router_flag=parent.usb_router_flag;
var edit_parameter= url.split("?")[1].split("=")[1].split(";");
var select_editnum=edit_parameter[0];

var lan_ip="<%If tcWebApi_staticGet("Info_Ether","ip","h") <> "N/A" Then tcWebApi_staticGet("Info_Ether","ip","s") end if%>";
var lan_subnet="<%If tcWebApi_get("Lan_Entry","netmask","h") <> "N/A" then tcWebApi_get("Lan_Entry","netmask","s") end if%>";
var endis_remote='<%if TCWebAPI_get("RemoteManager_Entry", "Activate", "h") <> "Yes" then asp_Write("0") else asp_Write("1") end if %>';
var endis_upnp='<%if TCWebAPI_get("Upnpd_Entry", "Active", "h") <> "Yes" then asp_Write("0") else asp_Write("1") end if %>';
var remote_port="<%if TCWebAPI_get("RemoteManager_Entry", "Port", "h") <> "N/A" then TCWebAPI_staticGet("RemoteManager_Entry", "Port", "s") else asp_Write("8443") end if %>";


var table_Data = [
["<%tcwebApi_staticGet("portTriggering_Entry0","Name","s")%>"],
["<%tcwebApi_staticGet("portTriggering_Entry1","Name","s")%>"],
["<%tcwebApi_staticGet("portTriggering_Entry2","Name","s")%>"],
["<%tcwebApi_staticGet("portTriggering_Entry3","Name","s")%>"],
["<%tcwebApi_staticGet("portTriggering_Entry4","Name","s")%>"],
["<%tcwebApi_staticGet("portTriggering_Entry5","Name","s")%>"],
["<%tcwebApi_staticGet("portTriggering_Entry6","Name","s")%>"],
["<%tcwebApi_staticGet("portTriggering_Entry7","Name","s")%>"],
["<%tcwebApi_staticGet("portTriggering_Entry8","Name","s")%>"],
["<%tcwebApi_staticGet("portTriggering_Entry9","Name","s")%>"],
["<%tcwebApi_staticGet("portTriggering_Entry10","Name","s")%>"],
["<%tcwebApi_staticGet("portTriggering_Entry11","Name","s")%>"],
["<%tcwebApi_staticGet("portTriggering_Entry12","Name","s")%>"],
["<%tcwebApi_staticGet("portTriggering_Entry13","Name","s")%>"],
["<%tcwebApi_staticGet("portTriggering_Entry14","Name","s")%>"],
["<%tcwebApi_staticGet("portTriggering_Entry15","Name","s")%>"],
["<%tcwebApi_staticGet("portTriggering_Entry16","Name","s")%>"],
["<%tcwebApi_staticGet("portTriggering_Entry17","Name","s")%>"],
["<%tcwebApi_staticGet("portTriggering_Entry18","Name","s")%>"],
["<%tcwebApi_staticGet("portTriggering_Entry19","Name","s")%>"]
];

/* [Number, Name, STARTPORT, ENDPORT, LOCAL_SPORT, LOCAL_EPORT, PROTOCOL, LOCALIP] */
var table_Data_forward = [
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



//var forward_array_num=0;

//var triggeringArray1="abc 0 any TCP 19182 TCP\/UDP 19182 19183 1";
//var trigger_array_num=1;

//var upnp_array_num=0;


//var is_ftp = 1;

//var show_enableHTTP="0";
//var show_enableHvia="1";
//var show_HTTP_via_port="80";
//var show_enableFTP="1";
//var show_enableFvia="1";
//var show_FTP_via_port="21";

//var endis_ntp="1";
//var endis_upnp="1";
//var select_editnum='1';
//var lan_ip="192.168.1.1";
//var lan_subnet="255.255.255.0";
//var remote_port="8443";
//var info_get_wanproto="dhcp";
//var endis_remote="0";
//var usb_router_flag=parent.usb_router_flag;

function loadvalue()
{
	
	
	var cf=document.forms[0];
	var src_ip_type;
	
	cf.select_entry_num.value = edit_parameter[0];
	cf.pt_name.value=edit_parameter[2];
	//cf.service_ip.value=each_info[2];
	cf.pt_type.value=edit_parameter[5];
	cf.pt_port.value=parseInt(edit_parameter[4]);
	cf.in_port_type.value=edit_parameter[8];
	cf.in_port_start.value=parseInt(edit_parameter[6]);
	cf.in_port_end.value=parseInt(edit_parameter[7]);
	//cf.endis_trigger.value=each_info[8];
	
	if(edit_parameter[3]== "any" )
	{
		src_ip_type="any";
	}
	else
	{
		src_ip_type="single";
	}
	//cf.src_ip_type.value=((edit_parameter[3]=="any") ? 'any':'single');
	if(src_ip_type!="any")
	{
		cf.service_ip.value = edit_parameter[3];
		var ip_array=edit_parameter[3].split('.');
		cf.src_ip1.value=ip_array[0];
		cf.src_ip2.value=ip_array[1];
		cf.src_ip3.value=ip_array[2];
		cf.src_ip4.value=ip_array[3];
		cf.src_ip_type.value="Single Address";		
	}
	
	setsrc(cf);
}

function doSave() 
{
	if (chkPortRange())
		return false;
	/*
	 if (chkRuleLimit())
	 {
		
	 	alert('<%tcWebApi_get("String_Entry","PortTriggerJS6Text","s")%>');
	 	return;
	 }	
	 */
	 /*  Service Name length limit is 30 */
	if (quotationCheck(document.forms[0].pt_name, 30) )
		return false;
	document.forms[0].edit_flag.value = 1;
	document.forms[0].PortTriggering_SubmitFlag.value = 1;
	document.forms[0].submit();
}
function quotationCheck(object, limit_len) 
{
	var len = object.value.length;
	var i;
	if(!len)
	{
		alert(sername_empty_str);
		return true;
	}

	for(var z=0; z < document.forms[0].PortTriggering_CanUseNumFlag.value; z++)
	{
		if(z==document.forms[0].select_entry_num.value)
			continue;
		if(object.value == table_Data[z][0])
		{
			alert(sername_duplicate_str);return true; 
		}
	}
	if (len > limit_len)
	{
		alert(sername_invalid_str);return true;
	}
	return false;
}
function checkPort(name, port)
{
	var msg = "";
	var portNum = parseInt(port,10);

	if (port.length == 0)
	{
		msg = name + " " + in_range_str;
		alert(msg);
		return false;
	}
	for(i=0;i<port.length;i++)
	{
		c=port.charAt(i);
		if("0123456789".indexOf(c,0)<0)
		{
			msg = invalid_str + name;
			alert(msg);			
			return false;
		}	
	}
	if (isNaN(portNum) || portNum < 1 || portNum > 65535)
	{
		msg = invalid_str + name + in_range_str;
		alert(msg);
		return false;
	}
	return true;
}

function chkPortRange()
{
	
		/*
		if(isNaN(document.forms[0].pt_port.value)|| 
		isNaN(document.forms[0].in_port_start.value)||
		isNaN(document.forms[0].in_port_end.value))
		{
			alert("<%tcWebApi_get("String_Entry","PortTriggerJS7Text","s")%>");return true;
		}		
	
		
		port1 = parseInt(document.forms[0].pt_port.value);
		port2 = parseInt(document.forms[0].in_port_start.value);
		port3 = parseInt(document.forms[0].in_port_end.value);
		
		
		if (port1 > 65535 || port1 < 1 || port2 > 65535 || port2 < 1 ||
		port3 > 65535 || port3 < 1 )
		{
			alert("Invalid Triggering Port, must be in the range 1-65535.");return true;
		}
		if ( port3 < port2)
		{
			alert("Invalid inbound connection port range.");return true;
		}
		*/
		var cf=document.forms[0];
		var type = cf.src_ip_type.selectedIndex;
		if (type == 0)
			cf.service_ip.value="any";
		else
		{
			cf.service_ip.value=cf.src_ip1.value+'.'+cf.src_ip2.value+'.'+cf.src_ip3.value+'.'+cf.src_ip4.value;
			if(checkipaddr(cf.service_ip.value)==false || is_sub_or_broad(cf.service_ip.value, lan_ip, lan_subnet) == false)
			{
				alert(invalid_ip_str);
				return true;
			}
			cf.service_ip.value = address_parseInt(cf.service_ip.value);
			if(isSameSubNet(cf.service_ip.value,lan_subnet,lan_ip,lan_subnet)== false)
			{
				alert(same_subnet_str);
				return true;
			}
			if(isSameIp(cf.service_ip.value,lan_ip) == true)
			{
				alert(invalid_ip_str);
				return true;
			} 
		}
		
		if(checkPort(str_pt_port, cf.pt_port.value)==false)
			return true;
		cf.pt_port.value=parseInt(cf.pt_port.value,10);
	/*	if(cf.pt_port.value == "21" )
		{
			alert("Triggering Port can not be 21!");
			return false;
		} */
			
		if(checkPort(in_port_start_str, cf.in_port_start.value)==false)
			return true;
		cf.in_port_start.value=parseInt(cf.in_port_start.value,10);

		if (cf.in_port_end.value.length > 0)
		{
			if(checkPort(in_port_end_str, cf.in_port_end.value)==false)
				return true;
			cf.in_port_end.value=parseInt(cf.in_port_end.value,10);
			if (parseInt(cf.in_port_end.value) < parseInt(cf.in_port_start.value))
			{//bug 23479:use parseInt to parsing string
				alert(inbound_prange_str);
				return true;
			}
		}
		if (cf.in_port_end.value.length == 0)
			cf.in_port_end.value = cf.in_port_start.value;

/* NAPT Check */
    var input_start_port=cf.in_port_start.value;
    var input_end_port=cf.in_port_end.value;
    var input_sertype=cf.in_port_type.value;
    //port_forwarding
    var forward_array_num = 20;
    var trigger_array_num = 20;
    var upnp_array_num = <%TCWebAPI_get("Upnpd_Entry", "Rule_number", "s")%>;

    for(i=0;i<forward_array_num;i++)
    {
        sertype=table_Data_forward[i][6];
        startport=table_Data_forward[i][2];
        endport=table_Data_forward[i][3];
        for(i=0;i<forward_array_num;i++)
        {
            sertype=table_Data_forward[i][6];
            startport=table_Data_forward[i][2];
            endport=table_Data_forward[i][3];
            serip=table_Data_forward[i][4];
            serflag=table_Data_forward[i][5];
            if( table_Data_forward[i][1] == "N/A" )
                continue;
	    //              if(sertype=="UDP"&&serflag=="1")
            if(sertype=="UDP")
            {
            }
            else if (!(parseInt(endport)<parseInt(input_start_port)||parseInt(input_end_port)<parseInt(startport)))
            {//bug 23479:same port and same ip, not need to pop warning message;same port and diff ip, need to pop warning message
                if (( sertype == "TCP/UDP" || input_sertype == "TCP/UDP" || input_sertype == sertype ) && ( cf.service_ip.value == "any" || cf.service_ip.value != serip ))
                {
                    alert(alert_invalid_port_used_str);
                    return true;
                }
            }
        }
    }
    //port_triggering
    var flag='edit';
    for(i=0;i<trigger_array_num;i++)
    {
        consertype=table_Data_trigger[i][4];
        constart_port=table_Data_trigger[i][5];
        conend_port=table_Data_trigger[i][6];
        if( table_Data_trigger[i][1] == "N/A" )
            continue;
	
        if (flag == 'edit')
        {
            if ((!(parseInt(conend_port)<parseInt(input_start_port)||parseInt(input_end_port)<parseInt(constart_port) ))&& select_editnum!=i)
            {
                if ( (consertype == "TCP/UDP" || input_sertype == "TCP/UDP" || input_sertype == consertype) && select_editnum != i )
                {
                    alert(alert_invalid_port_used_str);
                    return true;
                }
            }
        }
        else
        {
            if (!(parseInt(conend_port)<parseInt(input_start_port)||parseInt(input_end_port)<parseInt(constart_port) ))
            {
                if ( consertype == "TCP/UDP" || input_sertype == "TCP/UDP" || input_sertype == consertype )
                {
                    alert(alert_invalid_port_used_str);
                    return true;
                }
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
			if (!( parseInt(upnp_ext)<parseInt(input_start_port) || parseInt(input_end_port)<parseInt(upnp_int) ) && cf.service_ip.value != upnp_ip)
			{
				if ( upnp_protocal == "TCP/UDP" || input_sertype == "TCP/UDP" || input_sertype == upnp_protocal )
				{

					alert(alert_invalid_port_used_str);
					return true;
				}
			}
		}
	}
    
    //check USB ready share port, only use TCP
    if( usb_router_flag == 1)
    {
        if(input_sertype != "UDP")
        {
            if(check_readyshare_port(input_start_port, input_end_port, "WAN") == false)
            {
                alert(alert_invalid_port_used_str);
                return true;
            }
        }
    }
    
    //check with remote, only use TCP
    if(endis_remote=="1" && input_sertype != "UDP" ) //15873: remote only use TCP
        if (!(parseInt(remote_port)<parseInt(input_start_port)||parseInt(input_end_port)<parseInt(remote_port)) && remote_port!="")
        {
            alert(alert_invalid_port_used_str);
            return true;
        }
    //enable ntp, only use UDP
    if(parseInt(input_start_port)<=123 && parseInt(input_end_port)>=123 && endis_ntp == "1" && input_sertype != "TCP")
    {
        alert(alert_invalid_port_used_str);
        return true;
    }
    //enable upnp, only use UDP
    if(parseInt(input_start_port)<=1900 && parseInt(input_end_port)>=1900 && endis_upnp == "1" && input_sertype != "TCP")
    {
        alert(alert_invalid_port_used_str);
        return true;
    }
    /*
        //enable bigpond   15873: bigpond only use UDP
        if(parseInt(input_start_port)<=5050 && parseInt(input_end_port)>=5050 && info_get_wanproto == "bigpond" && input_sertype != "TCP")
        {
        alert(invalid_port_used);
        return true;
	}
    */
    
    
    return false;
}

function setsrc(cf)
{
	var type = cf.src_ip_type.selectedIndex;
	if (type == 1)
	{	
		cf.src_ip1.disabled = false;
		cf.src_ip2.disabled = false;
		cf.src_ip3.disabled = false;
		cf.src_ip4.disabled = false;
	}
	else
	{
		cf.src_ip1.disabled = true;
		cf.src_ip2.disabled = true;
		cf.src_ip3.disabled = true;
		cf.src_ip4.disabled = true;
	}
}
var str_pt_port="<%tcWebApi_multilingual("1","pt_port_str")%>";
var in_port_start_str="<%tcWebApi_multilingual("1","in_port_start_str")%>";
var in_port_end_str="<%tcWebApi_multilingual("1","in_port_end_str")%>";
var invalid_str="<%tcWebApi_multilingual("1","invalid_str")%>";
var in_range_str="<%tcWebApi_multilingual("1","in_range_str")%>";
var inbound_prange_str="<%tcWebApi_multilingual("1","inbound_prange_str")%>";
var invalid_ip_str="<%tcWebApi_multilingual("1","invalid_ip_str")%>";
var same_subnet_str="<%tcWebApi_multilingual("1","same_subnet_str")%>";
var sername_empty_str="<%tcWebApi_multilingual("1","sername_empty_str")%>";
var sername_duplicate_str="<%tcWebApi_multilingual("1","sername_duplicate_str")%>";
var sername_invalid_str="<%tcWebApi_multilingual("1","sername_invalid_str")%>";
</script>
<input type="hidden" name="service_ip">
<input type="hidden" name="endis_trigger">
<input type="hidden" name="hidden_pt_name">
<input type="hidden" name="select_entry_num">
<input type="hidden" name="hidden_timeout" value="<%If tcWebApi_get("portTriggering_Common", "timeout", "h") <>"N/A" then tcWebApi_get("portTriggering_Common", "timeout", "s") else asp_Write("20") end if%>">
<input type="hidden" name="disable_trigger_on" value="<%if TCWebAPI_get("portTriggering_setting", "Disable", "h") = "Yes" then TCWebAPI_staticGet("portTriggering_setting", "Disable", "s") else asp_Write("No") end if %>">
<INPUT type="hidden" name="PortTriggering_SubmitFlag" >
<input type="hidden" name="edit_flag">
<input type="hidden" name="active" value="Yes">
<INPUT type="hidden" name="PortTriggering_CanUseNumFlag" value="<%if TCWebAPI_get("portTriggering_setting", "canUseNum", "h") <> "N/A" then TCWebAPI_staticGet("portTriggering_setting", "canUseNum", "s") else asp_Write("20") end if %>">
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","service_name_str")%></TD>
	
	<TD nowrap>
	<input type="text" name="pt_name" id="pt_name" size="20" maxlength="30">
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","service_usr_str")%></TD>
	
	<TD nowrap> 
	<select name="src_ip_type" id="src_ip_type" onChange="setsrc(document.forms[0]);">
		<option value="Any"><%tcWebApi_multilingual("1","service_usr_1_str")%></option>
		<option value="Single Address"><%tcWebApi_multilingual("1","service_usr_2_str")%></option>
	</select>
	</TD>
</TR>
<TR>
	<TD nowrap> &nbsp;</TD>
	<TD nowrap>
	<input type="text" name="src_ip1" id="src_ip1" disabled size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="src_ip2" id="src_ip2" disabled size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="src_ip3" id="src_ip3" disabled size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="src_ip4" id="src_ip4" disabled size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","serveice_type_str")%></TD>	
	<TD nowrap>
	<select name="pt_type" id="pt_type" size="1" >
		<option value="TCP"><%tcWebApi_multilingual("1","tcp_name_str")%></option>
		<option value="UDP"><%tcWebApi_multilingual("1","udp_name_str")%></option>
		
	</select>
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","pt_port_str")%></TD>
	<TD nowrap>
	<input type="text" name="pt_port" id="pt_port" size="7" maxlength="5" onKeyPress="return getkey('num', event)">(1~65535)
	</TD>
</TR>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
<TR>
	<TD nowrap ><B><%tcWebApi_multilingual("1","inbound_con_str")%></B></TD>
	<TD nowrap>
	<select name="in_port_type" id="in_port_type" size="1">
		<option value="TCP/UDP"><%tcWebApi_multilingual("1","tcp_udp_name_str")%></option>
		<option value="TCP"><%tcWebApi_multilingual("1","tcp_name_str")%></option>
		<option value="UDP"><%tcWebApi_multilingual("1","udp_name_str")%></option>
	</select>
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","inbound_start_port_str")%></TD>
	<TD nowrap>
	<input type="text" name="in_port_start" id="in_port_start" size="7" maxlength="5" onKeyPress="return getkey('num', event)">(1~65535)
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","inbound_end_port_str")%></TD>
	<TD nowrap>
	<input type="text" name="in_port_end" id="" size="7" maxlength="5" onKeyPress="return getkey('num', event)">(1~65535)
	</TD>
</TR>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
</TABLE>
</div>
<%tcWebApi_multilingual("2","_FW_trigger_help.asp")%>
</FORM>
</BODY>
</HTML>
