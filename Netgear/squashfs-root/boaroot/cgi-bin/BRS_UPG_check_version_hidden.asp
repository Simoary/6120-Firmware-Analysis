
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/AUTO_search_fw.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="Download_firmware">
<input type=hidden name=UPGRADE_LANG value="6">

<script>
var firmware_upgrade_assistant_str= "<%tcWebApi_multilingual("1","firmware_upgrade_assistant_str")%>";
if(firmware_upgrade_assistant_str=="")
	firmware_upgrade_assistant_str="Firmware Upgrade Assistant";
	
var a_new_version_has_been_found_str= "<%tcWebApi_multilingual("1","a_new_version_has_been_found_str")%>";
if(a_new_version_has_been_found_str=="")
	a_new_version_has_been_found_str="A new version has been found. Do You want to upgrade to the new version now?";
	
	
var current_firmware_version_str= "<%tcWebApi_multilingual("0","current_firmware_version_str")%>";
if(current_firmware_version_str=="")
	current_firmware_version_str="Current Firmware Version";	
	

var new_firmware_version_str= "<%tcWebApi_multilingual("0","new_firmware_version_str")%>";
if(new_firmware_version_str=="")
	new_firmware_version_str="New Firmware Version";

var release_notes_str= "<%tcWebApi_multilingual("0","release_notes_str")%>";
if(release_notes_str=="")
	release_notes_str="Release Notes";

var current_gui_lang_version_str= "<%tcWebApi_multilingual("0","current_gui_lang_version_str")%>";
if(current_gui_lang_version_str=="")
	current_gui_lang_version_str="Current GUI Language Version";

var new_gui_lang_version_str= "<%tcWebApi_multilingual("0","new_gui_lang_version_str")%>";
if(new_gui_lang_version_str=="")
	new_gui_lang_version_str="New GUI Language Version";	
</script>


<div class="page_title"><script>document.write(firmware_upgrade_assistant_str);</script></div>
<div id="main" class="main">
<script>
var new_version = "<%tcWebApi_get("AutoUpgrade_Entry","NewVersion","s")%>"; //example:V1.0.0.2_0.0.1.bin
var curr_version ="<%tcWebApi_get("DeviceInfo","BasicInfo_FwVer","s")%>";
var newVersion = new_version.split("_")[0];
var currVersion = curr_version.split("_")[0];

var updateFirmware = "<%if tcWebApi_get("AutoUpgrade_Entry","NewVersionFound","h") <> "N/A" then tcWebApi_get("AutoUpgrade_Entry","NewVersionFound","s") else asp_write("0") end if%>";
var updateLanguage = "<%if tcWebApi_get("AutoUpgrade_Entry","NewLangVersionFound","h") <> "N/A" then tcWebApi_get("AutoUpgrade_Entry","NewLangVersionFound","s") else asp_write("0") end if%>";
var str_lang="";
var str_firm="";
var ts="<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
var sn = "<%tcWebApi_staticGet("SkuId_Entry","TE_serialnum","s")%>";	

function clickYes()
{
    var cf=document.forms[0];
    cf.submit();
	
	if ( updateLanguage == "1" && updateFirmware == "0" ){
        cf.action="/cgi-bin/BRS_AUTO_upgrade_language.asp?id="+ts;
        cf.submit();
    }
    else if ( updateLanguage == "0" && updateFirmware == "1" ){
        cf.action="/cgi-bin/BRS_AUTO_search_fw.asp?id="+ts;
		cf.UPGRADE_LANG.value="0";
        cf.submit();
    }
    else if ( updateLanguage == "1" && updateFirmware == "1" ){
        cf.action="/cgi-bin/BRS_AUTO_search_fw.asp?id="+ts;
        cf.submit();
    }
}

function getObj(name)
{
    if (document.getElementById)
    {
        return document.getElementById(name);
    }
    else if (document.all)
    {
        return document.all[name];
    }
    else if (document.layers)
    {
        return document.layers[name];
    }
}

function loadvalue()
{
        str_lang=getObj("show_lang").innerHTML;
        str_firm=getObj("show_firm").innerHTML;
        getObj("show_lang").innerHTML="";
        getObj("show_firm").innerHTML="";

        if( updateLanguage == "1" )
                getObj("lang").innerHTML=str_lang;
        if( updateFirmware == "1" )
                getObj("firm").innerHTML=str_firm;
	
}
function func_exit()
{
	/*
	var next_page = "http://www.netgear.com/success/generic.aspx";
	var winoptions = "width=960,height=800,menubar=yes,scrollbars=yes,toolbar=yes,status=yes,location=yes,resizable=yes";
	window.open(next_page,null,winoptions);
	*/
	if(sn == "")
		top.location.href = "http://www.netgear.com/success/generic.aspx";
	else
		top.location.href = "http://www.netgear.com/success/generic.aspx?sn="+sn;
}

</script>
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<TR>
	<TD nowrap colspan=2><B><script>document.write(a_new_version_has_been_found_str);</script></B><BR><BR></TD>
</TR>
</table>
<div id=firm>
</div>
<div align="center" ID="show_firm">
<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<TR><TD nowrap><b><script>document.write(current_firmware_version_str);</script>:</B></TD><TD><script>document.write(currVersion);</script></TD></TR>
<TR><TD nowrap><b><script>document.write(new_firmware_version_str);</script>:</B></TD><TD><script>document.write(newVersion);</script></TD></TR>
<TR><TD nowrap><b><script>document.write(release_notes_str);</script>:</B></TD><TD><%tcWebApi_get("AutoUpgrade_Entry","ReleaseNote","s")%></TD></TR>
</TABLE>
</div>

<div id=lang>
</div>
<div align="center" ID="show_lang">
<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<TR><TD nowrap><b><script>document.write(current_gui_lang_version_str);</script>:</B></TD><TD>V1.0.0.<%tcWebApi_get("LanguageSwitch_Entry","LanguageVersion","s")%></TD></TR>
<TR><TD nowrap><b><script>document.write(new_gui_lang_version_str);</script>:</B></TD><TD>V1.0.0.<%tcWebApi_get("LanguageSwitch_Entry","NewLanguageVersion","s")%></TD></TR>
</TABLE>
</div>

<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2 align=center>
	<BR><BR>
	<input class="short_common_bt" type="button" name="Yes" value="Yes" onclick="clickYes();">&nbsp;
	<input class="short_common_bt" type="button" name="No" value="No" onclick="func_exit()">
	<BR><BR>
	</TD>
</TR>
</TABLE>

</div>

</FORM>
</BODY>
</HTML>
