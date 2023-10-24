function setRemote()
{
	var cf = document.forms[0];
	
	
	if( cf.remote[0].checked == true )
	{
		cf.Romte_IP_1.disabled = true;
		cf.Romte_IP_2.disabled = true;
		cf.Romte_IP_3.disabled = true;
		cf.Romte_IP_4.disabled = true;
	}
	else if( cf.remote[1].checked == true )
	{
		cf.Romte_IP_1.disabled = false;
		cf.Romte_IP_2.disabled = false;
		cf.Romte_IP_3.disabled = false;
		cf.Romte_IP_4.disabled = false;
	}
	/*
	var i;
	for( i=0; i<cf.Romte_IP.length; i++)
	{
		if( cf.remote[0].checked == true )
		{
			cf.Romte_IP[i].disabled = true;
		}
		else if( cf.remote[1].checked == true )
		{
			cf.Romte_IP[i].disabled = false;
		}
	}*/
}	

function check_ipv6_6to4(cf)
{
	var i;

	if(internet_basic_type == 0)	//not dhcp
	{	
		//if((internet_ppp_type == 0) || (internet_ppp_type == 1))	//(pptp, 1),(pppoe, 0)
		//{
			if(confirm("6to4 Tunnel requires the IPv4 PPPoE/PPTP connection mode to be \"Always On\", other connection modes (\"Dial on Demand\" and \"Manually Connect\") will become unavailable. Please confirm the change.") == false)
			{
				return false;
			}	
		//}
	}

	/* Remote 6to4 Relay Router */
	if(cf.remote[1].checked == true)
	{
		cf.ipv6_hidden_6to4_relay.value = "";
		cf.ipv6_hidden_6to4_relay.value = cf.ipv6_hidden_6to4_relay.value + cf.Romte_IP_1.value + "." + cf.Romte_IP_2.value + "." + cf.Romte_IP_3.value + "." + cf.Romte_IP_4.value;
		/*
		for( i=0; i<cf.Romte_IP.length; i++)
		{
			if( i < (cf.Romte_IP.length-1) )
			{
				cf.ipv6_hidden_6to4_relay.value = cf.ipv6_hidden_6to4_relay.value + cf.Romte_IP[i].value + ".";
			}
			else if( i == (cf.Romte_IP.length-1) )
			{
				cf.ipv6_hidden_6to4_relay.value = cf.ipv6_hidden_6to4_relay.value + cf.Romte_IP[i].value;
			}
		}*/
		if( checkipaddr(cf.ipv6_hidden_6to4_relay.value) == false )
		{
			alert("Invalid IP address. Please enter it again.");
			return false;
		}
		cf.ipv6_hidden_6to4_relay_type.value = "1";
	}
	else
	{
		cf.ipv6_hidden_6to4_relay.value = ipv6_6to4_relay_ip;
	}
	
	if( ipv6_save_common(cf) == false )
	{
		return false;
	}
	
	parent.menu_ipv6_status = "TUNNEL";
	
	cf.ipv6_tunnel_flag.value = "1";
	
	document.getElementById("fix_button").style.display = "none";
	document.getElementById("main").style.display = "none";
	document.getElementById("waiting_bar").style.display = "";
	return true;
	
	
}

