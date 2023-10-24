
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_netgear_router")%> <%tcWebApi_get("SkuId_Entry","ProductName","s")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>
<script>
var ipupd_hour="";
var ipupd_min="";
var ipupd_month="";
var ipupd_day="";
var ipupd_time="";
var ipupd_year="";
var ipupd_date_split="";
var ipupd_time_split="";

var show_time   = "<%tcWebApi_get("DdnsStatus_Entry","SHOW_TIME","s")%>";
var ipupd_date  = "<%tcWebApi_get("DdnsStatus_Entry","IPUPD_DATE","s")%>";
var status      = "<%tcWebApi_get("DdnsStatus_Entry","STATUS","s")%>";
var ddns_enable = "<%If TCWebApi_get("Ddns_Entry","Active","h") <> "N/A" then TCWebApi_get("Ddns_Entry","Active","s") end if%>";
var hostname    = "<%If TCWebApi_get("Ddns_Entry","MYHOST","h") <> "N/A" then TCWebApi_get("Ddns_Entry","MYHOST","s") end if%>";
var timestamp   = "<%If TCWebApi_get("Timezone_Entry","GUITimestamp","h") <> "N/A" then TCWebApi_get("Timezone_Entry","GUITimestamp","s") end if%>";
var gui_region  = "English";

var please_wait_a_moment_str                 = "<%tcWebApi_multilingual("1","please_wait_a_moment_str")%>";
var dynamic_dns_service_is_not_enabled_str   = "<%tcWebApi_multilingual("1","dynamic_dns_service_is_not_enabled_str")%>";
var updated_successfully_at_str              = "<%tcWebApi_multilingual("1","updated_successfully_at_str")%>";
var no_update_action_str                     = "<%tcWebApi_multilingual("1","no_update_action_str")%>";
var authentication_failed_str                = "<%tcWebApi_multilingual("1","authentication_failed_str")%>";
var update_failed_hostname_not_correct       = "<%tcWebApi_multilingual("1","update_failed_hostname_not_correct")%>";
var update_failed_at_str                     = "<%tcWebApi_multilingual("1","update_failed_at_str")%>";
var the_service_provider_isnot_reachable_str = "<%tcWebApi_multilingual("1","the_service_provider_isnot_reachable_str")%>";

ipupd_date_split = ipupd_date.split(' ');
if(ipupd_date_split[2] == '')
{
	ipupd_month = ipupd_date_split[1];
	ipupd_day   = ipupd_date_split[3];
	ipupd_time  = ipupd_date_split[4];
	ipupd_year  = ipupd_date_split[6];
}
else
{
	ipupd_month = ipupd_date_split[1];
	ipupd_day   = ipupd_date_split[2];
	ipupd_time  = ipupd_date_split[3];
	ipupd_year  = ipupd_date_split[5];
}

ipupd_time_split = ipupd_time.split(':');
ipupd_hour       = ipupd_time_split[0];
ipupd_min        = ipupd_time_split[1];

//if(show_time == "1")
{
	if(ipupd_hour.charAt(0)!='0')
		var hour=parseInt(ipupd_hour);
	else
		var hour=parseInt(ipupd_hour.charAt(1));
	var ampm="am";
	var hour_24=hour;
	if (hour > 12)
	{
		hour=hour-12;
		ampm="pm"
	}
	hour=hour.toString();
	hour_24=hour_24.toString();
        if(hour_24.length==1)
                hour_24='0'+hour_24;
	if(hour.length==1)
		hour='0'+hour;
	if(ipupd_min.length==1)
		ipupd_min='0'+ipupd_min;
	if(ipupd_month=="Jan")
		ipupd_month="01";
	else if(ipupd_month == "Feb")
		ipupd_month="02";
	else if(ipupd_month == "Mar")
		ipupd_month="03";
	else if(ipupd_month == "Apr")
		ipupd_month="04";
	else if(ipupd_month == "May")
		ipupd_month="05";
	else if(ipupd_month == "Jun")
		ipupd_month="06";
	else if(ipupd_month == "Jul")
		ipupd_month="07";
	else if(ipupd_month == "Agu")
		ipupd_month="08";
	else if(ipupd_month == "Sep")
		ipupd_month="09";
	else if(ipupd_month == "Oct")
		ipupd_month="10";
	else if(ipupd_month == "Nov")
		ipupd_month="11";
	else if(ipupd_month == "Dec")
		ipupd_month="12";
	if(ipupd_day.length==1)
		ipupd_day='0'+ipupd_day;
	var year=parseInt(ipupd_year);	
}
</script>
<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<TR>
	<TD align=center>
	<font size=4><B>
<script>
if( ddns_enable == "No" )
	document.write(dynamic_dns_service_is_not_enabled_str);
else
{	
	if(status == "1" )
	{
		if( gui_region == "German" )
			document.write(hostname+ ' ' +updated_successfully_at_str+ ' ' +hour_24+':'+ipupd_min+', '+ipupd_day+'.'+ipupd_month+'.'+year);	
		else
			document.write(hostname+ ' ' +updated_successfully_at_str+ ' ' +hour+':'+ipupd_min+' '+ampm+', '+ipupd_month+'/'+ipupd_day+'/'+year);
	}
	else if(status == "2")
		document.write(no_update_action_str);
	else if(status == "3")
		document.write(authentication_failed_str);
	else if(status == "4")
		document.write(update_failed_hostname_not_correct);
	else
	{
		if( gui_region == "German" )
			document.write(update_failed_at_str+ ' ' + hour_24+':'+ipupd_min+', '+ipupd_day+'.'+ipupd_month+'.'+year+'.<BR>'+the_service_provider_isnot_reachable_str);
		else
			document.write(update_failed_at_str+ ' ' + hour+':'+ipupd_min+' '+ampm+', '+ipupd_month+'/'+ipupd_day+'/'+year+'.<BR>'+the_service_provider_isnot_reachable_str);
	}
}
window.opener.setValue(timestamp);
</script>
	</B></font>
	</TD>
</TR>
</TABLE>
</HTML>




