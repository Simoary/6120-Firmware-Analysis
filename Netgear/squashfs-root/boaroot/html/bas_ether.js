function goto_basic_login_page()
{
	if(((jp_multiPPPoE == 1 && gui_region != "Japanese" ) || ( select_type == 3 && gui_region == "Japanese") ) && (netgear_region == "" || netgear_region.toUpperCase() == "WW" || netgear_region.toUpperCase() == "JP" ))
		this.location.href = "BAS_mulpppoe.asp";
	else if( select_type == 0 )
		this.location.href="BAS_pppoe.asp";
	else if(select_type == 1 )
		this.location.href="BAS_pptp.asp";
	else if( select_type == 4 && have_l2tp == 1 )
		this.location.href="BAS_l2tp.asp";
	else
		this.location.href="BAS_pppoe.asp";
}

function setDNS(cf)
{
	var dflag = cf.DNSAssign[0].checked;
	if (cf.WANAssign[1].checked)
	{
		cf.DNSAssign[1].checked=true;
		dflag = false;
	}
	setDisabled(dflag,cf.DAddr1,cf.DAddr2,cf.DAddr3,cf.DAddr4,cf.PDAddr1,cf.PDAddr2,cf.PDAddr3,cf.PDAddr4);
	DisableFixedDNS = dflag;
}

function check_static_ip_mask_gtw()
{
	cf=document.forms[0];
	if(cf.WANAssign[1].checked == true)
	{
        cf.ether_ipaddr.value=cf.WPethr1.value+'.'+cf.WPethr2.value+'.'+cf.WPethr3.value+'.'+cf.WPethr4.value;
        cf.ether_subnet.value=cf.WMask1.value+'.'+cf.WMask2.value+'.'+cf.WMask3.value+'.'+cf.WMask4.value;
        cf.ether_gateway.value=cf.WGateway1.value+'.'+cf.WGateway2.value+'.'+cf.WGateway3.value+'.'+cf.WGateway4.value;
	}
	else
	{
        cf.ether_ipaddr.value=cf.IPoAethr1.value+'.'+cf.IPoAethr2.value+'.'+cf.IPoAethr3.value+'.'+cf.IPoAethr4.value;
        cf.ether_subnet.value=cf.IPoAMask1.value+'.'+cf.IPoAMask2.value+'.'+cf.IPoAMask3.value+'.'+cf.IPoAMask4.value;
        cf.ether_gateway.value=cf.IPoAGateway1.value+'.'+cf.IPoAGateway2.value+'.'+cf.IPoAGateway3.value+'.'+cf.IPoAGateway4.value;	
	}

	/*to fix bug 23900, change the order of check invalid ip and invalid mask */
	if(checksubnet(cf.ether_subnet.value)==false)
	{
		alert(alert_invalid_subnetmask_str);
		return false;
	}
	if(checkipaddr(cf.ether_ipaddr.value)==false || is_sub_or_broad(cf.ether_ipaddr.value, cf.ether_ipaddr.value, cf.ether_subnet.value) == false)
	{
		alert(alert_invalid_ipaddress_str);
		return false;
	}

	if(checkgateway(cf.ether_gateway.value)==false)
	{
		alert(alert_invalid_gw_str);
		return false;
	}
	if(isGateway(cf.ether_ipaddr.value,cf.ether_subnet.value,cf.ether_gateway.value)==false)
	{
		alert(alert_invalid_gw_str);
		return false;		
	}
	if( isSameIp(cf.ether_ipaddr.value, cf.ether_gateway.value) == true )
	{
		alert(alert_invalid_gw_str);
		return false;
	}
	if(isSameSubNet(cf.ether_ipaddr.value,cf.ether_subnet.value,cf.ether_gateway.value,cf.ether_subnet.value) == false)
	{
		alert(alert_invalid_gw_same_subnet_str);
		return false;
	}
	return true;
}

function check_three_DNS(wan_assign)
{
        var cf=document.forms[0];
        cf.ether_dnsaddr1.value=cf.DAddr1.value+'.'+cf.DAddr2.value+'.'+cf.DAddr3.value+'.'+cf.DAddr4.value;
        cf.ether_dnsaddr2.value=cf.PDAddr1.value+'.'+cf.PDAddr2.value+'.'+cf.PDAddr3.value+'.'+cf.PDAddr4.value;
	//cf.ether_dnsaddr3.value=cf.TDAddr1.value+'.'+cf.TDAddr2.value+'.'+cf.TDAddr3.value+'.'+cf.TDAddr4.value;
		if(cf.WANAssign[1].checked == true)
           cf.ether_ipaddr.value=cf.WPethr1.value+'.'+cf.WPethr2.value+'.'+cf.WPethr3.value+'.'+cf.WPethr4.value;
		else
		   cf.ether_ipaddr.value=cf.IPoAethr1.value+'.'+cf.IPoAethr2.value+'.'+cf.IPoAethr3.value+'.'+cf.IPoAethr4.value;

        if(cf.ether_dnsaddr1.value=="...")
                cf.ether_dnsaddr1.value="";

        if(cf.ether_dnsaddr2.value=="...")
                cf.ether_dnsaddr2.value="";

        if(cf.ether_dnsaddr3.value=="...")
                cf.ether_dnsaddr3.value="";

        if(cf.ether_dnsaddr1.value!="")
        {
                if(checkipaddr(cf.ether_dnsaddr1.value)==false)
                {
                        alert(error_invalid_primary_dns_str);
                        return false;
                }
		cf.ether_dnsaddr1.value = address_parseInt(cf.ether_dnsaddr1.value);
                if( wan_assign == true && isSameIp(cf.ether_dnsaddr1.value,cf.ether_ipaddr.value))
                {
                        alert(error_invalid_primary_dns_str);
                        return false;
                }
        }
        if(cf.ether_dnsaddr2.value!="")
        {
                if(checkipaddr(cf.ether_dnsaddr2.value)==false)
                {
                        alert(error_invalid_secondard_dns_str);
                        return false;
                }
		cf.ether_dnsaddr2.value = address_parseInt(cf.ether_dnsaddr2.value);
                if( wan_assign == true && isSameIp(cf.ether_dnsaddr2.value,cf.ether_ipaddr.value))
                {
                        alert(error_invalid_secondard_dns_str);
                        return false;
                }
        }
        if(cf.ether_dnsaddr3.value!="")
        {
                if(checkipaddr(cf.ether_dnsaddr3.value)==false)
                {
                        alert(error_invalid_secondard_dns_str);
                        return false;
                }
		cf.ether_dnsaddr3.value = address_parseInt(cf.ether_dnsaddr3.value);
                if( wan_assign == true && isSameIp(cf.ether_dnsaddr3.value,cf.ether_ipaddr.value))
                {
                        alert(error_invalid_secondard_dns_str);
                        return false;
                }
        }


        if(cf.ether_dnsaddr1.value=="" && cf.ether_dnsaddr2.value=="" && cf.ether_dnsaddr3.value==""  )
        {
                alert(alert_dns_address_be_specified_str);
                return false;
        }
        return true;
}

function check_static_dns( wan_assign )
{
	var cf=document.forms[0];
	cf.ether_dnsaddr1.value=cf.DAddr1.value+'.'+cf.DAddr2.value+'.'+cf.DAddr3.value+'.'+cf.DAddr4.value;
	cf.ether_dnsaddr2.value=cf.PDAddr1.value+'.'+cf.PDAddr2.value+'.'+cf.PDAddr3.value+'.'+cf.PDAddr4.value;
	if(cf.WANAssign[1].checked == true)
	   cf.ether_ipaddr.value=cf.WPethr1.value+'.'+cf.WPethr2.value+'.'+cf.WPethr3.value+'.'+cf.WPethr4.value;
	else
	   cf.ether_ipaddr.value=cf.IPoAethr1.value+'.'+cf.IPoAethr2.value+'.'+cf.IPoAethr3.value+'.'+cf.IPoAethr4.value;

	if(cf.ether_dnsaddr1.value=="...")
		cf.ether_dnsaddr1.value="";
	else
		cf.ether_dnsaddr1.value = address_parseInt(cf.ether_dnsaddr1.value);

	if(cf.ether_dnsaddr2.value=="...")
		cf.ether_dnsaddr2.value="";
	else
		cf.ether_dnsaddr2.value = address_parseInt(cf.ether_dnsaddr2.value);
	if( check_DNS(cf.ether_dnsaddr1.value,cf.ether_dnsaddr2.value,wan_assign,cf.ether_ipaddr.value))
		return true;
	else
		return false;
		
		
	if(!parent.aye_regex_IPV4.exec(cf.ether_dnsaddr1.value)){ alert(error_invalid_primary_dns_str); return false; }
	if(!parent.aye_regex_IPV4.exec(cf.ether_dnsaddr2.value)){ alert(error_invalid_secondard_dns_str); return false; }	
		
}

function check_ether_samesubnet()
{
	var cf=document.forms[0];
	if(cf.WANAssign[1].checked == true)
	{
        cf.ether_ipaddr.value=cf.WPethr1.value+'.'+cf.WPethr2.value+'.'+cf.WPethr3.value+'.'+cf.WPethr4.value;
        cf.ether_subnet.value=cf.WMask1.value+'.'+cf.WMask2.value+'.'+cf.WMask3.value+'.'+cf.WMask4.value;
        cf.ether_gateway.value=cf.WGateway1.value+'.'+cf.WGateway2.value+'.'+cf.WGateway3.value+'.'+cf.WGateway4.value;
	}
	else
	{
        cf.ether_ipaddr.value=cf.IPoAethr1.value+'.'+cf.IPoAethr2.value+'.'+cf.IPoAethr3.value+'.'+cf.IPoAethr4.value;
        cf.ether_subnet.value=cf.IPoAMask1.value+'.'+cf.IPoAMask2.value+'.'+cf.IPoAMask3.value+'.'+cf.IPoAMask4.value;
        cf.ether_gateway.value=cf.IPoAGateway1.value+'.'+cf.IPoAGateway2.value+'.'+cf.IPoAGateway3.value+'.'+cf.IPoAGateway4.value;	
	}
	if(isSameSubNet(cf.ether_ipaddr.value,cf.ether_subnet.value,lan_ip,lan_subnet) == true)
	{
		alert(alert_lan_wan_not_be_same_subnet_str);
		return false;
	}
	if(isSameSubNet(cf.ether_ipaddr.value,lan_subnet,lan_ip,lan_subnet) == true)
	{
		alert(alert_lan_wan_not_be_same_subnet_str);
		return false;
	}
	if(isSameSubNet(cf.ether_ipaddr.value,cf.ether_subnet.value,lan_ip,cf.ether_subnet.value) == true)
	{
		alert(alert_lan_wan_not_be_same_subnet_str);
		return false;
	}
	if(isSameIp(cf.ether_ipaddr.value,lan_ip) == true)
	{
		alert(alert_lan_wan_not_be_same_subnet_str);
		return false;
	}	
	return true;
}

function check_wizard_static(check,page)
{
	var cf=document.forms[0];
	if(check_static_ip_mask_gtw()==false)
		return false;
	if(check_ether_samesubnet()==false)
		return false;	
	if(check_static_dns(true)==false)
		return false;		

        if (check == 1)
        {
                cf.run_test.value="test";
                if( page == "wiz")
                        cf.action="/apply.cgi?/WIZ_update.htm timestamp="+ts;
        }
        else
                cf.run_test.value="no";
	return true;
}

function check_ether(cf,check)
{
	if(check==1)
		cf.runtest.value="true";
	else
		cf.runtest.value="false";
		
	format_IP("WPethr1", "WPethr2", "WPethr3", "WPethr4", "WMask1", "WMask2", "WMask3", "WMask4", "WGateway1", "WGateway2", "WGateway3", "WGateway4", "IPoAethr1", "IPoAethr2", "IPoAethr3", "IPoAethr4", "IPoAMask1", "IPoAMask2", "IPoAMask3", "IPoAMask4", "IPoAGateway1", "IPoAGateway2", "IPoAGateway3", "IPoAGateway4", "DAddr1", "DAddr2", "DAddr3", "DAddr4", "PDAddr1", "PDAddr2", "PDAddr3", "PDAddr4");

	    if(cf.WANAssign[1].checked == true)
		{
           cf.ether_ipaddr.value=cf.WPethr1.value+'.'+cf.WPethr2.value+'.'+cf.WPethr3.value+'.'+cf.WPethr4.value;
           cf.ether_subnet.value=cf.WMask1.value+'.'+cf.WMask2.value+'.'+cf.WMask3.value+'.'+cf.WMask4.value;
           cf.ether_gateway.value=cf.WGateway1.value+'.'+cf.WGateway2.value+'.'+cf.WGateway3.value+'.'+cf.WGateway4.value;
		}
		else
		{
           cf.ether_ipaddr.value=cf.IPoAethr1.value+'.'+cf.IPoAethr2.value+'.'+cf.IPoAethr3.value+'.'+cf.IPoAethr4.value;
           cf.ether_subnet.value=cf.IPoAMask1.value+'.'+cf.IPoAMask2.value+'.'+cf.IPoAMask3.value+'.'+cf.IPoAMask4.value;
           cf.ether_gateway.value=cf.IPoAGateway1.value+'.'+cf.IPoAGateway2.value+'.'+cf.IPoAGateway3.value+'.'+cf.IPoAGateway4.value;
		}
 
	if(cf.DNSAssign[1].checked)
	{
		cf.DNSASSIGN.value="1";
		if( dns_third_flag == 1 )
		{
                        if(check_three_DNS(cf.WANAssign[1].checked)==false)
                        return false;
		}
		else
		{
			if(check_static_dns(cf.WANAssign[1].checked)==false)
			return false;
		}
	}
	else
		cf.DNSASSIGN.value="0";
				
	/*if (cf.MACAssign[2].checked )
	{
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
	}*/
	if(cf.WANAssign[1].checked == true)
	{
		if(check_static_ip_mask_gtw()==false)
			return false;
		if(isSameSubNet(cf.ether_ipaddr.value,cf.ether_subnet.value,lan_ip,lan_subnet) == true)
		{
			cf.conflict_wanlan.value=1;	
		}
		
		if(isSameSubNet(cf.ether_ipaddr.value,lan_subnet,lan_ip,lan_subnet) == true)
		{
			cf.conflict_wanlan.value=1;
		}
		if(isSameSubNet(cf.ether_ipaddr.value,cf.ether_subnet.value,lan_ip,cf.ether_subnet.value) == true)
		{
			cf.conflict_wanlan.value=1;
		}
		if(isSameIp(cf.ether_ipaddr.value,lan_ip) == true)
		{
			cf.conflict_wanlan.value=1;
		}	
	}
	
	cf.hid_mtu_value.value=wan_mtu_now;
	if( old_wan_type!="dhcp" )
	{
        	cf.change_wan_type.value=0;
			mtu_change(wanproto_type);
	}
	else if ( old_wan_assign == "1" )
	{
        	if(old_wan_ip!=cf.ether_ipaddr.value && cf.WANAssign[1].checked)
                	cf.change_wan_type.value=0;
        	else if(cf.WANAssign[0].checked)
                	cf.change_wan_type.value=0;
        	else
                	cf.change_wan_type.value=1;
	}	
	else if(old_wan_assign == "0" )
	{
        	if(old_wan_ip!=cf.ether_ipaddr.value && cf.WANAssign[1].checked)
                	cf.change_wan_type.value=0;
        	else
                	cf.change_wan_type.value=1;
	}

	/*if(cf.WANAssign[1].checked && cf.MACAssign[2].checked)
	{
		if((cf.ether_ipaddr.value == old_wan_ip) && (cf.Spoofmac.value == ether_get_this_mac) && (cf.system_name.value == system_name))
		{
			if(confirm("The input data is duplicated with current record,\ncontinue to overwrite?") == false)
			{
				return false;
			}
		}
	}*/
	cf.ether_ipaddr.value = address_parseInt(cf.ether_ipaddr.value);
	cf.ether_subnet.value = address_parseInt(cf.ether_subnet.value);
	cf.ether_gateway.value = address_parseInt(cf.ether_gateway.value);
		
	if(cf.WANAssign[0].checked)
		cf.wanType.value = "0";
	else{	
		cf.wanType.value = "1";//static
		
		if(!parent.aye_regex_IPV4.exec(cf.ether_ipaddr.value)){ alert(error_invalid_ip_address_str); return false; }
		if(!parent.aye_regex_MASK.exec(cf.ether_subnet.value)){ alert(error_invalid_ip_subnet_mask_str); return false; }
		if(!parent.aye_regex_IPV4.exec(cf.ether_gateway.value)){ alert(error_invalid_gateway_ip_address_str); return false; }
	}
	
	//NAT
	if(cf.en_nat[0].checked)
		cf.NATEnable.value = "Enable";
	else	
		cf.NATEnable.value = "Disable";
		
	parent.menu_internet = "ipoe";	
		
	//MAC Spoofing
	if(cf.MACAssign[0].checked)
		cf.WAN_MAC_ASSIGN.value="0";
	else if	(cf.MACAssign[1].checked)
		cf.WAN_MAC_ASSIGN.value="1";
	else
		cf.WAN_MAC_ASSIGN.value="2";
		
	if(cf.ENCAP.value == "LLC")
	{
	   if(cf.WANAssign[0].checked == true)
	      cf.ENCAP.value = "1483 Bridged IP LLC";
	   else if(cf.WANAssign[1].checked == true)
	      cf.ENCAP.value = "1483 Bridged IP LLC";
	   else if(cf.WANAssign[2].checked == true)
	      cf.ENCAP.value = "1483 Routed IP LLC(IPoA)";
	}
	else
	{
	   if(cf.WANAssign[0].checked == true)
	      cf.ENCAP.value = "1483 Bridged IP VC-Mux";
	   else if(cf.WANAssign[1].checked == true)
	      cf.ENCAP.value = "1483 Bridged IP VC-Mux";
	   else if(cf.WANAssign[2].checked == true)
	      cf.ENCAP.value = "1483 Routed IP VC-Mux";
	}
		
	if (cf.MACAssign[2].checked )
    {
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
    }

	cf.Spoofmac.value = cf.Spoofmac.value.toUpperCase();
	
	check_wanlan_conflict();
	
	//Display Wait Bar
	document.getElementById("title").style.display = "none";
	document.getElementById("fix_button").style.display = "none";
	document.getElementById("bas_top").style.display = "none";
	document.getElementById("main").style.display = "none";
	document.getElementById("waiting_bar").style.display = "";
	updateProgress();
	return true;
}

function check_welcome_dhcp()
{
	var cf = document.forms[0];
	parent.account_name=cf.system_name.value;
	parent.domain_name=cf.domain_name.value;
	parent.welcome_wan_type=2;
	return true;
}

function check_welcome_static()
{
	var cf = document.forms[0];
	if(cf.WANAssign[1].checked == true)
	{
        cf.ether_ipaddr.value=cf.WPethr1.value+'.'+cf.WPethr2.value+'.'+cf.WPethr3.value+'.'+cf.WPethr4.value;
        cf.ether_subnet.value=cf.WMask1.value+'.'+cf.WMask2.value+'.'+cf.WMask3.value+'.'+cf.WMask4.value;
        cf.ether_gateway.value=cf.WGateway1.value+'.'+cf.WGateway2.value+'.'+cf.WGateway3.value+'.'+cf.WGateway4.value;
	}
	else
	{
        cf.ether_ipaddr.value=cf.IPoAethr1.value+'.'+cf.IPoAethr2.value+'.'+cf.IPoAethr3.value+'.'+cf.IPoAethr4.value;
        cf.ether_subnet.value=cf.IPoAMask1.value+'.'+cf.IPoAMask2.value+'.'+cf.IPoAMask3.value+'.'+cf.IPoAMask4.value;
        cf.ether_gateway.value=cf.IPoAGateway1.value+'.'+cf.IPoAGateway2.value+'.'+cf.IPoAGateway3.value+'.'+cf.IPoAGateway4.value;	
	}
        cf.ether_dnsaddr1.value=cf.DAddr1.value+'.'+cf.DAddr2.value+'.'+cf.DAddr3.value+'.'+cf.DAddr4.value;
        cf.ether_dnsaddr2.value=cf.PDAddr1.value+'.'+cf.PDAddr2.value+'.'+cf.PDAddr3.value+'.'+cf.PDAddr4.value;
	if(cf.ether_dnsaddr2.value=="...")
		cf.ether_dnsaddr2.value="";
	if(check_wizard_static(0,"welcome")==false)
			return false;	
	parent.welcome_wan_type=1;
	parent.static_ip=cf.ether_ipaddr.value;
	parent.static_subnet=cf.ether_subnet.value;
	parent.static_gateway=cf.ether_gateway.value;
	parent.static_dns1=cf.ether_dnsaddr1.value;
	parent.static_dns2=cf.ether_dnsaddr2.value;
	return true;
}
