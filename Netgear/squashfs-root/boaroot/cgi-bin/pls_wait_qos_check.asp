<HTML>
<HEAD>
<META http-equiv="Refresh" content="3; url=pls_wait_qos_check.asp">
<META http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<LINK rel="stylesheet" href="/style/form.css">
</HEAD>
<BODY onLoad="loadvalue();" bgcolor=#ffffff>
<script>
var qos_auto_uprate = "";
var qos_check_time = parent.qos_check_time;
function loadvalue()
{
	if( qos_auto_uprate != "" )
		location.href="QOS_main.asp";
	else if( qos_check_time >= 180 ) //the max waiting time to 3 minute
		location.href="QOS_main.asp";
	else
		parent.qos_check_time = parent.qos_check_time + 3;
		
}
</script>
<TR><TD colspan=2><BR>
<img src="/liteblue.gif" width=100%% height=12></TD></TR>
<TR><TD><BR><BR>Attempting to detect uplink bandwidth . Please Wait ..<BR><BR></TD></TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</BODY></HTML>
