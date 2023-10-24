<%
	if request_Form("submit_flag") = "show_traffic_reset" then
                tcWebApi_set("TrafficMeter_Entry","TimeReset","hidden_interval")
                tcWebApi_commit("TrafficMeter_Entry")
	end if
%>


<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/traffic.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/show_traffic.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="show_traffic_reset">
<input type="hidden" name="hidden_interval">

<div class="page_title"><%tcWebApi_multilingual("1","traffic_status_str")%></div>
<div id="main" class="main">
<script>
var alert_error_invalid_range_str="<%tcWebApi_multilingual("1","error_invalid_range_str")%>";

var timereset="<%if tcWebApi_get("TrafficMeter_Entry","TimeReset","h") <> "N/A" then tcWebApi_get("TrafficMeter_Entry","TimeReset","s") else asp_write("") end if%>"
if (timereset == "")
	timereset="5";
if( timereset != "0")
{
	if(get_browser() == "IE")
	{
		setTimeout("location.reload()", parseInt(timereset, 10)*1000);
	}
	else
	{
		document.write('<META http-equiv="refresh" content="'+timereset+'; url=show_traffic.asp">');
	}
}

var traffic_days="<%tcWebApi_get("TrafficMeter_Entry","traffic_days","s")%>";
var traffic_day_persent=eval(traffic_days);
var traffic_mbytes="0.00/0";
var traffic_mbytes_persent="0";
var warning_value="";

var warning_limit="0";
var warning_left="0";

var volume_control_type="<%tcWebApi_get("TrafficMeter_Entry","volume_control_type","s")%>";
var control_type="<%tcWebApi_get("TrafficMeter_Entry","control_type","s")%>";
var traffic_this_month_down="<%tcWebApi_get("TrafficStats_Entry","thismonth_down","s")%>";
var traffic_this_month_total="<%tcWebApi_get("TrafficStats_Entry","thismonth_total","s")%>";
var mon_volumn_limit="<%tcWebApi_get("TrafficMeter_Entry","monthly_volume_limit","s")%>";
var current_traffic= new Array();
var tmp_traffic;
if( volume_control_type==0 && control_type==0 )
{
    traffic_mbytes_persent="0";
}
else if ( volume_control_type==1 && control_type==0 )
{  /* DOWNLOAD ONLY */
    current_traffic=traffic_this_month_down.split("/");
    tmp_traffic=current_traffic[0];
    traffic_mbytes=tmp_traffic.replace(/,/g,"");
    traffic_mbytes+="/";
    traffic_mbytes+=mon_volumn_limit;
    traffic_mbytes_persent=eval(traffic_mbytes);
}
else
{  /* BOTH DIRECTION */
    current_traffic=traffic_this_month_total.split("/");
    tmp_traffic=current_traffic[0];
    traffic_mbytes=tmp_traffic.replace(/,/g,"");
    traffic_mbytes+="/";
    traffic_mbytes+=mon_volumn_limit;
    traffic_mbytes_persent=eval(traffic_mbytes);
}


function loadvalue()
{
	var form=document.forms[0];

	form.interval.value=timereset;
	if(warning_value!="" && (warning_limit=="1" || warning_left=="1"))
		alert(warning_value);
}

</script>

<table width=100% border="0">
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<!--TR><TD colSpan=2> <H1>Traffic Status</H1><br></TD></TR-->
<tr>
    <td align=center colspan=2>
		<table width="300" border="0" cellspacing=0 cellpadding="0">
		<tr>
			<td colspan=2><span class="thead"><%tcWebApi_multilingual("1","period_str")%></span></td>
			<td colspan=2><span class="thead"><%tcWebApi_multilingual("1","amount_use_str")%>&nbsp;&nbsp;</span></td>
		</tr>		
		<tr>
			<td><table width=100%  border="1" cellspacing=0 cellpadding="0" bordercolor="#000000">
				<tr>
					<td><table width=100%  border="0" cellspacing=0 cellpadding="0" height=100>
<script>	
if(traffic_day_persent!="0")
{
	var persent=parseInt(eval(traffic_day_persent*100));
	if ( persent >= 100)
		document.write('<tr><td bgcolor="#0000FF">&nbsp;</td></tr><tr><td width=20 height=100 bgcolor="#0000FF">&nbsp;</td></tr>');
	else	
		document.write('<tr><td>&nbsp;</td></tr><tr><td width=20 height='+persent+' bgcolor="#0000FF">&nbsp;</td></tr>');
}
else
	document.write('<tr><td>&nbsp;</td></tr><tr><td width=20>&nbsp;</td></tr>');					
</script>				
						</table>
					</td>
				</tr>
				</table>
			</td>
			<td><script>document.write(traffic_days)</script><br><%tcWebApi_multilingual("1","days_str")%></td>
			<td><table width=100%  border="1" cellspacing=0 cellpadding="0" bordercolor="#000000">
				<tr>
					<td><table width=100%  border="0" cellspacing=0 cellpadding="0" height=100>
<script>
if(traffic_mbytes_persent!="0")	
{
	var persent=parseInt(eval(traffic_mbytes_persent*100));
	if ( persent >= 100)
		document.write('<tr><td bgcolor=#FF0000>&nbsp;</td></tr><tr><td width=20 height=100 bgcolor=#FF0000>&nbsp;</td></tr>');
	else if( (persent >= 1) && (persent < 90) )	
		document.write('<tr><td>&nbsp;</td></tr><tr><td width=20 height='+persent+' bgcolor="#00FF00">&nbsp;</td></tr>');
	else if(persent < 1 )
		document.write('<tr><td>&nbsp;</td></tr><tr><td width=20>&nbsp;</td></tr>');
	else
		document.write('<tr><td>&nbsp;</td></tr><tr><td width=20 height='+persent+' bgcolor="#FF0000">&nbsp;</td></tr>');
}
else
{
	document.write('<tr><td>&nbsp;</td></tr><tr><td width=20>&nbsp;</td></tr>');		
}
</script>				  
						</table>
					</td>
				</tr>
				</table>
			</td>
<script>
if(traffic_mbytes_persent!="0")
{
	document.write('<td>'+traffic_mbytes+'&nbsp;&nbsp;<%tcWebApi_multilingual("1","mb_str")%>&nbsp;</td>');
}
else
{
	document.write('<td>&nbsp;<%tcWebApi_multilingual("1","no_limit_str")%>&nbsp;</td>');
}
</script>
			<!--td><script>document.write(traffic_mbytes)</script>&nbsp;&nbsp;<%tcWebApi_multilingual("1","mb_str")%>&nbsp;</td-->
		</tr>
    </table>
	</td>
  </tr>
<TR> 
	<TD nowrap>
		<B><%tcWebApi_multilingual("1","poll_interval_str")%> :</B>
		<INPUT TYPE="TEXT" NAME="interval" id="interval" SIZE="5" MAXLENGTH="5" onKeyPress="return getkey('num', event)"> <%tcWebApi_multilingual("1","poll_sec_str")%>
	</TD>
	<TD nowrap>
	<INPUT class="common_bt" TYPE="submit" NAME="settime" id="Set_intvl" VALUE="<%tcWebApi_multilingual("1","set_interval_str")%>" WIDTH="80" onClick="return reset_time();">
	</TD> 
</TR>
</TABLE>

</div>

</form>
</BODY>
<script>
loadvalue();
</script>
</HTML>
