
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/AUTO_download_image.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="download_image">

<div class="page_title">Firmware Upgrade Assistant</div>
<div id="main" class="main">
<script>
var updateFirmware = 0;
var updateLanguage = 0;


var ts='88894784';

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

function clickYes()
{
        var cf=document.forms[0];
	if ( updateLanguage == 1 || updateFirmware == 1 ){
		top.enable_action=0;
		if(top.topframe && !top.hidden_upgrade) //if top.topframe exists and top.hidden_upgrade does not exit
			top.topframe.location.href="top_nochange.asp";
		else if(top.topframe && top.hidden_upgrade)     //if top.hidden_upgrade exits, top is the hidden page CheckNewFirmware.asp
			top.topframe.location.href="CheckNewFW_top.asp";
	}
        if ( updateLanguage == 1 && updateFirmware == 0 ){
                cf.submit_flag.value="download_language";
                cf.action="/cgi-bin/AUTO_download_language.asp timestamp="+ts;
                cf.submit();
        }
        else if ( updateLanguage == 0 && updateFirmware == 1 ){
                cf.submit_flag.value="download_image";
                cf.action="/cgi-bin/AUTO_download_image.asp timestamp="+ts;
                cf.submit();
        }
        else if ( updateLanguage == 1 && updateFirmware == 1 ){
                cf.submit_flag.value="download_all";
                cf.action="/cgi-bin/AUTO_download_image.asp timestamp="+ts;
                cf.submit();
        }
}

function clickNo()
{
	if(top.topframe)
		top.topframe.location.reload();

	if(top.hidden_upgrade)  //if top.hidden_upgrade exits, top is CheckNewFirmware.asp
		close_top_window();
	else
		this.location.href = "tools_update.asp";
}

function loadvalue()
{

        if( updateFirmware == 1 ){
		document.getElementById("cur_firm").style.display="";
		document.getElementById("new_firm").style.display="";
	}
	else
	{
		document.getElementById("cur_firm").style.display="none";
		document.getElementById("new_firm").style.display="none";
	}

	if( updateLanguage == 1 ){
		document.getElementById("cur_lang").style.display="";
		document.getElementById("new_lang").style.display="";
	}
	else{
		document.getElementById("cur_lang").style.display="none";
		document.getElementById("new_lang").style.display="none";
	}
	
}
</script>
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<TR>
	<TD nowrap colspan=2><B>A new version has been found. Do You want to upgrade to the new version now?</B><BR><BR></TD>
</TR>
<TR id=cur_firm><TD nowrap><b>Current Firmware Version:</B></TD><TD>V1.0.0.13</TD></TR>
<TR id=new_firm><TD nowrap><b>New Firmware Version:</B></TD><TD></TD></TR>
<TR><TD>&nbsp;</TD><TD></TD></TR>
<TR id=cur_lang><TD nowrap><b>Current GUI Language Version:</B></TD><TD>V1.0.0.77</TD></TR>
<TR id=new_lang><TD nowrap><B>New GUI Language Version:</B></TD><TD></TD></TR>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR><TD colspan=2>

</TD>
</TR>
<TR>
	<TD nowrap colspan=2 align=center>
	<input class="short_common_bt" type="button" name="Yes" value="Yes" onclick="clickYes();">&nbsp;
	<input class="short_common_bt" type="button" name="No" value="No" onclick="clickNo();">
	</TD>
</TR>
</TABLE>

</div>

</FORM>
</BODY>
</HTML>
