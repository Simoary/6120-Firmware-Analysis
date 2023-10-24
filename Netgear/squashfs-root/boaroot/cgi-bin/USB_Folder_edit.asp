<%
if request_Form("submit_flag") = "sharefolder_edit" then
	tcWebApi_set("USBStorage_Common","Action","USBSTORAGEACTION_EDIT")
	tcWebApi_set("USBStorage_Common","SelectedId","USB_INDEX")
	tcWebApi_set("USBStorage_Common","Path","folderPath")
	tcWebApi_set("USBStorage_Common","ShareName","shareName")
	tcWebApi_set("USBStorage_Common","ReadAccess","readAccessTmp")
	tcWebApi_set("USBStorage_Common","WriteAccess","writeAccessTmp")
	tcWebApi_set("USBStorage_Common","MountName","MountName")
	tcWebApi_commit("USBStorage_Entry")
	tcWebApi_commit("Samba_Entry")
	tcWebApi_commit("Ftp_Entry")
elseif 	request_Form("submit_flag") = "open_browser_window" then
	tcWebApi_set("FolderTree_Common","Action","NOTHING")
	tcWebApi_set("FolderTree_Common","CurrMount","CURRMOUNT")
	tcWebApi_set("FolderTree_Common","NodeNumber","nodenumber")
	tcWebApi_set("FolderTree_Common","CurrMountName","CurrMountName")
	tcWebApi_set("FolderTree_Common","MountIdx","MountIdx")
	tcWebApi_commit("FolderTree_Entry")
end if
%>

<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/USB_NETStorage.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/USB_Folder_edit.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="sharefolder_edit">

<div class="page_title"><%tcWebApi_multilingual("1","edit_network_folder_str")%></div>
<div id="main" class="main">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<script>
<% If request_Form("submit_flag") = "sharefolder_edit" then %>
	opener.parent.formframe.location.reload();
	window.close();
<% End if %>

<% If request_Form("submit_flag") = "open_browser_window" then %>
	window.open('USB_browse.asp','browse','resizable=0,scrollvars=yes,width=400,height=400,left=400,top=300').focus();
<% End if %>

<!--
var getEditNum=location.href.indexOf("editFolderID");
var num=location.href.substr(getEditNum+13);
var usb_sharefolder0="/*/mnt/sda1*1.95 GB*1.12 GB*USB_Storage*All - no password*All - no password*FAT*U*U Drive (1.95 GB)*USB_Storage*USB      Disk             ";
var fd_num_in_disk0=1; 
var list_disk_num=1;
var folder_number=1;
var not_shared_number=0;

var sda_U0="/mnt/sda1*U";
var sda_num=1;

/*---check last time the saved folder path is real or not ----------*/
var noThisPath = 1;
var File_system = "FAT";

var ts='<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>';
if( noThisPath == 0 )
{
	alert("<%tcWebApi_multilingual("1","alert_folder_not_exist_str")%>");
}
    
//0-index,1-Active,2-ShareName,3-FolderName,4-VolumeName,5-TotoalSize,6-FreeSize,7-Read Access,8-Write Access,9-ShowIndex,10-Path,11-Original,12-SerialNumber,13-MountName,14-MountType
var usb_table = [
["1","<% if tcWebApi_get("USBStorage_Entry0","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry0","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry0","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry0","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry0","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry0","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry0","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry0","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry0","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry0","Path","s")%>","<%tcWebApi_get("USBStorage_Entry0","Original","s")%>","<%tcWebApi_get("USBStorage_Entry0","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry0","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry0","MountType","s")%>"],
["2","<% if tcWebApi_get("USBStorage_Entry1","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry1","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry1","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry1","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry1","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry1","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry1","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry1","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry1","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry1","Path","s")%>","<%tcWebApi_get("USBStorage_Entry1","Original","s")%>","<%tcWebApi_get("USBStorage_Entry1","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry1","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry1","MountType","s")%>"],
["3","<% if tcWebApi_get("USBStorage_Entry2","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry2","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry2","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry2","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry2","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry2","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry2","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry2","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry2","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry2","Path","s")%>","<%tcWebApi_get("USBStorage_Entry2","Original","s")%>","<%tcWebApi_get("USBStorage_Entry2","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry2","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry2","MountType","s")%>"],
["4","<% if tcWebApi_get("USBStorage_Entry3","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry3","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry3","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry3","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry3","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry3","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry3","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry3","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry3","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry3","Path","s")%>","<%tcWebApi_get("USBStorage_Entry3","Original","s")%>","<%tcWebApi_get("USBStorage_Entry3","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry3","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry3","MountType","s")%>"],
["5","<% if tcWebApi_get("USBStorage_Entry4","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry4","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry4","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry4","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry4","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry4","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry4","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry4","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry4","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry4","Path","s")%>","<%tcWebApi_get("USBStorage_Entry4","Original","s")%>","<%tcWebApi_get("USBStorage_Entry4","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry4","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry4","MountType","s")%>"],
["6","<% if tcWebApi_get("USBStorage_Entry5","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry5","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry5","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry5","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry5","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry5","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry5","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry5","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry5","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry5","Path","s")%>","<%tcWebApi_get("USBStorage_Entry5","Original","s")%>","<%tcWebApi_get("USBStorage_Entry5","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry5","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry5","MountType","s")%>"],
["7","<% if tcWebApi_get("USBStorage_Entry6","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry6","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry6","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry6","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry6","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry6","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry6","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry6","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry6","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry6","Path","s")%>","<%tcWebApi_get("USBStorage_Entry6","Original","s")%>","<%tcWebApi_get("USBStorage_Entry6","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry6","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry6","MountType","s")%>"],
["8","<% if tcWebApi_get("USBStorage_Entry7","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry7","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry7","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry7","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry7","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry7","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry7","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry7","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry7","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry7","Path","s")%>","<%tcWebApi_get("USBStorage_Entry7","Original","s")%>","<%tcWebApi_get("USBStorage_Entry7","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry7","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry7","MountType","s")%>"],
["9","<% if tcWebApi_get("USBStorage_Entry8","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry8","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry8","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry8","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry8","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry8","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry8","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry8","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry8","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry8","Path","s")%>","<%tcWebApi_get("USBStorage_Entry8","Original","s")%>","<%tcWebApi_get("USBStorage_Entry8","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry8","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry8","MountType","s")%>"],
["10","<% if tcWebApi_get("USBStorage_Entry9","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry9","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry9","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry9","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry9","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry9","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry9","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry9","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry9","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry9","Path","s")%>","<%tcWebApi_get("USBStorage_Entry9","Original","s")%>","<%tcWebApi_get("USBStorage_Entry9","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry9","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry9","MountType","s")%>"],
["11","<% if tcWebApi_get("USBStorage_Entry10","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry10","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry10","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry10","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry10","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry10","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry10","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry10","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry10","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry10","Path","s")%>","<%tcWebApi_get("USBStorage_Entry10","Original","s")%>","<%tcWebApi_get("USBStorage_Entry10","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry10","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry10","MountType","s")%>"],
["12","<% if tcWebApi_get("USBStorage_Entry11","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry11","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry11","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry11","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry11","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry11","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry11","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry11","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry11","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry11","Path","s")%>","<%tcWebApi_get("USBStorage_Entry11","Original","s")%>","<%tcWebApi_get("USBStorage_Entry11","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry11","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry11","MountType","s")%>"],
["13","<% if tcWebApi_get("USBStorage_Entry12","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry12","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry12","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry12","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry12","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry12","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry12","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry12","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry12","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry12","Path","s")%>","<%tcWebApi_get("USBStorage_Entry12","Original","s")%>","<%tcWebApi_get("USBStorage_Entry12","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry12","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry12","MountType","s")%>"],
["14","<% if tcWebApi_get("USBStorage_Entry13","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry13","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry13","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry13","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry13","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry13","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry13","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry13","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry13","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry13","Path","s")%>","<%tcWebApi_get("USBStorage_Entry13","Original","s")%>","<%tcWebApi_get("USBStorage_Entry13","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry13","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry13","MountType","s")%>"],
["15","<% if tcWebApi_get("USBStorage_Entry14","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry14","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry14","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry14","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry14","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry14","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry14","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry14","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry14","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry14","Path","s")%>","<%tcWebApi_get("USBStorage_Entry14","Original","s")%>","<%tcWebApi_get("USBStorage_Entry14","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry14","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry14","MountType","s")%>"],
["16","<% if tcWebApi_get("USBStorage_Entry15","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry15","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry15","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry15","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry15","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry15","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry15","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry15","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry15","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry15","Path","s")%>","<%tcWebApi_get("USBStorage_Entry15","Original","s")%>","<%tcWebApi_get("USBStorage_Entry15","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry15","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry15","MountType","s")%>"],
["17","<% if tcWebApi_get("USBStorage_Entry16","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry16","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry16","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry16","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry16","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry16","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry16","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry16","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry16","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry16","Path","s")%>","<%tcWebApi_get("USBStorage_Entry16","Original","s")%>","<%tcWebApi_get("USBStorage_Entry16","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry16","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry16","MountType","s")%>"],
["18","<% if tcWebApi_get("USBStorage_Entry17","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry17","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry17","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry17","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry17","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry17","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry17","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry17","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry17","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry17","Path","s")%>","<%tcWebApi_get("USBStorage_Entry17","Original","s")%>","<%tcWebApi_get("USBStorage_Entry17","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry17","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry17","MountType","s")%>"],
["19","<% if tcWebApi_get("USBStorage_Entry18","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry18","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry18","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry18","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry18","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry18","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry18","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry18","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry18","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry18","Path","s")%>","<%tcWebApi_get("USBStorage_Entry18","Original","s")%>","<%tcWebApi_get("USBStorage_Entry18","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry18","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry18","MountType","s")%>"],
["20","<% if tcWebApi_get("USBStorage_Entry19","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry19","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry19","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry19","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry19","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry19","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry19","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry19","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry19","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry19","Path","s")%>","<%tcWebApi_get("USBStorage_Entry19","Original","s")%>","<%tcWebApi_get("USBStorage_Entry19","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry19","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry19","MountType","s")%>"],
["21","<% if tcWebApi_get("USBStorage_Entry20","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry20","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry20","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry20","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry20","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry20","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry20","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry20","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry20","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry20","Path","s")%>","<%tcWebApi_get("USBStorage_Entry20","Original","s")%>","<%tcWebApi_get("USBStorage_Entry20","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry20","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry20","MountType","s")%>"],
["22","<% if tcWebApi_get("USBStorage_Entry21","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry21","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry21","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry21","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry21","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry21","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry21","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry21","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry21","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry21","Path","s")%>","<%tcWebApi_get("USBStorage_Entry21","Original","s")%>","<%tcWebApi_get("USBStorage_Entry21","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry21","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry21","MountType","s")%>"],
["23","<% if tcWebApi_get("USBStorage_Entry22","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry22","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry22","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry22","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry22","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry22","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry22","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry22","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry22","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry22","Path","s")%>","<%tcWebApi_get("USBStorage_Entry22","Original","s")%>","<%tcWebApi_get("USBStorage_Entry22","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry22","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry22","MountType","s")%>"],
["24","<% if tcWebApi_get("USBStorage_Entry23","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry23","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry23","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry23","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry23","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry23","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry23","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry23","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry23","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry23","Path","s")%>","<%tcWebApi_get("USBStorage_Entry23","Original","s")%>","<%tcWebApi_get("USBStorage_Entry23","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry23","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry23","MountType","s")%>"],
["25","<% if tcWebApi_get("USBStorage_Entry24","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry24","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry24","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry24","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry24","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry24","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry24","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry24","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry24","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry24","Path","s")%>","<%tcWebApi_get("USBStorage_Entry24","Original","s")%>","<%tcWebApi_get("USBStorage_Entry24","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry24","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry24","MountType","s")%>"],
];


var i=0;
var entryId=num;

var totalsize_unit_str;	
var UsbDevice;
var foldername_parent;
var mount_name;
for(j=0;j<25;j++)	
{
	if(usb_table[entryId][12] == usb_table[j][12])
	{
		//Find the index and fill the value
		if(parseInt(usb_table[j][5],10)/(1024*1024) > 0)
			totalsize_unit_str = formatFloat(parseInt(usb_table[j][5],10)/(1024*1024),1) + 'G';
		else if(parseInt(usb_table[j][5],10)/1024>0)
			totalsize_unit_str = formatFloat(parseInt(usb_table[j][5],10)/1024,1) + 'M';
		else	
			totalsize_unit_str = usb_table[j][5];
					
		UsbDevice = usb_table[j][4]+'('+totalsize_unit_str+')';

		if(usb_table[j][10]!="N/A" && usb_table[j][10]!="")	
			foldername_parent=usb_table[j][3]+":\\"+usb_table[j][10];
		else	
			foldername_parent=usb_table[j][3]+":\\";
			
		mount_name = usb_table[j][13];
		File_system = usb_table[j][14];
		break;	
	}
}

	
/*Return 0-available,1-already used*/	
function check_shareName_available(entryid,cur_sharename)
{
	var n;
	for(n=0;n<25;n++)
	{
		if(n==entryid)
			continue;
		if(usb_table[n][2].toLowerCase()==cur_sharename.toLowerCase())
			return 1;
	}
	
	return 0;
}
	
function getParentEntryId(child_serial)	
{
	for(i=0;i<25;i++)
	{
		if(usb_table[i][12]==child_serial && usb_table[i][5]!="")
		{
			return i;	
		}
	}
}
	
function openBrowse()
{
	var form = document.forms[0];
	var full_mount_name;	
	var totalsize_unit_str="";
	
	if(usb_table[entryId][5]=="N/A")
	{
		entryId = getParentEntryId(usb_table[entryId][12]);
	}
	if(parseInt(usb_table[entryId][5],10)/(1024*1024) > 0)
		totalsize_unit_str = formatFloat(parseInt(usb_table[entryId][5],10)/(1024*1024),1) + 'G';
	else if(parseInt(usb_table[entryId][5],10)/1024>0)
		totalsize_unit_str = formatFloat(parseInt(usb_table[entryId][5],10)/1024,1) + 'M';
	else	
		totalsize_unit_str = usb_table[entryId][5];
	
	full_mount_name = "/tmp/shares/"+usb_table[entryId][2];
 
    form.submit_flag.value="open_browser_window";
	form.CURRMOUNT.value= full_mount_name;
	form.CurrMountName.value=usb_table[entryId][3]+' Drive ('+totalsize_unit_str+')';
	form.action="/cgi-bin/USB_Folder_edit.asp?id="+form.tshidden.value+"&editFolderID="+num;
    form.submit();
	//window.open('USB_browse.asp','browse','resizable=0,scrollvars=yes,width=400,height=400,left=400,top=300').focus();
}
function change_type(str)
{
	var info=str.split("/");
	var root_path="/"+info[1]+"/"+info[2]+"/"+info[3]+"";
	for(i=0;i<sda_num;i++){
		 var sda_str = eval('sda_U' + i);
		each_info = sda_str.split('*');
		if( root_path == each_info[0]){
			root_path=""+each_info[1]+":";
		 }
	}
	str=root_path;
	for(j=4;j<info.length;j++){
		str=""+str+"/"+info[j]+"";
	}
	var path=str.replace(/\//g,"\\");

}
function loadvalue()
{
	var form=document.forms[0];
		
	if(usb_table[entryId][11]=='0')
	{
		var diskname = foldername_parent.split(":")[0];
		if(usb_table[entryId][10]!="N/A" && usb_table[entryId][10]!="")		
			foldername_parent=diskname+":\\"+usb_table[entryId][10];
		else	
			foldername_parent=diskname+":\\";
	}
				
	form.folder.value=foldername_parent;
	form.shareName.value=usb_table[entryId][2];

	if(usb_table[entryId][7]=='1')
		form.readAccess[0].selected=true;
	else
		form.readAccess[1].selected=true;
		
	if(usb_table[entryId][8]=='1')
		form.writeAccess[0].selected=true;
	else	
		form.writeAccess[1].selected=true;
}
function reload()
{
	opener.parent.formframe.location.reload();
}
function click_edit()
{
	var form = document.forms[0];

	form.USB_INDEX.value = entryId;
	
/*	if( form.folder.value.checkFolder()){
		alert("Folder can not contain  \" : < > ' |\/ ");
		return false;
	} */
	if( form.shareName.value.checkShareName()){
		alert("<%tcWebApi_multilingual("1","alert_share_name_not_contain_str")%>");
		return false;
	}

	form.folder.value = form.folder.value.replace(/(^\s*)/g, "");
	form.folder.value = delete_end_space(form.folder.value);
	if( form.folder.value == ""){
		alert("<%tcWebApi_multilingual("1","alert_folder_not_be_null_str")%>");
		return false;
	}
	var upfolder="\\.";
	if( form.folder.value.indexOf(upfolder) > -1 ){
		alert("<%tcWebApi_multilingual("1","alert_invalid_folder_path_str")%>");
		return false;
	}
	form.folderPath.value = form.folder.value.split("\\")[1];
	
	form.shareName.value = form.shareName.value.replace(/(^\s*)/g, "");
	form.shareName.value = delete_end_space(form.shareName.value);
	if( form.shareName.value == ""){
		alert("<%tcWebApi_multilingual("1","alert_share_name_not_be_empty_str")%>");
		return false;
	}
	if( form.shareName.value == "Not Shared" ){
		alert("<%tcWebApi_multilingual("1","alert_not_shared_is_not_allowed_str")%>");
		return false;
	}
	
	/*for( i=0; i < folder_number ; i++ ){
		var str = eval( 'usb_sharefolder' + i );
		each_info = str.split('*');
		if( i != num &&  form.shareName.value.toLowerCase() == each_info[4].toLowerCase() ){
			alert("<%tcWebApi_multilingual("1","alert_share_name_already_exist_str")%>");
			return false;
		}
	}*/
	
	if(check_shareName_available(entryId,form.shareName.value)==1)
	{	
		alert("<%tcWebApi_multilingual("1","alert_share_name_already_exist_str")%>");
		return false;
	}
	
	if(form.readAccess.value == 1 && form.writeAccess.value == 0){
		alert("<%tcWebApi_multilingual("1","alert_read_access_not_be_set_same_time_str")%>");
		return false;
	}

	if(form.readAccess.value==1)
		form.readAccessTmp.value="0";
	else
		form.readAccessTmp.value="1";
		
	if(form.writeAccess.value==1)
		form.writeAccessTmp.value="0";
	else
		form.writeAccessTmp.value="1";	
		
	form.MountName.value = 	mount_name;
		
	 /*	----change path----       */
	/* Temparory mark this.
	var info=form.folder.value.replace(/\\/g,"\/").split(":");
	var device_lable=info[0].toUpperCase();
	if( deviceLable != device_lable){
		var war="<%tcWebApi_multilingual("1","folder_str")%> "+form.folder.value+"<%tcWebApi_multilingual("1","is_not_in_usb_device_str")%>"+deviceLable;
		alert(war);
		return false;
	}
	*/			
	/*for(i=0; i<sda_num; i++){
		var sda_str = eval('sda_U' + i);
		each_info = sda_str.split('*');
		if( device_lable == each_info[1] ){
			info[0]=each_info[0];
		}
	}
	var str=""+info[0]+info[1]+"";
	form.folderPath.value=str;*/
	
	form.action= "/cgi-bin/USB_Folder_edit.asp?id="+form.tshidden.value;
	form.submit();
	//opener.parent.formframe.location.reload();
}
-->

</script>
<input type=hidden name=folderPath>
<input type=hidden name=old_shareName>
<input type=hidden name=devicePath>
<input type=hidden name=volumeName>
<input type=hidden name=deviceName>
<input type=hidden name=USB_INDEX>
<input type=hidden name=USBSTORAGEACTION_EDIT value="3">
<input type=hidden name=readAccessTmp>
<input type=hidden name=writeAccessTmp>
<input type=hidden name=MountName>
<input type=hidden name=CURRMOUNT>
<input type=hidden name=CurrMountName>
<input type=hidden name=NOTHING>
<input type=hidden name=nodenumber value="1">
<input type=hidden name=MountIdx>
<input type=hidden name=tshidden value="<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<TR><TD colspan=2>
	<TABLE border ="1" cellpadding ="2" cellspacing ="0" width="100%">
	<TR>
		<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","usb_device_str")%></span></TD>
		<TD nowrap id="usb_device" name="usbDevice"><span class="ttext">
		<script>document.write(UsbDevice)</script>
		</span>	</TD>
	</TR>
        <TR>
                <TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","file_system_str")%></span></TD>
                <TD nowrap ><span class="ttext">
		<script>document.write(File_system)</script>
                </span> </TD>
        </TR>

	<TR>
		<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","folder_str")%></span></TD>	
		<TD nowrap><span class="ttext">
			<input type="text" name="folder" id="folder" size=20 >
			<input class="short_common_bt" type="button" name="browse" id="browse" value="Browse" onClick='openBrowse();'>
		</span></TD>
	</TR>
	<TR>
		<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","share_name_str")%></span></TD>
		<TD nowrap><span class="ttext">
			<input type="text" name="shareName" id="share_name" value="" size=20 maxlength="15" onKeyPress=" return getkey('shareName', event)">
		</span></TD>
	</TR>
	<TR>
		<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","read_access_str")%></span></TD>
		<TD nowrap><span class="ttext">
			<select name="readAccess" id="read_access" size="1" onchange="set_read(document.forms[0],this.value);">
				<option value="0" selected><%tcWebApi_multilingual("1","all_no_password_str")%></option>
				<option value="1"><%tcWebApi_multilingual("1","admin_str")%></option>
			</select>	
		</span></TD>
	</TR>
	<TR>
		<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","write_access_str")%></span></TD>
		<TD nowrap><span class="ttext">
			<select name="writeAccess" id="write_access" size="1" onchange="set_write(document.forms[0],this.value);">
				<option value="0" selected><%tcWebApi_multilingual("1","all_no_password_str")%></option>
				<option value="1"><%tcWebApi_multilingual("1","admin_str")%></option>
		</span></TD>
	</TR>
	</TABLE>
</TD></TR>

<TR><TD colspan=2>&nbsp;</TD></TR>
<TR><TD colspan=2 align="center">
<input class="apply_bt" type="submit" name="Apply" id="apply" value="  <%tcWebApi_multilingual("0","glbstr_apply")%>  " onClick='click_edit();'>
</TD></TR>
<TR><TD colspan=2>&nbsp;</TD></TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100%% height=12></TD></TR>
<TR><TD colspan=2>&nbsp;</TD></TR>
<TR><TD colspan=2 align="center">
<input class="common_bt" type="button" name="Close" id="close" value="  <%tcWebApi_multilingual("1","close_window_str")%>  " onClick='close_window();'>
</TD></TR>
</TABLE>

</div>

</FORM>
</BODY>
</HTML>
