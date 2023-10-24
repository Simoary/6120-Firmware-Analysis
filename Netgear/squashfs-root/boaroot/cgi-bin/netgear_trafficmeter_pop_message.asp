
<html>
<head>
<META http-equiv=content-type content='text/html; charset=UTF-8'>
</head>
<body bgcolor=#000000>
<table width=100%% border=0 cellpadding=0 cellspacing=0 height=50>
<tr><td width=100%% bgcolor=#ff0000></td></tr>
</table>
<script>
var time_text = "<%tcWebApi_get("TrafficHijack_Entry","Time","s")%>";
var volume_limit = "<%tcWebApi_get("TrafficHijack_Entry","VolumeLimit","s")%>";
var time_limit = "<%tcWebApi_get("TrafficHijack_Entry","TimeLimit","s")%>";
var month_data = "<%tcWebApi_get("TrafficHijack_Entry","MonthLimit","s")%>";

var reach_month_limit = "<%tcWebApi_multilingual("1","warning_has_been_reached_str")%>";
var mbytes = "<%tcWebApi_multilingual("1","mb_str")%>";
var hours = "<%tcWebApi_multilingual("1","hours_str")%>";
var mins = "<%tcWebApi_multilingual("1","minutes_str")%>";
var in_mark = "<%tcWebApi_multilingual("1","traffic_count_is_str")%>";
var month_limit = "<%tcWebApi_multilingual("1","warning_before_the_monthly_limit_is_reached_str")%>";

var GUI_region = "<%tcWebApi_get("LanguageSwitch_Entry","GUI_Region","s")%>";
if(GUI_region == "Chinese")
{
  if(reach_month_limit == "")
     reach_month_limit = "已经达到。";
  if(mbytes == "")
     mbytes = "兆字节";
  if(hours == "")
     hours = "小时";
  if(mins == "")
     mins = "分钟.";
  if(in_mark == "")
     in_mark = "流量计数器为";
  if(month_limit == "")
     month_limit = "在达到每月限制前。";
}
else
{
  if(reach_month_limit == "")
     reach_month_limit = "has been reached.";
  if(mbytes == "")
     mbytes = "Mbytes";
  if(hours == "")
     hours = "hours";
  if(mins == "")
     mins = "minutes";
  if(in_mark == "")
     in_mark = "Your Traffic Meter counter is ";
  if(month_limit == "")
     month_limit = "before the monthly limit is reached.";
}

var reach_limit = "<%tcWebApi_get("TrafficMeter_Entry","monthly_limit_reached","s")%>"
var warning_setting = "<%tcWebApi_get("TrafficMeter_Entry","left_volume_time","s")%>"
var control_type = "<%tcWebApi_get("TrafficMeter_Entry","control_type","s")%>"
</script>

<br><br><br><br><br><br><br><br>
<center>
<table>
<tr ><td align=center colspan=2 id=main_text>

<font color=#ffffff size=5><b>
<script>

if( warning_setting == 0 || reach_limit == 1 ) /* Reach the limit */
{
    if(control_type == 0)
    {
        document.write( volume_limit + " " +  mbytes + " " + reach_month_limit + " " + time_text);
    }
    else
    {
        document.write( time_limit + " " + hours + " " + reach_month_limit + " " + time_text);
    }
}
else /* Warning before the limit */
{
    if(control_type == 0)
    {
        document.write( in_mark + " " + month_data + " " + mbytes + " " + month_limit + " " + time_text);
    }
    else
    {
        document.write( in_mark + " " + month_data + " " + mins + " " + month_limit + " " + time_text);
    }
}
</script></b></font>
</td></tr>
</table>
</center>
<br><br><br><br><br><br><br><br><br><br>
<table width=100%% border=0 cellpadding=0 cellspacing=0 height=50>
<tr><td width=100%% bgcolor=#ff0000></td></tr>
</table>
<table>
<tr><td width=95%%></td><td align=right><font color=#ffffff size=5><b>NETGEAR</b></font></td></tr>
</table>
</body>
</html>
