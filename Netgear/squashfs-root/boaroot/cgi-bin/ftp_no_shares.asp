
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

var show_enableFTP="1";
if( show_enableFTP == "1" )
        document.write('<H1>404 Not Found</H1>');
else
	if(list_disk_num == 0 || not_shared_number == folder_number )
        	document.write('<H1>readyshare.routerlogin.net - /</H1>');
	else
		window.location.href="ftp://readyshare.routerlogin.net/shares";
</script>
<HR><PRE><h4><b>No Shares Available</b></h4><BR></PRE><HR>
</BODY>
</HTML>
