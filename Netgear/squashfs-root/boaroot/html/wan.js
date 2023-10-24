function checkwan()
{
	var wan_changed=false;
	var cf = document.forms[0];
	//cf.hid_iptv_show_tag.value=have_bridge_iptv;
	cf.wan_mtu.value = parseInt(cf.wan_mtu.value, 10);
	
	if(wan_type=="2"){ //PPPoE, 616~1492
		if(!((cf.wan_mtu.value<=1492)&&(cf.wan_mtu.value>=616)))
		{
			alert(invalid_mtu_str+"1492");
			return false;
		}
		
		cf.wan_TCPMSS.value = cf.wan_mtu.value - 40;
	}
	else{ //DHCP,Static
		if(!((cf.wan_mtu.value<=1500)&&(cf.wan_mtu.value>=616)))
		{
			alert(invalid_mtu_str+"1500");
			return false;
		}
	}
	
	if(old_mtu!=cf.wan_mtu.value)
		wan_changed = true;
	
	if (cf.bri_lan1.checked == true)
		cf.hid_bri_lan1.value = 1;
	else
		cf.hid_bri_lan1.value = 0;	
	if (cf.bri_lan2.checked == true)
		cf.hid_bri_lan2.value = 1;
	else
		cf.hid_bri_lan2.value = 0;
	if (cf.bri_lan3.checked == true)
		cf.hid_bri_lan3.value = 1;
	else
		cf.hid_bri_lan3.value = 0;	
	if (cf.bri_lan4.checked == true)
		cf.hid_bri_lan4.value = 1;
	else
		cf.hid_bri_lan4.value = 0;

	cf.hid_iptv_mask.value=parseInt(cf.hid_bri_lan1.value)+parseInt(cf.hid_bri_lan2.value*2)+parseInt(cf.hid_bri_lan3.value*4)+parseInt(cf.hid_bri_lan4.value*8);
 	
	if (cf.brig_ssid1.checked == true)
		cf.hid_brig_ssid1.value = 1;
	else
		cf.hid_brig_ssid1.value = 0;
	if (cf.brig_ssid2.checked == true)
		cf.hid_brig_ssid2.value = 1;
	else
		cf.hid_brig_ssid2.value = 0;
	if (cf.brig_guest_ssid1.checked == true)
		cf.hid_brig_guest_ssid1.value = 1;
	else
		cf.hid_brig_guest_ssid1.value = 0;
	if (cf.brig_guest_ssid2.checked == true)
		cf.hid_brig_guest_ssid2.value = 1;
	else
		cf.hid_brig_guest_ssid2.value = 0;
		
	if (cf.disable_spi.checked == false)
		cf.spi_value.value = 1;
	else
		cf.spi_value.value = 0;
		
	cf.dmz_ip.value = cf.dmzip1.value + '.' + cf.dmzip2.value + '.' + cf.dmzip3.value + '.' + cf.dmzip4.value; //store the value of dmzip at any time
	if (cf.dmz_enable.checked == true)
	{
		//cf.dmz_value.value = 1;
		cf.DefaultDmz_Active.value="Yes";
		//cf.dmz_ip.value = cf.dmzip1.value + '.' + cf.dmzip2.value + '.' + cf.dmzip3.value + '.' + cf.dmzip4.value; 
		if(checkipaddr(cf.dmz_ip.value)==false || is_sub_or_broad(cf.dmz_ip.value, lan_ip, lan_mask) == false)
		{
			alert(invalid_ip_address_str);
			return false;
		}
		cf.dmz_ip.value = address_parseInt(cf.dmz_ip.value);
		if(isSameIp(lan_ip,cf.dmz_ip.value) == true)
		{
			alert(the_dmz_ip_str);
			return false;
		}
		if(isSameSubNet(cf.dmz_ip.value,lan_mask,lan_ip,lan_mask) == false)
                {
                        alert(this_ip_address_str);
                        return false;
                }
	}
	else
	{
		//cf.dmz_value.value = 0;
		cf.DefaultDmz_Active.value="No";
	}	
	if (cf.rspToPing.checked == true)
		cf.rspToPing_value.value = "Yes";
	else
		cf.rspToPing_value.value = "No";

	if (cf.NatInboundFiltering[0].checked == true)
		cf.firewall_value.value = "1";
	else
		cf.firewall_value.value = "0";
		
	if (cf.disable_sipalg.checked == true)
    {
		cf.sipalg_value.value = "off";
        cf.sipproxy_value.value = "No";
    }
	else
    {
		cf.sipalg_value.value = "on";
        cf.sipproxy_value.value = "Yes";
    }
		
	if (cf.enable_ipsec_passthrough[0].checked == true)
		cf.ipsecalg_value.value = "on";
	else
		cf.ipsecalg_value.value = "off";
		
	if (cf.enable_pptp_passthrough[0].checked == true)
		cf.pptpalg_value.value = "on";
	else
		cf.pptpalg_value.value = "off";
		
	if (cf.enable_l2tp_passthrough[0].checked == true)
		cf.l2tpalg_value.value = "on";
	else
		cf.l2tpalg_value.value = "off";
       
    if (cf.disable_igmp.checked == true)
        cf.IGMPEnable.value = "No";
    else
        cf.IGMPEnable.value = "Yes";
	
	if((old_igmp=="N/A" && cf.disable_igmp.checked == false) || (old_igmp=="Yes" && cf.disable_igmp.checked == true) || (old_igmp=="No" && cf.disable_igmp.checked == false))
	//if(old_igmp=="Yes" && cf.disable_igmp.checked == true || old_igmp=="No" && cf.disable_igmp.checked == false)
		wan_changed = true;
		
	if(wan_changed)	
		cf.WANCHANGED.value="1";
		
	cf.submit_flag.value="1";
	
	document.getElementById("title").style.display="none";
	document.getElementById("main").style.display="none";
	document.getElementById("check_button").style.display="none";
	document.getElementById("waiting_bar").style.display="";
		
	return true;
}

function checkdmzip()
{
	var cf = document.forms[0];
	if(!cf.dmz_enable.checked)
	{
		cf.dmzip1.disabled = true;
		cf.dmzip2.disabled = true;
		cf.dmzip3.disabled = true;
		cf.dmzip4.disabled = true;
	}
	else
	{
		cf.dmzip1.disabled = false;
		cf.dmzip2.disabled = false;
		cf.dmzip3.disabled = false;
		cf.dmzip4.disabled = false;
	}
}

