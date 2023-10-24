<%
If Request_Form("submit_flag") = "disk_remove" then
	tcWebApi_set("USBStorage_Common","Action","USBSTORAGEACTION_UMOUNT")
	tcWebApi_set("USBStorage_Common","Umount_Device","Umount_Device")
	tcWebApi_commit("USBStorage_Entry")
	tcWebApi_commit("Samba_Entry")
	tcWebApi_commit("Ftp_Entry")
End if
%>

<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_netgear_router")%> <%tcWebApi_get("SkuId_Entry","ProductName","s")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onload="dosubmit()">


<script>
function dosubmit()
{
	<% If Request_Form("submit_flag") <> "disk_remove" then %>
	var form = document.forms[0];
	form.Umount_Device.value="all";
	form.submit();
	<%else%>
	sleep(5000);
	opener.parent.formframe.location.reload();
	//window.close();
	<%end if%>
}
/*
var result="0";
getDevName=location.href.indexOf("dev_name=",0);
len=location.href.length-getDevName-9;
dev_name=location.href.substr(getDevName+9,len);
dev_name=dev_name.replace(/%20/g,"&nbsp;").replace(/%A0/g,"&nbsp;");

if (result == "") {
	document.write('<META http-equiv="refresh" content="3; url=USB_disk_rm.asp?dev_name='+dev_name+'">');
	document.write('<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR><TR><TD><BR><BR>Please wait a moment...<BR><BR></TD></TR><TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>');
} else if (result == "0") {
		document.write("<TR><TD nowrap><B>Now you can remove this device.</B></TD></TR>");
} else if (result == "1"){
	document.write("<TR><TD nowrap><B>The device(s) cannot be stopped right now. Try stopping the device again later.</B></TD></TR>");
}*/

document.write("<%tcWebApi_multilingual("1","now_you_can_remove_str")%>");
</script>
<form method="POST" action="/cgi-bin/USB_disk_rm.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="disk_remove">
<input type=hidden name=USBSTORAGEACTION_UMOUNT value="5">
<input type=hidden name=Umount_Device>
</form>
</BODY>
</HTML>
