<%
if request_Form("submit_flag") = "sharefolder_creat" then
	tcWebApi_set("USBStorage_Common","Action","USBSTORAGEACTION_ADDOLD")
	tcWebApi_set("USBStorage_Common","SelectedId","USB_INDEX")
	tcWebApi_set("USBStorage_Common","Path","folderPath")
	tcWebApi_set("USBStorage_Common","ShareName","shareName")
	tcWebApi_set("USBStorage_Common","ReadAccess","readAccessTmp")
	tcWebApi_set("USBStorage_Common","WriteAccess","writeAccessTmp")
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
<form method="POST" action="/cgi-bin/USB_Folder_creat.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="sharefolder_creat">

<div class="page_title"><%tcWebApi_multilingual("1","create_network_folder_str")%></div>
<div id="main" class="main">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>


<script>
<% If request_Form("submit_flag") = "sharefolder_creat" then %>
	//opener.parent.formframe.location.reload();
	opener.parent.formframe.location.href="USB_advanced.asp";
	window.close();
<% End if %>


<% If request_Form("submit_flag") = "open_browser_window" then %>
	window.open('USB_browse.asp','browse','resizable=0,scrollvars=yes,width=400,height=400,left=400,top=300').focus();
<% End if %>

var getMountIndex=location.href.indexOf("index");
var num=location.href.substr(getMountIndex+6);
var ts="<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";

<!--
var usb_sharefolder0="/*/mnt/sda1*1.95 GB*1.12 GB*USB_Storage*All - no password*All - no password*FAT*U*U Drive (1.95 GB)*USB_Storage*USB      Disk             ";
var fd_num_in_disk0=1; 
var list_disk_num=1;
var folder_number=1;
var not_shared_number=0;

var sda_U0="/mnt/sda1*U";
var sda_num=1;


var noThisPath = 1;

if( noThisPath == 0 )
{
	alert("<%tcWebApi_multilingual("1","alert_folder_not_exist_str")%>.");
}

function openwindow()
{
	window.open('USB_browse.asp','browse','resizable=0,scrollvars=yes,width=400,height=400,left=400,top=300').focus();
}

function loadvalue()
{
	var form=document.forms[0];
}
function click_creat()
{
	var form = document.forms[0];
	
	//Get Index
	var get_id = document.getElementById('usb_device');
    var result = get_id.options[get_id.selectedIndex].value;
	form.USB_INDEX.value = result;
	
/*	if( form.folder.value.checkFolder()){
		alert("Folder can not contain  \" : < > ' |\/ ");
		return false;
	} */
	if( form.shareName.value.checkShareName()){
		alert("<%tcWebApi_multilingual("1","alert_share_name_not_contain_str")%>");
		return false;
	}
	
	//delete all the space at the begainning and the end of the foler name.
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
	
	if(typeof(form.folder.value.split("\\")[1])=="undefined")
	{
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
		if(  form.shareName.value.toLowerCase() == each_info[4].toLowerCase() ){
			alert("<%tcWebApi_multilingual("1","alert_share_name_already_exist_str")%>");
			return false;
		}
	}*/
	if(form.readAccess.value == 1 && form.writeAccess.value == 0){
		alert("<%tcWebApi_multilingual("1","alert_read_access_not_be_set_same_time_str")%>");
		return false;
	}
		
    /*var info=form.folder.value.replace(/\\/g,"\/").split(":");
    var device_lable=info[0].toUpperCase();
	if(form.usbDevice.value != device_lable){
		var war="Folder "+form.folder.value+" is not in USB Device "+form.usbDevice.value;
		alert(war);
		return false;
	}*/

	if(form.readAccess.value==1)
		form.readAccessTmp.value="0";
	else
		form.readAccessTmp.value="1";
		
	if(form.writeAccess.value==1)
		form.writeAccessTmp.value="0";
	else
		form.writeAccessTmp.value="1";	
		
	form.submit_flag.value="sharefolder_creat";
	form.action= "/cgi-bin/USB_Folder_creat.asp?id="+form.tshidden.value;
	form.submit();
	//opener.parent.formframe.location.reload();
//	close_window();
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

function write_select_options(entryid)
{
	var diskname = usb_table[entryid][3];
	var totalsize_unit_str="";
	if(parseInt(usb_table[entryid][5],10)/(1024*1024) > 0)
		totalsize_unit_str = formatFloat(parseInt(usb_table[entryid][5],10)/(1024*1024),1) + 'G';
	else if(parseInt(usb_table[entryid][5],10)/1024>0)
		totalsize_unit_str = formatFloat(parseInt(usb_table[entryid][5],10)/1024,1) + 'M';
	else	
		totalsize_unit_str = usb_table[entryid][5];
	if(entryid==num)
		document.write('<option value=\"'+entryid+'\" selected>'+diskname+': ( '+diskname+' Drive ('+totalsize_unit_str+') )</option>');
	else
		document.write('<option value=\"'+entryid+'\">'+diskname+': ( '+diskname+' Drive ('+totalsize_unit_str+') )</option>');
}

function openBrowse()
{
	var form = document.forms[0];
	var full_mount_name;
	var index = form.usbDevice.value;
	
	var diskname = usb_table[index][3];
	var totalsize_unit_str="";
	if(parseInt(usb_table[index][5],10)/(1024*1024) > 0)
		totalsize_unit_str = formatFloat(parseInt(usb_table[index][5],10)/(1024*1024),1) + 'G';
	else if(parseInt(usb_table[index][5],10)/1024>0)
		totalsize_unit_str = formatFloat(parseInt(usb_table[index][5],10)/1024,1) + 'M';
	else	
		totalsize_unit_str = usb_table[index][5];
	
	full_mount_name = "/tmp/shares/"+usb_table[index][2];
 
    form.submit_flag.value="open_browser_window";
	form.CURRMOUNT.value= full_mount_name;
	form.CurrMountName.value=usb_table[index][3]+' Drive ('+totalsize_unit_str+')';
	form.MountIdx.value =num;
	form.action="/cgi-bin/USB_Folder_creat.asp?id="+form.tshidden.value+"&index="+num;
    form.submit();
//	setTimeout("openwindow()",500);	
	//window.open('USB_browse.asp','browse','resizable=0,scrollvars=yes,width=400,height=400,left=400,top=300').focus();
}

function switch_device()
{
	var form = document.forms[0];
	var index = form.usbDevice.value;
	location.href = "USB_Folder_creat.asp?index="+index;
}
</script>
<input type=hidden name=folderPath>
<input type=hidden name=devicePath>
<input type=hidden name=USB_INDEX>
<input type=hidden name=USBSTORAGEACTION_ADDOLD value="1">
<input type=hidden name=readAccessTmp>
<input type=hidden name=writeAccessTmp>
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
		<TD nowrap><span class="ttext">
			<select name="usbDevice" id="usb_device" size="1" onchange="switch_device()">
			<script>
				var showIdx;
				for(showIdx=0;showIdx<25;showIdx++)
				{
					for(i=0;i<25;i++)
					{
						if(usb_table[i][1]=="Yes" && usb_table[i][11]=="1" && showIdx==parseInt(usb_table[i][9]))
						{	
							write_select_options(i);
						}	
					}	
				}
			</script>
			</select>
		</span>	</TD>
	</TR>
	<TR>
		<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","folder_str")%></span></TD>	
		<TD nowrap><span class="ttext">
			<input type="text" name="folder" id="folder" value="" size=20 >
			<input class="short_common_bt" type="button" name="browse" id="browse" value="Browse" onClick='openBrowse();'>
		</span></TD>
	</TR>
	<TR>
		<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","share_name_str")%></span></TD>
		<TD nowrap><span class="ttext">
			<input type="text" name="shareName" id="share_name" value="" size=20 maxlength="20" onKeyPress="return getkey('shareName', event)">
		</span></TD>
	</TR>
	<TR>
		<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","read_access_str")%></span></TD>
		<TD nowrap><span class="ttext">
			<select name="readAccess" id="read_access" size="1" onchange="set_read(document.forms[0],this.value);">
				<option value="0"><%tcWebApi_multilingual("1","all_no_password_str")%></option>
				<option value="1"><%tcWebApi_multilingual("1","admin_str")%></option>
			</select>	
		</span></TD>
	</TR>
	<TR>
		<TD nowrap align=center><span class="thead"><%tcWebApi_multilingual("1","write_access_str")%></span></TD>
		<TD nowrap><span class="ttext">
			<select name="writeAccess" id="write_access" size="1" onchange="set_write(document.forms[0],this.value);">
				<option value="0"><%tcWebApi_multilingual("1","all_no_password_str")%></option>
				<option value="1"><%tcWebApi_multilingual("1","admin_str")%></option>
		</span></TD>
	</TR>
	</TABLE>
</TD></TR>

<TR><TD colspan=2>&nbsp;</TD></TR>
<TR><TD colspan=2 align="center">
<input class="apply_bt" type="button" name="Apply" id="apply" value="  <%tcWebApi_multilingual("0","glbstr_apply")%>  " onClick='click_creat();'>
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
