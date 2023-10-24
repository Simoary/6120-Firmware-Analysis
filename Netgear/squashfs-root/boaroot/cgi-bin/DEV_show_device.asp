
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title><%tcWebApi_multilingual("1","glbstr_title")%></title>
<meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body bgcolor=#ffffff>
<form method="POST">
<input type=hidden name=submit_flag value="">

<div class="page_title"><%tcWebApi_multilingual("1","attached_devices_str")%></div>
<div id="main" class="main">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>
 
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<script>
var cf = document.forms[0];

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
</script>

<TR>
        <TD nowrap colspan=2>
	<br>
        <A tabindex=-1 href="javascript:loadhelp('_attach_device','')"><B><%tcWebApi_multilingual("1","wired_devices_str")%></B></A>
        </TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<TABLE id="WiredDevice" class=tables border=0 cellpadding=2 cellspacing=0 width=100%>
	<TR class=table_header>
		<TD nowrap align=center style="width:85px"><span class="subhead"># </span></TD>
		<TD nowrap align=center style="width:180px"><span class="subhead"><%tcWebApi_multilingual("1","ip_address_str")%></span></TD>
		<TD nowrap align=center style="width:180px"><span class="subhead"><%tcWebApi_multilingual("1","mac_address_str")%></span></TD>
		<TD nowrap align=center style="width:180px"><span class="subhead"><%tcWebApi_multilingual("1","device_name_str")%></span></TD>
	</TR>
<script>
var num = 0;
var same_flag = 0;
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

	if(attach_ip_array[i].search(lan_prefix)!=-1 && wlstationlist.search(attach_mac_array[i])==-1 && wlstationlist5g.search(attach_mac_array[i])==-1){
			
		if( same_flag == 0 )	
		{
			num = num +1;			
			if( num%2== 0 )
				document.write('<TR class=even_line>');
			else
				document.write('<TR class=odd_line>');
			
			document.write('<TD nowrap align=center style=\"width:85px\"><span class=\"subhead\">'+num+'</span></TD>');
			document.write('<TD nowrap align=center style=\"width:180px\"><span class=\"subhead\">'+attach_ip_array[i]+'</span></TD>');
			document.write('<TD nowrap align=center style=\"width:180px\"><span class=\"subhead\">'+attach_mac_array[i]+'</span></TD>');
			document.write('<TD nowrap align=center style=\"width:180px\"><span class=\"subhead\">'+attach_name_array[i]+'</span></TD>');
			document.write('</TR>');
		}
	}	
}
</script>
</TABLE>
</TD>
</TR>

<TR>
        <TD nowrap colspan=2>
	<br>
	<br>
        <A tabindex=-1 href="javascript:loadhelp('_attach_device','')"><B><%tcWebApi_multilingual("1","two_four_g_wireless_devices_str")%></B></A>
        </TD>
</TR>
<TR>
        <TD nowrap colspan=2>
        <TABLE id="WirelessDevice" class=tables border=0 cellpadding=2 cellspacing=0 width=100%>
        <TR class=table_header>
        <TD nowrap align=center style="width:85px"><span class="subhead"># </span></TD>
        <TD nowrap align=center style="width:180px"><span class="subhead"><%tcWebApi_multilingual("1","ip_address_str")%></span></TD>
        <TD nowrap align=center style="width:180px"><span class="subhead"><%tcWebApi_multilingual("1","mac_address_str")%></span></TD>
		<TD nowrap align=center style="width:180px"><span class="subhead"><%tcWebApi_multilingual("1","device_name_str")%></span></TD>
        </TR>
<script>
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
			
			document.write('<TD nowrap align=center style=\"width:85px\"><span class=\"subhead\">'+num+'</span></TD>');
			document.write('<TD nowrap align=center style=\"width:180px\"><span class=\"subhead\">'+attach_ip_array[i]+'</span></TD>');
			document.write('<TD nowrap align=center style=\"width:180px\"><span class=\"subhead\">'+attach_mac_array[i]+'</span></TD>');
			document.write('<TD nowrap align=center style=\"width:180px\"><span class=\"subhead\">'+attach_name_array[i]+'</span></TD>');
			document.write('</TR>');	
		}
	}	
}

</script>
</TABLE>
</TD>
</TR>

<TR>
        <TD nowrap colspan=2>
	<br>
	<br>
        <A tabindex=-1 href="javascript:loadhelp('_attach_device','')"><B><%tcWebApi_multilingual("1","five_g_wireless_devices_str")%></B></A>
        </TD>
</TR>
<TR>
        <TD nowrap colspan=2>
        <TABLE id="WirelessDevice" class=tables border=0 cellpadding=2 cellspacing=0 width=100%>
        <TR class=table_header>
        <TD nowrap align=center style="width:85px"><span class="subhead"># </span></TD>
        <TD nowrap align=center style="width:180px"><span class="subhead"><%tcWebApi_multilingual("1","ip_address_str")%></span></TD>
        <TD nowrap align=center style="width:180px"><span class="subhead"><%tcWebApi_multilingual("1","mac_address_str")%></span></TD>
		<TD nowrap align=center style="width:180px"><span class="subhead"><%tcWebApi_multilingual("1","device_name_str")%></span></TD>
        </TR>
<script>
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
	
	if(attach_ip_array[i].search(lan_prefix)!=-1 && wlstationlist.search(attach_mac_array[i])==-1 && wlstationlist5g.search(attach_mac_array[i])!=-1){			
		if( same_flag == 0 )	
		{
			num = num +1;				
			if( num%2== 0 )
				document.write('<TR class=even_line>');
			else
				document.write('<TR class=odd_line>');
			
			document.write('<TD nowrap align=center style=\"width:85px\"><span class=\"subhead\">'+num+'</span></TD>');
			document.write('<TD nowrap align=center style=\"width:180px\"><span class=\"subhead\">'+attach_ip_array[i]+'</span></TD>');
			document.write('<TD nowrap align=center style=\"width:180px\"><span class=\"subhead\">'+attach_mac_array[i]+'</span></TD>');
			document.write('<TD nowrap align=center style=\"width:180px\"><span class=\"subhead\">'+attach_name_array[i]+'</span></TD>');
			document.write('</TR>');	
		}
	}	
}

</script>
</TABLE>
</TD>
</TR>

<TD>
<br>
</TD>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap align=center>
	<input class="common_bt" type="button" name="refresh" id="refresh" value="<%tcWebApi_multilingual("0","glbstr_refresh")%>" onClick=location.href="DEV_device.asp";>
	</TD>
</TR>
</TABLE>

</div>
<%tcWebApi_multilingual("2","_attach_device_help.asp")%>
</FORM>
</BODY>
</HTML>
