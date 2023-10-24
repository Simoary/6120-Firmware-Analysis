<%
If request_Form("ScheduleDays")<> "" then
	/* Block Site */
	tcWebApi_set("UrlFilterd_Entry","ScheduleDays","ScheduleDays")
	tcWebApi_set("UrlFilterd_Entry","ScheduleStartNum","ScheduleStartNum")
	tcWebApi_set("UrlFilterd_Entry","ScheduleEndNum","ScheduleEndNum")
	tcWebApi_commit("UrlFilterd_Entry")
	
	/* Block Service*/
	tcWebApi_set("IpMacFilter_Common","TimeStart","start_block_time")
	tcWebApi_set("IpMacFilter_Common","TimeEnd","end_block_time")
	tcWebApi_set("IpMacFilter_Common","Weekdays","days_to_block")
	tcWebApi_commit("IpMacFilter_Entry")
	
	/* NTP */
	tcWebApi_set("Timezone_Entry","TZ","TZ")
	tcWebApi_set("Timezone_Entry","DAYLIGHT","ntpadjust")
	tcWebApi_set("Timezone_Entry","SERVER","ntpserver1")
	tcWebApi_set("Timezone_Entry","SERVER2","ntpserver2")
	tcWebApi_set("Timezone_Entry","TYPE","TYPE")
	tcWebApi_set("Timezone_Entry","PCSyncFlag","PCSyncFlag")
	tcWebApi_set("Timezone_Entry","SELECTNUM","hidden_select")
	tcWebApi_commit("Timezone_Entry")
End if
%>


<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/schedule.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/FW_schedule.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="schedule">

<div class="page_title"><%tcWebApi_multilingual("1","schedule_str")%></div>
<div id="page_title" class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
			<input class="cancel_bt" name="Cancel" id="cancel" type="submit"  value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick="location.reload();return false;">&nbsp;&nbsp;
			<input class="apply_bt" name="Apply" id="apply" type="submit" value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick="return check_schedule_apply(document.forms[0])">	
        </TD>
</TR>
</TABLE>
</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>


<script>
var alert_check_at_least_one_day_str="<%tcWebApi_multilingual("1","alert_check_at_least_one_day_str")%>";
var alert_invalid_time_input_str="<%tcWebApi_multilingual("1","alert_invalid_time_input_str")%>";
var select_ntp= "<%if tcWebApi_get("Timezone_Entry","SELECTNUM","h") <> "N/A" then tcWebApi_get("Timezone_Entry","SELECTNUM","s") else asp_write("0") end if%>";
var old_ntpadjust= "<%if tcWebApi_get("Timezone_Entry","DAYLIGHT","h") <> "N/A" then tcWebApi_get("Timezone_Entry","DAYLIGHT","s") end if%>";

var cur_time="<%tcWebApi_get("DeviceInfo","cur_time","s")%>";
var gui_region="<%if tcWebApi_get("LanguageSwitch_Entry","Language_Selection","h") = "N/A" then asp_write("Auto") else tcWebApi_get("LanguageSwitch_Entry","Language_Selection","s") end if%>";
var sunday_str="<%tcWebApi_multilingual("1","sunday_str")%>";
var monday_str="<%tcWebApi_multilingual("1","monday_str")%>";
var tuesday_str="<%tcWebApi_multilingual("1","tuesday_str")%>";
var wednesday_str="<%tcWebApi_multilingual("1","wednesday_str")%>";
var thursday_str="<%tcWebApi_multilingual("1","thursday_str")%>";
var friday_str="<%tcWebApi_multilingual("1","friday_str")%>";
var saturday_str="<%tcWebApi_multilingual("1","saturday_str")%>";
cur_time=change_cur_time(cur_time,gui_region);
var schedule_days='<%if tcWebApi_get("UrlFilterd_Entry","ScheduleDays","h") <> "N/A" then tcWebApi_get("UrlFilterd_Entry","ScheduleDays","s") end if%>';
var schedule_startTime='<%if tcWebApi_get("UrlFilterd_Entry","ScheduleStartNum","h") <> "N/A" then tcWebApi_get("UrlFilterd_Entry","ScheduleStartNum","s") end if%>';
var schedule_endTime='<%if tcWebApi_get("UrlFilterd_Entry","ScheduleEndNum","h") <> "N/A" then tcWebApi_get("UrlFilterd_Entry","ScheduleEndNum","s") end if%>';


var is_vcna = parent.is_vc_release;
function loadvalue()
{
	var cf=document.forms[0];
	
	<%if request_Form("reflesh") = "1" then%>
	document.getElementById("page_title").style.display="none";
	document.getElementById("main").style.display="none";
	document.getElementById("waiting_bar").style.display="";
	setTimeout("redirect()", 3000);
	<%else%>
	
	if( schedule_days == '127' || schedule_days == '')
		cf.checkboxNameAll.checked = true;
	else
	{
		var day_array= parseInt(schedule_days);				
		if(day_array & 64)
			cf.checkboxNameSun.checked = true;
		if(day_array & 1)
			cf.checkboxNameMon.checked = true;
		if(day_array & 2)
			cf.checkboxNameTue.checked = true;
		if(day_array& 4)
			cf.checkboxNameWed.checked = true;
		if(day_array& 8)
			cf.checkboxNameThu.checked = true;
		if(day_array& 16)
			cf.checkboxNameFri.checked = true;
		if(day_array& 32)
			cf.checkboxNameSat.checked = true;	
	}
	
	if(schedule_startTime == '0' && schedule_endTime=='1439' || schedule_startTime == '' && schedule_endTime=='')
	{
		cf.checkboxNamehours.checked =true;
		ClearData1();
	}
	else{
		var startTime = parseInt(schedule_startTime,10);
		cf.starthour.value = parseInt(startTime / 60);
		cf.startminute.value = startTime % 60;
		
		var endTime = parseInt(schedule_endTime,10);
		cf.endhour.value = parseInt(endTime / 60);
		cf.endminute.value = endTime % 60;
	}
	BlockAllClickCheck(cf);	

    cf.time_zone.options[eval(select_ntp)].selected =true;
	if( old_ntpadjust == "Enable")
        cf.adjust.checked =true;
    else
        cf.adjust.checked =false;
	<%end if%>
}
function redirect(){
     var loc = '';
	 loc = '/cgi-bin/FW_schedule.asp';
	 location.href= loc;
}
</script>
<input type="hidden" name="days_to_block">
<input type="hidden" name="start_block_time">
<input type="hidden" name="end_block_time">
<input type="hidden" name="all_day">
<input type="hidden" name="ntpadjust">
<input type="hidden" name="ntpserver1">
<input type="hidden" name="ntpserver2">
<input type="hidden" name="hidden_ntpserver">
<input type="hidden" name="hidden_dstflag">
<input type="hidden" name="hidden_select">
<input type="hidden" name="dif_timezone">
<input type="hidden" name="ScheduleDays">
<input type="hidden" name="ScheduleStartNum">
<input type="hidden" name="ScheduleEndNum">
<input type="hidden" name="TZ">
<input type="hidden" name="TYPE" value="0">
<input type="hidden" name="PCSyncFlag" value="0">
<input type="hidden" name="reflesh" value="0">
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_FW_schedule','blocksch')"><B><%tcWebApi_multilingual("1","days_to_block_str")%>:</B></A>
	</TD>
</TR>
<TR>
	<TD nowrap>
	<input name="checkboxNameAll" id="everyday" onclick="BlockAllClickCheck(document.forms[0])"; type="checkbox" value=1><%tcWebApi_multilingual("1","every_day_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap>
	<input name="checkboxNameSun" id="sun" type=checkbox value=1><%tcWebApi_multilingual("1","sunday_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap> 
	<input name="checkboxNameMon" id="mon" type=checkbox value=1><%tcWebApi_multilingual("1","monday_str")%>
	</TD>
</TR> 
<TR>
	<TD nowrap>
	<input name="checkboxNameTue" id="tue" type=checkbox value=1><%tcWebApi_multilingual("1","tuesday_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap>
	<input name="checkboxNameWed" id="wed" type=checkbox value=1><%tcWebApi_multilingual("1","wednesday_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap>
	<input name="checkboxNameThu" id="thu" type=checkbox value=1><%tcWebApi_multilingual("1","thursday_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap>
	<input name="checkboxNameFri" id="fri" type=checkbox value=1><%tcWebApi_multilingual("1","friday_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap>
	<input name="checkboxNameSat" id="sat" type=checkbox value=1><%tcWebApi_multilingual("1","saturday_str")%>
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_FW_schedule','blocksch')"><B><%tcWebApi_multilingual("1","time_of_day_to_block_str")%></B></A><%tcWebApi_multilingual("1","use_24_hour_clock_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input name="checkboxNamehours" id="all_day" onclick="BlockPeriodClick(document.forms[0])"; type="checkbox" value=1><%tcWebApi_multilingual("1","all_day_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","start_blocking_str")%></TD>
	<TD nowrap>
	<input maxLength=2 name=starthour id="start_hour" size=3 onKeyPress="return getkey('num', event)"><%tcWebApi_multilingual("1","hour_str")%>
	<input maxLength=2 name=startminute id="start_minute" size=3 onKeyPress="return getkey('num', event)"><%tcWebApi_multilingual("1","minute_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","end_blocking_str")%></TD>
	<TD nowrap>
	<input maxLength=2 name=endhour id="end_hour" size=3 onKeyPress="return getkey('num', event)"><%tcWebApi_multilingual("1","hour_str")%>
	<input maxLength=2 name=endminute id="end_minute" size=3 onKeyPress="return getkey('num', event)"><%tcWebApi_multilingual("1","minute_str")%>
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
        <TD nowrap colspan=2>
        <A tabindex=-1 href="javascript:loadhelp('_FW_schedule','timezone')"><B><%tcWebApi_multilingual("1","time_zone_str")%></B></a>
        </TD>
</TR>
<TR>
        <TD nowrap colspan=2>
        <select name="time_zone" id="time_zone">					  <!--vcna-->
                <option value="GMT+12" selected><%tcWebApi_multilingual("1","gmt_eniwetok_str")%></option><!--0-->		
                <option value="GMT+11" ><%tcWebApi_multilingual("1","gtm_midway_island_str")%></option>	<!--1-->	
                <option value="GMT+10" ><%tcWebApi_multilingual("1","gtm_hawaii_str")%></option>	<!--2-->	
                <option value="GMT+9" ><%tcWebApi_multilingual("1","gtm_alaska_str")%></option>		<!--3-->	
                <option value="GMT+8" ><%tcWebApi_multilingual("1","gtm_pacific_time_str")%></option>		<!--4-->	
                <option value="GMT+7" ><%tcWebApi_multilingual("1","gtm_arizona_str")%></option>	<!--5-->	
                <option value="GMT+7" ><%tcWebApi_multilingual("1","gtm_mountain_time_str")%></option>	<!--6-->  <!--6-->
                <option value="GMT+6" ><%tcWebApi_multilingual("1","gtm_central_time_str")%></option>	<!--7-->  <!--7-->
<script>
if( is_vcna != 1 )
document.write('<option value="GMT+6" ><%tcWebApi_multilingual("1","gtm_guadalajara_str")%></option>')    //<!--8-->	
</script>
		<option value="GMT+5" ><%tcWebApi_multilingual("1","gtm_eastern_time_str")%></option>	<!--9-->  <!--8-->
                <option value="GMT+5" ><%tcWebApi_multilingual("1","gtm_indiana_str")%></option>	<!--10--> <!--9-->
                <option value="GMT+4" ><%tcWebApi_multilingual("1","gtm_atlantic_time_str")%></option>		<!--11--> <!--10-->
                <option value="GMT+3:30" ><%tcWebApi_multilingual("1","gtm_newfoundland_str")%></option>		<!--12--> <!--11-->
				<option value="GMT+3" ><%tcWebApi_multilingual("1","gtm_brasilia_str")%></option>		<!--13--> <!--12-->				
                <option value="GMT+2" ><%tcWebApi_multilingual("1","gtm_mid_atlantic_str")%></option>		<!--14--> <!--13-->
                <option value="GMT+1" ><%tcWebApi_multilingual("1","gtm_azores_str")%></option>		<!--15--> <!--14-->
                <option value="GMT-0" ><%tcWebApi_multilingual("1","gtm_casablanca_str")%></option>	<!--16-->
                <option value="GMT-0" ><%tcWebApi_multilingual("1","gtm_greenwich_mean_time_str")%></option>	<!--17-->
                <option value="GMT-1" ><%tcWebApi_multilingual("1","gtm_amsterdam_str")%></option>		<!--18-->
                <option value="GMT-1" ><%tcWebApi_multilingual("1","gtm_belgrade_str")%></option>		<!--19-->
                <option value="GMT-1" ><%tcWebApi_multilingual("1","gtm_brussels_str")%></option>		<!--20-->	
                <option value="GMT-1" ><%tcWebApi_multilingual("1","gtm_sarajevo_str")%></option>		<!--21-->	
                <option value="GMT-2" ><%tcWebApi_multilingual("1","gtm_athens_str")%></option>		<!--22-->	
                <option value="GMT-2" ><%tcWebApi_multilingual("1","gtm_bucharest_str")%></option>		<!--23-->
                <option value="GMT-2" ><%tcWebApi_multilingual("1","gtm_helsinki_str")%></option>		<!--24-->
                <option value="GMT-3" ><%tcWebApi_multilingual("1","gtm_baghdad_str")%></option>		<!--25-->
                <option value="GMT-3" ><%tcWebApi_multilingual("1","gtm_moscow_str")%></option>		<!--26-->
                <option value="GMT-4" ><%tcWebApi_multilingual("1","gtm_abu_dhabi_str")%></option>		<!--27-->
                <option value="GMT-5" ><%tcWebApi_multilingual("1","gtm_ekaterinburg_str")%></option>		<!--28-->
                <option value="GMT-5:30" ><%tcWebApi_multilingual("1","gtm_chennai_str")%></option>	<!--29-->
                <option value="GMT-6" ><%tcWebApi_multilingual("1","gtm_almaty_str")%></option>		<!--30-->
                <option value="GMT-7" ><%tcWebApi_multilingual("1","gtm_bangkok_str")%></option>		<!--31-->
                <option value="GMT-8" ><%tcWebApi_multilingual("1","gtm_beijing_str")%></option>		<!--32-->
                <option value="GMT-8" ><%tcWebApi_multilingual("1","gtm_taipei_str")%></option>		<!--33-->
                <option value="GMT-9" ><%tcWebApi_multilingual("1","gtm_tokyo_str")%></option>		<!--34-->
                <option value="GMT-10" ><%tcWebApi_multilingual("1","gtm_brisbane_str")%></option>	<!--35-->
                <option value="GMT-10" ><%tcWebApi_multilingual("1","gtm_guam_str")%></option>	<!--36-->
                <option value="GMT-11" ><%tcWebApi_multilingual("1","gtm_solomon_str")%></option>		<!--37-->
                <option value="GMT-12" ><%tcWebApi_multilingual("1","gtm_fiji_str")%></option>		<!--38-->
        </select>
        </TD>
</TR>
<TR>
        <TD nowrap colspan=2>
        <input type="checkbox" name="adjust" id="adjust" value="1"><%tcWebApi_multilingual("1","automatically_adjust_for_daylight_str")%>
        </TD>
</TR>
<TR>
        <TD id="current_time" nowrap colspan=2 align=center><B><%tcWebApi_multilingual("1","current_time_str")%>: <script>document.write(cur_time)</script></B></TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</TABLE>
</div>
<div id="waiting_bar" style="display:none">
<div  align="center"><BR><BR><TR><TD align="center"><B><%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%></B></TD></TR><BR><BR></div>
<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" alt="waiting" /></div>
</div>
<%tcWebApi_multilingual("2","_FW_schedule_help.asp")%>
</FORM>
</BODY>
</HTML>
