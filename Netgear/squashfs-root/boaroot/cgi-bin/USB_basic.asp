
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/USB_NETStorage.js"></script>
<script language=javascript type=text/javascript src="/advanced.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/USB_basic.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="disk_remove">
<div class="page_title"><%tcWebApi_multilingual("1","usb_storage_str")%></div>
<div id="main" class="main">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<script language="javascript" type="text/javascript">
var basic_str="<%tcWebApi_multilingual("1","basic_str")%>";
var readyshare_remote_str="ReadySHARE <%tcWebApi_multilingual("1","remote_str")%> (<%tcWebApi_multilingual("1","readyshare_remote_str")%>.)";
var readyshare_print_str="<%tcWebApi_multilingual("1","readyshare_print_str")%>";
var network_device_name_str="<%tcWebApi_multilingual("1","network_device_name_str")%>:";
var safely_remove_usb_str="<%tcWebApi_multilingual("1","safely_remove_usb_str")%>";
var access_admin_str="<%tcWebApi_multilingual("1","access_admin_str")%>";
var access_all_no_password_str="<%tcWebApi_multilingual("1","access_all_no_password_str")%>";


var enable_action=1;
var show_deviceName="<%if tcWebApi_get("Samba_Entry","WorkGroup","h") <> "N/A" then tcWebApi_get("Samba_Entry","WorkGroup","s") else asp_write("Workgroup") end if%>";
var show_lanip="192.168.1.1";
var readyShareSupportedLevel=2;
var dev0="sda1*0*USB      Disk             *U*U Drive (1.95 GB)";
var disk_num=1;
var device_num=0;

function remove_disk(cf)
{
	var wleft=(screen.width-400)/2;
	var wtop=(screen.height-400)/2;
	if(device_num == 1)
	{
		//cf.hidden_name.value="all";
		//cf.submit_flag.value = "disk_remove";
		//cf.submit();
		//str="USB_disk_rm.asp?dev_name=***";		
		removeDisk=window.open('USB_disk_rm.asp','removeDisk','width=400,height=400,left=440,top=312,status=yes');
		removeDisk.moveTo(wleft,wtop);
	}
	else
	{
		removeDisk=window.open('USB_disk_rm_part.asp','removeDisk','width=400,height=400,left=440,top=312,status=yes');
		removeDisk.moveTo(wleft,wtop);
	}
}

function loadvalue()
{
	var form = document.forms[0];
	/*if( device_num == 0 )
		form.safeRemove.disabled = true;
	else
		form.safeRemove.disabled = false;	*/

	//if( readyShareSupportedLevel >1 )	
	//	form.usb_serv_type.checked = true;
}
</script>
<input type="hidden" name="hidden_name">
<input type="hidden" name="hidden_share_serv_type" value="" />

<script>
/*if( readyShareSupportedLevel >1 )
{
	document.write('<tr><td nowrap="nowrap"><input type="radio" name="usb_serv_type" id="usb_serv_type" value="0" />'+basic_str+'</td></tr>');

	if( readyShareSupportedLevel == 3 || readyShareSupportedLevel == 7 )
		document.write('<tr><td nowrap="nowrap"><input type="radio" name="usb_serv_type" id="usb_serv_type" value="1" onclick="location.href=\'/cgi-bin/RMT_invite.asp\';" />'+readyshare_remote_str+'</td></tr>');

	if( readyShareSupportedLevel == 5 || readyShareSupportedLevel == 7 )
		document.write('<tr><td nowrap="nowrap"><input type="radio" name="usb_serv_type" id="usb_serv_type" value="2" onclick="location.href=\'/RMT_print.asp\';" />'+readyshare_print_str+'</td></tr>');
}*/
</script>
<!--<TR><TD colspan=2><img src="/liteblue.gif" width=100%% height=12></TD></TR>-->
<TR><TD colspan=2>&nbsp;</TD></TR>
<script>
if(isIE())
	document.write('<TR><TD colspan=2><a tabindex=-1 href="javascript:loadhelp(\'_USB_basic\',\'device\')"><b>'+network_device_name_str+'</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="linktype" id="device_name" href="\\\\'+show_deviceName+'" target="_blank">\\\\'+show_deviceName+'</a></TD></TR>');
else if( get_browser() == "Safari" )
	document.write('<TR><TD colspan=2><a tabindex=-1 href="javascript:loadhelp(\'_USB_basic\',\'device\')"><b>'+network_device_name_str+'</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="linktype" id="device_name" href="smb://'+show_lanip+'" >\\\\'+show_deviceName+'</a></TD></TR>');
else
	document.write('<TR><TD colspan=2><a tabindex=-1 href="javascript:loadhelp(\'_USB_basic\',\'device\')"><b>'+network_device_name_str+'</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\\\\'+show_deviceName+'</TD></TR>');
</script>
<TR><TD colspan=2>&nbsp;</TD></TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100%% height=12></TD></TR>
<TR><TD colspan=2>&nbsp;</TD></TR>
<TR><TD colspan=2><a tabindex=-1 href="javascript:loadhelp('_USB_basic','available_folder')"><b><%tcWebApi_multilingual("1","availabe_network_folder_str")%></b></a></TD></TR>
<TR><TD colspan=2>
	<TABLE id="available_folder" class=tables border ="0" cellpadding ="2" cellspacing ="0" width="100%">
	<TR class=table_header>
		<TD nowrap><span class="thead"><%tcWebApi_multilingual("1","share_name_str")%></span></TD>
		<TD nowrap><span class="thead"><%tcWebApi_multilingual("1","read_access_str")%></span></TD>
		<TD nowrap><span class="thead"><%tcWebApi_multilingual("1","write_access_str")%></span></TD>
		<TD nowrap><span class="thead"><%tcWebApi_multilingual("1","folder_name_str")%></span></TD>
		<TD nowrap><span class="thead"><%tcWebApi_multilingual("1","volume_name_str")%></span></TD>
		<TD nowrap><span class="thead"><%tcWebApi_multilingual("1","total_space_str")%></span></TD>
		<TD nowrap><span class="thead"><%tcWebApi_multilingual("1","free_space_str")%></span></TD>

	</TR>
<script>
var usb_sharefolder0="/*/mnt/sda1*1.95 GB*1.12 GB*USB_Storage*All - no password*All - no password*FAT*U*U Drive (1.95 GB)*USB_Storage*USB      Disk             ";
var fd_num_in_disk0=1; 
var list_disk_num=1;
var folder_number=1;
var not_shared_number=0;

function formatFloat(num, pos)
{
  var size = Math.pow(10, pos);
  return Math.round(num * size) / size;
}

//0-index,1-Active,2-ShareName,3-FolderName,4-VolumeName,5-TotoalSize,6-FreeSize,7-Read Access,8-Write Access,9-ShowIndex,10-Path,11-Original,12-SerialNumber,13-MountName
var usb_table = [
["1","<% if tcWebApi_get("USBStorage_Entry0","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry0","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry0","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry0","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry0","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry0","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry0","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry0","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry0","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry0","Path","s")%>","<%tcWebApi_get("USBStorage_Entry0","Original","s")%>","<%tcWebApi_get("USBStorage_Entry0","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry0","MountName","s")%>"],
["2","<% if tcWebApi_get("USBStorage_Entry1","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry1","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry1","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry1","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry1","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry1","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry1","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry1","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry1","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry1","Path","s")%>","<%tcWebApi_get("USBStorage_Entry1","Original","s")%>","<%tcWebApi_get("USBStorage_Entry1","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry1","MountName","s")%>"],
["3","<% if tcWebApi_get("USBStorage_Entry2","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry2","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry2","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry2","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry2","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry2","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry2","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry2","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry2","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry2","Path","s")%>","<%tcWebApi_get("USBStorage_Entry2","Original","s")%>","<%tcWebApi_get("USBStorage_Entry2","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry2","MountName","s")%>"],
["4","<% if tcWebApi_get("USBStorage_Entry3","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry3","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry3","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry3","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry3","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry3","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry3","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry3","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry3","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry3","Path","s")%>","<%tcWebApi_get("USBStorage_Entry3","Original","s")%>","<%tcWebApi_get("USBStorage_Entry3","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry3","MountName","s")%>"],
["5","<% if tcWebApi_get("USBStorage_Entry4","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry4","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry4","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry4","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry4","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry4","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry4","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry4","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry4","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry4","Path","s")%>","<%tcWebApi_get("USBStorage_Entry4","Original","s")%>","<%tcWebApi_get("USBStorage_Entry4","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry4","MountName","s")%>"],
["6","<% if tcWebApi_get("USBStorage_Entry5","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry5","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry5","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry5","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry5","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry5","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry5","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry5","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry5","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry5","Path","s")%>","<%tcWebApi_get("USBStorage_Entry5","Original","s")%>","<%tcWebApi_get("USBStorage_Entry5","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry5","MountName","s")%>"],
["7","<% if tcWebApi_get("USBStorage_Entry6","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry6","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry6","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry6","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry6","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry6","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry6","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry6","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry6","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry6","Path","s")%>","<%tcWebApi_get("USBStorage_Entry6","Original","s")%>","<%tcWebApi_get("USBStorage_Entry6","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry6","MountName","s")%>"],
["8","<% if tcWebApi_get("USBStorage_Entry7","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry7","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry7","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry7","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry7","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry7","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry7","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry7","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry7","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry7","Path","s")%>","<%tcWebApi_get("USBStorage_Entry7","Original","s")%>","<%tcWebApi_get("USBStorage_Entry7","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry7","MountName","s")%>"],
["9","<% if tcWebApi_get("USBStorage_Entry8","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry8","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry8","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry8","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry8","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry8","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry8","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry8","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry8","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry8","Path","s")%>","<%tcWebApi_get("USBStorage_Entry8","Original","s")%>","<%tcWebApi_get("USBStorage_Entry8","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry8","MountName","s")%>"],
["10","<% if tcWebApi_get("USBStorage_Entry9","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry9","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry9","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry9","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry9","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry9","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry9","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry9","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry9","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry9","Path","s")%>","<%tcWebApi_get("USBStorage_Entry9","Original","s")%>","<%tcWebApi_get("USBStorage_Entry9","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry9","MountName","s")%>"],
["11","<% if tcWebApi_get("USBStorage_Entry10","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry10","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry10","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry10","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry10","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry10","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry10","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry10","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry10","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry10","Path","s")%>","<%tcWebApi_get("USBStorage_Entry10","Original","s")%>","<%tcWebApi_get("USBStorage_Entry10","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry10","MountName","s")%>"],
["12","<% if tcWebApi_get("USBStorage_Entry11","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry11","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry11","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry11","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry11","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry11","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry11","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry11","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry11","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry11","Path","s")%>","<%tcWebApi_get("USBStorage_Entry11","Original","s")%>","<%tcWebApi_get("USBStorage_Entry11","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry11","MountName","s")%>"],
["13","<% if tcWebApi_get("USBStorage_Entry12","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry12","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry12","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry12","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry12","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry12","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry12","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry12","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry12","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry12","Path","s")%>","<%tcWebApi_get("USBStorage_Entry12","Original","s")%>","<%tcWebApi_get("USBStorage_Entry12","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry12","MountName","s")%>"],
["14","<% if tcWebApi_get("USBStorage_Entry13","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry13","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry13","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry13","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry13","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry13","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry13","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry13","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry13","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry13","Path","s")%>","<%tcWebApi_get("USBStorage_Entry13","Original","s")%>","<%tcWebApi_get("USBStorage_Entry13","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry13","MountName","s")%>"],
["15","<% if tcWebApi_get("USBStorage_Entry14","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry14","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry14","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry14","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry14","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry14","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry14","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry14","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry14","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry14","Path","s")%>","<%tcWebApi_get("USBStorage_Entry14","Original","s")%>","<%tcWebApi_get("USBStorage_Entry14","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry14","MountName","s")%>"],
["16","<% if tcWebApi_get("USBStorage_Entry15","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry15","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry15","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry15","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry15","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry15","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry15","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry15","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry15","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry15","Path","s")%>","<%tcWebApi_get("USBStorage_Entry15","Original","s")%>","<%tcWebApi_get("USBStorage_Entry15","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry15","MountName","s")%>"],
["17","<% if tcWebApi_get("USBStorage_Entry16","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry16","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry16","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry16","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry16","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry16","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry16","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry16","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry16","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry16","Path","s")%>","<%tcWebApi_get("USBStorage_Entry16","Original","s")%>","<%tcWebApi_get("USBStorage_Entry16","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry16","MountName","s")%>"],
["18","<% if tcWebApi_get("USBStorage_Entry17","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry17","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry17","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry17","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry17","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry17","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry17","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry17","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry17","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry17","Path","s")%>","<%tcWebApi_get("USBStorage_Entry17","Original","s")%>","<%tcWebApi_get("USBStorage_Entry17","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry17","MountName","s")%>"],
["19","<% if tcWebApi_get("USBStorage_Entry18","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry18","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry18","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry18","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry18","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry18","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry18","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry18","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry18","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry18","Path","s")%>","<%tcWebApi_get("USBStorage_Entry18","Original","s")%>","<%tcWebApi_get("USBStorage_Entry18","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry18","MountName","s")%>"],
["20","<% if tcWebApi_get("USBStorage_Entry19","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry19","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry19","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry19","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry19","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry19","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry19","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry19","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry19","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry19","Path","s")%>","<%tcWebApi_get("USBStorage_Entry19","Original","s")%>","<%tcWebApi_get("USBStorage_Entry19","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry19","MountName","s")%>"],
["21","<% if tcWebApi_get("USBStorage_Entry20","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry20","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry20","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry20","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry20","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry20","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry20","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry20","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry20","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry20","Path","s")%>","<%tcWebApi_get("USBStorage_Entry20","Original","s")%>","<%tcWebApi_get("USBStorage_Entry20","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry20","MountName","s")%>"],
["22","<% if tcWebApi_get("USBStorage_Entry21","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry21","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry21","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry21","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry21","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry21","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry21","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry21","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry21","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry21","Path","s")%>","<%tcWebApi_get("USBStorage_Entry21","Original","s")%>","<%tcWebApi_get("USBStorage_Entry21","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry21","MountName","s")%>"],
["23","<% if tcWebApi_get("USBStorage_Entry22","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry22","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry22","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry22","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry22","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry22","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry22","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry22","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry22","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry22","Path","s")%>","<%tcWebApi_get("USBStorage_Entry22","Original","s")%>","<%tcWebApi_get("USBStorage_Entry22","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry22","MountName","s")%>"],
["24","<% if tcWebApi_get("USBStorage_Entry23","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry23","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry23","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry23","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry23","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry23","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry23","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry23","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry23","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry23","Path","s")%>","<%tcWebApi_get("USBStorage_Entry23","Original","s")%>","<%tcWebApi_get("USBStorage_Entry23","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry23","MountName","s")%>"],
["25","<% if tcWebApi_get("USBStorage_Entry24","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry24","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry24","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry24","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry24","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry24","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry24","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry24","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry24","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry24","Path","s")%>","<%tcWebApi_get("USBStorage_Entry24","Original","s")%>","<%tcWebApi_get("USBStorage_Entry24","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry24","MountName","s")%>"],
];

var prefolder;
function write_usb_table(i,t,org,fd_num_in_disk)
{
	if( i%2== 0 )
        document.write("<TR class=\"even_line\">");
    else
        document.write("<TR class=\"odd_line\">");
        
    if( usb_table[t][2] == "Not Shared" )
		document.write('<TD nowrap>'+'<%tcWebApi_multilingual("1","not_shared_str")%>'+'</TD>');
    else{
        /*if(isIE())
			document.write('<TD nowrap><a class="linktype" href="\\\\'+show_deviceName+'\\'+"unknow"+'" target="_blank">\\\\'+show_deviceName+'\\'+usb_table[t][2]+'</a></TD>');
        else if( get_browser() == "Safari")
			document.write('<TD nowrap><a class="linktype" href="smb://'+show_lanip+'\\'+"unknow"+'">\\\\'+show_deviceName+'\\'+usb_table[t][2]+'</a></TD>');
        else*/
			document.write('<TD nowrap>\\\\'+show_deviceName+'\\'+usb_table[t][2]+'</TD>');
    }
	if(usb_table[t][7]=="0")	
		document.write('<TD nowrap>'+access_admin_str+'</TD>');				
	else
		document.write('<TD nowrap>'+access_all_no_password_str+'</TD>');				
		
	if(usb_table[t][8]=="0")	
		document.write('<TD nowrap>'+access_admin_str+'</TD>');				
	else
		document.write('<TD nowrap>'+access_all_no_password_str+'</TD>');
		
	if(usb_table[t][10]!="N/A" || usb_table[t][10]!="")	
		document.write('<TD nowrap>'+prefolder+':\\'+usb_table[t][10]+'</TD>');
	else	
		document.write('<TD nowrap>'+prefolder+':\\</TD>');
		
	var totalsize_unit_str="";
	if(parseInt(usb_table[t][5],10)/(1024*1024) > 0)
		totalsize_unit_str = formatFloat(parseInt(usb_table[t][5],10)/(1024*1024),1) + 'G';
	else if(parseInt(usb_table[t][5],10)/1024>0)
		totalsize_unit_str = formatFloat(parseInt(usb_table[t][5],10)/1024,1) + 'M';
	else	
		totalsize_unit_str = usb_table[t][5];
			
	var freesize_unit_str="";
	if(parseInt(usb_table[t][6],10)/(1024*1024)>0)
		freesize_unit_str = formatFloat(parseInt(usb_table[t][6],10)/(1024*1024),1) + 'G';
	else if(parseInt(usb_table[t][6],10)/1024>0)
		freesize_unit_str = formatFloat(parseInt(usb_table[t][6],10)/1024,1) + 'M';
	else
		freesize_unit_str = usb_table[t][6];	
				
	if( org == 1 ){	
		document.write('<td nowrap="nowrap" rowspan='+fd_num_in_disk+'>'+usb_table[t][4]+'('+totalsize_unit_str+')</td>');
		document.write('<td nowrap="nowrap" rowspan='+fd_num_in_disk+'>'+totalsize_unit_str+'</td>');
		document.write('<td nowrap="nowrap" rowspan='+fd_num_in_disk+'>'+freesize_unit_str+'</td>');
	}
    document.write('</TR>');
}

function get_fd_number(serialnum)
{
	var res=0;
	var n;
	for(n=0;n<25;n++)
	{
		if(usb_table[n][1]=="Yes" && usb_table[n][12]==serialnum)
		{
			res++;
		}
	}
	return res;
}

var i,j;
var count=0;
var showIdx;
for(showIdx=0;showIdx<25;showIdx++)
{
	for(i=0;i<25;i++)
	{
		if(usb_table[i][1]=="Yes" && showIdx==parseInt(usb_table[i][9]) && usb_table[i][11]=="1")
		{	
			fd_num_in_disk = get_fd_number(usb_table[i][12]);
			prefolder = usb_table[i][3];
			write_usb_table(count,i,1,fd_num_in_disk);
			for(j=0;j<25;j++)
			{
				if(i==j)
					continue;
				if(usb_table[j][1]=="Yes" && usb_table[i][12]==usb_table[j][12] && usb_table[j][11]!="1")
				{
					write_usb_table(count,j,0,0);
				}
			}
			count++;
		}	
	}	
}
device_num = count;

function refreshpage1()
{
	location.href = "USB_basic.asp";
}
</script>
	
	</TABLE>
</TD></TR>
<TR><TD colspan=2>&nbsp;</TD></TR>
<TR><TD colspan=2 >
<input class="edit_bt" type="button" name="edit" id="edit" value="<%tcWebApi_multilingual("0","glbstr_edit")%>" onClick='usb_redirect();'>
</TD></TR>
<script>
// onClick='location.href="USB_advanced.asp";'
function usb_redirect()
{
var cf=document.forms[0];

location.href="USB_advanced.asp";
if(top.location.href.indexOf("adv_index.asp") != -1)
   menu_color_change('usb_adv');
//top.location.href="adv_index.asp";
}
</script>	
<TR><TD colspan=2>&nbsp;</TD></TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100%% height=12></TD></TR>
<TR><TD colspan=2>&nbsp;</TD></TR>
<TR><TD colspan=2>

<script>
	if(device_num == 0 )
		document.write('<input class="long_common_gray_bt" type="button" name="safeRemove" id="safely_remove" value=" '+safely_remove_usb_str+' " disabled >');
	else
		document.write('<input class="long_common_bt" type="button" name="safeRemove" id="safely_remove" value=" '+safely_remove_usb_str+' " onClick=\'remove_disk(document.forms[0]);\'>');
</script>	

<!--input class="long_common_bt" type="button" name="safeRemove" value=" <%tcWebApi_multilingual("1","safely_remove_usb_str")%> " onClick='remove_disk(document.forms[0]);'-->

</TD></TR>
<TR><TD colspan=2>&nbsp;</TD></TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100%% height=12></TD></TR>
<TR><TD colspan=2>&nbsp;</TD></TR>
<TR><TD colspan=2>
<input class="short_common_bt" type="submit" name="Refresh" id="refresh" value=" <%tcWebApi_multilingual("0","glbstr_refresh")%> " onClick='refreshpage1();'>
</TD></TR>

</TABLE>
</div>
<%tcWebApi_multilingual("2","_USB_basic_help.asp")%>
</FORM>
</BODY>
</HTML>

