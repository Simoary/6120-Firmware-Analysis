function check_logs_clear(form)
{
	form.action="/cgi-bin/FW_log.asp?id="+ts;
	form.submit_flag.value="logs_clear";
	return true;
}

function check_logs_send(form)
{
	if (email_get_notify == '1')
	{
		form.action="/cgi-bin/FW_log.asp?id="+ts;
		form.submit_flag.value="logs_send";
		return true;
	}
	else
	{
		alert("If you want to send an e-mail notice, turn on e-mail notification on the E-mail screen.");
		return false;
	}
}
function check_log_apply(form)
{
	var cf=document.forms[0];
	cf.submit_flag.value="logs_apply";
	if(cf.log_site[0].checked == true)
		cf.hidden_log_site.value="1";
	else
		cf.hidden_log_site.value="0";
	if(cf.log_block.checked == true)
		cf.hidden_log_block.value="1";
	else
		cf.hidden_log_block.value="0";
	if(cf.log_conn.checked == true)
		cf.hidden_log_conn.value="1";
	else
		cf.hidden_log_conn.value="0";
	if(cf.log_router.checked == true)
		cf.hidden_log_router.value="1";
	else
		cf.hidden_log_router.value="0";
	if(cf.log_dosport.checked == true)
		cf.hidden_log_dosport.value="1";
	else
		cf.hidden_log_dosport.value="0";
	if(cf.log_port.checked == true)
		cf.hidden_log_port.value="1";
	else
		cf.hidden_log_port.value="0";
	if(cf.log_wlan.checked == true)
    {
		cf.hidden_log_wire.value="1";
        cf.hidden_log_level.value="1";
    }
	else
    {
		cf.hidden_log_wire.value="0";
        cf.hidden_log_level.value="0";
    }
	if(cf.log_conn_reset.checked == true)
		cf.hidden_log_conn_reset.value="1";
	else
		cf.hidden_log_conn_reset.value="0";
	if(cf.log_wire_sched.checked == true)
		cf.hidden_log_wire_sched.value="1";
	else
		cf.hidden_log_wire_sched.value="0";
	return true;
}
