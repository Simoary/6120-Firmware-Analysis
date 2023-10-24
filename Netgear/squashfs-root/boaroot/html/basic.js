function change_height()
{	
	setFooterClass();
	var footer_div = document.getElementById("footer");
	var is_double = ( footer_div.className == "footer_double") ;

	if(isIE_or_Opera())
	{
		//var height = document.documentElement.clientHeight - document.body.scrollHeight;
		var height = document.body.clientHeight - 97;
		//alert(height);
		if( (height > 460 && !is_double) || (height > 503 && is_double) )
		{
			document.getElementById("container").style.height = height;
			document.getElementById("middle").style.height = height-5;
			document.getElementById("menu").style.height = is_double ? height-93 : height-50;
			document.getElementById("formframe_div").style.height = is_double ? height-93 : height-50;
		}
		else
		{
			document.getElementById("container").style.height = is_double ? "503px" : "460px";
			document.getElementById("middle").style.height = is_double ? "498px" : "455px";
			document.getElementById("menu").style.height = "410px";
			document.getElementById("formframe_div").style.height = "410px";
		}
		/* calculate the width */
		var width = document.body.clientWidth - 60;
		document.getElementById("top").style.width = width > 820 ? width : "820px" ;
		document.getElementById("container").style.width = width > 820 ? width : "820px" ;
		document.getElementById("formframe_div").style.width = width > 820 ? width - 195 : "625px";
	}
	document.getElementById("middle").style.minHeight = is_double ? "498px" : "455px";
	//document.getElementById("menu").style.bottom = is_double ? "88px" : "45px";
	if(isSafari())
	   document.getElementById("formframe_div").style.bottom = is_double ? "68px" : "55px";
	else
	   document.getElementById("formframe_div").style.bottom = is_double ? "88px" : "45px";
}

function basic_menu_class_default()
{
	var menu_div = top.document.getElementById("menu");
	var menu_btns = menu_div.getElementsByTagName("div");
	var max_len = 20; 

	if(top.gui_region == "French" || top.gui_region == "Italian")////special handling for FR and IT
		max_len = 21;

	var i;
	for(i=0; i<menu_btns.length; i++)
	{
		var words_len = menu_btns[i].getElementsByTagName("span")[0].innerHTML.length;

		if(words_len > max_len)
			menu_btns[i].className = "basic_button_big";
		else
			menu_btns[i].className = "basic_button";
	}

	if(top.enabled_wds==1 || top.enable_ap_flag== 1)
	{
		var internet_div = top.document.getElementById("basic_internet");
		internet_div.className = internet_div.className + "_grey";
	}

	if(top.enabled_wds == 1)
	{
		var wds_div = top.document.getElementById("basic_guest");
		wds_div.className = wds_div.className + "_grey";
	}
}

function basic_menu_color_change( change_id )
{
	basic_menu_class_default();

	var clicked_item = top.document.getElementById(change_id);
	clicked_item.className = clicked_item.className + "_purple";
}

function click_action(id)
{
        if( enable_action )
        {
                if( id == "basic_home")
                {
                        basic_menu_color_change('basic_home');
                        goto_formframe('/cgi-bin/basic_home_wait.asp');
                }
				else if(id=="basic_dsl")
				{
					basic_menu_color_change('basic_dsl');
					goto_formframe('/cgi-bin/wan_type_setting_preset.asp');
				}
                else if( id == "basic_internet" && top.enabled_wds == 0 && top.enable_ap_flag != 1 )
                {
                    	basic_menu_color_change('basic_internet');
						if(top.menu_internet=="pppoe")
							goto_formframe('/cgi-bin/BAS_pppoe_preset.asp');
						if(top.menu_internet=="pppoa")
							goto_formframe('/cgi-bin/BAS_pppoa_preset.asp');	
						else if(top.menu_internet=="pptp")
							goto_formframe('/cgi-bin/BAS_pptp.asp');
						else if(top.menu_internet=="l2tp")
							goto_formframe('/cgi-bin/BAS_l2tp.asp');
						else if(top.menu_internet=="ipoe")
							goto_formframe('/cgi-bin/BAS_ether_preset.asp');
						else if(top.menu_internet=="ipoa")
							goto_formframe('/cgi-bin/BAS_ether_preset.asp');	
                }
                else if( id == "basic_wireless" )
                {
                        basic_menu_color_change('basic_wireless');
			if( endis_wl_radio == '1' || endis_wla_radio == '1' )
				goto_formframe('/cgi-bin/WLG_wireless.asp');
			else
				goto_formframe('/cgi-bin/WLG_adv.asp');
                }
                else if( id == "basic_attached" )
                {
                        basic_menu_color_change('basic_attached');
                        goto_formframe('/cgi-bin/DEV_device.asp');
                }
                else if( id == "basic_parental" )
                {
                        basic_menu_color_change('basic_parental');
			if(parental_ctrl_flag != 0 && ParentalControl == "1")				          
				open_window('http://netgear.opendns.com');
			else			             	
				open_window('http://www.netgear.com/lpc');
                }
                else if( id == "basic_ready" )
                {
                        basic_menu_color_change('basic_ready');
                        goto_formframe('/cgi-bin/USB_basic.asp');
                }
                else if( id == "basic_guest" && top.enabled_wds == 0 )
                {
                        basic_menu_color_change('basic_guest');
                        goto_formframe('/cgi-bin/WLG_wireless_guest1.asp');
                }
		else if( id == "basic_no_internet" )
		{
			basic_menu_color_change('basic_internet');
		//	if(portstatus == 0)
				location.href = "BRS_03A_A_noWan.asp"
		//	else
		//		document.forms[0].submit();
		}

        }
}

function setIconClass(id, words)
{
	var words_div = document.getElementById(id);
	var words_len = words.length;
	if( words_len >= 35 )
		words_div.className = "icon_status_smallFonts";
	else if(words_len >= 25)
		words_div.className = "icon_status_double";
	else if( gui_region == "Russian" && words_len >= 20)
		words_div.className = "icon_status_double";
}

function setIconClass_noDouble(id, words)
{
        var words_div = document.getElementById(id);
        var words_len = words.length;
        if(words_len >= 25)
                words_div.className = "icon_status_smallFonts";
        else if( gui_region == "Russian" && words_len >= 20)
                words_div.className = "icon_status_smallFonts";

}

