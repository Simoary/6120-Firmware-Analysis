function set_traffic_gray()
{
	var cf=document.forms[0];
	if(cf.traff_dir.value == '0'){
		cf.volume_monthly_limit.disabled = true;
		cf.round_up_volume.disabled = true;
	}
	else{
		cf.volume_monthly_limit.disabled = false;
		if(basic_type == 1)
			cf.round_up_volume.disabled = true;
		else
			cf.round_up_volume.disabled = false;
	}
}

function change_volumn_time()
{
	var cf=document.forms[0];
	if(cf.tm_type[0].checked == true)
	{
		cf.conntime_monthly_limit.disabled = true;
		cf.traff_dir.disabled = false;
		set_traffic_gray();
	}
	else
	{
		cf.conntime_monthly_limit.disabled = false;
		cf.traff_dir.disabled = true;
		cf.volume_monthly_limit.disabled = true;
		cf.round_up_volume.disabled = true;	
	}
}

function set_gray()
{
	var cf=document.forms[0];
	var dflag;
	dflag=(!(cf.checkTraffic.checked));
	setDisabled ( dflag, cf.tm_type[0], cf.tm_type[1], cf.traff_dir, cf.volume_monthly_limit, cf.round_up_volume, cf.conntime_monthly_limit, cf.hour, cf.minute,  cf.day,  cf.waterMark, cf.checkLed, cf.checkBlock, cf.ampm,cf.restartCounter, cf.refresh, cf.trafficStatus);
	if( basic_type == 1)
		setDisabled ( true, cf.round_up_volume, cf.tm_type[1], cf.conntime_monthly_limit);

	if(cf.checkTraffic.checked == true)
	{
	    document.getElementById("restart_counter").className  = "long_common_bt";
	    document.getElementById("refresh").className  = "common_bt";	
	    document.getElementById("trafficstatus").className  = "common_bt";	
	change_volumn_time();
	}
	else
	{
	    document.getElementById("restart_counter").className  = "long_common_gray_bt";
	    document.getElementById("refresh").className  =  "common_gray_bt";
	    document.getElementById("trafficstatus").className  = "common_gray_bt";
	}

}

function check_traffic_apply(cf)
{
	var cf=document.forms[0];
    cf.restart_counter_time.value=0;
	cf.submit_flag.value="traffic_apply";
	if(cf.checkTraffic.checked == true)
		cf.endis_traffic.value=1;
	else
		cf.endis_traffic.value=0;

	if(cf.checkTraffic.checked == true)
	{

		if(cf.tm_type[0].checked)
		{
		    cf.control_type.value=0;
		    cf.volume_control_type.value=cf.traff_dir.value;
			if(cf.volume_monthly_limit.value=='')
			{
				alert(alert_error_invalid_monthly_limit_str);
				return false;
			}
			if(!_isNumeric(cf.volume_monthly_limit.value))
        		{
                		alert(alert_error_invalid_monthly_limit_str);
                		return false;
        		}
			if(parseInt(cf.volume_monthly_limit.value)>999999)
			{
				alert(alert_error_invalid_monthly_limit_str);
                                return false;				
			}
			if(cf.round_up_volume.value=='')
			{
				alert(alert_error_invalie_round_up_data_str);
				return false;
			}
			if(!_isNumeric(cf.round_up_volume.value))
                        {
                                alert(alert_error_invalie_round_up_data_str);
                                return false;
                        }

			if(cf.waterMark.value=='')
			{
				alert(alert_error_invalie_traffic_control_str);
				return false;
			}
			if(!_isNumeric(cf.waterMark.value))
                        {
                                alert(alert_error_invalie_traffic_control_str);
                                return false;
                        }
			if(parseInt(cf.waterMark.value) > parseInt(cf.volume_monthly_limit.value))
			{
				alert(alert_error_invalie_traffic_control_str);
				return false;
			}

			if( basic_type == 1 && cf.round_up_volume.value != "0" )/* to fix bug 23024 */
			{
				cf.round_up_volume.value = "0";
			}
			if(parseInt(cf.round_up_volume.value) > parseInt(cf.volume_monthly_limit.value))
			{
				alert(alert_error_round_up_str);
				return false;
			}
			cf.hidden_round_up.value=cf.round_up_volume.value;
			cf.hidden_volume_monthly_limit.value=cf.volume_monthly_limit.value;
			cf.hidden_left_volume_time.value=cf.waterMark.value;
			cf.hidden_conntime_monthly_limit.value=0;
		}
		else
		{
		    cf.control_type.value=1;
		    cf.volume_control_type.value=0;
			if(cf.conntime_monthly_limit.value=='')
			{
				alert(alert_error_invalid_monthly_limit_str);
				return false;
			}
			if(!(cf.conntime_monthly_limit.value <= 744))
			{
				alert(alert_error_less_than_744_hr_str);
				return false;
			}
			var str1 = cf.conntime_monthly_limit.value;
			var arry = str1.split('.');
			if (arry.length>1)
			{
				alert(alert_error_must_be_int_str);
				return false;
			}

			if(cf.waterMark.value=='')
                        {
                                alert(alert_error_invalie_traffic_control_str);
                                return false;
                        }
                        if(!_isNumeric(cf.waterMark.value))
                        {
                                alert(alert_error_invalie_traffic_control_str);
                                return false;
                        }
			if(parseInt(cf.waterMark.value) > parseInt(cf.conntime_monthly_limit.value)*60)
			{
				alert(alert_error_watermark_str);
				return false;
			}

			cf.hidden_round_up.value=0;
			cf.hidden_volume_monthly_limit.value=0;
		    cf.hidden_conntime_monthly_limit.value=cf.conntime_monthly_limit.value;
		    cf.hidden_left_volume_time.value=cf.waterMark.value;
		}
		if ((cf.hour.value < 0) || (cf.hour.value > 11) ||
			(cf.minute.value < 0) || (cf.minute.value > 59) )
			{
				alert(alert_error_time_inpur_str);
				return false;
			}
		if ((!_isNumeric(cf.hour.value)) ||
				(!_isNumeric(cf.minute.value)))
			{
				alert(alert_error_time_inpur_str);
				return false;
			}

		if ((cf.hour.value == '') || (cf.minute.value == ''))
			{
				alert(alert_error_time_inpur_str);
				return false;
			}
		var hour=cf.hour.value;
		var minute=cf.minute.value
		var day=cf.day.value
		if(hour.length<2)
			hour="0"+hour;
		if(minute.length<2)
			minute="0"+minute;
		if(cf.ampm.selectedIndex==1)
		{
			hour=parseInt(hour,10)+12;
			hour=hour.toString();
		}	
		//cf.restart_counter_time.value=hour+':'+minute;
	    cf.restart_time_hour.value=hour;
	    cf.restart_time_min.value=minute;
	    cf.restart_time_day.value=day;

		if(cf.checkLed.checked == true)
			cf.traffic_led.value=1;
		else
			cf.traffic_led.value=0;
		if(cf.checkBlock.checked == true)
			cf.traffic_block_all.value=1;
		else
			cf.traffic_block_all.value=0;

	}
    else
    {
	cf.control_type.value=0;
	cf.volume_control_type.value=0;
	cf.hidden_round_up.value="0";
	cf.hidden_conntime_monthly_limit.value="0";
	cf.hidden_volume_monthly_limit.value="0";
	cf.hidden_left_volume_time.value="0";
	cf.restart_time_hour.value="00";
	cf.restart_time_min.value="00";
	cf.restart_time_day.value="1";
	cf.traffic_led.value=0;
	cf.traffic_block_all.value=0;
    }

    document.getElementById("title").style.display="none";
    document.getElementById("main").style.display="none";
    document.getElementById("check_button").style.display="none";
    document.getElementById("waiting_bar").style.display="";	
	return true;
}

function click_restart()
{
	var cf=document.forms[0];
	if(cf.checkTraffic.checked == true)
	{
	    if(!confirm(alert_confirm_restart_counter_str))
			return false;

	    document.getElementById("title").style.display="none";
	    document.getElementById("main").style.display="none";
	    document.getElementById("check_button").style.display="none";
	    document.getElementById("waiting_bar").style.display="";
	    cf.restart_counter_time.value=1;
	    cf.action="/cgi-bin/traffic_meter_wait.asp?id="+ts;
	    cf.submit();
	}

}

function click_refresh_2()
{
	var cf=document.forms[0];
	if (cf.checkTraffic.checked == true)
	{
		location.href='traffic.htm';
	}
}

function click_status()
{
	var cf=document.forms[0];
	if (cf.checkTraffic.checked == true)
	{
		window.open('show_traffic.asp','show_traffic','width=600,height=400,top=200,left=200,status=yes');
	}
}

function reset_time()
{
	cf=document.forms[0];
	if( cf.interval.value == "")
	{
		cf.interval.value = "10";
		return true;
	}
	var interval=cf.interval.value;

        for(i=0;i<interval.length;i++)
        {
                c=interval.charAt(i);
                if("0123456789".indexOf(c,0)<0)
                {
			alert(alert_error_invalid_range_str);
                        return false;
                }
        }

	interval=parseInt(interval);
	if(!(	interval >=5 && interval<=  86400))
	{
		alert(alert_error_invalid_range_str);
		return false;
	}
	cf.hidden_interval.value=interval;
	return true;
}

function click_refresh()
{
	cf=document.forms[0];
	cf.submit_flag.value="traffic_refresh"
	cf.action="/cgi-bin/no_commit.cgi?/cgi-bin/traffic.asp"
    document.getElementById("title").style.display="none";
    document.getElementById("main").style.display="none";
    document.getElementById("check_button").style.display="none";
    document.getElementById("waiting_bar").style.display="";
	cf.submit();
}

