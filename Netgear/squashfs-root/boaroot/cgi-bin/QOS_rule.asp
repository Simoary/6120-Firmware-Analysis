
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/qos.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/QOS_main.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="qos_editnum">

<div class="page_title">QoS Setup</div>
<div class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
	<input class="cancel_bt" type="button" name="Cancel" id="cancel" value="Cancel" onClick="qosMain();">&nbsp;&nbsp;
        <input class="apply_bt" type="submit" name="Apply" id="apply" value="Apply" onClick="qosMain();return false;">
	</TD>
</TR>
</TABLE>
</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<script>
var qos_array_num=0;
var qosmac_array_num=0;
var qosArray1="MSN_messenger 0 MSN_messenger 1 TCP 443 443 ---- ----";
var qosArray2="Yahoo_Messenger 0 Yahoo_messenger 1 TCP 5050,5100,11999 5050,5100,11999 ---- ----";
var qosArray3="IP_Phone 0 IP_Phone 0 TCP 6670 6670 ---- ----";
var qosArray4="Vonage_IP_Phone 0 Vonage_IP_Phone 0 UDP 53,69,5060 53,69,5061 ---- ----";
var qosArray5="NetMeeting 0 Netmeeting 1 TCP 1720 1720 ---- ----";
var qosArray6="AIM 0 AIM 1 TCP 5190 5190 ---- ----";
var qosArray7="Google_Talk 0 Google_Talk 0 TCP 443 443 ---- ----";
var qosArray8="Netgear_EVA 0 Netgear_EVA 0 UDP 49152 49155 ---- ----";
var qosArray9="Counter-Strike 1 Counter-Strike 1 UDP 27015 27019 ---- ----";
var qosArray10="Age-of-Empires 1 Age-of-Empires 1 TCP/UDP 47624 47624 ---- ----";
var qosArray11="Everquest 1 Everquest 1 TCP 7000 7000 ---- ----";
var qosArray12="Quake-2 1 Quake-2 1 TCP/UDP 27960 27960 ---- ----";
var qosArray13="Quake-3 1 Quake-3 1 TCP/UDP 27960 27960 ---- ----";
var qosArray14="Unreal-Tourment 1 Unreal-Tourment 1 TCP/UDP 7777,27960 7783,27960 ---- ----";
var qosArray15="Warcraft 1 Warcraft 1 TCP 6112 6112 ---- ----";
var qos_array_num=15;

var qosmac_array_num=0;



var ts='89575568'
</script>
<input type="hidden" name="qos_list">
<input type="hidden" name="select_edit">
<input type="hidden" name="select_del">
<input type="hidden" name="select_del_mac" value="0">
<TR>
	<TD>
		<TABLE class=tables border=0 cellpadding=2 cellspacing=0 width=100%>
		<TR class=table_header>
			<TD nowrap align=center>&nbsp;</TD>
			<TD nowrap align=center><span class="subhead">#</span> </TD>
			<TD nowrap align=center><span class="subhead">QoS Policy</span> </TD>
			<TD nowrap align=center><span class="subhead">Priority</span></TD>
			<TD nowrap align=center><span class="subhead">Description</span></TD>
		</TR>
<script>	
if( qos_array_num > 0 )
{
	for(i=1,j=0;i<=qos_array_num;i++,j++)
	{
		var str = eval ( 'qosArray' + i );	
		var each_info=str.split(' ');
		
		each_info[0] = each_info[0].replace(/</g, "&#60;").replace(/>/g, "&#62;");
        		if( i%2== 0 )
                       document.write("<TR class=\"even_line\">");
                else
                       document.write("<TR class=\"odd_line\">");
		document.write('<TD nowrap align=center><input type="radio" name="ruleSelect" id="qos_select" value="'+j+'"></TD><TD nowrap align=center>'+i+'</TD><TD nowrap align=center>'+change_name_online(each_info[0])+'</TD>');
		
		if(each_info[3]=='0')
			document.write('<TD nowrap align=center>Highest</TD>');
		else if(each_info[3]=='1')
			document.write('<TD nowrap align=center>High</TD>');
		else if(each_info[3]=='2')
			document.write('<TD nowrap align=center>Normal</TD>');
		else 
			document.write('<TD nowrap align=center>Low</TD>');
		if(each_info[1]=='0')
		{
			if(each_info[2]!="Add")
				document.write("<TD nowrap align=center>"+ each_info[2]+' Applications</TD></TR>');	
			else
				document.write("<TD nowrap align=center>"+ each_info[0]+' Applications</TD></TR>');	
		}
		else if(each_info[1]=='1')
		{
			if(each_info[2]!="Add")
				document.write("<TD nowrap align=center>Online Gaming "+change_name_online(each_info[2])+'</TD></TR>');	
			else
				document.write("<TD nowrap align=center>Online Gaming "+change_name_online(each_info[0])+'</TD></TR>');	
		}
		else if(each_info[1]=='2')
		{
			//document.write("<TD nowrap align=center> "+change_name_online(each_info[0])+" </TD></TR>");	
                        document.write("<TD nowrap align=center> "+"LAN Port "+each_info[2]+" </TD></TR>");
		}
		else if(each_info[1]=='3')
			document.write("<TD nowrap align=center>  MAC "+each_info[8]+" </TD></TR>");	
	}
}		
</script>
		</TABLE>
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD  align=center nowrap>
	<input class="edit_bt" type="button" name="edit_qos" id="edit_qos" value="Edit" onClick="check_qoslist_editnum(document.forms[0]);">&nbsp;
	<input class="delete_bt" type="button" name="delete_qos" id="delete_qos" value="Delete" onClick="check_qoslist_delnum(document.forms[0]);">&nbsp;&nbsp;
	<input class="delete_bt" type="button" name="delete_all_qos" id="delete_all_qos" value="Delete All" onClick="check_qoslist_delall(document.forms[0]);">
	<br><br>	
	<input class="long_add_bt" type="button" name="add_qos" id="add_qos" value="Add Priority Rule" onClick="location.href='QOS_adva_add.asp';">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</TABLE>
</div>
<%tcWebApi_multilingual("2","_qos_help.asp")%>
</form>
</BODY>
</HTML>	
