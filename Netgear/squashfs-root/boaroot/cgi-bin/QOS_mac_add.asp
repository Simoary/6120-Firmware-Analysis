
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/qos.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/QOS_rule.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="add_qos_mac">

<div class="page_title">QoS - Priority Rules</div>
<div class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
        <TR>
                <TD nowrap colspan=2 align=center>
			<input class="cancel_bt" type='button' name='Cancel' id="cancel" value='Cancel' onClick='qosRule();'>&nbsp;&nbsp;
                        <input class="apply_bt" type="submit" name="Apply" id="apply" value="Apply" onClick="return check_qos_mac(document.forms[0],'add');">
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
var qosArray10="Age-of-Empires 1 Age-of-Empires 1 TCP\/UDP 47624 47624 ---- ----";
var qosArray11="Everquest 1 Everquest 1 TCP 7000 7000 ---- ----";
var qosArray12="Quake-2 1 Quake-2 1 TCP\/UDP 27960 27960 ---- ----";
var qosArray13="Quake-3 1 Quake-3 1 TCP\/UDP 27960 27960 ---- ----";
var qosArray14="Unreal-Tourment 1 Unreal-Tourment 1 TCP\/UDP 7777,27960 7783,27960 ---- ----";
var qosArray15="Warcraft 1 Warcraft 1 TCP 6112 6112 ---- ----";
var qos_array_num=15;

var qosmac_array_num=0;

var attach_dev_num=0

var deviceIP_name_num=0


var attach_device_list="192.168.1.12 00:21:E0:29:91:42 TEST-PC     @\#$\&*!";
var attach_array=attach_device_list.split(' @#$&*! ');
var attach_ip_array = new Array();
var attach_mac_array = new Array();
var attach_name_array = new Array();
var attach_policy = new Array();
//var mac = new Array();
//var name = new Array();
//var policy = new Array();
var user_add_mac = new Array();
var k=0;
var p=0;
var ts='61297644';
</script>

<input type="hidden" name="the_mac">
<input type="hidden" name="select_editnum_mac">
<input type="hidden" name="select_qoslist_num">
<input type="hidden" name="hidden_priority_category" value="3">
<input type="hidden" name="attached_mac">
	<TR><TD nowrap colspan=2><b>Priority</b> </TD></TR>
	<TR>
		<TD nowrap>QoS Policy for</TD>
		<TD nowrap> <INPUT type="text" name="name" id="name" maxLength="60" size="16" onKeyPress="return getkey('ssid', event)" value=""></TD>
	</TR>
	<TR>
		<TD nowrap>Priority Category</TD>
		<TD nowrap> 
			<SELECT name="category" id="category" onChange="change_priority()">
				<OPTION value="0" >Applications</OPTION>
				<OPTION value="1" >Online Gaming</OPTION>
				<OPTION value="2" >Ethernet LAN Port</OPTION>
				<OPTION value="3" >MAC Address</OPTION>
			</SELECT>
		</TD>
	</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR><TD nowrap colspan=2> <b>MAC Device List</b></TD></TR>
	<TR>	
		<TD nowrap colspan=2>
			<TABLE class=tables border=0 cellpadding=2 cellspacing=0 width=100%>
			<TR class=table_header>
				<TD nowrap>&nbsp; </TD>
				<TD nowrap align=center> <span class="subhead">QoS Policy</span></TD>
				<TD nowrap align=center> <span class="subhead">Priority</span></TD>
				<TD nowrap align=center> <span class="subhead">Device Name</span></TD>
				<TD nowrap align=center> <span class="subhead">MAC Address</span></TD>
			</TR>
<script>
function loadvalue()
{
	document.forms[0].category.selectedIndex=3;
}	
if(attach_device_list != "")
{
        for(i=0, p=0;i<attach_array.length;i++, p++)
        {
                var each_info=attach_array[i].split(' ');
                if(each_info.length>2)
                {
			attach_ip_array[p]=each_info[0];
	                attach_mac_array[p]=each_info[1];
                        if (each_info[2].length>0)
                                attach_name_array[p]=each_info[2];
                        else
                                attach_name_array[p]="----";
                }
                else
                {
			attach_ip_array[p]=each_info[0];
                        attach_mac_array[p]=each_info[1];
                        attach_name_array[p]="----";
                }
		if(attach_ip_array[p] == "<unknown>")
			attach_ip_array[p]="&lt;Unknown&gt;"
                if(attach_mac_array[p] == "<unknown>")
                        attach_mac_array[p]="&lt;Unknown&gt;"

                if(attach_name_array[p] == "<unknown>" || attach_name_array[p] == "&lt;unknown&gt;" || attach_name_array[p] == "----" ){
                        for( t=0; t<deviceIP_name_num; t++){
                                var dev_name = eval ( 'deviceIP_name' + t );
                                var dev_name_array = dev_name.split(' ');
                                if( attach_ip_array[p] == dev_name_array[0] )
                                        attach_name_array[p] = dev_name_array[1];

                        }
                }

                if( attach_mac_array[p].toUpperCase() == "".toUpperCase().replace(/-/g,":") 
                        && (attach_name_array[p] == "<unknown>" || attach_name_array[p] == "&lt;unknown&gt;" || attach_name_array[p] == "----" ) )
                {
                        attach_name_array[p] = "";
                }

                if(attach_name_array[p] == "<unknown>")
                        attach_name_array[p]="&lt;Unknown&gt;"
	    }
}
if( qosmac_array_num > 0 )
{
        for(i=1;i<=qosmac_array_num;i++)
        {
                var str = eval ( 'qosmac_Array' + i );
                var each_info=str.split(' ');
		    k = i - 1;
                user_add_mac[k]=each_info[3];
	    }
}
if( p > 0 )
{
        for(j=0,i=qosmac_array_num;j<p;j++)
        {
		var flag=0;
		for(k=0;k<qosmac_array_num;k++)
		{
                	if(attach_mac_array[j].toLowerCase() == user_add_mac[k].toLowerCase())
                	{	
				/*-- when user added list have this device info, 
				     clear it in attach list, to avoid record duplicate info  --*/
				attach_mac_array[j]="";
				attach_name_array[j]="";
				attach_policy[j]="";
				flag++;
				break;
			}
		}
		if(flag == 0)
		{
			i++;
                        var def_name=attach_mac_array[j].substring(9,11)+attach_mac_array[j].substring(12,14)+attach_mac_array[j].substring(15,17);
                        attach_policy[j]='Pri_MAC_'+def_name;
			//name[s]=attach_name_array[j];
			//mac[s]=attach_mac_array[j];
			//policy[s]=attach_policy[j];
			    if( j%2== 0 )
                       document.write("<TR class=\"odd_line\">");
                else
                       document.write("<TR class=\"even_line\">");
                        document.write('<TD nowrap align=center><input type="radio" name="MacSelect" id="mac_select" value="'+i+'"  onclick="attached_qosmac_data_select('+i+','+j+')"></TD><TD nowrap align=center><span class="subhead">'+attach_policy[j]+'</span></TD>');
                        document.write('<TD nowrap align=center> Normal</TD>');
                        document.write('<TD nowrap align=center> '+attach_name_array[j]+'</TD><TD nowrap align=center> '+attach_mac_array[j]+'</TD></TR>');
        }
	    }
}

if( qosmac_array_num > 0 )
{
	for(i=1;i<=qosmac_array_num;i++)
	{
		var str = eval ( 'qosmac_Array' + i );	
		var each_info=str.split(' ');
         		if( i%2== 0 )
                       document.write("<TR class=\"even_line\">");
                else
                       document.write("<TR class=\"odd_line\">");
		document.write('<TD nowrap align=center><input type="radio" name="MacSelect" id="mac_select" value="'+i+'"  onclick="qosmac_data_select('+i+')"></TD><TD nowrap align=center><span class="subhead">'+each_info[0].replace(/</g, "&#60;").replace(/>/g, "&#62;")+'</span></TD>');
		if(each_info[1]=='0')
			document.write('<TD nowrap align=center> Highest</TD>');
		else if(each_info[1]=='1')
			document.write('<TD nowrap align=center> High</TD>');
		else if(each_info[1]=='2')
			document.write('<TD nowrap align=center> Normal</TD>');
		else 
			document.write('<TD nowrap align=center> Low</TD>');
		document.write('<TD nowrap align=center> '+each_info[2].replace(/</g, "&#60;").replace(/>/g, "&#62;")+'</TD><TD nowrap align=center> '+each_info[3]+'</TD></TR>');
	}
}	
</script>		
			</TABLE>
		</TD>
	</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap>MAC Address</TD>
		<TD nowrap> <!--
			<input type="text" value="" name="mac_addr1" maxlength="2" size=1 onKeyPress="return getkeya(event)">:
			<input type="text" value="" name="mac_addr2" maxlength="2" size=1 onKeyPress="return getkeya(event)">:
			<input type="text" value="" name="mac_addr3" maxlength="2" size=1 onKeyPress="return getkeya(event)">:
			<input type="text" value="" name="mac_addr4" maxlength="2" size=1 onKeyPress="return getkeya(event)">:
			<input type="text" value="" name="mac_addr5" maxlength="2" size=1 onKeyPress="return getkeya(event)">:
			<input type="text" value="" name="mac_addr6" maxlength="2" size=1 onKeyPress="return getkeya(event)">   -->	
			<input type="text" value="" name="mac" id="mac" maxlength="60" size="16" onKekPress="return getkeya(event)">
		</TD>
	</TR>
	<TR>
		<TD nowrap>Device Name</TD>
		<TD nowrap> <INPUT type="text" name="dev_name" id="dev_name" maxLength="60" size="16" onKeyPress="return getkey('hostname', event)" value=""></TD>
	</TR>
	<TR>
		<TD nowrap>Priority</TD>
		<TD nowrap> 
			<SELECT name="priority" id="priority">
				<OPTION value="0" >Highest</OPTION>
				<OPTION value="1" >High</OPTION>			
				<OPTION value="2" selected>Normal</OPTION>
				<OPTION value="3" >Low</OPTION>
			</SELECT>
		</TD>
	</TR>	
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR align=center>
	    <TD nowrap colspan=2>
		<input class="add_bt"  type="submit" name="Add" id="add" value="Add" onClick="return valid_add_qosmac(document.forms[0],'add','add_page');">
		<input class="edit_bt" type="submit" name="Edit" id="edit" value="Edit" onClick="return valid_add_qosmac(document.forms[0],'edit','add_page');">
		<input class="delete_bt" type="submit" name="Delete" id="delete" value="Delete" onClick="return valid_delete_qosmac(document.forms[0]);">
		<input class="common_bt" type='submit' name='Refresh' id="refresh" value='Refresh' onClick='location.href="QOS_mac_add.asp";return false;'>
		</TD>
	</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	</TABLE>
</div>
<%tcWebApi_multilingual("2","_qos_help.asp")%>	
</FORM>
</BODY>
</HTML>
