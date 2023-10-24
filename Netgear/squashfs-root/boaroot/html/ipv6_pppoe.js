function change_ipv6_pppoe_password(obj)
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
                        obj.outerHTML = '<input type="text" name="ipv6_pppoe_passwd" maxlength="64" size="18" onFocus="this.select();" onKeyPress="return getkey(\'ssid\', event)" value="">';
                        document.forms[0].ipv6_pppoe_passwd.focus();
                        document.forms[0].ipv6_pppoe_passwd.focus();
                }
        }
}

function check_ipv6_pppoe(cf)
{
	ipv6_save_common(cf);

	if(cf.ipv6_pppoe_username.value == "")
	{
		alert(alert_login_name_cannot_be_blank_str);
		return false;
	}
        for(i=0;i<cf.ipv6_pppoe_username.value.length;i++)
        {
                if(isValidChar(cf.ipv6_pppoe_username.value.charCodeAt(i))==false)
                {
                        alert(alert_invalid_login_name_str);
                        return false;
                }
        }
		
	
	if(cf.ipv6_pppoe_passwd.value == "")
	{
		alert(alert_password_cannot_be_blank_str);
		return false;
	}
        for(i=0;i<cf.ipv6_pppoe_passwd.value.length;i++)
        {
                if(isValidChar(cf.ipv6_pppoe_passwd.value.charCodeAt(i))==false)
                {
                        alert(alert_invalid_password_str);
                        return false;
                }
        }

        for(i=0;i<cf.ipv6_pppoe_servername.value.length;i++)
        {
                if(isValidChar(cf.ipv6_pppoe_servername.value.charCodeAt(i))==false)
                {
                        alert(alert_invalid_service_name_str);
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
	parent.menu_ipv6_status = "PPPoE";
	
	document.getElementById("fix_button").style.display = "none";
	document.getElementById("main").style.display = "none";
	document.getElementById("waiting_bar").style.display = "";
	return true;
}
