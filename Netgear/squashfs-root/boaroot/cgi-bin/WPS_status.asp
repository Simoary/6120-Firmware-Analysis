<%
If Request_Form("wps_mode") = "1"  Then 
    TcWebApi_set("WebCurSet_Entry","wlan_id","hidden_wlan_id")
	TCWebApi_set("WLan_Entry","WPSMode","wps_mode")
	TCWebApi_set("Info_WLan","WPSActiveStatus","wps_start")
    TCWebApi_set("Info_WLan","WPSButtonPush","wps_button_push")
elseif Request_Form("wps_mode") = "0"  Then 
    TcWebApi_set("WebCurSet_Entry","wlan_id","hidden_wlan_id")
	TCWebApi_set("WLan_Entry","WPSMode","wps_mode")
	TCWebApi_set("WLan_Entry","enrolleePinCode","PIN")
	TCWebApi_set("Info_WLan","WPSActiveStatus","wps_start")
    TCWebApi_set("Info_WLan","WPSButtonPush","wps_button_push")
End if
If Request_Form("wps5g_mode") = "1"  Then 
    TcWebApi_set("WebCurSet_Entry","wlan_ac_id","hidden_wlan_id")
	TCWebApi_set("WLan11ac_Entry","WPSMode","wps5g_mode")
	TCWebApi_set("Info_WLan11ac","WPSActiveStatus","wps_start")
    TCWebApi_set("Info_WLan11ac","WPSButtonPush","wps_button_push")
elseif Request_Form("wps5g_mode") = "0"  Then 
    TcWebApi_set("WebCurSet_Entry","wlan_ac_id","hidden_wlan_id")
	TCWebApi_set("WLan11ac_Entry","WPSMode","wps5g_mode")
	TCWebApi_set("WLan11ac_Entry","enrolleePinCode","PIN")
	TCWebApi_set("Info_WLan11ac","WPSActiveStatus","wps_start")
    TCWebApi_set("Info_WLan11ac","WPSButtonPush","wps_button_push")
End if
tcWebApi_commit("WebCurSet_Entry")
tcWebApi_commit("WLan_Entry")
tcWebApi_commit("WLan11ac_Entry")
%>
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" target=formframe name="WPSstopForm">
<input type=hidden name=submit_flag value="stop_wps_status">

<div class="page_title" id="title"><%tcWebApi_multilingual("1","connecting_wireless_clients_str")%></div>
<div id="main" class="main">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<input type="hidden" name="wps_stop" value="0">



<STYLE type=text/css>
.prgbar1 { font-family:Arial; padding:0px; height: 20px; font-weight: bolder; font-size: 10pt; border: 1px solid; border-color: #09c; color: #0000FF}
</STYLE>

<script type="text/javascript">
var pchar = "|"; // progress char
var maxchars;
var timestamp;
if ( parent.wps_choice == 1 )
	maxchars = (120*2+70);		//bug 22356, GUI will display timeout message after 4 minutes.
else if ( parent.wps_choice == 0 )
	{
		maxchars = (60*4+50);		// bug 22360,GUI will display timeout message after 2 minutes.
		pchar = "|";
	}
var delay_time = 500; // msecs		//bug16779: a half-second interval

//var wps_status="";
wps_charcount = parent.wps_charcount;
parent.wps_cancel_button=0;
pin_refresh_time = parent.pin_refresh_time; //bug 23496,the result page of timeout(PIN method) doesn't appearance when loading bar reach at 100%
function loadvalue()
{
	updateProgress();
}

function makeStr(strsize, fillchar)
{
	var temp = "";
	for (i=0; i < strsize ; i ++)
		temp = temp + fillchar;
	return temp;
}

function WPSstop()
{
   parent.wps_cancel_button=1;
   document.getElementById("title").style.display="none";
   document.getElementById("main").style.display="none";
   document.getElementById("waiting_bar").style.display="";
   document.forms[0].action="/cgi-bin/WPS_failure.asp?id="+timestamp;
}

function updateProgress()
{
	wps_status = top.formframe.wps_status_frame.wps_status;
	wps_status_5g = top.formframe.wps_status_frame.wps_status_5g;
	updateInfo();
	var cf = document.forms[0];
	
	if ( parent.wps_charcount % 2 == 0 )
		cf.wps_icon.src = "/wps_icon_on.jpg";
	else
		cf.wps_icon.src = "/wps_icon_off.jpg";

	cf.progress.value = makeStr(parseInt(parent.wps_charcount/2),pchar);

	if(wps_status == "WPS Process Fail" || wps_status_5g == "WPS Process Fail")
	{
		setTimeout("location.href='WPS_failure.asp'",3000);
	}
	else if ( parent.wps_charcount == maxchars )
	{
		setTimeout("location.href='WPS_failure.asp'",3000);
	}
	else
	{
		if ( parent.wps_choice == 1 )
		{
				parent.wps_charcount=parent.wps_charcount+1;
		}
		else
			parent.wps_charcount=parent.wps_charcount+1;
			
		setTimeout("updateProgress();",delay_time);
	}

}

function updateInfo()
{

if ( parent.wps_choice == 1 )
{
	document.getElementById("pin").style.display="";

	if(top.wps_process == 0)
	{
	    if(wps_status == "Configured" || wps_status_5g == "Configured")
		{
		document.getElementById("info_1").style.display="";
		document.getElementById("info_2").style.display="none";
		document.getElementById("info_3").style.display="none";
		document.getElementById("info_4").style.display="none";
			top.wps_process = 1;	//Authenticating client...
	    }
	}
	else if( top.wps_process == 1)
	{
	    if(wps_status == "Configured" || wps_status_5g == "Configured")
		{
		document.getElementById("info_1").style.display="none";
		document.getElementById("info_2").style.display="";
		document.getElementById("info_3").style.display="none";
		document.getElementById("info_4").style.display="none";
			top.wps_process = 2;  //Sending configuration data to the client...
		}
	}
	else if( top.wps_process == 2)
	{
	    if(wps_status == "Configured" || wps_status_5g == "Configured")
		{
		document.getElementById("info_1").style.display="none";
		document.getElementById("info_2").style.display="none";
		document.getElementById("info_3").style.display="";
		document.getElementById("info_4").style.display="none";
                parent.wps_charcount=parseInt(parent.wps_charcount/4);
                parent.wps_client=parseInt(parent.wps_charcount/4);
			top.wps_process = 3;  //Collecting the client's information...
                	document.forms[0].action="/cgi-bin/WPS_success.asp?id="+timestamp;
					document.forms[0].submit();
		}
	}

}else{

        if(top.wps_process == 0)
        {
		if(wps_status == "Configured" || wps_status_5g == "Configured")
		{
		document.getElementById("info_1").style.display="";
		document.getElementById("info_2").style.display="none";
		document.getElementById("info_3").style.display="none";
		document.getElementById("info_4").style.display="none";
                	top.wps_process = 1;   //Authenticating client...
		}
        }
        else if(top.wps_process == 1)
        {
		if(wps_status == "Configured" || wps_status_5g == "Configured")
		{
		document.getElementById("info_1").style.display="none";
		document.getElementById("info_2").style.display="";
		document.getElementById("info_3").style.display="none";
		document.getElementById("info_4").style.display="none";
	                top.wps_process = 2;  //Sending configuration data to the client...
		}
        }
        else if( top.wps_process == 2)
        {
		if(wps_status == "Configured" || wps_status_5g == "Configured")
		{
		document.getElementById("info_1").style.display="none";
		document.getElementById("info_2").style.display="none";
		document.getElementById("info_3").style.display="";
		document.getElementById("info_4").style.display="none";
                parent.wps_charcount=parseInt(parent.wps_charcount/4);
                parent.wps_client=parseInt(parent.wps_charcount/4);
			top.wps_process = 3;  //Collecting the client's information...
                	document.forms[0].action="/cgi-bin/WPS_success.asp?id="+timestamp;
					document.forms[0].submit();
		}
        }
	else
	{
		document.getElementById("info_1").style.display="none";
		document.getElementById("info_2").style.display="none";
		document.getElementById("info_3").style.display="none";
		document.getElementById("info_4").style.display="";
	}

}
}
</script>
<TR id="pin" style="display:none;">
	<TD><%tcWebApi_multilingual("1","clients_pin_str")%><font size=4><B><script>document.write(" " + parent.wps_pin_num);</script></B></font>.</TD>
</TR>
<TR id="info_1" style="display:none;">
	<TD><%tcWebApi_multilingual("1","authenticating_client_str")%></TD>
</TR>
<TR id="info_2" style="display:none;">
	<TD><%tcWebApi_multilingual("1","send_configure_client_str")%></TD>
</TR>
<TR id="info_3" style="display:none;">
	<TD><%tcWebApi_multilingual("1","collect_client_information_str")%></TD>
</TR>
<TR id="info_4" style="display:none;">
	<TD><%tcWebApi_multilingual("1","click_button_client_str")%></TD>
</TR>

<TR>
	<TD nowrap align="center">
	<img name="wps_icon" src="/wps_icon_on.jpg">&nbsp;&nbsp;&nbsp;
	<input type="text" name="progress" id="progress" value="" class="prgbar1" size="50">
	</TD>
</TR>
<TR>
	<TD ALIGN=center>
	<input class="cancel_bt" type="submit" name="Cancel" id="cancel" value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick="WPSstop();">
	</TD>
</TR>
</TABLE>
<iframe name="wps_status_frame" src="wps_get_status.asp" allowtransparency="true" scrolling="no" frameborder="0" ></iframe>
</div>
<div id="waiting_bar" style="display:none">
<div  align="center"><BR><BR><TR><TD align="center"><B><%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%></B></TD></TR><BR><BR></div>
<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" alt="waiting" /></div>
</div>
<%tcWebApi_multilingual("2","_wps_help.asp")%>
</FORM>
</BODY>
</HTML>
