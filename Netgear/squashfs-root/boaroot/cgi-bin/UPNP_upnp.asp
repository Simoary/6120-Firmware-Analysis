<%
If Request_Form("SaveFlag")="1" Then
	TCWebApi_set("Upnpd_Entry","Active","upnp_onoff")
TCWebApi_set("Upnpd_Entry","autoconf","UPnP_auto")
if tcwebApi_get("WebCustom_Entry","isUpnpEnhanceSupport","h") = "Yes" then
TCWebApi_set("Upnpd_Entry","ExtSecFlag","ExtSec")
end if
TCWebApi_set("Upnpd_Entry","Advertise_period","hidden_advertime")
TCWebApi_set("Upnpd_Entry","Advertise_ttl","TimeToLive")
tcWebApi_commit("Upnpd_Entry")
End If	
%>
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>
<script>
var upnp_list="<%tcWebApi_get("Upnpd_Entry","DATA","s")%>";
</script>
<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/UPNP_upnp.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="upnp">

<div class="page_title"><%tcWebApi_multilingual("1","upnp_title_str")%></div>
<div class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap align=center>
	<input class="common_bt" type='button' name='Refresh' id="refresh" value="<%tcWebApi_multilingual("0","glbstr_refresh")%>" onClick='location.href="UPNP_upnp.asp";'>
        <input class="cancel_bt" type='reset' name='Cancel' id="cancel" value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick='location.href="UPNP_upnp.asp";'>
	<input class="apply_bt" type="submit" name="Apply" value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick="return checkupnp(document.forms[0]);">
        </TD>
</TR>
</TABLE>
</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<input type="hidden" name="hidden_advertime" value="<%If tcWebApi_get("Upnpd_Entry","Advertise_period","h") <>"N/A" then tcWebApi_get("Upnpd_Entry","Advertise_period","s") end if%>">
<input type="hidden" name="hidden_timetolive" value="<%If tcWebApi_get("Upnpd_Entry","Advertise_ttl","h") <>"N/A" then tcWebApi_get("Upnpd_Entry","Advertise_ttl","s") end if%>">
<input type="hidden" name="UPnP_auto" value="1">
<input type="hidden" name="SaveFlag" value="0">
<script>
function click_upnp()
{
	if(document.forms[0].UPnP.checked == true)
	{
		document.forms[0].AdverTime.disabled=false;
		document.forms[0].TimeToLive.disabled=false;
		document.forms[0].upnp_onoff.value = 'Yes';
	}
	else
	{
		document.forms[0].AdverTime.disabled=true;
		document.forms[0].TimeToLive.disabled=true;
		document.forms[0].upnp_onoff.value = 'No';
	}
}
function loadvalue()
{
	<%If tcWebApi_get("Upnpd_Entry","Advertise_period","h") <>"N/A" then %>
	document.forms[0].AdverTime.value = eval(document.forms[0].hidden_advertime.value)/60;
	<%end if%>
	<%If tcWebApi_get("Upnpd_Entry","Active","h") = "Yes" then%>
	document.forms[0].UPnP.value = "Yes";
	document.forms[0].UPnP.checked = true;
	document.forms[0].AdverTime.disabled=false;
	document.forms[0].TimeToLive.disabled=false;
	<%elseif tcWebApi_get("Upnpd_Entry","Active","h") = "No" then%>
	document.forms[0].UPnP.value = "No";
	document.forms[0].UPnP.checked = false;
	document.forms[0].AdverTime.disabled=true;
	document.forms[0].TimeToLive.disabled=true;
	<%end if%>
}
function checkupnp(cf)
{
	if(cf.UPnP.checked==true)
	{
		cf.upnp_onoff.value="Yes";
		cf.UPnP.value="Yes";
		cf.UPnP_auto.value=1;
	}
	else if(cf.UPnP.checked==false)
	{
		cf.upnp_onoff.value="No";
		cf.UPnP.value="No";
		cf.UPnP_auto.value=0;
	}
	if(cf.AdverTime.value=="")
	{
		alert(invalid_advertise_period_str);
		return false;
	}
	if((cf.AdverTime.value>1440)||(cf.AdverTime.value<1))
	{
		alert(invalid_advertise_period_str);
		return false;
	}
	if(cf.TimeToLive.value=="")
	{
		alert(invalid_advertise_ttl_str);
		return false;
	}
	if((cf.TimeToLive.value>255)||(cf.TimeToLive.value<1))
	{
		alert(invalid_advertise_ttl_str);
		return false;
	}
	cf.hidden_advertime.value = eval(cf.AdverTime.value)*60;
	cf.SaveFlag.value = 1;
	cf.submit();
}
var invalid_advertise_period_str="<%tcWebApi_multilingual("1","invalid_advertise_period_str")%>";
var invalid_advertise_ttl_str="<%tcWebApi_multilingual("1","invalid_advertise_ttl_str")%>";
</script>
<input type="hidden" name="upnp_onoff" value="<% If TCWebApi_get("Upnpd_Entry","Active","h") <> "N/A" then TCWebApi_get("Upnpd_Entry","Active","s") end if%>">
<input type="hidden" name="changetime">

<TR>
	<TD nowrap colspan=2>
	<input type="checkbox" name="UPnP" id="upnp" onClick='return click_upnp()'>
	<A tabindex=-1 href="javascript:loadhelp('_upnp','turnon')"><B><%tcWebApi_multilingual("1","upnp_turn_on_str")%></B></A>
	</TD>
</TR>
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_upnp','adv')"><B><%tcWebApi_multilingual("1","upnp_advertise_period_str")%></B></A><%tcWebApi_multilingual("1","upnp_advertise_period_unit_str")%>
	</TD>
	<TD nowrap>
	<input type="text" name="AdverTime" id="adver_time" size="8" maxlength="4" onKeyPress="return getkey('num', event)" >
	</TD>
</TR>
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_upnp','live')"><B><%tcWebApi_multilingual("1","upnp_advertise_ttl_str")%></B></A><%tcWebApi_multilingual("1","upnp_advertise_ttl_unit_str")%>
	</TD>
	<TD nowrap>
	<input type="text" name="TimeToLive" id="time_to_live" size="8" maxlength="3" onKeyPress="return getkey('num', event)" value="<%If tcWebApi_get("Upnpd_Entry","Advertise_ttl","h") <>"N/A" then tcWebApi_get("Upnpd_Entry","Advertise_ttl","s") end if%>">
	</TD>
</TR>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_upnp','table')"><B><%tcWebApi_multilingual("1","upnp_port_table_str")%></B></A>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<TABLE class=tables name=Active id="upnp_portmap" border=0 cellpadding=2 cellspacing=0 width=100%>
	<TR class=table_header>
	<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","active_str")%></span></TD>
	<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","protocol_str")%></span></TD>
	<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","upnp_inter_port_str")%></span></TD>
	<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","upnp_exter_port_str")%></span></TD>
	<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","ipaddr_str")%></span></TD>
	</TR>
<script>
	var upnp_list_array = new Array();  
	
	var upnp_list_array=upnp_list.split("@&#35;$&#38;*! ");
	var upnp_active_array = new Array();  
	var upnp_protocal_array = new Array(); 
	var upnp_int_array = new Array(); 
	var upnp_ext_array = new Array(); 	
	var upnp_ip_array = new Array(); 	
	var p=0;
	
	
	if(upnp_list != "")
	for(i=0;i<upnp_list_array.length-1;i++)
	{
		var each_info=upnp_list_array[i].split(';');
		if(each_info[0]==0)
		{	upnp_active_array[p]="NO";}
		else
		{	upnp_active_array[p]="YES";}
		
		upnp_protocal_array[p]=each_info[1];
		upnp_int_array[p]=each_info[2];
		upnp_ext_array[p]=each_info[3];
		upnp_ip_array[p]=each_info[4];		
		p++;
	}		
	if( upnp_list != "" )	
	for(i=0;i<upnp_list_array.length-1;i++)
	{
	    if( i%2== 0 )
			document.write('<TR class=\"even_line\"><TD nowrap align=center>'+upnp_active_array[i]+'</TD><TD nowrap align=center>'+upnp_protocal_array[i]+'</TD><TD nowrap align=center>'+upnp_int_array[i]+'</TD><TD nowrap align=center>'+upnp_ext_array[i]+'</TD><TD nowrap align=center>'+upnp_ip_array[i]+'</TD></TR>');
		else
			document.write('<TR class=\"odd_line\"><TD nowrap align=center>'+upnp_active_array[i]+'</TD><TD nowrap align=center>'+upnp_protocal_array[i]+'</TD><TD nowrap align=center>'+upnp_int_array[i]+'</TD><TD nowrap align=center>'+upnp_ext_array[i]+'</TD><TD nowrap align=center>'+upnp_ip_array[i]+'</TD></TR>');
	}
	
	var test = 'externalport:protocol:internalport:internalclient:enabled:description:leaseduration' ;
	
</script>
	</TABLE>
	</TD>
</TR>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
</TABLE>
</div>
<%tcWebApi_multilingual("2","_upnp_help.asp")%>
</FORM>
</BODY>
</HTML>
