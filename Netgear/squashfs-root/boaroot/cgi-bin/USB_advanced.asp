<%
If Request_Form("submit_flag") = "USB_advanced" then	
	/* Samba */
	TCWebApi_set("Samba_Entry","Active","enable_samba_value")
	TCWebAPI_set("Samba_Entry","WorkGroup","deviceName")
	TCWebAPI_set("Samba_Entry","NetBiosName","workGroup")
	TCWebAPI_commit("Samba_Entry")
	
	/* FTP */
	TCWebApi_set("Ftp_Entry","LanAccess","enable_ftp_value")
	TCWebApi_set("Ftp_Entry","WanAccess","enable_wan_ftp_value")
	TCWebApi_set("Ftp_Entry","WanPort","ftp_via_port")
	TCWebAPI_commit("Ftp_Entry")
	
	/* WFTP */
	
	/* Remote management */
	TCWebAPI_commit("RemoteManager_Entry")
	
elseif	Request_Form("submit_flag") = "sharefolder_delete" then
	tcWebApi_set("USBStorage_Common","Action","USBSTORAGEACTION_DELETE")
	tcWebApi_set("USBStorage_Common","SelectedId","USB_INDEX")
	tcWebApi_commit("USBStorage_Entry")
	tcWebApi_commit("Samba_Entry")
	tcWebApi_commit("Ftp_Entry")
End if
%>


<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/USB_NETStorage.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/USB_advanced.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="USB_advanced">
<input type=hidden name=USBSTORAGEACTION_DELETE value="4">

<div class="page_title"><%tcWebApi_multilingual("1","usb_storage_str")%></div>
<div class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR><TD colspan=2 align=center>
	<input class="common_bt" type="button" name="Refresh" id="refresh" value="<%tcWebApi_multilingual("0","glbstr_refresh")%>" onClick='refreshpage1();'>&nbsp;&nbsp;
        <input class="apply_bt"type="submit" name="Apply" id="apply" value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick='return clickadvanced();'>
</TD></TR>
</TABLE>
</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>



<script>
var via_internet_str="<%tcWebApi_multilingual("1","via_internet_str")%>";
var safely_remove_usb_str="<%tcWebApi_multilingual("1","safely_remove_usb_str")%>";
var create_network_folder_str="<%tcWebApi_multilingual("1","create_network_folder_str")%>";
var glbstr_edit = "<%tcWebApi_multilingual("0","glbstr_edit")%>";
var glbstr_delete = "<%tcWebApi_multilingual("0","glbstr_delete")%>";
var alert_please_choose_folder_str="<%tcWebApi_multilingual("1","alert_please_choose_folder_str")%>";
var alert_not_shared_folder_str="<%tcWebApi_multilingual("1","alert_not_shared_folder_str")%>";
var alert_the_number_shared_reach_max_str="The number of shared folder has reached the maximum.";
var access_admin_str="<%tcWebApi_multilingual("1","access_admin_str")%>";
var access_all_no_password_str="<%tcWebApi_multilingual("1","access_all_no_password_str")%>";
var alert_invalid_device_name_str="<%tcWebApi_multilingual("1","alert_invalid_device_name_str")%>";
var alert_network_device_not_be_blank_str="<%tcWebApi_multilingual("1","alert_network_device_not_be_blank_str")%>";
var alert_invalid_character_str="<%tcWebApi_multilingual("1","alert_invalid_character_str")%>";
var alert_network_device_name_str="<%tcWebApi_multilingual("1","alert_network_device_name_str")%>";
var alert_workgroup_not_be_null_str="<%tcWebApi_multilingual("1","alert_workgroup_not_be_null_str")%>";
var alert_workgroup_str="<%tcWebApi_multilingual("1","alert_workgroup_str")%>";
var alert_http_via_port_str="http via port should be 443 or in the range [1024 ~ 65534] .";
var alert_ftp_via_port_str="<%tcWebApi_multilingual("1","alert_ftp_via_port_str")%>";
var alert_the_specified_ports_str="<%tcWebApi_multilingual("1","alert_the_specified_ports_str")%>";
var alert_notice_to_share_your_files_str="<%tcWebApi_multilingual("1","alert_notice_to_share_your_files_str")%>";

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

var forwarding_data = [
["1","<%tcwebApi_staticGet("VirServer_PVC_Entry0","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry0","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry0","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry0","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry0","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry0","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry0","LOCALIP","s")%>"],
["2","<%tcwebApi_staticGet("VirServer_PVC_Entry1","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry1","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry1","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry1","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry1","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry1","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry1","LOCALIP","s")%>"],
["3","<%tcwebApi_staticGet("VirServer_PVC_Entry2","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry2","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry2","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry2","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry2","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry2","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry2","LOCALIP","s")%>"],
["4","<%tcwebApi_staticGet("VirServer_PVC_Entry3","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry3","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry3","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry3","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry3","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry3","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry3","LOCALIP","s")%>"],
["5","<%tcwebApi_staticGet("VirServer_PVC_Entry4","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry4","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry4","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry4","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry4","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry4","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry4","LOCALIP","s")%>"],
["6","<%tcwebApi_staticGet("VirServer_PVC_Entry5","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry5","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry5","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry5","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry5","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry5","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry5","LOCALIP","s")%>"],
["7","<%tcwebApi_staticGet("VirServer_PVC_Entry6","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry6","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry6","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry6","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry6","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry6","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry6","LOCALIP","s")%>"],
["8","<%tcwebApi_staticGet("VirServer_PVC_Entry7","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry7","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry7","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry7","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry7","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry7","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry7","LOCALIP","s")%>"],
["9","<%tcwebApi_staticGet("VirServer_PVC_Entry8","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry8","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry8","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry8","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry8","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry8","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry8","LOCALIP","s")%>"],
["10","<%tcwebApi_staticGet("VirServer_PVC_Entry9","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry9","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry9","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry9","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry9","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry9","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry9","LOCALIP","s")%>"],
["11","<%tcwebApi_staticGet("VirServer_PVC_Entry10","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry10","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry10","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry10","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry10","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry10","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry10","LOCALIP","s")%>"],
["12","<%tcwebApi_staticGet("VirServer_PVC_Entry11","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry11","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry11","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry11","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry11","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry11","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry11","LOCALIP","s")%>"],
["13","<%tcwebApi_staticGet("VirServer_PVC_Entry12","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry12","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry12","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry12","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry12","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry12","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry12","LOCALIP","s")%>"],
["14","<%tcwebApi_staticGet("VirServer_PVC_Entry13","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry13","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry13","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry13","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry13","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry13","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry13","LOCALIP","s")%>"],
["15","<%tcwebApi_staticGet("VirServer_PVC_Entry14","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry14","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry14","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry14","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry14","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry14","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry14","LOCALIP","s")%>"],
["16","<%tcwebApi_staticGet("VirServer_PVC_Entry15","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry15","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry15","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry15","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry15","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry15","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry15","LOCALIP","s")%>"],
["17","<%tcwebApi_staticGet("VirServer_PVC_Entry16","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry16","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry16","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry16","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry16","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry16","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry16","LOCALIP","s")%>"],
["18","<%tcwebApi_staticGet("VirServer_PVC_Entry17","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry17","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry17","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry17","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry17","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry17","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry17","LOCALIP","s")%>"],
["19","<%tcwebApi_staticGet("VirServer_PVC_Entry18","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry18","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry18","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry18","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry18","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry18","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry18","LOCALIP","s")%>"],
["20","<%tcwebApi_staticGet("VirServer_PVC_Entry19","Name","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry19","STARTPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry19","ENDPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry19","LOCAL_SPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry19","LOCAL_EPORT","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry19","PROTOCOL","s")%>","<%tcwebApi_staticGet("VirServer_PVC_Entry19","LOCALIP","s")%>"]
];

var triggering_data = [
    ["1","<%tcwebApi_staticGet("portTriggering_Entry0","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry0","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry0","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry0","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry0","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry0","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry0","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry0","Service_User","s")%>"],
    ["2","<%tcwebApi_staticGet("portTriggering_Entry1","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry1","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry1","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry1","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry1","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry1","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry1","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry1","Service_User","s")%>"],
    ["3","<%tcwebApi_staticGet("portTriggering_Entry2","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry2","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry2","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry2","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry2","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry2","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry2","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry2","Service_User","s")%>"],
    ["4","<%tcwebApi_staticGet("portTriggering_Entry3","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry3","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry3","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry3","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry3","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry3","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry3","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry3","Service_User","s")%>"],
    ["5","<%tcwebApi_staticGet("portTriggering_Entry4","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry4","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry4","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry4","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry4","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry4","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry4","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry4","Service_User","s")%>"],
    ["6","<%tcwebApi_staticGet("portTriggering_Entry5","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry5","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry5","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry5","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry5","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry5","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry5","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry5","Service_User","s")%>"],
    ["7","<%tcwebApi_staticGet("portTriggering_Entry6","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry6","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry6","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry6","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry6","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry6","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry6","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry6","Service_User","s")%>"],
    ["8","<%tcwebApi_staticGet("portTriggering_Entry7","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry7","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry7","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry7","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry7","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry7","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry7","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry7","Service_User","s")%>"],
    ["9","<%tcwebApi_staticGet("portTriggering_Entry8","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry8","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry8","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry8","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry8","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry8","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry8","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry8","Service_User","s")%>"],
    ["10","<%tcwebApi_staticGet("portTriggering_Entry9","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry9","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry9","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry9","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry9","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry9","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry9","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry9","Service_User","s")%>"],
    ["11","<%tcwebApi_staticGet("portTriggering_Entry10","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry10","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry10","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry10","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry10","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry10","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry10","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry10","Service_User","s")%>"],
    ["12","<%tcwebApi_staticGet("portTriggering_Entry11","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry11","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry11","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry11","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry11","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry11","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry11","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry11","Service_User","s")%>"],
    ["13","<%tcwebApi_staticGet("portTriggering_Entry12","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry12","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry12","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry12","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry12","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry12","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry12","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry12","Service_User","s")%>"],
    ["14","<%tcwebApi_staticGet("portTriggering_Entry13","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry13","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry13","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry13","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry13","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry13","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry13","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry13","Service_User","s")%>"],
    ["15","<%tcwebApi_staticGet("portTriggering_Entry14","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry14","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry14","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry14","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry14","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry14","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry14","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry14","Service_User","s")%>"],
    ["16","<%tcwebApi_staticGet("portTriggering_Entry15","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry15","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry15","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry15","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry15","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry15","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry15","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry15","Service_User","s")%>"],
    ["17","<%tcwebApi_staticGet("portTriggering_Entry16","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry16","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry16","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry16","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry16","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry16","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry16","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry16","Service_User","s")%>"],
    ["18","<%tcwebApi_staticGet("portTriggering_Entry17","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry17","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry17","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry17","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry17","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry17","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry17","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry17","Service_User","s")%>"],
    ["19","<%tcwebApi_staticGet("portTriggering_Entry18","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry18","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry18","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry18","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry18","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry18","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry18","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry18","Service_User","s")%>"],
    ["20","<%tcwebApi_staticGet("portTriggering_Entry19","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry19","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry19","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry19","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry19","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry19","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry19","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry19","Service_User","s")%>"]
];


var folder_number=0;
for(ii=0;ii<usb_table.length-1;ii++)
{
	if(usb_table[ii][1]=="Yes")
		folder_number++;
}


var isIE_Flag="0";
if (navigator.userAgent.indexOf('MSIE') !== -1 || navigator.appVersion.indexOf('Trident/') > 0) {
   // MSIE
   isIE_Flag = "1";
}

<!--
var forwardingArray1="test TCP\/UDP 11182 11183 11182 11183 192.168.1.98 0 1";
var forward_array_num=1;

var triggeringArray1="abc 0 any TCP 19182 TCP\/UDP 19182 19183 1";
var trigger_array_num=1;

var upnp_array_num=0;

var endis_remote="0";
var remote_port="8443";
var show_lanip="192.168.1.1";

var usb_sharefolder0="/*/mnt/sda1*1.95 GB*1.12 GB*USB_Storage*All - no password*All - no password*FAT*U*U Drive (1.95 GB)*USB_Storage*USB      Disk             ";
var fd_num_in_disk0=1; 
var list_disk_num=1;
var not_shared_number=0;

var is_ftp = 1;

var dev0="sda1*0*USB      Disk             *U*U Drive (1.95 GB)";
var disk_num=1;
var device_num=0;

parent.folder_path="";
var show_workGroup="<%if tcWebApi_get("Samba_Entry","NetBiosName","h") <> "N/A" then tcWebApi_get("Samba_Entry","NetBiosName","s") else asp_write("Workgroup") end if%>";
var show_deviceName="<%if tcWebApi_get("Samba_Entry","WorkGroup","h") <> "N/A" then tcWebApi_get("Samba_Entry","WorkGroup","s") else asp_write("Workgroup") end if%>";
var show_enable_samba="<%if tcWebApi_get("Samba_Entry","Active","h") = "Yes" then asp_write("Yes") else asp_write("No") end if%>";
var show_enable_http="1";
var show_enable_wan_http="1";
var show_HTTP_via_port="80";

var show_enable_ftp="<%if tcWebApi_get("Ftp_Entry","LanAccess","h") = "Yes" then asp_write("Yes") else asp_write("No") end if%>";
var show_enable_wan_ftp="<%if tcWebApi_get("Ftp_Entry","WanAccess","h") = "Yes" then asp_write("Yes") else asp_write("No") end if%>";
var show_ftp_via_port="<%if tcWebApi_get("Ftp_Entry","WanPort","h") <> "N/A" then tcWebApi_get("Ftp_Entry","WanPort","s") else asp_write("21") end if%>";
var share_folder_maximum = 256;

var old_sysDNSHost="<%if tcWebApi_staticGet("WanInfo_Entry","IP","h") <> "N/A" then tcWebApi_staticGet("WanInfo_Entry","IP","s") else asp_write("0.0.0.0") end if%>";

function creat_folder()
{
	if(folder_number <= share_folder_maximum){
		var form = document.forms[0];
		form.submit_flag.value = "open_creat_window";
		//form.submit();	
		window.open('USB_Folder_creat.asp','net_folder','resizable=0,scrollbars=yes,width=635,height=400,left=400,top=300').focus();
	}
	else{
		alert(alert_the_number_shared_reach_max_str);
                return false;
	}
}

function edit_folder()
{
	form=document.forms[0];
	var num = -1;
	var entryId= -1;
	if(folder_number == 1){
	
		if(form.shareFolderSelect.checked == true){
			num = 0;
			entryId = parseInt(form.shareFolderSelect.value);
		}
	}
	else{
		for(i=0;i < folder_number ;i++){
			if(form.shareFolderSelect[i].checked == true){
				num = i;
				entryId = parseInt(form.shareFolderSelect[i].value);
			}
		}
	}
	
	if(entryId == -1 ){
		alert(alert_please_choose_folder_str);
		return false;
	}
	str="USB_Folder_edit.asp?editFolderID="+entryId+"";
	window.open(str,'net_folder','resizable=0,scrollbars=yes,width=400,height=400,left=400,top=300').focus();
}
function delete_folder()
{
	form=document.forms[0];
	var num = -1;
	var entryId= -1;
	if(folder_number == 1){
	
		if(form.shareFolderSelect.checked == true){
			num = 0;
			entryId = parseInt(form.shareFolderSelect.value);
		}
	}
	else{
		for(i=0;i < folder_number ;i++){
			if(form.shareFolderSelect[i].checked == true){
				num = i;
				entryId = parseInt(form.shareFolderSelect[i].value);
			}
		}
	}
	
	if(entryId == -1 ){
		alert(alert_please_choose_folder_str);
		return false;
	}
	form.submit_flag.value="sharefolder_delete";
	form.USB_INDEX.value=entryId;
	form.submit();
}

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
	
function refreshpage1()
{
	location.href = "USB_advanced.asp";
}	
	
function loadvalue()
{
	form=document.forms[0];
	form.deviceName.value=show_deviceName;
	form.workGroup.value=show_workGroup;
	document.getElementById("usb_http").style.display="none";  //201404301045, Tony, Disable "HTTP" Options
	document.getElementById("usb_http_internet").style.display="none";  //201404301045, Tony, Disable "HTTP (via Internet)" Options
	if( show_enable_samba == 'Yes' )
		form.enable_samba.checked = true;
	else
		form.enable_samba.checked = false;
	if( show_enable_http == '0' )
		form.enable_http.checked = true;
	else
		form.enable_http.checked = false;
	if( show_enable_wan_http == '0' )
		form.enable_wan_http.checked = true;
	else
		form.enable_wan_http.checked = false;
	form.HTTP_via_port.value=show_HTTP_via_port;
	
	if(is_ftp == 1)
	{
		if( show_enable_ftp == 'Yes' )
			form.enable_ftp.checked = true;
		else
			form.enable_ftp.checked = false;
		if( show_enable_wan_ftp == 'Yes' )
			form.enable_wan_ftp.checked = true;
		else
			form.enable_wan_ftp.checked = false;
		form.ftp_via_port.value=show_ftp_via_port;
		form.hidden_is_ftp.value="1";
	
	}

	/*if( folder_number == 0 )
		form.edit.disabled = true;
	else
		form.edit.disabled = false;

	if( folder_number == not_shared_number )
		form.btDelete.disabled = true;	
	else
		form.btDelete.disabled = false;

	if( disk_num == 0 )
		form.Creat.disabled = true;
	else
		form.Creat.disabled = false;
	
	if( device_num == 0 )
		form.safeRemove.disabled = true;
	else
		form.safeRemove.disabled = false;
     */
	
}
-->
</script>
<input type="hidden" name="hidden_name">
<input type="hidden" name="hidden_is_ftp" value="0">
<input type="hidden" name="hidden_select_number" >
<input type="hidden" name="delete_sharefolder_name" >
<input type="hidden" name="delete_folder_path" >
<input type="hidden" name="enable_samba_value">
<input type="hidden" name="enable_http_value">
<input type="hidden" name="enable_wan_http_value">
<input type="hidden" name="enable_ftp_value">
<input type="hidden" name="enable_wan_ftp_value">
<input type=hidden name=volumeName>
<input type=hidden name=usb_device_name>
<input type="hidden" name="device_name_change_flag">
<input type="hidden" name="USB_INDEX">

<TR><TD colspan=2>&nbsp;</TD></TR>
<TR><TD><a tabindex=-1 href="javascript:loadhelp('_USB_advance','device')"><b><%tcWebApi_multilingual("1","network_device_name_str")%>:</b></a></TD><TD><input type="text" name="deviceName" id="device_name" value="readyshare" size="20" maxlength="15" onKeyPress="return getkey('shareName', event)"></TD></TR>
<TR><TD colspan=2>&nbsp;</TD></TR>
<TR><TD ><a tabindex=-1 href="javascript:loadhelp('_USB_advance','workgroup')"><b><%tcWebApi_multilingual("1","workgroup_str")%>:</b></a></TD><TD><input type="text" name="workGroup" id="work_group" value="Workgroup" size="20" maxlength="15" onKeyPress="return getkey('shareName', event)"></TD></TR>
<TR><TD colspan=2><a tabindex=-1 href="javascript:loadhelp('_USB_advance','access')">&nbsp;</a></TD></TR>
<TR><TD colspan=2>
<TABLE id="access_method" class=tables border ="0" cellpadding ="2" cellspacing ="0" width="100%">
	<TR class=table_header>
		<TD nowrap ><span class="thead"><%tcWebApi_multilingual("0","glbstr_enable")%></span></TD>
		<TD nowrap ><span class="thead"><%tcWebApi_multilingual("1","access_method_str")%></span></TD>
		<TD nowrap ><span class="thead"><%tcWebApi_multilingual("1","link_str")%></span></TD>
		<TD nowrap ><span class="thead"><%tcWebApi_multilingual("1","port_str")%></span></TD>
	</TR>
	<TR class="odd_line">
		<TD><input type="checkbox" name="enable_samba" id="enable_net"></TD>
		<TD nowrap ><%tcWebApi_multilingual("1","network_connection_str")%></TD>
<script>
	if(isIE())	
		document.write('<TD><a class="linktype" href="\\\\'+show_deviceName+'" target="_blank">\\\\'+show_deviceName+'</a></TD>');
	else if( get_browser() == "Safari" )
		document.write('<TD><a class="linktype" href="smb://'+show_lanip+'" >\\\\'+show_deviceName+'</a></TD>');
	else
		document.write('<TD>\\\\'+show_deviceName+'</TD>');
</script>
		<TD nowrap>-</TD>
	</TR>
	<TR class="even_line" id="usb_http">
		<TD><input type="checkbox" name="enable_http" id="enable_http" disabled></TD>
		<TD nowrap >HTTP</TD>
		<TD>Not support</TD>
		<!--<script>document.write('<TD><a class="linktype" href="http://readyshare.routerlogin.net/shares" target="_blank">http://readyshare.routerlogin.net/shares</a></TD>'); </script>-->
		<TD nowrap>80</TD>
	</TR>
	<TR class="odd_line" id="usb_http_internet">
		<TD><input type="checkbox" name="enable_wan_http" id="enable_http_via" disabled></TD>
		<TD nowrap >HTTP(<%tcWebApi_multilingual("1","via_internet_str")%>)</TD>
		<TD>Not support</TD>
<script>
	/*
	if( show_HTTP_via_port == "80" )
	{	//bug 22003:if the links are shown like http://0.0.0.0/...or ftp://0.0.0.0/...(black and no underline)and no hyperlink
		if(old_sysDNSHost == "0.0.0.0")
			document.write('<TD>http://'+old_sysDNSHost+'/shares</TD>');
		else
			document.write('<TD><a class="linktype" href="http://'+old_sysDNSHost+'/shares" target="_blank">http://'+old_sysDNSHost+'/shares</a></TD>');
	}
	else
	{
		if(old_sysDNSHost == "0.0.0.0")
			document.write('<TD>http://'+old_sysDNSHost+':'+show_HTTP_via_port+'/shares</TD>');
		else
			document.write('<TD><a class="linktype" href="http://'+old_sysDNSHost+':'+show_HTTP_via_port+'/shares" target="_blank">http://'+old_sysDNSHost+':'+show_HTTP_via_port+'/shares</a></TD>');
	}*/
</script>
		<TD nowrap><input type="text" name="HTTP_via_port" id="http_via_port" size="5" maxlength="5" onKeyPress="return getkey('num', event)"></TD>
	</TR>
<script>
if( is_ftp == 1 )
{
	document.write("<TR class=even_line>");
	document.write("<TD><input type='checkbox' name='enable_ftp' id='enable_ftp'></TD>");
	document.write("<TD nowrap >FTP</TD>");
	/* to fix bug 23277 */
	if(list_disk_num == 0 || not_shared_number == folder_number )
		document.write('<TD><a class=\'linktype\' href=\'ftp_no_shares.asp\' target=\'_blank\'>ftp://readyshare.routerlogin.net/shares</a></TD>');
	else
	{
		document.write('<TD><a class=\'linktype\' href=\'ftp://readyshare.routerlogin.net/shares\' target=\'_blank\'>ftp://readyshare.routerlogin.net/shares</a></TD>');
	}
	document.write("<TD nowrap >21</TD>");
	document.write("</TR>");
	document.write("<TR class=odd_line>");
	document.write("<TD><input type='checkbox' name='enable_wan_ftp' id='enable_ftp_via'></TD>");
	document.write("<TD nowrap >FTP("+via_internet_str+")</TD>");
	if( show_ftp_via_port == "21" )
	{
		if(old_sysDNSHost == "0.0.0.0")
			document.write("<TD>ftp://"+old_sysDNSHost+"/shares</TD>");
		else
			if(list_disk_num == 0 || not_shared_number == folder_number )
				document.write("<TD><a class='linktype' href='ftp_via_no_shares.asp' target='_blank'>ftp://"+old_sysDNSHost+"/shares</a></TD>");
			else
				document.write("<TD><a class='linktype' href='ftp://"+old_sysDNSHost+"' target='_blank'>ftp://"+old_sysDNSHost+"/shares</a></TD>");
	}
	else
	{
		if(old_sysDNSHost == "0.0.0.0")
			document.write("<TD>ftp://"+old_sysDNSHost+":"+show_ftp_via_port+"/shares</TD>");
		else
			if(list_disk_num == 0 || not_shared_number == folder_number )
				document.write("<TD><a class='linktype' href='ftp_via_no_shares.asp' target='_blank'>ftp://"+old_sysDNSHost+":"+show_ftp_via_port+"/shares</a></TD>");
			else
				document.write("<TD><a class='linktype' href='ftp://"+old_sysDNSHost+":"+show_ftp_via_port+"' target='_blank'>ftp://"+old_sysDNSHost+":"+show_ftp_via_port+"/shares</a></TD>");
	}
	document.write("<TD nowrap><input type='text' name='ftp_via_port' id='ftp_via_port' size='5' maxlength='5' onKeyPress=\"return getkey('num', event)\"></TD>");
	document.write("</TR>");	
}
</script>		

	</TABLE>
</TD></TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100%% height=12></TD></TR>
<TR><TD colspan=2><a tabindex=-1 href="javascript:loadhelp('_USB_advance','available')"><b><%tcWebApi_multilingual("1","availabe_network_folder_str")%></b></a></TD></TR>
<TR><TD colspan=2>
<TABLE id="available_folder" class=tables border ="0" cellpadding ="2" cellspacing ="0" width="100%">
	<TR class=table_header>
		<TD nowrap><span class="thead">&nbsp;</span></TD>
		<TD nowrap><span class="thead"><%tcWebApi_multilingual("1","share_name_str")%></span></TD>
		<TD nowrap><span class="thead"><%tcWebApi_multilingual("1","read_access_str")%></span></TD>
		<TD nowrap><span class="thead"><%tcWebApi_multilingual("1","write_access_str")%></span></TD>
		<TD nowrap><span class="thead"><%tcWebApi_multilingual("1","folder_name_str")%></span></TD>
		<TD nowrap><span class="thead"><%tcWebApi_multilingual("1","volume_name_str")%></span></TD>
		<TD nowrap><span class="thead"><%tcWebApi_multilingual("1","total_space_str")%></span></TD>
		<TD nowrap><span class="thead"><%tcWebApi_multilingual("1","free_space_str")%></span></TD>
	</TR>
<!--show folder -->
<script>

var shared_folder_num=0;
var nopassword_num=0;
var prefolder;
i=0;	
fd_num_in_disk=0
//for( j=0; j<list_disk_num; j++){		
//	var fd_num_in_disk = eval('fd_num_in_disk' + j );
		
function write_usb_table(i,t,org,fd_num_in_disk)
{
	if( i%2== 0 )
        document.write("<TR class=\"even_line\">");
    else
        document.write("<TR class=\"odd_line\">");
        
	if(i==0&&org==1)
			document.write('<TD nowrap><input type="radio" name="shareFolderSelect" value="'+t+'" checked></TD>');
		else
			document.write('<TD nowrap><input type="radio" name="shareFolderSelect" value="'+t+'"></TD>');
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
</script>
	
	
	</TABLE>
</TD></TR>
<TR><TD colspan=2>
<script>
	if(folder_number == 0 )
		document.write('<input class="long_add_gray_bt" type="button" name="Create" id="create" value=" '+create_network_folder_str+' " disabled >');
	else
		document.write('<input class="long_add_bt" type="button" name="Create" id="create" value=" '+create_network_folder_str+' " onClick=\'creat_folder();\'>');
</script>
	<!--input class="long_add_bt" type="button" name="Creat" value=" Create Network Folder " onClick='creat_folder();'-->
	
<script>
	if(folder_number == 0 )
		document.write('<input class="edit_gray_bt" type="button" name="Edit" id="edit" value="  '+glbstr_edit+'  " disabled >');
	else
		document.write('<input class="edit_bt" type="button" name="Edit" id="edit" value="  '+glbstr_edit+'  " onClick=\'edit_folder();\'>');
</script>	
	<!--input class="edit_bt" type="button" name="Edit" value="  <%tcWebApi_multilingual("0","glbstr_edit")%>  " onClick='edit_folder();'-->
<script>
	if(folder_number == not_shared_number )
		document.write('<input class="delete_gray_bt" type="button" name="Delete" id="delete" value=" '+glbstr_delete+' " disabled >');
	else
		document.write('<input class="delete_bt" type="button" name="Delete" id="delete" value=" '+glbstr_delete+' " onClick=\'delete_folder();\'>');
</script>		
	
	<!--input class="delete_bt" type="button" name="btDelete" value=" Delete " onClick='delete_folder();'-->
</TD></TR>
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
</TABLE>
</div>
<%tcWebApi_multilingual("2","_USB_advance_help.asp")%>
</FORM>
</BODY>
</HTML>











