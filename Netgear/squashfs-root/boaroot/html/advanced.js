function close_all_sub(click_name)/* fold all menus, except the menu which user click */
{
	var sub_list = "setup,usb,security,admin,advance";
	var sub_array = sub_list.split(',');
	for ( i=0; i< sub_array.length; i++)
	{
		var button_name = sub_array[i];
		var sub_name = sub_array[i]+"_sub";
		if( sub_name != click_name )
		{
			var div_name = top.document.getElementById(button_name);
			var content_length = div_name.getElementsByTagName("span")[0].innerHTML.length;
			settingClass(div_name, content_length, "advanced_white_close_button", top.region_class.white_triple, top.region_class.white_double);

			top.document.getElementById(sub_name).style.display="none";
		}
	}
}

function open_or_close_sub(name)
{
	/* to fix bug 23268, when user want to unfold one menus, fold the other menus. */
	var button_name= name;
	var sub_name= name+"_sub";
	var open_flag= top.document.getElementById(sub_name).style.display;
	
	close_all_sub(sub_name);/* fold all menus first, except the menu which user click*/

	var button_div = top.document.getElementById(button_name);
	var content_length = button_div.getElementsByTagName("span")[0].innerHTML.length;
	if( open_flag == "none")
	{
		settingClass(button_div, content_length, "advanced_white_open_button", top.region_class.white_triple, top.region_class.white_double);
		top.document.getElementById(sub_name).style.display="";
	}
	else
	{
		settingClass(button_div, content_length, "advanced_white_close_button", top.region_class.white_triple, top.region_class.white_double);
		top.document.getElementById(sub_name).style.display="none";
	}
	change_menu_height();
}

/* change the min-height of the fromframe if unfold "Advanced Setup" */
function change_menu_height()
{
	var footer_div = document.getElementById("footer");
	var is_double = (footer_div.className == "footer_double");
	var menu_height = document.getElementById("menu").clientHeight > 410 ? document.getElementById("menu").clientHeight : 410;
	if(isIE_or_Opera())
	{
		var height = is_double ? document.body.clientHeight - 190 : document.body.clientHeight - 147;
		menu_height = height > menu_height ? height : menu_height;
		document.getElementById("container").style.height = is_double ? menu_height+93 : menu_height+ 50;
		document.getElementById("middle").style.height = is_double ?  menu_height+87 : menu_height+ 45;
		document.getElementById("formframe_div").style.height = menu_height;
	}
	else
		document.getElementById("middle").style.minHeight = is_double ? (menu_height + 87)+"px" : (menu_height+ 45)+"px";
}

function change_height()
{
	setFooterClass();
	var footer_div = document.getElementById("footer");
	var is_double = (footer_div.className == "footer_double");
/*
	//if(isIE_or_Opera())
	{
		var height = document.documentElement.clientHeight - document.body.scrollHeight;
		if( (height > 460 && !is_double) || (height > 578 && is_double) )
		{
			document.getElementById("container").style.height=height;
			document.getElementById("middle").style.height=height-5;
			//document.getElementById("menu").style.height=is_double?height-93:height-50;
			document.getElementById("formframe_div").style.height=is_double?height-93:height-50;
		}
		else
		{
			document.getElementById("container").style.height= is_double ? "578px" : "460px";
			document.getElementById("middle").style.height=is_double ? "573px" : "455px";
			//document.getElementById("menu").style.height=is_double ? "485px" : "410px";
			document.getElementById("formframe_div").style.height=is_double ? "485px" : "410px";
		}
	}
	document.getElementById("middle").style.minHeight=is_double ? "573px" : "455px";
	//document.getElementById("menu").style.bottom = is_double ? "88px" : "45px";
	document.getElementById("formframe_div").style.bottom = is_double ? "88px" : "45px";
	*/
	if(isIE_or_Opera())
	{
		/* to calculate the width */
		var width = document.body.clientWidth - 40;
		document.getElementById("top").style.width = width > 820 ? width : "820px" ;
		document.getElementById("container").style.width = width > 820 ? width : "820px" ;
		document.getElementById("formframe_div").style.width = width > 820 ? width - 195 : "625px";
	}
	document.getElementById("formframe_div").style.bottom = is_double ? "88px" : "45px";

	change_menu_height();
}

/* according to the content length in a div,  change the div class type 
   parameter: div name, div content length, class name to set, minimum length for triple class, .. 
*/
function settingClass(obj, len, class_name)
{
	var triple_len, double_len;
	switch(arguments.length)
	{
		case 4://four parameter, take the last on as double_len 
			triple_len = 9999;
			double_len = arguments[3];
			break;
		case 5:
			triple_len = arguments[3];
			double_len = arguments[4];
			
			break;
		default:
			triple_len = top.region_class.adv_btn_triple;
			double_len = top.region_class.adv_btn_double;
			break;
	}
	
	if(obj.getElementsByTagName("span")[0].innerHTML.indexOf(" ") != obj.getElementsByTagName("span")[0].innerHTML.lastIndexOf(" "))
		len=len+1;

	if(len >= triple_len)
		obj.className = class_name + "_triple";
	else if(len >= double_len)
		obj.className = class_name + "_double";
	else
		obj.className = class_name;
}

function subItemsClass(argv)
{
	var sub_menu;
	var items;
	var words_length;
	var i, num;

	for(num=0; num<arguments.length; num++)
	{
		sub_menu = top.document.getElementById(arguments[num]);
		items = sub_menu.getElementsByTagName("dt");

		for(i=0; i<items.length; i++)
		{
			words_length = items[i].getElementsByTagName("span")[0].innerHTML.length;
			if(words_length >= 20)
				items[i].className = "long_name";
			else
				items[i].className = "sub_back";
		}
	}
}

var array_name = ["wds_items", "ap_items"];
var enable_flags = ["enabled_wds", "enable_ap_flag"];
var wds_items = ["internet_setup", "dsl_setup", "guest_network_setup", "wan_setup", "qos_setup", "security_block_site", "security_block_service", "security_schedule","security_email", "admin_logs", "advanced_pf_pt", "advanced_ddns", "advanced_static", "advanced_remote", "advanced_upnp", "advanced_traffic"];
var ap_items = ["lan_setup", "wan_setup", "internet_setup", "security_block_site", "security_block_service", "security_schedule", "advanced_wds", "advanced_pf_pt", "advanced_ddns", "advanced_static", "advanced_remote"];

function enabledItemsClass()
{
	var i, j;
	var double_length = 25;
	
	for(i=0; i<array_name.length; i++)
	{
		var item_group, enable_flag;

		item_group = eval(array_name[i]);
		enable_flag = eval("top." + enable_flags[i]);
		for(j=0; j<item_group.length; j++)
		{
			var cur_div, content_length;

			cur_div = top.document.getElementById(item_group[j]);
			content_length = cur_div.getElementsByTagName("span")[0].innerHTML.length;
			if(enable_flag == 1)
			{
				if(content_length > double_length)
					cur_div.className = "long_grey";
				else
					cur_div.className = "sub_grey";
			}
			else
			{
				if(content_length > double_length)
					cur_div.className = "long_name";
				else
					cur_div.className = "sub_back";
			}
		}
	}
}

function menu_class_default()
{
	var menu_div;
	var content_length;

	menu_div = top.document.getElementById("home");
	content_length = menu_div.getElementsByTagName("span")[0].innerHTML.length;
	settingClass(menu_div, content_length, "advanced_black_button");

	menu_div = top.document.getElementById("setup_wizard");
	content_length = menu_div.getElementsByTagName("span")[0].innerHTML.length;
	if( top.enabled_wds == 1 || top.enable_ap_flag == 1 )
		settingClass(menu_div, content_length, "advanced_grey_button");
	else
		settingClass(menu_div, content_length, "advanced_black_button");

	menu_div = top.document.getElementById("wps");
	content_length = menu_div.getElementsByTagName("span")[0].innerHTML.length;
	if( top.enabled_wps == 1 && top.enabled_wds == 0 )
		settingClass(menu_div, content_length, "advanced_black_button");
	else
		settingClass(menu_div, content_length, "advanced_grey_button");
	
        var extensible_items = ["setup", "usb", "security", "admin", "advance"];
	var i;
	for(i=0; i<extensible_items.length; i++)
	{
		menu_div = top.document.getElementById(extensible_items[i]);
		content_length = menu_div.getElementsByTagName("span")[0].innerHTML.length;
		//if(menu_div.getElementsByTagName("span")[0].innerHTML.indexOf(" ") != menu_div.getElementsByTagName("span")[0].innerHTML.lastIndexOf(" "))
			//settingClass(menu_div, content_length+1, "advanced_white_close_button", top.region_class.white_triple, top.region_class.white_double);
		//else
			settingClass(menu_div, content_length, "advanced_white_close_button", top.region_class.white_triple, top.region_class.white_double);
	}

	subItemsClass("setup_sub", "usb_sub", "security_sub", "admin_sub", "advance_sub");

	enabledItemsClass();
}

function menu_color_change( change_id )
{
	   menu_class_default();

	var current_div = top.document.getElementById(change_id);
	var content_length = current_div.getElementsByTagName("span")[0].innerHTML.length;
	
	if( change_id == "home" ||  change_id == "setup_wizard" || change_id == "wps" )
	{
		settingClass(current_div, content_length, "advanced_purple_button");
	}
	else
	{
		//the parent button class should be kept
		var parent_id = top.document.getElementById(change_id).parentNode.parentNode.id;
		var btn_id = parent_id.replace('_sub', '');
		var btn_div = top.document.getElementById(btn_id);
		var words_len = btn_div.getElementsByTagName("span")[0].innerHTML.length;
		settingClass(btn_div, words_len, "advanced_white_open_button", top.region_class.white_triple, top.region_class.white_double);

		content_length = current_div.getElementsByTagName("span")[0].innerHTML.length;
		

		if(change_id == "advanced_wds")
		   settingClass(current_div, content_length, "sub_back_purple");
		//else if(change_id == "advanced_pf_pt")
		   //settingClass(current_div, content_length, "sub_back_purple_double");
		else
		   settingClass(current_div, content_length, "sub_back_purple", top.region_class.sub_triple, top.region_class.sub_double);

	}
}

function protocol_checkstate(){
    if ((xmlRequest.readyState == 4) && (xmlRequest.status == 200)) 
	{
        response_info = xmlRequest.responseText;
	    response_info = eval(response_info);

	if(typeof(response_info[0].protocol) == 'undefined' || typeof(response_info[0].protocol) == null || response_info[0].IfName == 'none')
	{
        goto_formframe('BAS_ether.asp');
	}
	else if(response_info[0].protocol == 'pppoe' || response_info[0].protocol == 'pppoa')
	{
	    goto_formframe('BAS_pppoe.asp');
	}
	else
	{
		goto_formframe('BAS_ether.asp');
	}
    }

}

function protocol_sendrequest(){
    if(!xmlRequest)
    {
        alert("Sorry, your browser is not support XMLrequest!");
        return;
    }
    if(xmlRequest.overrideMimeType)
        xmlRequest.overrideMimeType('text/xml');
    xmlRequest.open('GET', 'aye.cli?cli=wan show web AllL3InfoEdit$', true);
    xmlRequest.onreadystatechange = protocol_checkstate;
    xmlRequest.send(null);
}

function click_adv_action(id)
{
        if( enable_action == 1 )
        {
                if( id == "home" )
                {
                        menu_color_change('home');
                        goto_formframe('RST_status.asp');
                }
                else if( id == "setup_wizard" && top.enabled_wds == 0 && top.enable_ap_flag != 1 )
                {
                        menu_color_change('setup_wizard');
                        goto_formframe('BRS_01_checkNet_ping.asp');
                }
                else if( id == "wps" && top.enabled_wps == 1 && top.enabled_wds == 0)
                {
                        menu_color_change('wps');
                        goto_formframe('Add_WPS_Client.asp');

                }
	    else if( id == "dsl_setup" && top.enabled_wds == 0 && top.enable_ap_flag != 1 )
	    {
		goto_formframe("wan_type_setting.asp");
		menu_color_change('dsl_setup');
	    }
	    else if( id == "internet_setup" && top.enabled_wds == 0 && top.enable_ap_flag != 1 )
            {
                        menu_color_change('internet_setup');
						if(menu_internet=="pppoe")
							goto_formframe('/cgi-bin/BAS_pppoe_preset.asp');
						if(menu_internet=="pppoa")
							goto_formframe('/cgi-bin/BAS_pppoa_preset.asp');	
						else if(menu_internet=="pptp")
							goto_formframe('/cgi-bin/BAS_pptp.asp');
						else if(menu_internet=="l2tp")
							goto_formframe('/cgi-bin/BAS_l2tp.asp');
						else if(menu_internet=="ipoe")
							goto_formframe('/cgi-bin/BAS_ether_preset.asp');
						else if(menu_internet=="ipoa")
							goto_formframe('/cgi-bin/BAS_ether_preset.asp');
                }
                else if( id == "wireless_setup" || id == "basic_wireless")
                {
                        goto_formframe("WLG_wireless.asp");
                        menu_color_change('wireless_setup');
                }
                else if( id == "guest_network_setup" && top.enabled_wds == 0 )
                {
                        goto_formframe("WLG_wireless_guest1.asp");
                        menu_color_change('guest_network_setup');
                }
                /*else if( id == "guest_a" && top.enabled_wds == 0 )
                {
                        goto_formframe("WLG_wireless_guestA1.asp");
                        menu_color_change('guest_a');
                }*/
                else if( id == "wan_setup" && top.enabled_wds == 0 && top.enable_ap_flag != 1 )
                {
                        goto_formframe("WAN_wan.asp");
                        menu_color_change('wan_setup');
                }
                else if( id == "lan_setup" && top.enable_ap_flag != 1 )
                {
                        goto_formframe("LAN_lan.asp");
                        menu_color_change('lan_setup');
                }
                else if( id == "qos_setup" && top.enabled_wds == 0 )
                {
                        goto_formframe("QOS_main.asp");
                        menu_color_change('qos_setup');
                }
                else if( id == "usb_basic" )
                {
                        goto_formframe("USB_basic.asp");
                        menu_color_change('usb_basic');
                }
                else if( id == "usb_advanced" )
                {
                        goto_formframe("USB_advanced.asp");
                        menu_color_change('usb_advanced');
                }
                else if( id == "usb_media" )
                {
                        goto_formframe("UPNP_media.asp");
                        menu_color_change('usb_media');
                }
                else if( id == "security_parental" )
                {
                       // open_window('http://www.netgear.com/lpc');
			if(parental_ctrl_flag != 0 && ParentalControl == "1")				          
				open_window('http://netgear.opendns.com');
			else			             	
				open_window('http://www.netgear.com/lpc');
                }
                else if( id == "security_block_site" && top.enabled_wds == 0 && top.enable_ap_flag != 1 )
                {
                        goto_formframe("BKS_keyword.asp");
                        menu_color_change('security_block_site');
                }
                else if( id == "security_block_service" && top.enabled_wds == 0 && top.enable_ap_flag != 1 )
                {
                        goto_formframe("BKS_service.asp");
                        menu_color_change('security_block_service');
                }
                else if( id == "security_schedule" && top.enabled_wds == 0 && top.enable_ap_flag != 1 )
                {
                        goto_formframe("FW_schedule.asp");
                        menu_color_change('security_schedule');
                }
                else if( id == "security_email" && top.enabled_wds == 0 )
                {
                        goto_formframe("FW_email.asp");
                        menu_color_change('security_email');
                }
                else if( id == "admin_status" )
                {
                        goto_formframe("RST_status.asp");
                        menu_color_change('admin_status');
                }
                else if( id == "admin_logs" && top.enabled_wds == 0 )
                {
                        goto_formframe("FW_log.asp");
                        menu_color_change('admin_logs');
                }
                else if( id == "admin_attached" )
                {
                        goto_formframe("DEV_device.asp");
                        menu_color_change('admin_attached');
                }
                else if( id == "admin_bakup" )
                {
                        goto_formframe("BAK_backup.asp");
                        menu_color_change('admin_bakup');
                }
                else if( id == "admin_setpassword" )
                {
                        goto_formframe("PWD_password.asp");
                        menu_color_change('admin_setpassword');
                }
                else if( id == "admin_upgrade" )
                {
                        goto_formframe("tools_update.asp");
                        menu_color_change('admin_upgrade');
                }
                else if( id == "advanced_plc" )
                {
                        goto_formframe("PLC_wait_scan.asp");
                        menu_color_change('advanced_plc');
                }
                else if( id == "advanced_wireless" )
                {
                        goto_formframe("WLG_adv.asp");
                        menu_color_change('advanced_wireless');
                }
                else if( id == "advanced_wds" && top.enable_ap_flag != 1 )
                {
                        goto_formframe("WLG_wds.asp");
                        menu_color_change('advanced_wds');
                }
                else if( id == "advanced_pf_pt" && top.enabled_wds == 0 && top.enable_ap_flag != 1 )
                {
						if(TriggerorForward=="trigger")
							goto_formframe("triggering.asp");
						else
							goto_formframe("forwarding.asp");
                        menu_color_change('advanced_pf_pt');
                }
                else if( id == "advanced_ddns" && top.enabled_wds == 0 && top.enable_ap_flag != 1 )
                {
                        goto_formframe("DNS_ddns.asp");
                        menu_color_change('advanced_ddns');
                }
		else if( id == "advanced_static" && top.enabled_wds == 0 && top.enable_ap_flag != 1 )
		{
                        goto_formframe("STR_routes.asp");
                        menu_color_change('advanced_static');
		}
		else if( id == "advanced_remote" && top.enabled_wds == 0 && top.enable_ap_flag != 1 )
		{
                        goto_formframe("FW_remote.asp");
                        menu_color_change('advanced_remote');
		}
		else if( id == "advanced_usb" )
		{
                        goto_formframe("USB_settings.asp");
                        menu_color_change('advanced_usb');
		}
		else if( id == "advanced_upnp" && top.enabled_wds == 0 )
		{
                        goto_formframe("UPNP_upnp.asp");
                        menu_color_change('advanced_upnp');
		}
		else if( id == "advanced_ipv6" )
		{
			if(menu_ipv6_status=="PPPoE")
				goto_formframe('IPv6_pppoe.asp');
			else if(menu_ipv6_status=="Static")
				goto_formframe('IPv6_fixed.asp');
			else if(menu_ipv6_status=="Passthrough")
				goto_formframe('IPv6_passThrougth.asp');	
			else if(menu_ipv6_status=="Autoconfig")
				goto_formframe('IPv6_autoConfig.asp');
			else if(menu_ipv6_status=="DHCP")
				goto_formframe('IPv6_dhcp.asp');
			else if(menu_ipv6_status=="AUTO")
				goto_formframe('IPv6_auto.asp');
			else if(menu_ipv6_status=="TUNNEL")
				goto_formframe('IPv6_tunnel.asp');
			else
				goto_formframe("IPv6_disabled.asp");
				
            menu_color_change('advanced_ipv6');
		}
		else if( id == "advanced_tr069" )
		{
                        goto_formframe("tr069.asp");
                        menu_color_change('advanced_tr069');
		}
		else if( id == "advanced_traffic" && top.enabled_wds == 0 )
		{
                        goto_formframe("traffic.asp");
                        menu_color_change('advanced_traffic');
		}
        }
}
