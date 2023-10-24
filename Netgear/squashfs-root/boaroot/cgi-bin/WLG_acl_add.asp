
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/wlacl.js"></script>
<title><%tcWebApi_multilingual("1","glbstr_title")%></title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/WLG_acl.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="wlacl_add">

<div class="page_title" id="title"><%tcWebApi_multilingual("1","wireless_card_setup_str")%></div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<script>
var array_num=0;

</script>

<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_WLG_acl_add','card')"><B><%tcWebApi_multilingual("1","wireless_available_str")%></B></A>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2 align=center>
	<TABLE id="available_wireless" class=tables border=0 cellpadding=2 cellspacing=0 width=100%>
	<TR class=table_header>
		<TD nowrap>&nbsp; </TD>
		<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","device_name_str")%></span></TD>
		<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","mac_addr_str")%></span></TD>
	</TR>
<script>
var device_not_null_str="<%tcWebApi_multilingual("1","device_not_null_str")%>";
var invalid_device_str="<%tcWebApi_multilingual("1","invalid_device_str")%>";
var device_name_dup_str="<%tcWebApi_multilingual("1","device_name_dup_str")%>";
var mac_dup_str="<%tcWebApi_multilingual("1","mac_dup_str")%>";
var max_num_rule_str="<%tcWebApi_multilingual("1","max_num_rule_str")%>";
var alert_invalid_mac_str="<%tcWebApi_multilingual("0","invalid_mac_str")%>";
var wlan_devname_table_Data = 
[
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME0","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME1","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME2","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME3","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME4","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME5","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME6","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME7","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME8","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME9","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME10","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME11","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME12","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME13","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME14","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME15","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME16","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME17","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME18","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME19","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME20","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME21","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME22","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME23","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME24","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME25","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME26","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME27","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME28","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME29","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME30","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME31","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME32","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME33","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME34","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME35","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME36","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME37","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME38","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME39","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME40","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME41","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME42","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME43","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME44","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME45","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME46","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME47","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME48","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME49","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME50","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME51","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME52","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME53","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME54","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME55","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME56","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME57","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME58","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME59","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME60","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME61","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME62","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME63","s")%>"
]
var wlan_mac_table_Data = 
[
"<%tcWebApi_get("WLan_Entry0","WLan_MAC0","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC1","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC2","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC3","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC4","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC5","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC6","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC7","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC8","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC9","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC10","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC11","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC12","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC13","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC14","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC15","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC16","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC17","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC18","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC19","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC20","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC21","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC22","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC23","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC24","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC25","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC26","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC27","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC28","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC29","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC30","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC31","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC32","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC33","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC34","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC35","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC36","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC37","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC38","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC39","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC40","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC41","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC42","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC43","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC44","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC45","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC46","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC47","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC48","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC49","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC50","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC51","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC52","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC53","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC54","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC55","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC56","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC57","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC58","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC59","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC60","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC61","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC62","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC63","s")%>"
]
var wlstationlist = "<%tcWebApi_get("Netscan_Common","WirelessStationMAC","s")%>";
var wlstationlist5g = "<%tcWebApi_get("Netscan_Common","WirelessStationMAC_5G","s")%>";
var attach_device_list="<%tcWebApi_showFile("/var/netscan_lists")%>";
var attach_array=attach_device_list.split(' @#$&*! ');
var attach_ip_array = new Array();
var attach_mac_array = new Array();
var attach_name_array = new Array();
var p=0;

var lan_ip="<%tcWebApi_get("Lan_Entry","IP","s")%>";
var lan_subnet="<%tcWebApi_get("Lan_Entry","netmask","s")%>";
var lan_prefix = parent.aye_utils_GET_IPv4_Prefix(lan_ip,lan_subnet);

var attach_dev_num=0

var deviceIP_name_num=0

var repeater_wireless_attach_device_num=0;
var wired_num=0;
var check_the_valid_range;

if(attach_device_list != "none")
{
        for(i=0;i<attach_array.length;i++)
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
                                if( attach_ip_array[p] == dev_name_array[0] && dev_name_array[1] != "")
                                {
                                        attach_name_array[p] = dev_name_array[1];
                                }
                        }
                }

                //if( attach_mac_array[p].toUpperCase() == "".toUpperCase().replace(/-/g,":")&& (attach_name_array[p] == "<unknown>" || attach_name_array[p] == "&lt;unknown&gt;" || attach_name_array[p] == "----" ) )
                //{
                //       attach_name_array[p] = "";
                //}

                if(attach_name_array[p] == "<unknown>") 
                {
                        attach_name_array[p]="&lt;Unknown&gt;"
                }
				p++;
        }
}

num = 0;
same_flag = 0;
for(i=0; i<attach_array.length; i++)
{
	same_flag = 0;
	for(j=0;j<attach_dev_num;j++)
	{
		var mac = eval ( 'attach_dev_mac' + j );
		if( attach_mac_array[i].toLowerCase() == mac.toLowerCase() )	
		{
			same_flag = 1;	
		}
	}
	if( repeater_wireless_attach_device_num > 0 )
		if( attach_mac_array[i].toLowerCase() == repeater_wireless_attach_device_mac.toLowerCase() )
			same_flag = 1;

	if(attach_ip_array[i].search(lan_prefix)!=-1 && wlstationlist.search(attach_mac_array[i])!=-1 && wlstationlist5g.search(attach_mac_array[i])==-1){			
		if( same_flag == 0 )	
		{
			num = num +1;				
			if( num%2== 0 )
				document.write('<TR class=even_line>');
			else
				document.write('<TR class=odd_line>');
			document.write('<TD nowrap align=center><input type="radio" name="MacSelect" value="'+i+'" onclick="mac_data_select('+i+')"></TD><TD nowrap align=center>&nbsp;'+attach_name_array[i]+'&nbsp;</TD><TD nowrap align=center>'+attach_mac_array[i].toUpperCase()+'</TD></TR>');
		}
	}	
}

same_flag = 0;
for(i=0; i<attach_array.length; i++)
{
	same_flag = 0;
	for(j=0;j<attach_dev_num;j++)
	{
		var mac = eval ( 'attach_dev_mac' + j );
		if( attach_mac_array[i].toLowerCase() == mac.toLowerCase() )	
		{
			same_flag = 1;	
		}
	}
	if( repeater_wireless_attach_device_num > 0 )
		if( attach_mac_array[i].toLowerCase() == repeater_wireless_attach_device_mac.toLowerCase() )
			same_flag = 1;
	
	if(attach_ip_array[i].search(lan_prefix)!=-1 && wlstationlist.search(attach_mac_array[i])==-1 && wlstationlist5g.search(attach_mac_array[i])!=-1){			
		if( same_flag == 0 )	
		{
			num = num +1;				
			if( num%2== 0 )
				document.write('<TR class=even_line>');
			else
				document.write('<TR class=odd_line>');
            document.write('<TD nowrap align=center><input type="radio" name="MacSelect" value="'+i+'" onclick="mac_data_select('+i+')"></TD><TD nowrap align=center>&nbsp;'+attach_name_array[i]+'&nbsp;</TD><TD nowrap align=center>'+attach_mac_array[i].toUpperCase()+'</TD></TR>');
		}
	}	
}

</script>
<input type="hidden" name="wlacl_num" value="0">
<input type="hidden" name="hidden_wlan_id" value="0">
<input type="hidden" name="hidden_wlan_id_1" value="1">
<input type="hidden" name="hidden_wlan_id_2" value="2">
<input type="hidden" name="hidden_wlan_id_3" value="3">
<input type="hidden" name="hidden_wlan_ac_id" value="0">
<input type="hidden" name="hidden_wlan_ac_id_1" value="1">
<input type="hidden" name="hidden_wlan_ac_id_2" value="2">
<input type="hidden" name="hidden_wlan_ac_id_3" value="3">
<input type="hidden" name="guest_ssid_filter_add" value="1">
	</TABLE>
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_WLG_acl','entry')"><B><%tcWebApi_multilingual("1","wireless_card_entry_str")%></B></A>
	</TD>
</TR>	
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","device_name_str")%></TD>
	<TD nowrap>
	<input type="text" name="device" id="device_name" maxLength="20" size="20" onKeyPress="return getkey('ssid', event)">
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","mac_addr_str")%></TD>
	<TD nowrap>
	<input type="text" value="" name="adr" id="mac_address" maxlength="17" size="20" onKeyPress="return getkey('mac',event)">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2 align=center>
	<input class="add_bt"  type="submit" value="<%tcWebApi_multilingual("0","glbstr_add")%>" name="Add" id="add" onClick="return check_wlacl_add(document.forms[0],'add')">&nbsp;&nbsp;
	<input class="cancel_bt" type='button' value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" name="Cancel" id="cancel" onClick='location.href="WLG_acl.asp";'>&nbsp;&nbsp;
	<input class="common_bt" type='button' value="<%tcWebApi_multilingual("0","glbstr_refresh")%>" name="Refresh" id="refresh" onClick='location.href="WLG_acl_wait.asp";'>
	</TD>
</TR>  
</TABLE>
</div>
<div id="waiting_bar" style="display:none">
<div  align="center"><BR><BR><TR><TD align="center"><B><%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%></B></TD></TR><BR><BR></div>
<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" alt="waiting" /></div>
</div>
<%tcWebApi_multilingual("2","_WLG_acl_add_help.asp")%>
</FORM>
</BODY>
</HTML>
