
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/qos.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/QOS_rule.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="edit_qos_ether">

<div class="page_title">QoS - Priority Rules</div>
<div class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
        <TR>
                <TD nowrap colspan=2 align=center>
			<input class="cancel_bt" type='button' name='Cancel' id="cancel" value='Cancel' onClick='qosRule();'>&nbsp;&nbsp;
                        <input class="apply_bt" type="submit" name="Apply" id="apply" value="Apply" onClick="return check_qos_ether(document.forms[0],'edit');">
            </TD>
        </TR>
</TABLE>
</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>



<script>
var qosArray1="MSN_messenger 0 MSN_messenger 1 TCP 443 443 ---- ----";
var qosArray2="Yahoo_Messenger 0 Yahoo_messenger 1 TCP 5050,5100,11999 5050,5100,11999 ---- ----";
var qosArray3="IP_Phone 0 IP_Phone 0 TCP 6670 6670 ---- ----";
var qosArray4="Vonage_IP_Phone 0 Vonage_IP_Phone 0 UDP 53,69,5060 53,69,5061 ---- ----";
var qosArray5="NetMeeting 0 Netmeeting 1 TCP 1720 1720 ---- ----";
var qosArray6="AIM 0 AIM 1 TCP 5190 5190 ---- ----";
var qosArray7="Google_Talk 0 Google_Talk 0 TCP 443 443 ---- ----";
var qosArray8="Netgear_EVA 0 Netgear_EVA 0 UDP 49152 49155 ---- ----";
var qosArray9="Counter-Strike 1 Counter-Strike 1 UDP 27015 27019 ---- ----";
var qosArray10="Age-of-Empires 1 Age-of-Empires 1 TCP\/UDP 47624 47624 ---- ----";
var qosArray11="Everquest 1 Everquest 1 TCP 7000 7000 ---- ----";
var qosArray12="Quake-2 1 Quake-2 1 TCP\/UDP 27960 27960 ---- ----";
var qosArray13="Quake-3 1 Quake-3 1 TCP\/UDP 27960 27960 ---- ----";
var qosArray14="Unreal-Tourment 1 Unreal-Tourment 1 TCP\/UDP 7777,27960 7783,27960 ---- ----";
var qosArray15="Warcraft 1 Warcraft 1 TCP 6112 6112 ---- ----";
var qos_array_num=15;

var select_editnum="";
function loadvalue()
{
	var cf=document.forms[0];
	var edit_str=eval('qosArray'+select_editnum);
	var each_info=edit_str.split(' ');
	cf.name.value=change_name_online(each_info[0]);
	cf.hidden_qos_policy_name.value=each_info[0];
	cf.port_num.value=each_info[2];
	cf.priority.value=each_info[3];
}
</script>
<input type="hidden" name="hidden_qos_policy_name">
<input type="hidden" name="hidden_priority_category" value=2>
	<TR><TD nowrap colspan=2><b>Priority</b> </TD></TR>
	<TR>
		<TD nowrap>QoS Policy for</TD>
		<TD nowrap> <INPUT type="text" name="name" id="name" maxLength="60" size="16" onKeyPress="return getkey('ssid', event)" value=""></TD>
	</TR>
	<TR>
		<TD nowrap>Priority Category</TD>
		<TD nowrap> 
			<SELECT name="category" id="category" onChange="change_priority()" disabled>
				<OPTION value="0" >Applications</OPTION>
				<OPTION value="1" >Online Gaming</OPTION>
				<OPTION value="2" selected>Ethernet LAN Port</OPTION>
				<OPTION value="3" >MAC Address</OPTION>
			</SELECT>
		</TD>		
	</TR>
	<TR>
		<TD nowrap>Ethernet LAN Port</TD>
		<TD nowrap> 
			<SELECT name="port_num" id="port_num" onChange="change_serv_ether()">
				<OPTION value="1" >1</OPTION>
				<OPTION value="2" >2</OPTION>
				<OPTION value="3" >3</OPTION>
				<OPTION value="4" >4</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR>
		<TD nowrap>Priority</TD>
		<TD nowrap> 
			<SELECT name="priority" id="priority">
				<OPTION value="0" >Highest</OPTION>
				<OPTION value="1" selected>High</OPTION>			
				<OPTION value="2" >Normal</OPTION>
				<OPTION value="3" >Low</OPTION>
			</SELECT>
		</TD>		
	</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</TABLE>
</div>
<%tcWebApi_multilingual("2","_qos_help.asp")%>
</FORM>
</BODY>
</HTML>
