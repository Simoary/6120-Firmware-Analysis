function myip_update(page)
{
    var cf = document.forms[0];

    if((cf.myip_1.value.length>0)&&(cf.myip_2.value.length>0)&&(cf.myip_3.value.length>0)&&(cf.myip_4.value.length>0))
    {
        setDisabled(false, cf.mygw_1, cf.mygw_2, cf.mygw_3, cf.mygw_4);
	//if( russian_ppp_flag == 1 && gui_region == "Russian" && page == "bas" )
	//{
		setDisabled(false, cf.mymask_1, cf.mymask_2, cf.mymask_3, cf.mymask_4);
		pptp_servip_update();
	//}
    }
    else
    {
        setDisabled(true, cf.mygw_1, cf.mygw_2, cf.mygw_3, cf.mygw_4);
	//if( russian_ppp_flag == 1 && gui_region == "Russian" && page == "bas" )
	//{
		setDisabled(true, cf.mymask_1, cf.mymask_2, cf.mymask_3, cf.mymask_4);
		pptp_servip_update();
	//}
    }
}

function change_pptp_password(obj)
{
        if( obj.type == "password" )
        {
                if( get_browser() == "Firefox" )
                {
                        obj.value = "";
                        obj.type = "text";
                }
                else
                {
			obj.outerHTML='<input type="text" name="pptp_passwd" maxlength="50" size="16" onFocus="this.select();" onKeyPress="return getkey(\'ssid\', event)" value="">';
			document.forms[0].pptp_passwd.focus();
			document.forms[0].pptp_passwd.focus();
                }
        }
}

function pptp_servip_update()
{
	var disable=false;
	var cf = document.forms[0];
	var serv_array=cf.pptp_serv_ip.value.split('.');
	if (serv_array.length == 4)
	{
		var flag = 0;
		for (iptab=0; iptab<4; iptab++)
			if (isNumeric(serv_array[iptab], 255))
				flag++;
		if (flag == 4)
		{
			if (checkipaddr(cf.pptp_serv_ip.value) == false)
				disable=true;
		}
		else
		{
			disable=true;
		}
	}
	else if (cf.pptp_serv_ip.value.length > 0)
	{
		disable=true;
	}

	//if( russian_ppp_flag == 1 && gui_region == "Russian" )
	//{
	   	if( disable == true && cf.myip_1.value == "") 
	   	{
			disable = false;
	   	}				
		setDisabled(disable, cf.DNSAssign[0]);
		if ( disable == true && cf.DNSAssign[1].checked == false)
		{
			cf.DNSAssign[1].checked = true;
			setDNS(cf);
		}		
	   
	//}
	/*else
	{
		setBlank(disable, cf.myip_1, cf.myip_2, cf.myip_3, cf.myip_4);	
		setDisabled(disable, cf.myip_1, cf.myip_2, cf.myip_3, cf.myip_4);
	}*/
}

function setDNS(cf)
{
	var dflag = cf.DNSAssign[0].checked;
	setDisabled(dflag,cf.DAddr1,cf.DAddr2,cf.DAddr3,cf.DAddr4,cf.PDAddr1,cf.PDAddr2,cf.PDAddr3,cf.PDAddr4);
	DisableFixedDNS = dflag;
}

/* check each charactor in server address, if all numbers, return true */
function is_IP_addr(serv_array)
{
        var i, j, charct;
        for( i=0; i<serv_array.length; i++ )
        {
                for( j=0; j<serv_array[i].length; j++)
                {
                        charct = serv_array[i].charAt(j);
                        if("0123456789".indexOf(charct,0)<0)
                        {
                                return false;
                        }
                }
        }
        return true;
}

function check_wizard_pptp(check,page)
{
	var cf=document.forms[0];
	if(cf.pptp_username.value=="")
	{
		alert(alert_login_name_cannot_blank_str);
		return false;
	}
	for(i=0;i<cf.pptp_username.value.length;i++)
	{
		if(isValidChar(cf.pptp_username.value.charCodeAt(i))==false)
		{
			alert(alert_login_name_str);
			return false;
		}
	}

	if(cf.pptp_passwd.value=="")
	{
		alert(alert_invalid_password_str);
		return false;
	}
	if(cf.pptp_idletime.value.length<=0)
	{
		alert(alert_enter_idle_time_str);
		return false;
	}
	else if(!_isNumeric(cf.pptp_idletime.value))
	{
		alert(alert_invalid_idle_time_str);
		return false;
	}
	cf.pptp_myip.value=cf.myip_1.value+'.'+cf.myip_2.value+'.'+cf.myip_3.value+'.'+cf.myip_4.value;
	cf.pptp_gateway.value=cf.mygw_1.value+'.'+cf.mygw_2.value+'.'+cf.mygw_3.value+'.'+cf.mygw_4.value;
	cf.pptp_subnet.value=cf.mymask_1.value+'.'+cf.mymask_2.value+'.'+cf.mymask_3.value+'.'+cf.mymask_4.value;

	if(cf.pptp_subnet.value == "" || cf.pptp_subnet.value=="..." )
	{
        var pptp_mask="255.255.255.0";
       if( parseInt(cf.myip_1.value) < 128 )
            pptp_mask="255.0.0.0";
        else if(parseInt(cf.myip_1.value) < 192 )
            pptp_mask="255.255.0.0";
        else
            pptp_mask="255.255.255.0";
		cf.pptp_subnet.value=pptp_mask;
	}
	
    if( cf.pptp_myip.value != "..." )
    {
		cf.WANAssign.value=1;

        if(checkipaddr(cf.pptp_myip.value)==false)
        {
            alert(alert_invalid_ip_address_str);
            return false;
        }
        if(isSameSubNet(cf.pptp_myip.value,lan_subnet,lan_ip,lan_subnet) == true)
        {
            cf.conflict_wanlan.value=1;
        }
        if(isSameIp(cf.pptp_myip.value,lan_ip) == true)
        {
            cf.conflict_wanlan.value=1;
        }
		if( russian_ppp_flag == 1 && gui_region == "Russian" && page == 'bas' )
		{
            if(checksubnet(cf.pptp_subnet.value)==false)
            {
                alert(alert_invalid_subnetmask_str);
               	return false;
            }
            if(isSameSubNet(cf.pptp_myip.value,cf.pptp_subnet.value,lan_ip,cf.pptp_subnet.value) == true)
			{
               	cf.conflict_wanlan.value=1;
            }
            if(isSameSubNet(cf.pptp_myip.value,cf.pptp_subnet.value,lan_ip,lan_subnet) == true)
            {
               	cf.conflict_wanlan.value=1;
            }
		}
        if ( cf.pptp_gateway.value != "" && checkgateway(cf.pptp_gateway.value) == false )
        {
            alert(alert_invalid_gateway_ip_str);
            return false;
        }
        if( cf.pptp_gateway.value != "" )
        {
            if(isGateway(cf.pptp_myip.value,cf.pptp_subnet.value,cf.pptp_gateway.value) == false)
            {
                alert(alert_invalid_gateway_ip_str);
                return false;
            }	
            if(isSameIp(cf.pptp_myip.value,cf.pptp_gateway.value) == true)
            {
                alert(alert_invalid_gateway_ip_str);
                return false;
            }
			cf.pptp_gateway.value = address_parseInt(cf.pptp_gateway.value);
        }
		cf.pptp_myip.value = address_parseInt(cf.pptp_myip.value);
		cf.pptp_subnet.value = address_parseInt(cf.pptp_subnet.value);

    }
    else
    {
        cf.pptp_myip.value="";
        cf.pptp_gateway.value="";
		cf.pptp_subnet.value="";
        cf.WANAssign.value=0;
    }

	if(!parent.aye_regex_IPV4.exec(cf.pptp_serv_ip.value)){ alert(alert_invalid_server_address_str); return false; }	

    if( cf.pptp_serv_ip.value == cf.pptp_myip.value )
    {
		alert(alert_myip_must_notbe_thesame_str);
		return false;
    }
	
	//DNS
	if(cf.DNSAssign[1].checked == true)
	{
		cf.pptp_dnsaddr1.value=cf.DAddr1.value+'.'+cf.DAddr2.value+'.'+cf.DAddr3.value+'.'+cf.DAddr4.value;
		cf.pptp_dnsaddr2.value=cf.PDAddr1.value+'.'+cf.PDAddr2.value+'.'+cf.PDAddr3.value+'.'+cf.PDAddr4.value;
		if(!parent.aye_regex_IPV4.exec(cf.pptp_dnsaddr1.value)){ alert(error_invalid_primary_dns_str); return false; }
		
		if(cf.pptp_dnsaddr2.value!="...")
			if(!parent.aye_regex_IPV4.exec(cf.pptp_dnsaddr2.value)){ alert(error_invalid_secondard_dns_str); return false; }
	}	
	
	//MAC Spoofing
	if(cf.MACAssign[0].checked)
		cf.WAN_MAC_ASSIGN.value="0";
	else if	(cf.MACAssign[1].checked)
		cf.WAN_MAC_ASSIGN.value="1";
	else
		cf.WAN_MAC_ASSIGN.value="2";

	cf.Spoofmac.value = cf.Spoofmac.value.toUpperCase();	
	
	parent.menu_internet = "pptp";
	
	//Call ID
	if(cf.pptp_conn_id.value=="")
		cf.PPTPCallID.value = "_NULL_";
	else
		cf.PPTPCallID.value = cf.pptp_conn_id.value;
	return true;
}

function check_pptp(cf,check)
{
	//bug 23249, change the input value format
	format_IP("myip_1", "myip_2", "myip_3", "myip_4", "mymask_1", "mymask_2", "mymask_3", "mymask_4", "mygw_1", "mygw_2", "mygw_3", "mygw_4", "DAddr1", "DAddr2", "DAddr3", "DAddr4", "PDAddr1", "PDAddr2", "PDAddr3", "PDAddr4");

	if(cf.auto_conn_24hr.checked == true)
		cf.hidden_auto_conn_flag.value=1;
	else
		cf.hidden_auto_conn_flag.value=0;

	var wan_assgin = false;
	if(check_wizard_pptp(check,"bas")==false)
		return false;
	cf.hidden_pptp_idle_time.value=parseInt(cf.pptp_idletime.value, 10);
	cf.hid_pptp_dod.value = cf.pptp_dod.value;//bug 22322:when connection mode gray out,need a hidden-value to transfer
	if(cf.WANAssign.value == 1)
		wan_assgin = true;
	 
	if(cf.DNSAssign[1].checked == true)
	{
		cf.pptp_dnsaddr1.value=cf.DAddr1.value+'.'+cf.DAddr2.value+'.'+cf.DAddr3.value+'.'+cf.DAddr4.value;
		cf.pptp_dnsaddr2.value=cf.PDAddr1.value+'.'+cf.PDAddr2.value+'.'+cf.PDAddr3.value+'.'+cf.PDAddr4.value;

                if(cf.pptp_dnsaddr1.value=="...")
                        cf.pptp_dnsaddr1.value="";
		if(cf.pptp_dnsaddr2.value=="...")
			cf.pptp_dnsaddr2.value="";
	
		if(!check_DNS(cf.pptp_dnsaddr1.value,cf.pptp_dnsaddr2.value,wan_assgin,cf.pptp_myip.value))
			return false;

		if( cf.WANAssign.value == 1  )	
		{
			if( (cf.pptp_dnsaddr1.value != "" && !isSameSubNet(cf.pptp_dnsaddr1.value, cf.pptp_subnet.value, cf.pptp_myip.value, cf.pptp_subnet.value)) || (cf.pptp_dnsaddr2.value !="" && !isSameSubNet(cf.pptp_dnsaddr2.value, cf.pptp_subnet.value, cf.pptp_myip.value, cf.pptp_subnet.value)) )
			{
				if(cf.pptp_gateway.value == "" || cf.pptp_gateway.value == "...")
				{
					alert("Invalid gateway IP address. Please enter it again.");
					return false;
				}
			}
		}

		cf.pptp_dnsaddr1.value = address_parseInt(cf.pptp_dnsaddr1.value);
		cf.pptp_dnsaddr2.value = address_parseInt(cf.pptp_dnsaddr2.value);
	}
	
	//MAC Spoofing
	if(cf.MACAssign[0].checked)
		cf.WAN_MAC_ASSIGN.value="0";
	else if	(cf.MACAssign[1].checked)
		cf.WAN_MAC_ASSIGN.value="1";
	else
		cf.WAN_MAC_ASSIGN.value="2";
			
	the_mac=cf.Spoofmac.value;
	if(the_mac.indexOf(":")==-1 && the_mac.length=="12")
	{
		var tmp_mac=the_mac.substr(0,2)+":"+the_mac.substr(2,2)+":"+the_mac.substr(4,2)+":"+the_mac.substr(6,2)+":"+the_mac.substr(8,2)+":"+the_mac.substr(10,2);
		cf.Spoofmac.value = tmp_mac;
	}
	else if ( the_mac.split("-").length == 6 )
	{
		var tmp_mac = the_mac.replace(/-/g,":");
		cf.Spoofmac.value=tmp_mac;
	}	
	if(maccheck_multicast(cf.Spoofmac.value) == false)
		return false;
	
	return true;
}

function setIP_welcome_pptp()
{
	var cf = document.forms[0];
	var dflag = cf.WANAssign[0].checked;
	setDisabled(dflag,cf.myip_1,cf.myip_2,cf.myip_3,cf.myip_4);
	DisableFixedIP = dflag;
}


function check_welcome_pptp()
{
	var cf = document.forms[0];
	if(check_wizard_pptp(0,"welcome")==false)
		return false;
	parent.pptp_username=cf.pptp_username.value;
	parent.pptp_password=cf.pptp_passwd.value;
	parent.pptp_idle_time=cf.pptp_idletime.value;
	cf.pptp_myip.value=cf.myip_1.value+'.'+cf.myip_2.value+'.'+cf.myip_3.value+'.'+cf.myip_4.value;
	if(cf.pptp_myip.value=="...")
	{
		cf.pptp_myip.value="";	
		cf.WANAssign.value=0;
		parent.pptp_wan_assign=0;
	}
	else
	{
		cf.WANAssign.value=1;				
		parent.pptp_wan_assign=1;
	}	
	parent.pptp_local_ipaddr=cf.pptp_myip.value;
	parent.pptp_local_gateway=cf.pptp_gateway.value;
	parent.pptp_server_ipaddr=cf.pptp_serv_ip.value;
	parent.pptp_connect_id=cf.pptp_conn_id.value;
	parent.welcome_wan_type=4;
	return true;
}
