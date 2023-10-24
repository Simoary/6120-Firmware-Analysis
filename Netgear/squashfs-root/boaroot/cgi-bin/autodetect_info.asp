<%
if request_Form("submit_flag") <> "" then
	tcWebApi_commit("AutoDetect_Entry")
end if
%>

<html><head><link rel="stylesheet" href="/style/form.css">
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<script>
function upload_log()
{
	var cf = document.forms[0];
	/*var fullmac = "<%If tcWebApi_get("Info_Ether","mac","h") <> "N/A" Then tcWebApi_staticGet("Info_Ether","mac","s") end if%>";
	var fullname,tmp,mac;
	var time=new Date;
	var y = time.getFullYear();
	var mon = time.getMonth()+1;
	var d = time.getDate();
	var h = time.getHours();
	var m = time.getMinutes();
	var s = time.getSeconds();
	
	if(mon<10) 	mon = '0'+mon;
	if(d<10) 	d = '0'+d;
	if(h<10)   	h = '0'+h;	
	if(m<10)    m = '0'+m;	
	if(s<10)    s = '0'+s;	
	
	tmp = fullmac.split(":");
	mac = tmp[0]+tmp[1]+tmp[2]+tmp[3]+tmp[4]+tmp[5];
	
	fullname = mac.toUpperCase() + '_'+ y.toString()+mon.toString()+d.toString()+h.toString()+m.toString();
	cf.FILENAME.value=fullname;*/
	alert("OK");
	cf.submit();
}

function refresh()
{
	location.href="autodetect_info.asp";
}
</script>

<body bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/autodetect_info.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<INPUT type=hidden name=submit_flag value="Upload_log">
<INPUT type=hidden name=UploadLogAction value="1">
<INPUT type=hidden name=FILENAME value="Upload_log">
<input class="apply_bt" type="button" name="Apply" id="apply" value="Upload" onClick="upload_log()"> 
<input class="apply_bt" type="button" name="Apply" id="apply" value="<%tcWebApi_multilingual("0","glbstr_refresh")%>" onClick="refresh()"> 
</form>	

<TR>
	<TD nowrap colspan=2 align=center height=450>
    <iframe src="/cgi-bin/autodetect_log.cgi" allowtransparency="true" height="100%" width="100%" frameborder="0"></iframe>	
	</TD>
</TR>
</body>
</html>
