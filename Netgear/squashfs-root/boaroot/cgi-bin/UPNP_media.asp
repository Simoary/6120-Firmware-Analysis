<%
if Request_Form("submit_flag")="upnp_media" then	
	TCWebApi_set("DMS_Entry","Enable","media_server_onoff")	
	TCWebApi_set("Minidlna_Entry","friendly_name","hidden_media_server_name")
	TCWebApi_set("Minidlna_Entry","friendly_name_prefix","hidden_media_server_name_prefix")
	tcWebApi_commit("Minidlna_Entry")
	tcWebApi_commit("DMS_Entry")
else 
	if Request_Form("submit_flag")="upnp_media_scan" then	
		tcWebApi_commit("DMS")
	end if
end if	
%>

<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/UPnP_Media.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/UPNP_media.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="upnp_media">

<div class="page_title"><%tcWebApi_multilingual("1","media_server_settings_str")%></div>
<div id="main" class="main"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>


<script>
var invalid_media_server_name_str="<%tcWebApi_multilingual("1","invalid_media_server_name_str")%>";
var upnp_media_onoff="<%if tcWebApi_get("DMS_Entry","Enable","h") <> "N/A" then tcWebApi_get("DMS_Entry","Enable","s") end if%>";
var upnp_media_name="<% if tcWebApi_get("Minidlna_Entry","friendly_name","h") <> "N/A" then tcWebApi_get("Minidlna_Entry","friendly_name","s") end if%>";
var upnp_media_name_prefix="<% if tcWebApi_get("Minidlna_Entry","friendly_name_prefix","h") <> "N/A" then tcWebApi_get("Minidlna_Entry","friendly_name_prefix","s") end if%>";
var scanType="1";
var product_name="<%tcWebApi_get("SkuId_Entry","ProductName","s")%>";
//var scanPeriod="60";
//bug 24250:Tivo supporting from NETGEAR's request
var upnp_enabletivo_flag="yes";
var tivo_flag=parent.tivo_flag;

if(upnp_media_name_prefix=="")
	upnp_media_name_prefix = upnp_media_name;

function loadvalue()
{
	var cf=document.forms[0];
	//if(tivo_flag == 1)
	//	document.getElementById("tivo_display").style.display="";
	//else
		document.getElementById("tivo_display").style.display="none";
	
	if(upnp_media_onoff == "1")
		cf.media_server.checked =true;
	else
		cf.media_server.checked =false;
	
	cf.media_server_name.value = upnp_media_name_prefix;
	
//	if(scanType == "0")
//		cf.scan.checked=false;
//	else
		cf.scan.checked=true;
	//else
		//cf.scan[1].checked=true;
	//cf.scan_time.value=scanPeriod;
	if(upnp_enabletivo_flag == "yes")
		cf.media_server_tivo.checked = true;
	else
		cf.media_server_tivo.checked = false;
	mediaserver_enable();
}

function check_name()
{
	var cf=document.forms[0];
	var media_name=cf.media_server_name.value;
	cf.hidden_media_server_name.value=media_name+": "+product_name;
	cf.hidden_media_server_name_prefix.value=media_name;
}

function mediaserver_enable()
{
	var cf=document.forms[0];
	if(cf.media_server.checked == true)
	{
		cf.media_server_tivo.disabled=false;
		cf.media_server_name.disabled=false;
		cf.scan.disabled=false;
	}
	else
	{
		cf.media_server_tivo.disabled=true;
		cf.media_server_name.disabled=true;
		cf.scan.disabled=true;
	}
}
</script>
<input type="hidden" name="media_server_onoff">
<input type="hidden" name="changetime">
<input type="hidden" name="hidden_advertime" value="">
<input type="hidden" name="hidden_timetolive" value="">
<input type="hidden" name="hidden_media_server_name">
<input type="hidden" name="hidden_media_server_name_prefix">
<input type="hidden" name="media_server_tivo_flag">
<input type="hidden" name="hidden_media_scan">
<TR>
	<TD nowrap colspan=2>
	<input type="checkbox" name="media_server" id="media_server" value="1" onClick="mediaserver_enable()">
	<A tabindex=-1 href="javascript:loadhelp('_UPNP_media','turnon')"><B><%tcWebApi_multilingual("1","enable_media_server_str")%></B></A>
	</TD>
</TR>
<TR id=tivo_display>
	<TD nowrap colspan=2>
	<input type="checkbox" name="media_server_tivo" value="1">
	<A tabindex=-1 href="javascript:loadhelp('_UPNP_media','tivo')"><B>Enable TiVo<sup>&reg;</sup> support</B></A>
	</TD>
</TR>
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_UPNP_media','name')"><B><%tcWebApi_multilingual("1","media_server_name_str")%></B></A>:
	</TD>
	<TD nowrap align=left>
	<input type="text" name="media_server_name" id="media_server_name" size="32" onBlur="check_name()" onKeyPress="return getkey('mediaServerName', event)">: <%tcWebApi_get("SkuId_Entry","ProductName","s")%>
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD>
	<input class="apply_bt" type="button" name="Apply" id="apply" value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick="check_media(document.forms[0])">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_UPNP_media','scan')"><B><%tcWebApi_multilingual("1","content_scan_str")%></B></A>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="scan" id="scan" value="0" onClick=""><%tcWebApi_multilingual("1","automatic_str")%>
	</TD>
</TR>
<!--TR>
        <TD nowrap colspan=2>
        <input type="radio" name="scan" value="1" onClick="">Scheduled Scan in
	<input type="text" name="scan_time" size="4" onKeyPress="return getkey('num', event)">Minutes
        </TD>
</TR>
<TR>
	<TD>
	<input type="button" name="Apply_Scan" value="Scan Now" onClick="">
	</TD>
</TR>-->
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap>
	<input class="apply_bt" type="button" name="Apply" value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick="check_media_scan(document.forms[0])">
	</TD>
</TR>
</TABLE>

</div>
<%tcWebApi_multilingual("2","_UPNP_media_help.asp")%>
</FORM>
</BODY>
</HTML>
