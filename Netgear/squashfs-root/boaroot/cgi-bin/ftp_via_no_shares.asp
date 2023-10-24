
<html><head><title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<BODY>
<style type="text/css">
H1 { font-size:32px; color:#000000;}
h4 { font-size:16px; color:#000000;}
</style>
<script>
var list_disk_num=0;
var folder_number=0;
var not_shared_number=0;

var show_enableFvia="1";
var show_FTP_via_port="21";
var old_endis_ddns="0";
if(old_endis_ddns == "1")
	var old_sysDNSHost="";
else
	var old_sysDNSHost="172.17.144.126";
if (show_enableFvia=="0")
{
        if( show_FTP_via_port =="21" )
        {
                
		if(list_disk_num == 0 || not_shared_number == folder_number )
			document.write('<H1>'+old_sysDNSHost+' - /</H1>');
		else
			window.location.href="ftp://"+old_sysDNSHost+"/shares";
        }
        else
        {
		if(list_disk_num == 0 || not_shared_number == folder_number )
                	document.write('<H1>'+old_sysDNSHost+':'+show_FTP_via_port+' - /</H1>');
		else
			window.location.href="ftp://"+old_sysDNSHost+":"+show_FTP_via_port+"/shares";
        }
}
else
{
        document.write('<H1>404 Not Found</H1>');
}
</script>
<HR><PRE><h4><b>No Shares Available</b></h4><BR></PRE><HR>
</BODY>
</HTML>


