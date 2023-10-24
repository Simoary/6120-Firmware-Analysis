
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/USB_NETStorage.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/USB_approved.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="usb_approved_add">

<div class="page_title">USB Drive Approved Devices</div>
<div class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR><TD colspan=2 align=center>
	<input class="common_bt" type="button" name="Refresh" id="refresh" value=" Refresh " onClick='location.href="USB_approved.asp";'> &nbsp;&nbsp;
        <input class="apply_bt" type="button" name="Apply" id="apply" value=" Apply " onClick='click_apply();'>
</TD></TR>
</TABLE>
</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>



<script>
<!--
var show_enableUSB="0";
function loadvalue()
{
	var form = document.forms[0];
	if( show_enableUSB == '1' )
		form.allow_approved.checked = true;	
	else
		form.allow_approved.checked = false;
}
function delete_app()
{
	form=document.forms[0];
	var num = -1;
	if( app_num== 1){
		if(form.app_devname.checked == true){
			 num = 0;
		}
	}
	else{
		for(i=0;i < app_num;i++){
			if(form.app_devname[i].checked == true){
				num = i;
			}
		}
	}
	if(num == -1 ){
		alert("Please choose a device.");
		return false;
	}

	form.select_approved_item.value=num+1;
	form.submit_flag.value="usb_approved_del";
	form.submit();
}
function click_add_device()
{
	form=document.forms[0];
	var num = -1;
	if( ava_num== 1){
		if(form.ava_devname.checked == true){
			num = 0;
		}
	}
	else{
		for(i=0;i < ava_num;i++){
			if(form.ava_devname[i].checked == true){
				num = i;
			}
		}
	}
	if(num == -1 ){
		alert("Please choose a device.");
		return false;
	}
	return true;
}
function click_apply()
{
	var form = document.forms[0];

	if(form.allow_approved.checked == true)
		form.enableUSB.value="1";
	else
		form.enableUSB.value="0";

	form.submit_flag.value="usb_setting";
	form.submit();
	
}
-->
</script>
<input type="hidden" name="enableUSB">
<input type="hidden" name="select_approved_item">
<TR><TD colspan=2><input type="checkbox" name="allow_approved" id="allow_approved">Allow only approved devices</TD></TR>
<TR><TD colspan=2>&nbsp;</TD></TR>
<TR><TD colspan=2><b>Approved USB Devices</b></TD></TR>
<TR><TD colspan=2>
	<TABLE name="ApprovedDevice" id="approved_device" class=tables id="app_table" border ="0" cellpadding ="2" cellspacing ="0" width="100%">
	<TR class=table_header>
		<TD nowrap align="center" width="20%"><span class="thead">&nbsp;</span></TD>
		<TD nowrap align="center"><span class="thead">Volume Name</span></TD>
		<TD nowrap align="center"><span class="thead">Device Name</span></TD>
		<TD nowrap align="center"><span class="thead">Capacity</span></TD>
	</TR>
 <script> var app_num=0;</script>
	</TABLE>
</TR>
<TR><TD colspan=2 align=left>
<input class="delete_bt" type="button" name="Delete" id="delete" value=" Delete " onClick='delete_app();'></TD></TR>
<TR><TD colspan=2>&nbsp;</TD></TR>
<TR><TD colspan=2>&nbsp;</TD></TR>

<TR><TD colspan=2><b>Available USB Devices</b></TD></TR>
<TR><TD colspan=2>
	<TABLE name="AvailableDevice" id="available_device" class=tables border ="0" cellpadding ="2" cellspacing ="0" width="100%">
	<TR class=table_header>
		<TD nowrap align="center" width="20%"><span class="thead">&nbsp;</span></TD>
		<TD nowrap align="center"><span class="thead">Volume Name</span></TD>
		<TD nowrap align="center"><span class="thead">Device Name</span></TD>
		<TD nowrap align="center"><span class="thead">Capacity</span></TD>
	</TR>
<TR>
	<TD nowrap align=center><input type=radio name=ava_devname value='/dev/sda1'></TD>
	<TD nowrap align=center>U Drive (1.95 GB)</TD>
	<TD nowrap align=center>USB      Disk             </TD>
	<TD nowrap align=center>1.95 GB</TD>
</TR>
 <script> var ava_num=1;</script>
	</TABLE>
</TD></TR>
<TR><TD colspan=2 align=left>
	<input class="add_bt" type="submit" name="Add" id="add" value="  Add  " onClick='return click_add_device();'>
</TD></TR>
<TR><TD colspan=2>&nbsp;</TD></TR>
</TABLE>
</div>
<%tcWebApi_multilingual("2","_USB_approve_help.asp")%>
</FORM>
</BODY>
</HTML>











