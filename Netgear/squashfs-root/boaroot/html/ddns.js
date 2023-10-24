function click_ddns(form)
{
	if (form.sysDNSActive.checked)
	{
		form.EnableDNS.value = "Yes";
		form.ddns_enabled.value = "1";
	}	
	else
	{
		form.EnableDNS.value = "No";
		form.ddns_enabled.value = "0";
	}	

	if (form.sysDNSWildCard.checked)
		form.wildcards_enabled.value="Yes";
	else
		form.wildcards_enabled.value="No";

	if (form.sysDNSActive.checked)
	{
		if(form.sysDNSHost.value=="")
		{
			alert(alert_hostname_cannot_be_blank_str);
			return false;
		}
		if(form.sysDNSUser.value=="")
		{
			alert(alert_username_cannot_be_blank_str);
			return false;
		}
		if(form.sysDNSPassword.value=="")
		{
			alert(alert_password_cannot_be_blank_str);
			return false;
		}
	}
	for (i=0;i<form.sysDNSHost.value.length;i++)
	{
		if(isValidDdnsHost(form.sysDNSHost.value.charCodeAt(i))==false)
		{
			alert(alert_invalid_hostname_str);
			return false;
		}
	}
	for (i=0;i<form.sysDNSUser.value.length;i++)
	{
		if(isValidChar_space(form.sysDNSUser.value.charCodeAt(i))==false)
		{
			alert(alert_invalid_username_str);
			return false;
		}
	}
	for (i=0;i<form.sysDNSPassword.value.length;i++)
	{
		if(isValidChar_space(form.sysDNSPassword.value.charCodeAt(i))==false)
		{
			alert(alert_invalid_password_str);
			return false;
		}
	}
	if (old_endis_ddns != form.ddns_enabled.value || old_sysDNSHost != form.sysDNSHost.value || old_sysDNSUser != form.sysDNSUser.value || old_sysDNSPassword !=  form.sysDNSPassword.value || old_endis_wildcards != form.wildcards_enabled.value)
		form.change_wan_type.value=0;
	else
		form.change_wan_type.value=1;

	form.action="/cgi-bin/DNS_ddns.asp?id=" + timestamp;
	return true;
}
