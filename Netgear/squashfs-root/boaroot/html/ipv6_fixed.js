function check_ipv6_fixed(cf)
{
	var i;
	var ip_trans_array = new Array("","","","","");//save IP address, if the IP input value is blank, change it to 0
	cf.ipv6_wan_ip_fixed.value = "";
	cf.ipv6_wan_gw_fixed.value = "";
	cf.ipv6_primary_dns_fixed.value = "";
	cf.ipv6_second_dns_fixed.value = "";
	cf.ipv6_lan_ip_fixed.value = "";

	if(check_ipv6_IP_address(cf.IPv6_wan1.value) == false)
	{
		alert(alert_invalid_wan_setup_str);
					return false;
	}
	if(check_ipv6_IP_address(cf.IPv6_wan2.value) == false)
	{
		alert(alert_invalid_wan_setup_str);
					return false;
	}
	if(check_ipv6_IP_address(cf.IPv6_wan3.value) == false)
	{
		alert(alert_invalid_wan_setup_str);
					return false;
	}
	if(check_ipv6_IP_address(cf.IPv6_wan4.value) == false)
	{
		alert(alert_invalid_wan_setup_str);
					return false;
	}
	if(check_ipv6_IP_address(cf.IPv6_wan5.value) == false)
	{
		alert(alert_invalid_wan_setup_str);
					return false;
	}
	if(check_ipv6_IP_address(cf.IPv6_wan6.value) == false)
	{
		alert(alert_invalid_wan_setup_str);
					return false;
	}
	if(check_ipv6_IP_address(cf.IPv6_wan7.value) == false)
	{
		alert(alert_invalid_wan_setup_str);
					return false;
	}
	if(check_ipv6_IP_address(cf.IPv6_wan8.value) == false)
	{
		alert(alert_invalid_wan_setup_str);
					return false;
	}
	
	if(cf.IPv6_wan1.value != "")			//00xx  ------>   xx
			cf.IPv6_wan1.value = parseInt(cf.IPv6_wan1.value, 16).toString(16);
	if(cf.IPv6_wan2.value != "")			//00xx  ------>   xx
			cf.IPv6_wan2.value = parseInt(cf.IPv6_wan2.value, 16).toString(16);
	if(cf.IPv6_wan3.value != "")			//00xx  ------>   xx
			cf.IPv6_wan3.value = parseInt(cf.IPv6_wan3.value, 16).toString(16);
	if(cf.IPv6_wan4.value != "")			//00xx  ------>   xx
			cf.IPv6_wan4.value = parseInt(cf.IPv6_wan4.value, 16).toString(16);
	if(cf.IPv6_wan5.value != "")			//00xx  ------>   xx
			cf.IPv6_wan5.value = parseInt(cf.IPv6_wan5.value, 16).toString(16);
	if(cf.IPv6_wan6.value != "")			//00xx  ------>   xx
			cf.IPv6_wan6.value = parseInt(cf.IPv6_wan6.value, 16).toString(16);
	if(cf.IPv6_wan7.value != "")			//00xx  ------>   xx
			cf.IPv6_wan7.value = parseInt(cf.IPv6_wan7.value, 16).toString(16);
	if(cf.IPv6_wan8.value != "")			//00xx  ------>   xx
			cf.IPv6_wan8.value = parseInt(cf.IPv6_wan8.value, 16).toString(16);
			
	
	if(cf.IPv6_wan1.value == "")
	{
		ip_trans_array[0] = ip_trans_array[0] + "0" + ":";
		cf.ipv6_wan_ip_fixed.value = cf.ipv6_wan_ip_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[0] = ip_trans_array[0] + cf.IPv6_wan1.value + ":"; 
		cf.ipv6_wan_ip_fixed.value = cf.ipv6_wan_ip_fixed.value + cf.IPv6_wan1.value + ":";
	}
	if(cf.IPv6_wan2.value == "")
	{
		ip_trans_array[0] = ip_trans_array[0] + "0" + ":";
		cf.ipv6_wan_ip_fixed.value = cf.ipv6_wan_ip_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[0] = ip_trans_array[0] + cf.IPv6_wan2.value + ":"; 
		cf.ipv6_wan_ip_fixed.value = cf.ipv6_wan_ip_fixed.value + cf.IPv6_wan2.value + ":";
	}
	if(cf.IPv6_wan3.value == "")
	{
		ip_trans_array[0] = ip_trans_array[0] + "0" + ":";
		cf.ipv6_wan_ip_fixed.value = cf.ipv6_wan_ip_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[0] = ip_trans_array[0] + cf.IPv6_wan3.value + ":"; 
		cf.ipv6_wan_ip_fixed.value = cf.ipv6_wan_ip_fixed.value + cf.IPv6_wan3.value + ":";
	}
	if(cf.IPv6_wan4.value == "")
	{
		ip_trans_array[0] = ip_trans_array[0] + "0" + ":";
		cf.ipv6_wan_ip_fixed.value = cf.ipv6_wan_ip_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[0] = ip_trans_array[0] + cf.IPv6_wan4.value + ":"; 
		cf.ipv6_wan_ip_fixed.value = cf.ipv6_wan_ip_fixed.value + cf.IPv6_wan4.value + ":";
	}
	if(cf.IPv6_wan5.value == "")
	{
		ip_trans_array[0] = ip_trans_array[0] + "0" + ":";
		cf.ipv6_wan_ip_fixed.value = cf.ipv6_wan_ip_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[0] = ip_trans_array[0] + cf.IPv6_wan5.value + ":"; 
		cf.ipv6_wan_ip_fixed.value = cf.ipv6_wan_ip_fixed.value + cf.IPv6_wan5.value + ":";
	}
	if(cf.IPv6_wan6.value == "")
	{
		ip_trans_array[0] = ip_trans_array[0] + "0" + ":";
		cf.ipv6_wan_ip_fixed.value = cf.ipv6_wan_ip_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[0] = ip_trans_array[0] + cf.IPv6_wan6.value + ":"; 
		cf.ipv6_wan_ip_fixed.value = cf.ipv6_wan_ip_fixed.value + cf.IPv6_wan6.value + ":";
	}
	if(cf.IPv6_wan7.value == "")
	{
		ip_trans_array[0] = ip_trans_array[0] + "0" + ":";
		cf.ipv6_wan_ip_fixed.value = cf.ipv6_wan_ip_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[0] = ip_trans_array[0] + cf.IPv6_wan7.value + ":"; 
		cf.ipv6_wan_ip_fixed.value = cf.ipv6_wan_ip_fixed.value + cf.IPv6_wan7.value + ":";
	}
	if(cf.IPv6_wan8.value == "")
	{
		ip_trans_array[0] = ip_trans_array[0] + "0" + ":";
		cf.ipv6_wan_ip_fixed.value = cf.ipv6_wan_ip_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[0] = ip_trans_array[0] + cf.IPv6_wan8.value + ":"; 
		cf.ipv6_wan_ip_fixed.value = cf.ipv6_wan_ip_fixed.value + cf.IPv6_wan8.value + ":";
	}
	
	
	if(check_ipv6_IP_address(cf.IPv6_gw1.value) == false)
	{
		alert(alert_invalid_gatewayaddress_str);
		return false;
	}
	if(check_ipv6_IP_address(cf.IPv6_gw2.value) == false)
	{
		alert(alert_invalid_gatewayaddress_str);
		return false;
	}
	if(check_ipv6_IP_address(cf.IPv6_gw3.value) == false)
	{
		alert(alert_invalid_gatewayaddress_str);
		return false;
	}
	if(check_ipv6_IP_address(cf.IPv6_gw4.value) == false)
	{
		alert(alert_invalid_gatewayaddress_str);
		return false;
	}
	if(check_ipv6_IP_address(cf.IPv6_gw5.value) == false)
	{
		alert(alert_invalid_gatewayaddress_str);
		return false;
	}
	if(check_ipv6_IP_address(cf.IPv6_gw6.value) == false)
	{
		alert(alert_invalid_gatewayaddress_str);
		return false;
	}
	if(check_ipv6_IP_address(cf.IPv6_gw7.value) == false)
	{
		alert(alert_invalid_gatewayaddress_str);
		return false;
	}
	
	if(cf.IPv6_gw1.value != "")
			cf.IPv6_gw1.value = parseInt(cf.IPv6_gw1.value, 16).toString(16);
	if(cf.IPv6_gw2.value != "")
			cf.IPv6_gw2.value = parseInt(cf.IPv6_gw2.value, 16).toString(16);
	if(cf.IPv6_gw3.value != "")
			cf.IPv6_gw3.value = parseInt(cf.IPv6_gw3.value, 16).toString(16);
	if(cf.IPv6_gw4.value != "")
			cf.IPv6_gw4.value = parseInt(cf.IPv6_gw4.value, 16).toString(16);
	if(cf.IPv6_gw5.value != "")
			cf.IPv6_gw5.value = parseInt(cf.IPv6_gw5.value, 16).toString(16);
	if(cf.IPv6_gw6.value != "")
			cf.IPv6_gw6.value = parseInt(cf.IPv6_gw6.value, 16).toString(16);
	if(cf.IPv6_gw7.value != "")
			cf.IPv6_gw7.value = parseInt(cf.IPv6_gw7.value, 16).toString(16);
	if(cf.IPv6_gw8.value != "")
			cf.IPv6_gw8.value = parseInt(cf.IPv6_gw8.value, 16).toString(16);
			
			
	if(cf.IPv6_gw1.value == "")
	{
		ip_trans_array[1] = ip_trans_array[1] + "0" + ":";
		cf.ipv6_wan_gw_fixed.value = cf.ipv6_wan_gw_fixed.value +"0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[1] = ip_trans_array[1] + cf.IPv6_gw1.value + ":";
		cf.ipv6_wan_gw_fixed.value = cf.ipv6_wan_gw_fixed.value + cf.IPv6_gw1.value + ":";
	}
	if(cf.IPv6_gw2.value == "")
	{
		ip_trans_array[1] = ip_trans_array[1] + "0" + ":";
		cf.ipv6_wan_gw_fixed.value = cf.ipv6_wan_gw_fixed.value +"0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[1] = ip_trans_array[1] + cf.IPv6_gw2.value + ":";
		cf.ipv6_wan_gw_fixed.value = cf.ipv6_wan_gw_fixed.value + cf.IPv6_gw2.value + ":";
	}
	if(cf.IPv6_gw3.value == "")
	{
		ip_trans_array[1] = ip_trans_array[1] + "0" + ":";
		cf.ipv6_wan_gw_fixed.value = cf.ipv6_wan_gw_fixed.value +"0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[1] = ip_trans_array[1] + cf.IPv6_gw3.value + ":";
		cf.ipv6_wan_gw_fixed.value = cf.ipv6_wan_gw_fixed.value + cf.IPv6_gw3.value + ":";
	}
	if(cf.IPv6_gw4.value == "")
	{
		ip_trans_array[1] = ip_trans_array[1] + "0" + ":";
		cf.ipv6_wan_gw_fixed.value = cf.ipv6_wan_gw_fixed.value +"0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[1] = ip_trans_array[1] + cf.IPv6_gw4.value + ":";
		cf.ipv6_wan_gw_fixed.value = cf.ipv6_wan_gw_fixed.value + cf.IPv6_gw4.value + ":";
	}
	if(cf.IPv6_gw5.value == "")
	{
		ip_trans_array[1] = ip_trans_array[1] + "0" + ":";
		cf.ipv6_wan_gw_fixed.value = cf.ipv6_wan_gw_fixed.value +"0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[1] = ip_trans_array[1] + cf.IPv6_gw5.value + ":";
		cf.ipv6_wan_gw_fixed.value = cf.ipv6_wan_gw_fixed.value + cf.IPv6_gw5.value + ":";
	}
	if(cf.IPv6_gw6.value == "")
	{
		ip_trans_array[1] = ip_trans_array[1] + "0" + ":";
		cf.ipv6_wan_gw_fixed.value = cf.ipv6_wan_gw_fixed.value +"0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[1] = ip_trans_array[1] + cf.IPv6_gw6.value + ":";
		cf.ipv6_wan_gw_fixed.value = cf.ipv6_wan_gw_fixed.value + cf.IPv6_gw6.value + ":";
	}
	if(cf.IPv6_gw7.value == "")
	{
		ip_trans_array[1] = ip_trans_array[1] + "0" + ":";
		cf.ipv6_wan_gw_fixed.value = cf.ipv6_wan_gw_fixed.value +"0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[1] = ip_trans_array[1] + cf.IPv6_gw7.value + ":";
		cf.ipv6_wan_gw_fixed.value = cf.ipv6_wan_gw_fixed.value + cf.IPv6_gw7.value + ":";
	}
	if(cf.IPv6_gw8.value == "")
	{
		ip_trans_array[1] = ip_trans_array[1] + "0" + ":";
		cf.ipv6_wan_gw_fixed.value = cf.ipv6_wan_gw_fixed.value +"0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[1] = ip_trans_array[1] + cf.IPv6_gw8.value + ":";
		cf.ipv6_wan_gw_fixed.value = cf.ipv6_wan_gw_fixed.value + cf.IPv6_gw8.value + ":";
	}
	
	
	if(check_ipv6_IP_address(cf.IPv6_Pri_DNS1.value) == false)
	{
		alert(alert_invalid_primary_dns_str);
		return false;
	}
	if(check_ipv6_IP_address(cf.IPv6_Pri_DNS2.value) == false)
	{
		alert(alert_invalid_primary_dns_str);
		return false;
	}
	if(check_ipv6_IP_address(cf.IPv6_Pri_DNS3.value) == false)
	{
		alert(alert_invalid_primary_dns_str);
		return false;
	}
	if(check_ipv6_IP_address(cf.IPv6_Pri_DNS4.value) == false)
	{
		alert(alert_invalid_primary_dns_str);
		return false;
	}
	if(check_ipv6_IP_address(cf.IPv6_Pri_DNS5.value) == false)
	{
		alert(alert_invalid_primary_dns_str);
		return false;
	}
	if(check_ipv6_IP_address(cf.IPv6_Pri_DNS6.value) == false)
	{
		alert(alert_invalid_primary_dns_str);
		return false;
	}
	if(check_ipv6_IP_address(cf.IPv6_Pri_DNS7.value) == false)
	{
		alert(alert_invalid_primary_dns_str);
		return false;
	}
	if(check_ipv6_IP_address(cf.IPv6_Pri_DNS8.value) == false)
	{
		alert(alert_invalid_primary_dns_str);
		return false;
	}
	
	if(cf.IPv6_Pri_DNS1.value != "")
			cf.IPv6_Pri_DNS1.value = parseInt(cf.IPv6_Pri_DNS1.value, 16).toString(16);
	if(cf.IPv6_Pri_DNS2.value != "")
			cf.IPv6_Pri_DNS2.value = parseInt(cf.IPv6_Pri_DNS2.value, 16).toString(16);
	if(cf.IPv6_Pri_DNS3.value != "")
			cf.IPv6_Pri_DNS3.value = parseInt(cf.IPv6_Pri_DNS3.value, 16).toString(16);
	if(cf.IPv6_Pri_DNS4.value != "")
			cf.IPv6_Pri_DNS4.value = parseInt(cf.IPv6_Pri_DNS4.value, 16).toString(16);
	if(cf.IPv6_Pri_DNS5.value != "")
			cf.IPv6_Pri_DNS5.value = parseInt(cf.IPv6_Pri_DNS5.value, 16).toString(16);
	if(cf.IPv6_Pri_DNS6.value != "")
			cf.IPv6_Pri_DNS6.value = parseInt(cf.IPv6_Pri_DNS6.value, 16).toString(16);
	if(cf.IPv6_Pri_DNS7.value != "")
			cf.IPv6_Pri_DNS7.value = parseInt(cf.IPv6_Pri_DNS7.value, 16).toString(16);
	if(cf.IPv6_Pri_DNS8.value != "")
			cf.IPv6_Pri_DNS8.value = parseInt(cf.IPv6_Pri_DNS8.value, 16).toString(16);
	
	if(cf.IPv6_Pri_DNS1.value == "")
	{
		ip_trans_array[2] = ip_trans_array[2] + "0" + ":";
		cf.ipv6_primary_dns_fixed.value = cf.ipv6_primary_dns_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[2] = ip_trans_array[2] + cf.IPv6_Pri_DNS1.value + ":";
		cf.ipv6_primary_dns_fixed.value = cf.ipv6_primary_dns_fixed.value + cf.IPv6_Pri_DNS1.value + ":";	
	}
	
	if(cf.IPv6_Pri_DNS2.value == "")
	{
		ip_trans_array[2] = ip_trans_array[2] + "0" + ":";
		cf.ipv6_primary_dns_fixed.value = cf.ipv6_primary_dns_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[2] = ip_trans_array[2] + cf.IPv6_Pri_DNS2.value + ":";
		cf.ipv6_primary_dns_fixed.value = cf.ipv6_primary_dns_fixed.value + cf.IPv6_Pri_DNS2.value + ":";	
	}
	
	if(cf.IPv6_Pri_DNS3.value == "")
	{
		ip_trans_array[2] = ip_trans_array[2] + "0" + ":";
		cf.ipv6_primary_dns_fixed.value = cf.ipv6_primary_dns_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[2] = ip_trans_array[2] + cf.IPv6_Pri_DNS3.value + ":";
		cf.ipv6_primary_dns_fixed.value = cf.ipv6_primary_dns_fixed.value + cf.IPv6_Pri_DNS3.value + ":";	
	}
	
	if(cf.IPv6_Pri_DNS4.value == "")
	{
		ip_trans_array[2] = ip_trans_array[2] + "0" + ":";
		cf.ipv6_primary_dns_fixed.value = cf.ipv6_primary_dns_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[2] = ip_trans_array[2] + cf.IPv6_Pri_DNS4.value + ":";
		cf.ipv6_primary_dns_fixed.value = cf.ipv6_primary_dns_fixed.value + cf.IPv6_Pri_DNS4.value + ":";	
	}
	
	if(cf.IPv6_Pri_DNS5.value == "")
	{
		ip_trans_array[2] = ip_trans_array[2] + "0" + ":";
		cf.ipv6_primary_dns_fixed.value = cf.ipv6_primary_dns_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[2] = ip_trans_array[2] + cf.IPv6_Pri_DNS5.value + ":";
		cf.ipv6_primary_dns_fixed.value = cf.ipv6_primary_dns_fixed.value + cf.IPv6_Pri_DNS5.value + ":";	
	}
	
	if(cf.IPv6_Pri_DNS6.value == "")
	{
		ip_trans_array[2] = ip_trans_array[2] + "0" + ":";
		cf.ipv6_primary_dns_fixed.value = cf.ipv6_primary_dns_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[2] = ip_trans_array[2] + cf.IPv6_Pri_DNS6.value + ":";
		cf.ipv6_primary_dns_fixed.value = cf.ipv6_primary_dns_fixed.value + cf.IPv6_Pri_DNS6.value + ":";	
	}
	
	if(cf.IPv6_Pri_DNS7.value == "")
	{
		ip_trans_array[2] = ip_trans_array[2] + "0" + ":";
		cf.ipv6_primary_dns_fixed.value = cf.ipv6_primary_dns_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[2] = ip_trans_array[2] + cf.IPv6_Pri_DNS7.value + ":";
		cf.ipv6_primary_dns_fixed.value = cf.ipv6_primary_dns_fixed.value + cf.IPv6_Pri_DNS7.value + ":";	
	}
	
	if(cf.IPv6_Pri_DNS8.value == "")
	{
		ip_trans_array[2] = ip_trans_array[2] + "0" + ":";
		cf.ipv6_primary_dns_fixed.value = cf.ipv6_primary_dns_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[2] = ip_trans_array[2] + cf.IPv6_Pri_DNS8.value + ":";
		cf.ipv6_primary_dns_fixed.value = cf.ipv6_primary_dns_fixed.value + cf.IPv6_Pri_DNS8.value + ":";	
	}
	
	
	if((check_ipv6_IP_address(cf.IPv6_Pri_DNS1.value) == false )&& (check_ipv6_IP_address(cf.IPv6_Sec_DNS1.value) == false))
	{
		alert(alert_invalid_secondary_dns_str);	
		return false;	
	}
	if((check_ipv6_IP_address(cf.IPv6_Pri_DNS2.value) == false )&& (check_ipv6_IP_address(cf.IPv6_Sec_DNS2.value) == false))
	{
		alert(alert_invalid_secondary_dns_str);	
		return false;	
	}
	if((check_ipv6_IP_address(cf.IPv6_Pri_DNS3.value) == false )&& (check_ipv6_IP_address(cf.IPv6_Sec_DNS3.value) == false))
	{
		alert(alert_invalid_secondary_dns_str);	
		return false;	
	}
	if((check_ipv6_IP_address(cf.IPv6_Pri_DNS4.value) == false )&& (check_ipv6_IP_address(cf.IPv6_Sec_DNS4.value) == false))
	{
		alert(alert_invalid_secondary_dns_str);	
		return false;	
	}
	if((check_ipv6_IP_address(cf.IPv6_Pri_DNS5.value) == false )&& (check_ipv6_IP_address(cf.IPv6_Sec_DNS5.value) == false))
	{
		alert(alert_invalid_secondary_dns_str);	
		return false;	
	}
	if((check_ipv6_IP_address(cf.IPv6_Pri_DNS6.value) == false )&& (check_ipv6_IP_address(cf.IPv6_Sec_DNS6.value) == false))
	{
		alert(alert_invalid_secondary_dns_str);	
		return false;	
	}
	if((check_ipv6_IP_address(cf.IPv6_Pri_DNS7.value) == false )&& (check_ipv6_IP_address(cf.IPv6_Sec_DNS7.value) == false))
	{
		alert(alert_invalid_secondary_dns_str);	
		return false;	
	}
	if((check_ipv6_IP_address(cf.IPv6_Pri_DNS8.value) == false )&& (check_ipv6_IP_address(cf.IPv6_Sec_DNS8.value) == false))
	{
		alert(alert_invalid_secondary_dns_str);	
		return false;	
	}
	
	
	if(cf.IPv6_Sec_DNS1.value != "")
			cf.IPv6_Sec_DNS1.value = parseInt(cf.IPv6_Sec_DNS1.value, 16).toString(16);
	if(cf.IPv6_Sec_DNS2.value != "")
			cf.IPv6_Sec_DNS2.value = parseInt(cf.IPv6_Sec_DNS2.value, 16).toString(16);
	if(cf.IPv6_Sec_DNS3.value != "")
			cf.IPv6_Sec_DNS3.value = parseInt(cf.IPv6_Sec_DNS3.value, 16).toString(16);
	if(cf.IPv6_Sec_DNS4.value != "")
			cf.IPv6_Sec_DNS4.value = parseInt(cf.IPv6_Sec_DNS4.value, 16).toString(16);
	if(cf.IPv6_Sec_DNS5.value != "")
			cf.IPv6_Sec_DNS5.value = parseInt(cf.IPv6_Sec_DNS5.value, 16).toString(16);
	if(cf.IPv6_Sec_DNS6.value != "")
			cf.IPv6_Sec_DNS6.value = parseInt(cf.IPv6_Sec_DNS6.value, 16).toString(16);
	if(cf.IPv6_Sec_DNS1.value != "")
			cf.IPv6_Sec_DNS7.value = parseInt(cf.IPv6_Sec_DNS7.value, 16).toString(16);
	if(cf.IPv6_Sec_DNS1.value != "")
			cf.IPv6_Sec_DNS8.value = parseInt(cf.IPv6_Sec_DNS8.value, 16).toString(16);
	
	if(cf.IPv6_Sec_DNS1.value == "")
	{
		ip_trans_array[3] = ip_trans_array[3] + "0" + ":";
		cf.ipv6_second_dns_fixed.value = cf.ipv6_second_dns_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[3] = ip_trans_array[3] + cf.IPv6_Sec_DNS1.value + ":";
		cf.ipv6_second_dns_fixed.value = cf.ipv6_second_dns_fixed.value + cf.IPv6_Sec_DNS1.value + ":";
	}
	if(cf.IPv6_Sec_DNS2.value == "")
	{
		ip_trans_array[3] = ip_trans_array[3] + "0" + ":";
		cf.ipv6_second_dns_fixed.value = cf.ipv6_second_dns_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[3] = ip_trans_array[3] + cf.IPv6_Sec_DNS2.value + ":";
		cf.ipv6_second_dns_fixed.value = cf.ipv6_second_dns_fixed.value + cf.IPv6_Sec_DNS2.value + ":";
	}
	if(cf.IPv6_Sec_DNS3.value == "")
	{
		ip_trans_array[3] = ip_trans_array[3] + "0" + ":";
		cf.ipv6_second_dns_fixed.value = cf.ipv6_second_dns_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[3] = ip_trans_array[3] + cf.IPv6_Sec_DNS3.value + ":";
		cf.ipv6_second_dns_fixed.value = cf.ipv6_second_dns_fixed.value + cf.IPv6_Sec_DNS3.value + ":";
	}
	if(cf.IPv6_Sec_DNS4.value == "")
	{
		ip_trans_array[3] = ip_trans_array[3] + "0" + ":";
		cf.ipv6_second_dns_fixed.value = cf.ipv6_second_dns_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[3] = ip_trans_array[3] + cf.IPv6_Sec_DNS4.value + ":";
		cf.ipv6_second_dns_fixed.value = cf.ipv6_second_dns_fixed.value + cf.IPv6_Sec_DNS4.value + ":";
	}
	if(cf.IPv6_Sec_DNS5.value == "")
	{
		ip_trans_array[3] = ip_trans_array[3] + "0" + ":";
		cf.ipv6_second_dns_fixed.value = cf.ipv6_second_dns_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[3] = ip_trans_array[3] + cf.IPv6_Sec_DNS5.value + ":";
		cf.ipv6_second_dns_fixed.value = cf.ipv6_second_dns_fixed.value + cf.IPv6_Sec_DNS5.value + ":";
	}
	if(cf.IPv6_Sec_DNS6.value == "")
	{
		ip_trans_array[3] = ip_trans_array[3] + "0" + ":";
		cf.ipv6_second_dns_fixed.value = cf.ipv6_second_dns_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[3] = ip_trans_array[3] + cf.IPv6_Sec_DNS6.value + ":";
		cf.ipv6_second_dns_fixed.value = cf.ipv6_second_dns_fixed.value + cf.IPv6_Sec_DNS6.value + ":";
	}
	if(cf.IPv6_Sec_DNS7.value == "")
	{
		ip_trans_array[3] = ip_trans_array[3] + "0" + ":";
		cf.ipv6_second_dns_fixed.value = cf.ipv6_second_dns_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[3] = ip_trans_array[3] + cf.IPv6_Sec_DNS7.value + ":";
		cf.ipv6_second_dns_fixed.value = cf.ipv6_second_dns_fixed.value + cf.IPv6_Sec_DNS7.value + ":";
	}
	if(cf.IPv6_Sec_DNS8.value == "")
	{
		ip_trans_array[3] = ip_trans_array[3] + "0" + ":";
		cf.ipv6_second_dns_fixed.value = cf.ipv6_second_dns_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[3] = ip_trans_array[3] + cf.IPv6_Sec_DNS8.value + ":";
		cf.ipv6_second_dns_fixed.value = cf.ipv6_second_dns_fixed.value + cf.IPv6_Sec_DNS8.value + ":";
	}
	
	
	if(check_ipv6_IP_address(cf.IPv6_lan1.value) == false)
	{
		alert(alert_invalid_lan_setup_str);
		return false;
	}
	if(check_ipv6_IP_address(cf.IPv6_lan2.value) == false)
	{
		alert(alert_invalid_lan_setup_str);
		return false;
	}
	if(check_ipv6_IP_address(cf.IPv6_lan3.value) == false)
	{
		alert(alert_invalid_lan_setup_str);
		return false;
	}
	if(check_ipv6_IP_address(cf.IPv6_lan4.value) == false)
	{
		alert(alert_invalid_lan_setup_str);
		return false;
	}
	if(check_ipv6_IP_address(cf.IPv6_lan5.value) == false)
	{
		alert(alert_invalid_lan_setup_str);
		return false;
	}
	if(check_ipv6_IP_address(cf.IPv6_lan6.value) == false)
	{
		alert(alert_invalid_lan_setup_str);
		return false;
	}
	if(check_ipv6_IP_address(cf.IPv6_lan7.value) == false)
	{
		alert(alert_invalid_lan_setup_str);
		return false;
	}
	if(check_ipv6_IP_address(cf.IPv6_lan8.value) == false)
	{
		alert(alert_invalid_lan_setup_str);
		return false;
	}
	
	
	if(cf.IPv6_lan1.value != "")
			cf.IPv6_lan1.value = parseInt(cf.IPv6_lan1.value, 16).toString(16);
	if(cf.IPv6_lan2.value != "")
			cf.IPv6_lan2.value = parseInt(cf.IPv6_lan2.value, 16).toString(16);
	if(cf.IPv6_lan3.value != "")
			cf.IPv6_lan3.value = parseInt(cf.IPv6_lan3.value, 16).toString(16);
	if(cf.IPv6_lan4.value != "")
			cf.IPv6_lan4.value = parseInt(cf.IPv6_lan4.value, 16).toString(16);
	if(cf.IPv6_lan5.value != "")
			cf.IPv6_lan5.value = parseInt(cf.IPv6_lan5.value, 16).toString(16);
	if(cf.IPv6_lan6.value != "")
			cf.IPv6_lan6.value = parseInt(cf.IPv6_lan6.value, 16).toString(16);
	if(cf.IPv6_lan7.value != "")
			cf.IPv6_lan7.value = parseInt(cf.IPv6_lan7.value, 16).toString(16);
	if(cf.IPv6_lan8.value != "")
			cf.IPv6_lan8.value = parseInt(cf.IPv6_lan8.value, 16).toString(16);
	
	
	if(cf.IPv6_lan1.value == "")
	{
		ip_trans_array[4] = ip_trans_array[4] + "0" + ":";
		cf.ipv6_lan_ip_fixed.value = cf.ipv6_lan_ip_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[4] = ip_trans_array[4] + cf.IPv6_lan1.value + ":";
		cf.ipv6_lan_ip_fixed.value = cf.ipv6_lan_ip_fixed.value + cf.IPv6_lan1.value + ":";
	}
	if(cf.IPv6_lan2.value == "")
	{
		ip_trans_array[4] = ip_trans_array[4] + "0" + ":";
		cf.ipv6_lan_ip_fixed.value = cf.ipv6_lan_ip_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[4] = ip_trans_array[4] + cf.IPv6_lan2.value + ":";
		cf.ipv6_lan_ip_fixed.value = cf.ipv6_lan_ip_fixed.value + cf.IPv6_lan2.value + ":";
	}
	if(cf.IPv6_lan3.value == "")
	{
		ip_trans_array[4] = ip_trans_array[4] + "0" + ":";
		cf.ipv6_lan_ip_fixed.value = cf.ipv6_lan_ip_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[4] = ip_trans_array[4] + cf.IPv6_lan3.value + ":";
		cf.ipv6_lan_ip_fixed.value = cf.ipv6_lan_ip_fixed.value + cf.IPv6_lan3.value + ":";
	}
	if(cf.IPv6_lan4.value == "")
	{
		ip_trans_array[4] = ip_trans_array[4] + "0" + ":";
		cf.ipv6_lan_ip_fixed.value = cf.ipv6_lan_ip_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[4] = ip_trans_array[4] + cf.IPv6_lan4.value + ":";
		cf.ipv6_lan_ip_fixed.value = cf.ipv6_lan_ip_fixed.value + cf.IPv6_lan4.value + ":";
	}
	if(cf.IPv6_lan5.value == "")
	{
		ip_trans_array[4] = ip_trans_array[4] + "0" + ":";
		cf.ipv6_lan_ip_fixed.value = cf.ipv6_lan_ip_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[4] = ip_trans_array[4] + cf.IPv6_lan5.value + ":";
		cf.ipv6_lan_ip_fixed.value = cf.ipv6_lan_ip_fixed.value + cf.IPv6_lan5.value + ":";
	}
	if(cf.IPv6_lan6.value == "")
	{
		ip_trans_array[4] = ip_trans_array[4] + "0" + ":";
		cf.ipv6_lan_ip_fixed.value = cf.ipv6_lan_ip_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[4] = ip_trans_array[4] + cf.IPv6_lan6.value + ":";
		cf.ipv6_lan_ip_fixed.value = cf.ipv6_lan_ip_fixed.value + cf.IPv6_lan6.value + ":";
	}
	if(cf.IPv6_lan7.value == "")
	{
		ip_trans_array[4] = ip_trans_array[4] + "0" + ":";
		cf.ipv6_lan_ip_fixed.value = cf.ipv6_lan_ip_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[4] = ip_trans_array[4] + cf.IPv6_lan7.value + ":";
		cf.ipv6_lan_ip_fixed.value = cf.ipv6_lan_ip_fixed.value + cf.IPv6_lan7.value + ":";
	}
	if(cf.IPv6_lan8.value == "")
	{
		ip_trans_array[4] = ip_trans_array[4] + "0" + ":";
		cf.ipv6_lan_ip_fixed.value = cf.ipv6_lan_ip_fixed.value + "0" + ":";/* to fix bug 24430 */
	}
	else
	{
		ip_trans_array[4] = ip_trans_array[4] + cf.IPv6_lan8.value + ":";
		cf.ipv6_lan_ip_fixed.value = cf.ipv6_lan_ip_fixed.value + cf.IPv6_lan8.value + ":";
	}
	
	/****************************check the IP legality***************************************/	
	
	/*
	for( i=0; i<cf.IPv6_wan.length; i++ )
	{
		/*---------------------------WAN IP---------------------------------*//*
		if(check_ipv6_IP_address(cf.IPv6_wan[i].value) == false)
		{
			alert(alert_invalid_wan_setup_str);
                        return false;
		}

		if(cf.IPv6_wan[i].value != "")			//00xx  ------>   xx
			cf.IPv6_wan[i].value = parseInt(cf.IPv6_wan[i].value, 16).toString(16);

		if(cf.IPv6_wan[i].value == "")
		{
			ip_trans_array[0] = ip_trans_array[0] + "0" + ":";
			cf.ipv6_wan_ip_fixed.value = cf.ipv6_wan_ip_fixed.value + "0" + ":";/* to fix bug 24430 *//*
		}
		else
		{
			ip_trans_array[0] = ip_trans_array[0] + cf.IPv6_wan[i].value + ":"; 
			cf.ipv6_wan_ip_fixed.value = cf.ipv6_wan_ip_fixed.value + cf.IPv6_wan[i].value + ":";
		}


		/*----------------------------Gateway-------------------------------------*//*
		if(check_ipv6_IP_address(cf.IPv6_gw[i].value) == false)
		{
			alert(alert_invalid_gatewayaddress_str);
			return false;
		}

		if(cf.IPv6_gw[i].value != "")
			cf.IPv6_gw[i].value = parseInt(cf.IPv6_gw[i].value, 16).toString(16);

		if(cf.IPv6_gw[i].value == "")
		{
			ip_trans_array[1] = ip_trans_array[1] + "0" + ":";
			cf.ipv6_wan_gw_fixed.value = cf.ipv6_wan_gw_fixed.value +"0" + ":";/* to fix bug 24430 *//*
		}
		else
		{
			ip_trans_array[1] = ip_trans_array[1] + cf.IPv6_gw[i].value + ":";
			cf.ipv6_wan_gw_fixed.value = cf.ipv6_wan_gw_fixed.value + cf.IPv6_gw[i].value + ":";
		}


		/*----------------------------Primary DNS------------------------------------*/	/*
		if(check_ipv6_IP_address(cf.IPv6_Pri_DNS[i].value) == false)
		{
			alert(alert_invalid_primary_dns_str);
			return false;
		}

		if(cf.IPv6_Pri_DNS[i].value != "")
			cf.IPv6_Pri_DNS[i].value = parseInt(cf.IPv6_Pri_DNS[i].value, 16).toString(16);

		if(cf.IPv6_Pri_DNS[i].value == "")
		{
			ip_trans_array[2] = ip_trans_array[2] + "0" + ":";
			cf.ipv6_primary_dns_fixed.value = cf.ipv6_primary_dns_fixed.value + "0" + ":";/* to fix bug 24430 *//*
		}
		else
		{
			ip_trans_array[2] = ip_trans_array[2] + cf.IPv6_Pri_DNS[i].value + ":";
			cf.ipv6_primary_dns_fixed.value = cf.ipv6_primary_dns_fixed.value + cf.IPv6_Pri_DNS[i].value + ":";	
		}


		/*------------------------------Second DNS------------------------------------*//*
		if(check_ipv6_IP_address(cf.IPv6_Sec_DNS[i].value) == false)
		{
			alert(alert_invalid_secondary_dns_str);	
			return false;	
		}

		if(cf.IPv6_Sec_DNS[i].value != "")
			cf.IPv6_Sec_DNS[i].value = parseInt(cf.IPv6_Sec_DNS[i].value, 16).toString(16);

		if(cf.IPv6_Sec_DNS[i].value == "")
		{
			ip_trans_array[3] = ip_trans_array[3] + "0" + ":";
			cf.ipv6_second_dns_fixed.value = cf.ipv6_second_dns_fixed.value + "0" + ":";/* to fix bug 24430 *//*
		}
		else
		{
			ip_trans_array[3] = ip_trans_array[3] + cf.IPv6_Sec_DNS[i].value + ":";
			cf.ipv6_second_dns_fixed.value = cf.ipv6_second_dns_fixed.value + cf.IPv6_Sec_DNS[i].value + ":";
		}


		/*---------------------------------LAN----------------------------------------*//*
		if(check_ipv6_IP_address(cf.IPv6_lan[i].value) == false)
		{
			alert(alert_invalid_lan_setup_str);
			return false;
		}
	
		if(cf.IPv6_lan[i].value != "")
			cf.IPv6_lan[i].value = parseInt(cf.IPv6_lan[i].value, 16).toString(16);

		if(cf.IPv6_lan[i].value == "")
		{
			ip_trans_array[4] = ip_trans_array[4] + "0" + ":";
			cf.ipv6_lan_ip_fixed.value = cf.ipv6_lan_ip_fixed.value + "0" + ":";/* to fix bug 24430 *//*
		}
		else
		{
			ip_trans_array[4] = ip_trans_array[4] + cf.IPv6_lan[i].value + ":";
			cf.ipv6_lan_ip_fixed.value = cf.ipv6_lan_ip_fixed.value + cf.IPv6_lan[i].value + ":";
		}
	}
	
	
	*/

        if(check_ipv6_IP_address(cf.IPv6_wan_prefix.value) == false)
        {
                alert(alert_invalid_wan_setup_str);
                return false;
        }
        if(check_ipv6_IP_address(cf.IPv6_lan_prefix.value) == false)
        {
                alert(alert_invalid_lan_setup_str);
                return false;
        }
	/****************************************************************************************************/

	/*------------------------------WAN-------------------------------------*/
	var str = cf.ipv6_wan_ip_fixed.value;
	cf.ipv6_wan_ip_fixed.value = str.substring(0, str.length-1);

	if(cf.ipv6_wan_ip_fixed.value == ":::::::")
	{
		cf.ipv6_wan_ip_fixed.value = "";
	}
	else if(cf.ipv6_wan_ip_fixed.value == "0:0:0:0:0:0:0:0")
	{
		alert(alert_invalid_wan_setup_str);
		return false;
	}
	else if(ip_trans_array[0] == "0:0:0:0:0:0:0:0:")
	{
		alert(alert_invalid_wan_setup_str);
		return false;
	}

	cf.ipv6_wan_fixed_prefix.value = cf.IPv6_wan_prefix.value;
	if(cf.ipv6_wan_ip_fixed.value == "")
	{
		alert(alert_invalid_wan_setup_str);
		return false;
	}
	if(cf.ipv6_wan_fixed_prefix.value == "" || parseInt(cf.ipv6_wan_fixed_prefix.value, 10) > 128 || parseInt(cf.ipv6_wan_fixed_prefix.value, 10) < 1)
	{
		alert(alert_invalid_wan_setup_str);
		return false;
	}
	//for bug 20078, and special checking temply
	if(check_addr_legality(cf.ipv6_wan_ip_fixed.value) == false)
	{
		alert(alert_invalid_wan_setup_str);
		return false;
	}

	/*-----------------------------gateway----------------------------------*/
	str = cf.ipv6_wan_gw_fixed.value;
	cf.ipv6_wan_gw_fixed.value = str.substring(0, str.length-1);

	if(cf.ipv6_wan_gw_fixed.value == ":::::::")
	{
		cf.ipv6_wan_gw_fixed.value = "";
	}
	else if(cf.ipv6_wan_gw_fixed.value == "0:0:0:0:0:0:0:0")
	{
		alert(alert_invalid_gatewayaddress_str);
		return false;
	}
	else if(ip_trans_array[1] == "0:0:0:0:0:0:0:0:")
	{
		alert(alert_invalid_gatewayaddress_str);
		return false;
	}
	//for bug 20078, and special checking temply
	if(cf.ipv6_wan_gw_fixed.value != "")
	{
		if(check_addr_legality(cf.ipv6_wan_gw_fixed.value) == false)
		{
			alert(alert_invalid_gatewayaddress_str);
			return false;
		}
	}

	/*-----------------------------primary DNS----------------------------------*/
	str = cf.ipv6_primary_dns_fixed.value;
	cf.ipv6_primary_dns_fixed.value = str.substring(0, str.length-1);
	
	if(cf.ipv6_primary_dns_fixed.value == ":::::::")
	{
		cf.ipv6_primary_dns_fixed.value = "";
	}
	else if(cf.ipv6_primary_dns_fixed.value == "0:0:0:0:0:0:0:0")
	{
		alert(alert_invalid_primary_dns_str);
		return false;
	}
	else if(ip_trans_array[2] == "0:0:0:0:0:0:0:0:")
        {
		alert(alert_invalid_secondary_dns_str);
                return false;
        }
	//for bug 20078, and special checking temply
	if(cf.ipv6_primary_dns_fixed.value != "")
	{
		if(check_addr_legality(cf.ipv6_primary_dns_fixed.value) == false
		|| cf.ipv6_primary_dns_fixed.value == cf.ipv6_wan_ip_fixed.value )/* to fix bug 26445 */
		{
			alert(alert_invalid_primary_dns_str);
			return false;
		}
	}

	/*-----------------------------second DNS-------------------------------------*/
	str = cf.ipv6_second_dns_fixed.value;
	cf.ipv6_second_dns_fixed.value = str.substring(0, str.length-1);

	if(cf.ipv6_second_dns_fixed.value == ":::::::")
	{
		cf.ipv6_second_dns_fixed.value = "";
	}
	else if((cf.ipv6_primary_dns_fixed.value == "0:0:0:0:0:0:0:0") && (cf.ipv6_second_dns_fixed.value == "0:0:0:0:0:0:0:0"))
	{
		alert(alert_invalid_secondary_dns_str);
		return false;
	}
	else if((ip_trans_array[2] == "0:0:0:0:0:0:0:0:") && (ip_trans_array[3] == "0:0:0:0:0:0:0:0:"))
	{
		alert(alert_invalid_secondary_dns_str);
		return false;
	}
	//for bug 20078, and special checking temply
	if(cf.ipv6_second_dns_fixed.value != "")
	{
		if(check_addr_legality(cf.ipv6_second_dns_fixed.value) == false
		|| cf.ipv6_second_dns_fixed.value == cf.ipv6_wan_ip_fixed.value
		|| cf.ipv6_primary_dns_fixed.value == cf.ipv6_second_dns_fixed.value )/* to fix bug 26445 */
		{
			alert(alert_invalid_secondary_dns_str);
			return false;
		}
	}
	if(cf.ipv6_second_dns_fixed.value == "0:0:0:0:0:0:0:0")
	{
		cf.ipv6_second_dns_fixed.value = "N/A";
	}

	/*-------------------------------LAN--------------------------------------*/
	str = cf.ipv6_lan_ip_fixed.value;
	cf.ipv6_lan_ip_fixed.value = str.substring(0, str.length-1);

	if(cf.ipv6_lan_ip_fixed.value == ":::::::")
	{
		cf.ipv6_lan_ip_fixed.value = "";
	}
	else if(cf.ipv6_lan_ip_fixed.value == "0:0:0:0:0:0:0:0")
	{
		alert(alert_invalid_lan_setup_str);
		return false;
	}
	else if(ip_trans_array[4] == "0:0:0:0:0:0:0:0:")
	{
		alert(alert_invalid_lan_setup_str);
		return false;
	}

	cf.ipv6_lan_fixed_prefix.value = cf.IPv6_lan_prefix.value;
	if(cf.ipv6_lan_ip_fixed.value == "")
	{
		alert(alert_invalid_lan_setup_str);
		return false;
	}
	if(cf.IPv6_lan_prefix.value == "" || parseInt(cf.IPv6_lan_prefix.value, 10) > 128 || parseInt(cf.IPv6_lan_prefix.value, 10) < 1)
	{
		alert(alert_invalid_lan_setup_str);
		return false;
	}
	//for bug 20078, and special checking temply
	if(check_addr_legality(cf.ipv6_lan_ip_fixed.value) == false)
	{
		alert(alert_invalid_lan_setup_str);
		return false;
	}

	/*************check IP confilict****************/
	var wan_ip = ip_trans_array[0];
	var gate_way = ip_trans_array[1];
	var primary_dns = ip_trans_array[2];
	var second_dns = ip_trans_array[3];
	var lan_ip = ip_trans_array[4];
	if(wan_ip!="" && (wan_ip.toUpperCase()==lan_ip.toUpperCase()))
	{
		alert(alert_lan_wan_ip_must_be_the_same_subnet_str);
		return false;
	}
	if(wan_ip!="" && (wan_ip==primary_dns||wan_ip==second_dns))
	{
		alert(alert_invalid_ipaddress_str);
		return false;
	}
	if(lan_ip!="" && (lan_ip==primary_dns||lan_ip==second_dns))
	{
		alert(alert_invalid_ipaddress_str);
		return false;
	}
	/***********************************************/


	/* save IPv6 Filtering */
    if(cf.IPv6Filtering[0].checked == true)
    {
        cf.ipv6_hidden_filtering.value = "1";
    }
    else if(cf.IPv6Filtering[1].checked == true)
    {
        cf.ipv6_hidden_filtering.value = "0";
    }
	
	/* Hidden Info for radvd */
	if(cf.ipv6_lan_ip_assign[0].checked == true)
	{
		cf.RADVDMbit.value="on";
		cf.RADVDMode.value="0";//Radvd Auto
		cf.DHCP6SEnable.value="1";
		//cf.RADVDEnable.value = "0";
	}
	else
	{
		cf.RADVDMbit.value="off";
		cf.RADVDMode.value="1";//Radvd Manual
		//cf.DHCP6SEnable.value="0";
	}
	parent.menu_ipv6_status = "Static";
	
	cf.PrefixIPv6.value = parent.aye_utils_Get_IPv6_Prefix(cf.ipv6_lan_ip_fixed.value,parseInt(cf.ipv6_lan_fixed_prefix.value));
	
	document.getElementById("fix_button").style.display = "none";
	document.getElementById("main").style.display = "none";
	document.getElementById("waiting_bar").style.display = "";

	return true;
} 


function check_addr_legality(value)
{
	//for bug 20078, and special checking temply

	//multicase IP address
	if(value.charAt(0).toLowerCase()=="f" && value.charAt(1).toLowerCase()=="f")
		return false;

	//loopback address
	if(value==":::::::1" || value=="0:0:0:0:0:0:0:1")
		return false;

	//The IP address' scope type must be global, so just can start with 2xxx or 3xxx

	//bug 25367, the checking is not needed
	/*
	var each_info = value.split(":");
	if(each_info[0].length != 4)
		return false;
	else if(each_info[0].charAt(0)!="2" && each_info[0].charAt(0)!="3")
		return false;
	*/

	return true;
}
