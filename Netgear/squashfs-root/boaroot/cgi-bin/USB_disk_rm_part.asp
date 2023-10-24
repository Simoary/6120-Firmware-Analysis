<%
If Request_Form("submit_flag") = "disk_remove" then
	tcWebApi_set("USBStorage_Common","Action","USBSTORAGEACTION_UMOUNT")
	tcWebApi_set("USBStorage_Common","Umount_Device","Umount_Device")
	tcWebApi_set("USBStorage_Common","Umount_Index","Umount_Index")
	tcWebApi_commit("USBStorage_Entry")
	tcWebApi_commit("Samba_Entry")
	tcWebApi_commit("Ftp_Entry")
End if
%>

<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/USB_NETStorage.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_netgear_router")%> <%tcWebApi_get("SkuId_Entry","ProductName","s")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/USB_disk_rm_part.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="disk_remove">

<div class="page_title" id="page_title"><%tcWebApi_multilingual("1","safely_remove_usb_str")%></div>
<div class="fix_button" id="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
<input class="cancel_bt" type="button" name="Cancel" id="cancel" value=" <%tcWebApi_multilingual("0","glbstr_cancel")%> " onClick='close_window();'> &nbsp;&nbsp;
<input class="apply_bt" type="button" name="apply" id="apply" value=" <%tcWebApi_multilingual("0","glbstr_apply")%> " onClick='click_apply();'>
        </TD>
</TR>
</TABLE>

</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>


<TR><TD colspan=2 nowrap>
<b><%tcWebApi_multilingual("1","do_you_umount_all_device_str")%></b>
<input type="radio" name="choose_all" value="0" onClick='click_all(0);'><%tcWebApi_multilingual("0","glbstr_yes")%>
<input type="radio" name="choose_all" value="1" onClick='click_all(1);'><%tcWebApi_multilingual("0","glbstr_no")%></TD>
</TD></TR>
<input type="hidden" name="hidden_name">
<input type="hidden" name="Umount_Device" value="">
<input type="hidden" name="Umount_Index" value="">
<input type="hidden" name="USBSTORAGEACTION_UMOUNT" value="5">
<script>
var disk_num=0;
var device_num=0;

var radio_num=0;
var device_array = new Array();
var device_name_tmp = new Array();
var device_vendor_tmp = new Array();
var array_num=0;
var old_dev_name;
var ts='99170920'

<% If Request_Form("submit_flag") = "disk_remove" then %>
var main_div = document.getElementById("main");
var page_title_div = document.getElementById("page_title");
var fix_button_div = document.getElementById("fix_button");
main_div.style.display = "none";
page_title_div.style.display = "none";
fix_button_div.style.display = "none";
<%end if%>

//0-index,1-Active,2-ShareName,3-FolderName,4-VolumeName,5-TotoalSize,6-FreeSize,7-Read Access,8-Write Access,9-ShowIndex,10-Path,11-Original,12-SerialNumber,13-MountName,14-Product Name
var usb_table = [
["1","<% if tcWebApi_get("USBStorage_Entry0","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry0","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry0","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry0","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry0","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry0","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry0","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry0","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry0","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry0","Path","s")%>","<%tcWebApi_get("USBStorage_Entry0","Original","s")%>","<%tcWebApi_get("USBStorage_Entry0","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry0","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry0","ProductName","s")%>"],
["2","<% if tcWebApi_get("USBStorage_Entry1","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry1","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry1","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry1","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry1","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry1","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry1","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry1","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry1","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry1","Path","s")%>","<%tcWebApi_get("USBStorage_Entry1","Original","s")%>","<%tcWebApi_get("USBStorage_Entry1","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry1","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry1","ProductName","s")%>"],
["3","<% if tcWebApi_get("USBStorage_Entry2","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry2","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry2","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry2","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry2","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry2","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry2","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry2","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry2","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry2","Path","s")%>","<%tcWebApi_get("USBStorage_Entry2","Original","s")%>","<%tcWebApi_get("USBStorage_Entry2","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry2","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry2","ProductName","s")%>"],
["4","<% if tcWebApi_get("USBStorage_Entry3","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry3","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry3","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry3","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry3","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry3","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry3","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry3","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry3","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry3","Path","s")%>","<%tcWebApi_get("USBStorage_Entry3","Original","s")%>","<%tcWebApi_get("USBStorage_Entry3","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry3","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry3","ProductName","s")%>"],
["5","<% if tcWebApi_get("USBStorage_Entry4","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry4","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry4","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry4","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry4","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry4","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry4","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry4","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry4","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry4","Path","s")%>","<%tcWebApi_get("USBStorage_Entry4","Original","s")%>","<%tcWebApi_get("USBStorage_Entry4","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry4","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry4","ProductName","s")%>"],
["6","<% if tcWebApi_get("USBStorage_Entry5","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry5","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry5","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry5","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry5","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry5","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry5","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry5","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry5","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry5","Path","s")%>","<%tcWebApi_get("USBStorage_Entry5","Original","s")%>","<%tcWebApi_get("USBStorage_Entry5","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry5","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry5","ProductName","s")%>"],
["7","<% if tcWebApi_get("USBStorage_Entry6","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry6","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry6","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry6","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry6","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry6","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry6","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry6","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry6","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry6","Path","s")%>","<%tcWebApi_get("USBStorage_Entry6","Original","s")%>","<%tcWebApi_get("USBStorage_Entry6","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry6","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry6","ProductName","s")%>"],
["8","<% if tcWebApi_get("USBStorage_Entry7","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry7","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry7","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry7","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry7","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry7","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry7","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry7","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry7","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry7","Path","s")%>","<%tcWebApi_get("USBStorage_Entry7","Original","s")%>","<%tcWebApi_get("USBStorage_Entry7","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry7","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry7","ProductName","s")%>"],
["9","<% if tcWebApi_get("USBStorage_Entry8","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry8","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry8","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry8","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry8","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry8","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry8","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry8","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry8","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry8","Path","s")%>","<%tcWebApi_get("USBStorage_Entry8","Original","s")%>","<%tcWebApi_get("USBStorage_Entry8","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry8","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry8","ProductName","s")%>"],
["10","<% if tcWebApi_get("USBStorage_Entry9","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry9","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry9","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry9","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry9","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry9","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry9","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry9","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry9","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry9","Path","s")%>","<%tcWebApi_get("USBStorage_Entry9","Original","s")%>","<%tcWebApi_get("USBStorage_Entry9","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry9","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry9","ProductName","s")%>"],
["11","<% if tcWebApi_get("USBStorage_Entry10","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry10","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry10","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry10","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry10","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry10","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry10","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry10","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry10","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry10","Path","s")%>","<%tcWebApi_get("USBStorage_Entry10","Original","s")%>","<%tcWebApi_get("USBStorage_Entry10","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry10","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry10","ProductName","s")%>"],
["12","<% if tcWebApi_get("USBStorage_Entry11","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry11","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry11","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry11","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry11","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry11","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry11","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry11","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry11","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry11","Path","s")%>","<%tcWebApi_get("USBStorage_Entry11","Original","s")%>","<%tcWebApi_get("USBStorage_Entry11","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry11","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry11","ProductName","s")%>"],
["13","<% if tcWebApi_get("USBStorage_Entry12","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry12","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry12","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry12","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry12","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry12","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry12","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry12","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry12","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry12","Path","s")%>","<%tcWebApi_get("USBStorage_Entry12","Original","s")%>","<%tcWebApi_get("USBStorage_Entry12","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry12","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry12","ProductName","s")%>"],
["14","<% if tcWebApi_get("USBStorage_Entry13","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry13","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry13","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry13","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry13","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry13","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry13","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry13","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry13","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry13","Path","s")%>","<%tcWebApi_get("USBStorage_Entry13","Original","s")%>","<%tcWebApi_get("USBStorage_Entry13","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry13","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry13","ProductName","s")%>"],
["15","<% if tcWebApi_get("USBStorage_Entry14","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry14","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry14","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry14","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry14","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry14","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry14","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry14","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry14","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry14","Path","s")%>","<%tcWebApi_get("USBStorage_Entry14","Original","s")%>","<%tcWebApi_get("USBStorage_Entry14","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry14","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry14","ProductName","s")%>"],
["16","<% if tcWebApi_get("USBStorage_Entry15","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry15","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry15","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry15","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry15","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry15","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry15","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry15","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry15","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry15","Path","s")%>","<%tcWebApi_get("USBStorage_Entry15","Original","s")%>","<%tcWebApi_get("USBStorage_Entry15","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry15","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry15","ProductName","s")%>"],
["17","<% if tcWebApi_get("USBStorage_Entry16","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry16","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry16","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry16","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry16","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry16","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry16","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry16","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry16","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry16","Path","s")%>","<%tcWebApi_get("USBStorage_Entry16","Original","s")%>","<%tcWebApi_get("USBStorage_Entry16","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry16","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry16","ProductName","s")%>"],
["18","<% if tcWebApi_get("USBStorage_Entry17","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry17","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry17","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry17","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry17","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry17","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry17","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry17","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry17","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry17","Path","s")%>","<%tcWebApi_get("USBStorage_Entry17","Original","s")%>","<%tcWebApi_get("USBStorage_Entry17","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry17","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry17","ProductName","s")%>"],
["19","<% if tcWebApi_get("USBStorage_Entry18","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry18","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry18","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry18","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry18","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry18","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry18","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry18","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry18","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry18","Path","s")%>","<%tcWebApi_get("USBStorage_Entry18","Original","s")%>","<%tcWebApi_get("USBStorage_Entry18","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry18","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry18","ProductName","s")%>"],
["20","<% if tcWebApi_get("USBStorage_Entry19","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry19","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry19","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry19","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry19","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry19","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry19","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry19","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry19","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry19","Path","s")%>","<%tcWebApi_get("USBStorage_Entry19","Original","s")%>","<%tcWebApi_get("USBStorage_Entry19","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry19","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry19","ProductName","s")%>"],
["21","<% if tcWebApi_get("USBStorage_Entry20","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry20","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry20","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry20","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry20","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry20","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry20","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry20","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry20","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry20","Path","s")%>","<%tcWebApi_get("USBStorage_Entry20","Original","s")%>","<%tcWebApi_get("USBStorage_Entry20","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry20","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry20","ProductName","s")%>"],
["22","<% if tcWebApi_get("USBStorage_Entry21","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry21","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry21","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry21","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry21","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry21","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry21","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry21","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry21","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry21","Path","s")%>","<%tcWebApi_get("USBStorage_Entry21","Original","s")%>","<%tcWebApi_get("USBStorage_Entry21","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry21","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry21","ProductName","s")%>"],
["23","<% if tcWebApi_get("USBStorage_Entry22","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry22","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry22","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry22","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry22","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry22","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry22","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry22","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry22","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry22","Path","s")%>","<%tcWebApi_get("USBStorage_Entry22","Original","s")%>","<%tcWebApi_get("USBStorage_Entry22","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry22","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry22","ProductName","s")%>"],
["24","<% if tcWebApi_get("USBStorage_Entry23","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry23","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry23","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry23","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry23","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry23","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry23","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry23","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry23","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry23","Path","s")%>","<%tcWebApi_get("USBStorage_Entry23","Original","s")%>","<%tcWebApi_get("USBStorage_Entry23","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry23","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry23","ProductName","s")%>"],
["25","<% if tcWebApi_get("USBStorage_Entry24","Active","h") = "1" then asp_write("Yes") else asp_write("No") end if%>","<%tcWebApi_get("USBStorage_Entry24","ShareName","s")%>","<%tcWebApi_get("USBStorage_Entry24","FolderName","s")%>","<%tcWebApi_get("USBStorage_Entry24","VolumeName","s")%>","<%tcWebApi_get("USBStorage_Entry24","TotalSize","s")%>","<%tcWebApi_get("USBStorage_Entry24","FreeSize","s")%>","<%tcWebApi_get("USBStorage_Entry24","ReadAccess","s")%>","<%tcWebApi_get("USBStorage_Entry24","WriteAccess","s")%>","<%tcWebApi_get("USBStorage_Entry24","ShowIndex","s")%>","<%tcWebApi_get("USBStorage_Entry24","Path","s")%>","<%tcWebApi_get("USBStorage_Entry24","Original","s")%>","<%tcWebApi_get("USBStorage_Entry24","SerialNum","s")%>","<%tcWebApi_get("USBStorage_Entry24","MountName","s")%>","<%tcWebApi_get("USBStorage_Entry24","ProductName","s")%>"],
];


var display_value='';
for(i=0; i<25; i++)
{
	if(usb_table[i][1]=="Yes" && usb_table[i][11]=="1")
	{	
		var totalsize_unit_str="";
		if(parseInt(usb_table[i][5],10)/(1024*1024) > 0)
			totalsize_unit_str = formatFloat(parseInt(usb_table[i][5],10)/(1024*1024),1) + 'G';
		else if(parseInt(usb_table[i][5],10)/1024>0)
			totalsize_unit_str = formatFloat(parseInt(usb_table[i][5],10)/1024,1) + 'M';
		else	
			totalsize_unit_str = usb_table[i][5];
			
			
		display_value = usb_table[i][14] + '(' + usb_table[i][3] + ':' + usb_table[i][3] + ' Drive(' + totalsize_unit_str + '))';
		document.write('<TR><TD><input type="checkbox" name="choose_dev" value="'+i+'">'+display_value+'</TD></TR>');
		radio_num++;
	}
}

</script>
<!--TR><TD colspan=2>
<input class="cancel_bt" type="button" name="cancel" value=" Cancel " onClick='close_window();'> &nbsp;&nbsp;
<input class="apply_bt" type="button" name="apply" value=" Apply " onClick='click_apply();'>		
</TD></TR-->
</TABLE>

<script>
document.forms[0].choose_all[0].checked=true;
click_all(0);
function click_all(num)
{
	form=document.forms[0];
	if(num == 0)
		for(i=0;i<radio_num;i++)
			form.choose_dev[i].disabled=true;
	else
		for(i=0;i<radio_num;i++)
			form.choose_dev[i].disabled=false;

		
}
function click_apply()
{
	var deleteList=0;
	form=document.forms[0];
	if(form.choose_all[0].checked == true){
		form.hidden_name.value="***";
		dev_value="***";
		form.Umount_Device.value="all";
		deleteList=1;
	}
	else
	{
		form.hidden_name.value="";
		for(i=0;i<radio_num;i++)
		{
			if( form.choose_dev[i].checked == true){
				form.hidden_name.value=form.hidden_name.value+device_name_tmp[i]+'*';
				var checkbox_value = parseInt(form.choose_dev[i].value);
				form.Umount_Index.value = checkbox_value;
				form.Umount_Device.value += usb_table[checkbox_value][13]+',';
				deleteList=1;
			}
		}
	}

	if(deleteList==1)
	{
		form.submit_flag.value="disk_remove";
		form.submit();
	}
}

</script>
</div>
<% If Request_Form("submit_flag") = "disk_remove" then %>
<%tcWebApi_multilingual("1","now_you_can_remove_str")%>
<%end if%>
</Form>
</BODY>
</HTML>
