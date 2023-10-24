<%
        if request_Form("submit_flag") = "traffic_apply" then
                tcWebApi_set("TrafficMeter_Entry","endis_traffic_meter","endis_traffic")
                tcWebApi_set("TrafficMeter_Entry","restart_counter_time","restart_counter_time")
                tcWebApi_set("TrafficMeter_Entry","control_type","control_type")
                tcWebApi_set("TrafficMeter_Entry","volume_control_type","volume_control_type")
                tcWebApi_set("TrafficMeter_Entry","monthly_volume_limit","hidden_volume_monthly_limit")
                tcWebApi_set("TrafficMeter_Entry","round_up_data","hidden_round_up")
                tcWebApi_set("TrafficMeter_Entry","monthly_time_limit","hidden_conntime_monthly_limit")
                tcWebApi_set("TrafficMeter_Entry","restart_day","restart_time_day")
                tcWebApi_set("TrafficMeter_Entry","restart_time_hour","restart_time_hour")
                tcWebApi_set("TrafficMeter_Entry","restart_time_min","restart_time_min")
                tcWebApi_set("TrafficMeter_Entry","left_volume_time","hidden_left_volume_time")
                tcWebApi_set("TrafficMeter_Entry","traffic_led","traffic_led")
                tcWebApi_set("TrafficMeter_Entry","traffic_block","traffic_block_all")
                tcWebApi_commit("TrafficMeter_Entry")
        end if

%>
 
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/traffic.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

 <body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/traffic.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="traffic">

 <div class="page_title" id="title">Traffic Meter</div>
<div class="fix_button" id="check_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<tr>
  	<td nowrap colspan=2 align=center>
	<input class="cancel_bt" type='reset' name='Cancel' value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" id="cancel" onClick='location.href="traffic.asp";'>&nbsp;&nbsp;
        <input class="apply_bt" type="submit" name="cmd" value="<%tcWebApi_multilingual("0","glbstr_apply")%>" id="apply" onClick="return check_traffic_apply(document.forms[0]);">
        </td>
</tr>
</table>
</div>
<div id="main" class="main_top_button"> 
 <table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

 
<script>
var ts="<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
var alert_error_invalid_monthly_limit_str="<%tcWebApi_multilingual("1","error_invalid_monthly_limit_str")%>";
var alert_error_invalie_round_up_data_str="<%tcWebApi_multilingual("1","error_invalie_round_up_data_str")%>";
var alert_error_invalie_traffic_control_str="<%tcWebApi_multilingual("1","error_invalie_traffic_control_str")%>";
var alert_error_watermark_str="<%tcWebApi_multilingual("1","error_watermark_str")%>";
var alert_error_round_up_str="<%tcWebApi_multilingual("1","error_round_up_str")%>";
var alert_error_less_than_744_hr_str="<%tcWebApi_multilingual("1","error_less_than_744_hr_str")%>";
var alert_error_must_be_int_str="<%tcWebApi_multilingual("1","error_must_be_int_str")%>";
//var alert_error_invalid_range_str="<%tcWebApi_multilingual("1","error_invalid_range_str")%>";
var alert_error_time_inpur_str="<%tcWebApi_multilingual("1","error_time_inpur_str")%>";
var alert_confirm_restart_counter_str="<%tcWebApi_multilingual("1","confirm_restart_counter_str")%>";

var enable_traffic="<%tcWebApi_get("TrafficMeter_Entry","endis_traffic_meter","s")%>";
var limit="0";
var volume_control_type="<%tcWebApi_get("TrafficMeter_Entry","volume_control_type","s")%>";
var control_type="<%tcWebApi_get("TrafficMeter_Entry","control_type","s")%>";
var mon_volumn_limit="<%tcWebApi_get("TrafficMeter_Entry","monthly_volume_limit","s")%>";
var mon_time_limit="<%tcWebApi_get("TrafficMeter_Entry","monthly_time_limit","s")%>";
var round_up_value="<%tcWebApi_get("TrafficMeter_Entry","round_up_data","s")%>";
var restart_counter_hour="<%tcWebApi_get("TrafficMeter_Entry","restart_time_hour","s")%>";
var restart_counter_min="<%tcWebApi_get("TrafficMeter_Entry","restart_time_min","s")%>";
var traffic_restart_day="<%tcWebApi_get("TrafficMeter_Entry","restart_day","s")%>";
var left_time_volumn="<%tcWebApi_get("TrafficMeter_Entry","left_volume_time","s")%>";
var traffic_led="<%tcWebApi_get("TrafficMeter_Entry","traffic_led","s")%>";
var traffic_block_all="<%tcWebApi_get("TrafficMeter_Entry","traffic_block","s")%>";

/* Traffic Stats Data */
var traffic_today_time="<%tcWebApi_get("TrafficStats_Entry","today_time","s")%>";
var traffic_today_up="<%tcWebApi_get("TrafficStats_Entry","today_up","s")%>";
var traffic_today_down="<%tcWebApi_get("TrafficStats_Entry","today_down","s")%>";
var traffic_today_total="<%tcWebApi_get("TrafficStats_Entry","today_total","s")%>";
var traffic_yesterday_time="<%tcWebApi_get("TrafficStats_Entry","yesterday_time","s")%>";
var traffic_yesterday_up="<%tcWebApi_get("TrafficStats_Entry","yesterday_up","s")%>";
var traffic_yesterday_down="<%tcWebApi_get("TrafficStats_Entry","yesterday_down","s")%>";
var traffic_yesterday_total="<%tcWebApi_get("TrafficStats_Entry","yesterday_total","s")%>";
var traffic_this_week_time="<%tcWebApi_get("TrafficStats_Entry","thisweek_time","s")%>";
var traffic_this_week_up="<%tcWebApi_get("TrafficStats_Entry","thisweek_up","s")%>";
var traffic_this_week_down="<%tcWebApi_get("TrafficStats_Entry","thisweek_down","s")%>";
var traffic_this_week_total="<%tcWebApi_get("TrafficStats_Entry","thisweek_total","s")%>";
var traffic_this_month_time="<%tcWebApi_get("TrafficStats_Entry","thismonth_time","s")%>";
var traffic_this_month_up="<%tcWebApi_get("TrafficStats_Entry","thismonth_up","s")%>";
var traffic_this_month_down="<%tcWebApi_get("TrafficStats_Entry","thismonth_down","s")%>";
var traffic_this_month_total="<%tcWebApi_get("TrafficStats_Entry","thismonth_total","s")%>";
var traffic_last_month_time="<%tcWebApi_get("TrafficStats_Entry","lastmonth_time","s")%>";
var traffic_last_month_up="<%tcWebApi_get("TrafficStats_Entry","lastmonth_up","s")%>";
var traffic_last_month_down="<%tcWebApi_get("TrafficStats_Entry","lastmonth_down","s")%>";
var traffic_last_month_total="<%tcWebApi_get("TrafficStats_Entry","lastmonth_total","s")%>";

var traffic_startday="<%tcWebApi_get("TrafficMeter_Entry","WarningMsg_StartTime","s")%>";
var traffic_currentdate="<%tcWebApi_get("TrafficMeter_Entry","WarningMsg_CurrentTime","s")%>";
var traffic_volumnleft="<%tcWebApi_get("TrafficMeter_Entry","WarningMsg_LeftVolume","s")%>";
var traffic_connectiontimeleft="<%tcWebApi_get("TrafficMeter_Entry","WarningMsg_LeftTime","s")%>";

var ConnTime_text="<%tcWebApi_multilingual("1","conn_time_str")%>";

//gui_region="<%tcWebApi_get("TrafficMeter_Entry","gui_region","s")%>";
gui_region="English";
var basic_type="0";
var wan_type="<%tcWebApi_get("Wan_PVC","ENCAP","s")%>";
var ppp_login_type="0";

/* 
Startdatum/-zeit: Thu Jan 1 00:00:00 1970
Aktuelle(s) Datum/Zei: Sat Jan 1 00:00:44 2000
*/
/*
if( traffic_startday != "")
{
	traffic_startday = get_date(traffic_startday);
}
if( traffic_currentdate != "")
{
	traffic_currentdate = get_date(traffic_currentdate);
}

function get_date(old_str)
{
	var each_info=old_str.split(': ');

	var name=each_info[0];

	var date_info=each_info[1].split(' ');
	var week=date_info[0];
	var show_week=change_week(week);
	var month=date_info[1];
	var show_month=change_month(month);

	if( date_info[2] == "")
	{
		var day=date_info[3];
		var time=date_info[4];
		var year=date_info[5];
	}
	else
	{
		var day=date_info[2];
		var time=date_info[3];
		var year=date_info[4];	
	}	

	if( gui_region == "German" )
		var new_str = name+': '+show_week+' '+day+'.'+show_month+' '+time+' '+year;
	else
		var new_str = name+': '+show_week+' '+show_month+' '+day+' '+time+' '+year;

	return new_str;	
}
*/
function loadvalue()
{
	var cf=document.forms[0];

	cf.volume_monthly_limit.value=mon_volumn_limit;
	cf.hidden_volume_monthly_limit.value=mon_volumn_limit;
	cf.conntime_monthly_limit.value=mon_time_limit;
	cf.round_up_volume.value=round_up_value;
	cf.hidden_round_up.value=round_up_value;
	cf.waterMark.value=left_time_volumn;

	if( (wan_type.match(/Bridged IP/g) == "Bridged IP") || (wan_type.match(/Routed IP/g) == "Routed IP"))
	{
		/* Proto is DHCP or Static IP */
		basic_type = 1 ;
	}
	else
	{
		basic_type = 0 ;
	}

	if(basic_type==1) {
		document.getElementById("left_traffic").style.display = "";
		document.getElementById("left_time").style.display = "none";
	} else {
		if(control_type==0) {
			document.getElementById("left_traffic").style.display = "";
			document.getElementById("left_time").style.display = "none";
		} else {
			document.getElementById("left_traffic").style.display = "none";
			document.getElementById("left_time").style.display = "";
		}
	}
	
	if( gui_region == "German" )
		for( i=0; i<31; i++)
		{
			var value=i+1;
			value = value.toString();
			cf.day.options[i].text = value;
		}	
	
	if((basic_type=="0"&&ppp_login_type=="2") && false) //according to bug No.19250, should allow user to enable traffic meter under bigpond mode.
	{
		cf.checkTraffic.disabled = true;	
		var dflag=true;
		setDisabled ( dflag, cf.checkTraffic, cf.tm_type[0], cf.tm_type[1], cf.traff_dir, cf.volume_monthly_limit, cf.round_up_volume, cf.conntime_monthly_limit, cf.hour, cf.minute, cf.day, cf.restartCounter, cf.waterMark, cf.checkLed, cf.checkBlock, cf.refresh, cf.trafficStatus, cf.cmd, cf.Cancel, cf.ampm);
	}
	else
	{
		if( enable_traffic == "0" )
		{
			cf.checkTraffic.checked = false;	
		}
		else
		{
			cf.checkTraffic.checked = true;

		}

		if( basic_type == 1)
			cf.tm_type[0].checked =true;
		else if(mon_time_limit=="0")
			cf.tm_type[0].checked =true;
		else
			cf.tm_type[1].checked = true;

		cf.traff_dir.value=volume_control_type;

		if ( traffic_led == "0")
			cf.checkLed.checked = false;
		else
			cf.checkLed.checked = true;
		if( traffic_block_all == "1")
			cf.checkBlock.checked = true;
		else
			cf.checkBlock.checked = false;

	    var hour=restart_counter_hour;
		if(hour >11 )
		{
			hour = hour-12;
			cf.ampm.selectedIndex = 1;
		}
		else
			cf.ampm.selectIndex = 0; 
		hour=hour.toString();

		cf.hour.value=hour;
		cf.minute.value=restart_counter_min;
		cf.day.value=traffic_restart_day;
		set_gray();
		
	}
}
</script>
<input type="hidden" name="endis_traffic">
<input type="hidden" name="traffic_led">
<input type="hidden" name="traffic_block_all">
<input type="hidden" name="restart_counter_time">
<input type="hidden" name="restart_time_hour">
<input type="hidden" name="restart_time_min">
<input type="hidden" name="restart_time_day">
<input type="hidden" name="hidden_left_volume_time">
<input type="hidden" name="hidden_round_up">
<input type="hidden" name="hidden_volume_monthly_limit">
<input type="hidden" name="hidden_conntime_monthly_limit">
<input type="hidden" name="volume_control_type">
<input type="hidden" name="control_type">

	<tr><td nowrap colspan=2><A tabindex=-1 href="javascript:loadhelp('_traffic','internet')"><b><%tcWebApi_multilingual("1","internet_traffic_meter_str")%></b></A></td></tr>
	<tr><td nowrap colspan=2>
			<input type="checkbox" name="checkTraffic" id="check_traffic" value="1" onclick="set_gray();"><A tabindex=-1 href="javascript:loadhelp('_traffic','meter')"><%tcWebApi_multilingual("1","enable_tm_str")%></A>
		</td>
	</tr>
	<tr>
		<td nowrap> 
			<input type="radio" name="tm_type" id="tm_type" value="tvolume" onclick="change_volumn_time()"><%tcWebApi_multilingual("1","traffic_volume_control_str")%>
		</td>	
		<td nowrap> 	
			<SELECT name="traff_dir" id="traff_dir" onchange="set_traffic_gray()">
				<OPTION value="0" selected ><%tcWebApi_multilingual("1","no_limit_str")%></OPTION>
				<OPTION value="1" ><%tcWebApi_multilingual("1","download_only_str")%></OPTION>
				<OPTION value="2" ><%tcWebApi_multilingual("1","both_directions_str")%></OPTION>
			</SELECT>
		</td>
	</tr>
	<tr>
		<td nowrap> <img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","monthly_limit_str")%></td>
		<td nowrap> 
			<input type="text" name="volume_monthly_limit" id="volume_monthly_limit" maxlength="6" size="16" onKeyPress="return getkey('num', event)"><%tcWebApi_multilingual("1","mb_str")%>
		</td>
	</tr>
	<tr>	
		<td nowrap> <img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","round_up_date_str")%></td>
		<td nowrap> 
			<input type="text" name="round_up_volume" id="round_up_volume" maxlength="16" value="" size="16" onKeyPress="return getkey('num', event)"><%tcWebApi_multilingual("1","mb_str")%>
		</td>
	</tr>
	<tr>
		<td nowrap colspan=2>
			<input type="radio" name="tm_type" id="tm_type" value="conntime" onclick="change_volumn_time()" ><%tcWebApi_multilingual("1","conn_time_ctl_str")%>
		</td>
	<tr>	
		<td nowrap> <img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","monthly_limit_str")%></td>
		<td nowrap> 
			<input type="text" name="conntime_monthly_limit" id="conntime_monthly_limit" maxlength="5" size="16" onKeyPress="return getkey('num', event)"><%tcWebApi_multilingual("1","hours_str")%>
		</td>
	</tr>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<tr>
		<td nowrap colspan=2><A tabindex=-1 href="javascript:loadhelp('_traffic','counter')"><b><%tcWebApi_multilingual("1","traffic_counter_str")%></b></A></td>
	</tr>
	<tr>
		<td nowrap colspan=2><%tcWebApi_multilingual("1","restart_traffic_counter_str")%>
			<input type="text" name="hour" id="hour" maxlength=2 size=2>:<input type="text" name="minute" id="minute" maxlength=2 size=2>
			<select name="ampm" id="ampm">
				<option value="0" selected><%tcWebApi_multilingual("1","am_str")%></option>
				<option value="1"><%tcWebApi_multilingual("1","pm_str")%></option>
			</select> 
			<%tcWebApi_multilingual("1","on_the_str")%>
			<select name="day" id="day">
				<option value="1" selected><%tcWebApi_multilingual("1","n01_str")%></option>
				<option value="2"><%tcWebApi_multilingual("1","n02_str")%></option>
				<option value="3"><%tcWebApi_multilingual("1","n03_str")%></option>
				<option value="4"><%tcWebApi_multilingual("1","n04_str")%></option>		
				<option value="5"><%tcWebApi_multilingual("1","n05_str")%></option>	
				<option value="6"><%tcWebApi_multilingual("1","n06_str")%></option>		
				<option value="7"><%tcWebApi_multilingual("1","n07_str")%></option>		
				<option value="8"><%tcWebApi_multilingual("1","n08_str")%></option>		
				<option value="9"><%tcWebApi_multilingual("1","n09_str")%></option>	
				<option value="10"><%tcWebApi_multilingual("1","n10_str")%></option>		
				<option value="11"><%tcWebApi_multilingual("1","n11_str")%></option>	
				<option value="12"><%tcWebApi_multilingual("1","n12_str")%></option>	
				<option value="13"><%tcWebApi_multilingual("1","n13_str")%></option>				
				<option value="14"><%tcWebApi_multilingual("1","n14_str")%></option>		
				<option value="15"><%tcWebApi_multilingual("1","n15_str")%></option>	
				<option value="16"><%tcWebApi_multilingual("1","n16_str")%></option>		
				<option value="17"><%tcWebApi_multilingual("1","n17_str")%></option>		
				<option value="18"><%tcWebApi_multilingual("1","n18_str")%></option>		
				<option value="19"><%tcWebApi_multilingual("1","n19_str")%></option>	
				<option value="20"><%tcWebApi_multilingual("1","n20_str")%></option>		
				<option value="21"><%tcWebApi_multilingual("1","n21_str")%></option>	
				<option value="22"><%tcWebApi_multilingual("1","n22_str")%></option>	
				<option value="23"><%tcWebApi_multilingual("1","n23_str")%></option>				
				<option value="24"><%tcWebApi_multilingual("1","n24_str")%></option>	
				<option value="25"><%tcWebApi_multilingual("1","n25_str")%></option>	
				<option value="26"><%tcWebApi_multilingual("1","n26_str")%></option>		
				<option value="27"><%tcWebApi_multilingual("1","n27_str")%></option>		
				<option value="28"><%tcWebApi_multilingual("1","n28_str")%></option>		
				<option value="29"><%tcWebApi_multilingual("1","n29_str")%></option>
				<option value="30"><%tcWebApi_multilingual("1","n30_str")%></option>	
				<option value="31"><%tcWebApi_multilingual("1","n31_str")%></option>				
			</select>	
			<%tcWebApi_multilingual("1","day_of_each_month_str")%>
		</td>
	</tr>
	<tr>
	<td nowrap colspan=2 align=right>
    <input class="long_common_bt" type="button" name="restartCounter" id="restart_counter" value="<%tcWebApi_multilingual("1","restart_counter_now_str")%>" onclick="click_restart();">
		</td>
	</tr>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<tr><td nowrap colspan=2><A href="javascript:loadhelp('_traffic', 'reached')"><b><%tcWebApi_multilingual("1","traffic_control_str")%></b></A></td></tr>
	<tr><td nowrap colspan=2><%tcWebApi_multilingual("1","pop_up_warning_str")%></td></tr>
	<tr>
		<td nowrap colspan=2>
			<input type="text" maxlength="16" size="16" name="waterMark" id="water_mark" onKeyPress="return getkey('num', event)"><%tcWebApi_multilingual("1","the_monthly_limit_is_reached_str")%>
		</td>	
	</tr>
	<tr><td nowrap colspan=2><%tcWebApi_multilingual("1","limit_reach_str")%></td></tr>
	<tr>
		<td nowrap colspan=2><input type="checkbox" name="checkLed" id="check_led" value=1><%tcWebApi_multilingual("1","turn_led_flashing_str")%></td>	
	</tr>
	<tr>
		<td nowrap colspan=2><input type="checkbox" name="checkBlock" id="check_block" ><%tcWebApi_multilingual("1","disconnect_and_disable_str")%></td>	
	</tr>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<tr><td nowrap colspan=2><A href="javascript:loadhelp('_traffic', 'statistics')"><b><%tcWebApi_multilingual("1","internet_traffic_statistics_str")%></b></A></td></tr>
    <tr id=start_time><td nowrap><%tcWebApi_multilingual("1","start_time_str")%>: <script>document.write(traffic_startday);</script></td></tr>
    <tr id=current_time><td nowrap><%tcWebApi_multilingual("1","cur_time_str")%>: <script>document.write(traffic_currentdate);</script></td></tr>
    <tr id=left_traffic ><td nowrap><%tcWebApi_multilingual("1","traffic_volume_left_str")%>: <script>document.write(traffic_volumnleft);</script></td></tr>
    <tr id=left_time style="display:none"><td nowrap><%tcWebApi_multilingual("1","conn_time_left_str")%>: <script>document.write(traffic_connectiontimeleft);</script></td></tr>
	<tr>
		<td nowrap colspan=2 align=center>
			<table id="TrafficStatistics" border=1 cellpadding=2 cellspacing=0 width=100%>
				<tr>
				<td nowrap rowspan="2" align="center"><span class="subhead"><%tcWebApi_multilingual("1","period_str")%></span></td>
				<script>
				if( basic_type == 1)
					document.write('<td nowrap rowspan="2" align="center"><span class="subhead" style="color:gray;"><%tcWebApi_multilingual("1","conn_time_str")%><br><%tcWebApi_multilingual("1","hm_str")%></span></td>');
				else
					document.write('<td nowrap rowspan="2" align="center"><span class="subhead"><%tcWebApi_multilingual("1","conn_time_str")%><br><%tcWebApi_multilingual("1","hm_str")%></span></td>');
				</script>
				<td nowrap colspan="3" align="center" style="border-bottom-style:none"><span class="subhead"><%tcWebApi_multilingual("1","traffic_volume_mb_str")%></span></td>
				</tr>
				<tr>
				<td nowrap align="center" style="border-top-style:none; border-right-style:none"><span class="subhead"><%tcWebApi_multilingual("1","upload_avg_str")%></span></td>
				<td nowrap align="center" style="border-top-style:none; border-left-style:none; border-right-style:none"><span class="subhead"><%tcWebApi_multilingual("1","download_avg_str")%></span></td>
				<td nowrap align="center" style="border-top-style:none; border-left-style:none"><span class="subhead"><%tcWebApi_multilingual("1","total_avg_str")%></span></td>
				</tr>
				<tr>
					<td nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","today_str")%></span></td>
					<script>
					if( basic_type == 1)
						document.write("<td nowrap align=center style='color:gray'>0:0");
					else
						document.write("<td nowrap align=center>"+traffic_today_time);
					</script></td>
					<td nowrap align=center> <script>document.write(traffic_today_up)</script></td>
					<td nowrap align=center> <script>document.write(traffic_today_down)</script></td>
					<td nowrap align=center> <script>document.write(traffic_today_total)</script></td>
				</tr>
				<tr>
					<td nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","yesterday_str")%></span></td>
					<script>
					if( basic_type == 1)
						document.write("<td nowrap align=center style='color:gray'>0:0");
					else
						document.write("<td nowrap align=center>"+traffic_yesterday_time);
					</script></td>
					<td nowrap align=center> <script>document.write(traffic_yesterday_up)</script></td>
					<td nowrap align=center> <script>document.write(traffic_yesterday_down)</script></td>
					<td nowrap align=center> <script>document.write(traffic_yesterday_total)</script></td>
				</tr>		
				<tr>
					<td nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","this_week_str")%></span></td>
					<script>
					if( basic_type == 1)
						document.write("<td nowrap align=center style='color:gray'>0:0");
					else
						document.write("<td nowrap align=center>"+traffic_this_week_time);
					</script></td>
					<td nowrap align=center> <script>document.write(traffic_this_week_up)</script> </td>
					<td nowrap align=center> <script>document.write(traffic_this_week_down)</script> </td>
					<td nowrap align=center> <script>document.write(traffic_this_week_total)</script> </td>
				</tr>	
				<tr>
					<td nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","this_month_str")%></span></td>
					<script>
					if( basic_type == 1)
						document.write("<td nowrap align=center style='color:gray'>0:0");
					else
						document.write("<td nowrap align=center>"+traffic_this_month_time);
					</script></td>
					<td nowrap align=center> <script>document.write(traffic_this_month_up)</script> </td>
					<td nowrap align=center> <script>document.write(traffic_this_month_down)</script> </td>
					<td nowrap align=center> <script>document.write(traffic_this_month_total)</script> </td>
				</tr>	
				<tr>
					<td nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","last_month_str")%></span></td>
					<script>
					if( basic_type == 1)
						document.write("<td nowrap align=center style='color:gray'>0:0");
					else
						document.write("<td nowrap align=center>"+traffic_last_month_time);
					</script></td>
					<td nowrap align=center> <script>document.write(traffic_last_month_up)</script> </td>
					<td nowrap align=center> <script>document.write(traffic_last_month_down)</script> </td>
					<td nowrap align=center> <script>document.write(traffic_last_month_total)</script> </td>
				</tr>			
			</table>	
		</td>
	</tr>	
	<tr>
		<td nowrap colspan=2 >
		<input id="refresh" class="common_bt" type='submit' name='refresh' id="refresh" value="<%tcWebApi_multilingual("0","glbstr_refresh")%>" onclick="click_refresh_2();"> &nbsp;
		<input class="common_bt" type="button" name="trafficStatus" id="trafficstatus" value="<%tcWebApi_multilingual("1","traffic_status_str")%>" onclick="click_status();">
	</tr>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</table>
</div>
<div id="waiting_bar" style="display:none">
<div  align="center"><BR><BR><TR><TD align="center"><B><%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%></B></TD></TR><BR><BR></div>
<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" alt="waiting" /></div>
</div>
<%tcWebApi_multilingual("2","_traffic_help.asp")%>
</form>
</BODY>
</HTML>
