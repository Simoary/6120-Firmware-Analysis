function check_ipv6_dhcp(cf)
{
	for(i=0;i<cf.userClass.value.length;i++)
	{
		if(isValidChar(cf.userClass.value.charCodeAt(i))==false)
		{
			alert(alert_invalid_accout_name_str);
			return false;
		}
	}

	for(i=0;i<cf.domainName.value.length;i++)
	{
		if(isValidDdnsHost(cf.domainName.value.charCodeAt(i))==false)
		{
			alert(alert_invalid_domain_name_str);
			return false;
		}
	}

	/* Hidden Info for radvd */
	if(cf.ipv6_lan_ip_assign[0].checked == true)
	{
		cf.RADVDMbit.value="on";
		//cf.RADVDEnable.value = "0";
	}
	else
	{
		cf.RADVDMbit.value="off";
	}
	if(cf.EnableDynIPv6.value==0)
		parent.menu_ipv6_status = "Autoconfig";
	else
		parent.menu_ipv6_status = "DHCP";
	
	if( ipv6_save_common(cf) == false )
        {
                return false;
        }
	else
	{
		document.getElementById("fix_button").style.display = "none";
		document.getElementById("main").style.display = "none";
		document.getElementById("waiting_bar").style.display = "";
        	return true;
	}
}
