function check_ipv6_dhcp(cf)
{
	for(i=0;i<cf.userClass.value.length;i++)
	{
		if(isValidChar(cf.userClass.value.charCodeAt(i))==false)
		{
			alert("Invalid account name.");
			return false;
		}
	}

	for(i=0;i<cf.domainName.value.length;i++)
	{
		if(isValidDdnsHost(cf.domainName.value.charCodeAt(i))==false)
		{
			alert("Invalid domain name.");
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
	parent.menu_ipv6_status = "Autoconfig";
	
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
