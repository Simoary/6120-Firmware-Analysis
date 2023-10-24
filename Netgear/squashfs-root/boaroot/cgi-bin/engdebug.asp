<%
if request_Form("Type") = "0" then
	tcWebApi_set("Utelnetd_Entry","Active","ACTIVE")
	tcWebApi_commit("Utelnetd_Entry")
elseif request_Form("Type") = "1" then
	tcWebApi_set("AyeDebug_Entry","Active","ACTIVE")
	tcWebApi_commit("AyeDebug_Entry")	
elseif request_Form("Type") = "3" then
	tcWebApi_set("Vlanpt_Entry","Active","ACTIVE")
	tcWebApi_commit("Vlanpt_Entry")	
end if	
%>
<html><head>
<title>NETGEAR Router <%tcWebApi_get("SkuId_Entry","ProductName","s")%></title>
<meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>
<body bgcolor=#ffffff>
<form>
<script>
var check_hwid_valid="<%tcWebApi_get("SkuId_Entry","SKUID_Check","s")%>";
if(check_hwid_valid!="Success")
	alert("Error hwid and region in your flash!!!! Please fix it!");

var productname="<%tcWebApi_get("SkuId_Entry","ProductName","s")%>";	
var wifi5gmode="<%tcWebApi_get("SkuId_Entry","WiFi5GMode","s")%>";

if(wifi5gmode!="0" && wifi5gmode!="1")
	alert("wifi5gmode is wrong. Please fix it!!! Otherwise maybe will always reset to debug!");

if(productname=="D6000"||productname=="D6010")	
{
	if(wifi5gmode=="0")
		alert("wifi5gmode is wrong. Please fix it!!!");
}	
else if(productname=="D3600"||productname=="D3610")	
{
	if(wifi5gmode=="1")
		alert("wifi5gmode is wrong. Please fix it!!!");
}
	
function submit_debugmode(enable)
{
	var cf = document.forms[0];
	cf.Type.value="0";	
	if(enable==1)
	{
		cf.ACTIVE.value="Yes";
		alert("Warning: It will disable ThinClient!");
	}
	else
		cf.ACTIVE.value="No";
	cf.submit();	
}	

function submit_advdebug(enable)
{
	var cf = document.forms[0];
	cf.Type.value="1";
	if(enable==1)
	{
		cf.ACTIVE.value="1";
		alert("Start sniffer packet and log system information. Please stop while you want to download log!");
	}
	else if(enable==0)
		cf.ACTIVE.value="0";
	else if(enable==2)
	{
		alert("Start detecting your internet type, please plug your cable and wait for 3 minutes and click Stop!");
		cf.ACTIVE.value="2";
	}	
	cf.submit();	
}

function submit_VLAN(enable)
{
	var cf = document.forms[0];
	cf.Type.value="3";	
	if(enable==1)
	{
		cf.ACTIVE.value="Yes";
		alert("Warning: It will enable VLAN feature!");
	}
	else
	{
		cf.ACTIVE.value="No";
		alert("Warning: It will disable VLAN feature!");
	}
	cf.submit();	
}	
</script>

<BODY bgcolor=#FFFFFF>
<form method="POST" action="/cgi-bin/engdebug.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=ACTIVE value="">
<input type=hidden name=Type value="0">
<table>
<TR>
	<TD nowrap><B>Product Name : </B></TD>
	<TD nowrap>&nbsp;<%tcWebApi_get("SkuId_Entry","ProductName","s")%>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>FW Version : </B></TD>
	<TD nowrap>&nbsp;<%If tcWebApi_get("DeviceInfo","BasicInfo_FwVer","h") <> "N/A" Then tcWebApi_staticGet("DeviceInfo","BasicInfo_FwVer","s") end if%>&nbsp;</TD>
</TR>																																																					 
<TR>
	<TD nowrap><B>Build Time : </B></TD>
	<TD nowrap>&nbsp;<%tcWebApi_get("SkuId_Entry","BuildTime","s")%>&nbsp;</TD>
</TR>
<TR>
    <TD nowrap><B>Bootloader Version : </B></TD>
    <TD nowrap>&nbsp;<%tcWebApi_get("SkuId_Entry","Bootloaderver","s")%>&nbsp;</TD>
</TR>
<TR>
    <TD nowrap><B>Bootloader Build Time: </B></TD>
    <TD nowrap>&nbsp;<%tcWebApi_get("SkuId_Entry","Bootloaderbutime","s")%>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>HWID : </B></TD>
	<TD nowrap>&nbsp;<%tcWebApi_get("SkuId_Entry","HWID","s")%>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>Region : </B></TD>
	<TD nowrap>&nbsp;<%tcWebApi_get("SkuId_Entry","Region","s")%>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>WiFi5gmode : </B></TD>
	<TD nowrap>&nbsp;<%tcWebApi_get("SkuId_Entry","WiFi5GMode","s")%>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>Check HWID Valid : </B></TD>
	<TD nowrap>&nbsp;<%tcWebApi_get("SkuId_Entry","SKUID_Check","s")%>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>Telnet : </B></TD>
	<TD nowrap>&nbsp;<%tcWebApi_get("Utelnetd_Entry","Active","s")%>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><input type="button" name="Enable" value="Debug Mode Enable" onClick="submit_debugmode(1)"></TD>
	<TD nowrap><input type="button" name="Disable" value="Debug Mode Disable" onClick="submit_debugmode(0)"></TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap><B>Debug Log : </B></TD>
	<TD nowrap><a href="/ayedebug.log"> Download </a></TD>
</TR>
<TR>
	<TD nowrap><B>Debug Packet : </B></TD>
	<TD nowrap><a href="/ayedebug.pcap"> Download </a></TD>
</TR>
<TR>
	<TD nowrap><input type="button" value="Advance Debug Start" onClick="submit_advdebug(1)"></TD>
	<TD nowrap><input type="button" value="Advance Debug DSL Type" onClick="submit_advdebug(2)"></TD>
	<TD nowrap><input type="button" value="Advance Debug Stop" onClick="submit_advdebug(0)"></TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
    <TD nowrap><B>VLAN Function : </B></TD>
    <TD nowrap>&nbsp;<script>
            var status="<%tcWebApi_get("Vlanpt_Entry","Active","s")%>";
            if(status=="Yes")
                document.write("Enable");
            else if(status=="No")
                document.write("Disable");
        </script>
	</TD>
</TR>
<TR>
	<TD>
	 <input type="button" name="enable" value="Enable" onClick="submit_VLAN(1);">
     <input type="button" name="disable" value="Disable" onClick="submit_VLAN(0);">
   </TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap><B>Efuse : </B></TD>
	<TD nowrap></TD>
</TR>
<TR>
	<TD nowrap><B>PowerTable : </B></TD>
	<TD nowrap></TD>
</TR>
</table>
</form>
</BODY>
</HTML>
