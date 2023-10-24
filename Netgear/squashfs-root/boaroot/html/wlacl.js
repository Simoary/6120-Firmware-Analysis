function check_wlacl_add(cf,flag)
{
    var mac_num=0;
    array_num = wlan_mac_table_Data.length;
	if(cf.device.value=="")
	{
		alert(device_not_null_str);
		return false;
	}	
	for(i=0;i<cf.device.value.length;i++)
	{
		if(isValidChar(cf.device.value.charCodeAt(i))==false)
		{
			alert(invalid_device_str);
			return false;
		}
	}
	for(i=0;i<array_num;i++)
	{
		if (flag == 'add')
		{		
			if(wlan_devname_table_Data[i]==cf.device.value)
			{
				alert(device_name_dup_str);
				return false;
			}
		}
	}
	if(cf.adr.value.length==12 && cf.adr.value.indexOf(":")==-1)
	{
		var mac=cf.adr.value; 
		cf.adr.value=mac.substr(0,2)+":"+mac.substr(2,2)+":"+mac.substr(4,2)+":"+mac.substr(6,2)+":"+mac.substr(8,2)+":"+mac.substr(10,2);

	}
	else if ( cf.adr.value.split("-").length == 6 )
	{
		var tmp_mac = cf.adr.value.replace(/-/g,":");
		cf.adr.value=tmp_mac;
	}	

	if(maccheck(cf.adr.value) == false)
		return false;
	for(i=0;i<array_num;i++)
	{
		if (flag == 'add')
		{
			if(wlan_mac_table_Data[i] == cf.adr.value)
			{
				alert(mac_dup_str);
				return false;
			}
		}
	}
	for(i=0;i<array_num;i++)
	{
	    if(wlan_mac_table_Data[i] != "N/A" && wlan_mac_table_Data[i] != "00:00:00:00:00:00")
		{
		    mac_num++;
		}
	}
	cf.wlacl_num.value=mac_num;
	document.getElementById("title").style.display="none";
	document.getElementById("main").style.display="none";
	document.getElementById("waiting_bar").style.display="";
	return true;
}

function check_wlacl_edit(cf,flag)
{
    array_num = wlan_mac_table_Data.length;
	if(cf.device.value=="")
	{
		alert(device_not_null_str);
		return false;
	}
	for(i=0;i<cf.device.value.length;i++)
	{
		if(isValidChar(cf.device.value.charCodeAt(i))==false)
		{
			alert(invalid_device_str);
			return false;
		}
	}

	if(cf.adr.value.length==12 && cf.adr.value.indexOf(":")==-1)
	{
		var mac=cf.adr.value; 
		cf.adr.value=mac.substr(0,2)+":"+mac.substr(2,2)+":"+mac.substr(4,2)+":"+mac.substr(6,2)+":"+mac.substr(8,2)+":"+mac.substr(10,2);

	}
	else if ( cf.adr.value.split("-").length == 6 )
	{
		var tmp_mac = cf.adr.value.replace(/-/g,":");
		cf.adr.value=tmp_mac;
	}	
	if(maccheck(cf.adr.value) == false)
		return false;
	cf.wlacl_num.value=cf.select_edit_num.value-1;
	return true;
}

function check_wlacl_editnum(cf)
{
	if (mac_list_num == 0)
	{
		alert(select_item_edit_str);
		return false;
	}
	var count_select=0;
	var select_num;
	if( mac_list_num == 1)
	{
		if(cf.MacSelect.checked == true)
		{
			count_select++;
			select_num=1;
		}
	}
	else
    {	
	   for(i=0;i<mac_list_num;i++)
	   {
	      if(cf.MacSelect[i].checked == true)
	      {
		      count_select++;
		      select_num=i+1;
	      }
	   }
	}
	if(count_select==0)
	{
		alert(select_item_edit_str);
		return false;
	}
	else
	{
		cf.select_edit.value=select_num;
		cf.submit_flag.value="wlacl_editnum";
		//cf.action="/apply.cgi?/WLG_acl_edit.asp timestamp="+ts;
		//return true;

		location.href="WLG_acl_edit.asp?" + select_num + "";
		return false;
	}
}

function check_wlacl_del(cf)
{
	if (mac_list_num == 0)
	{
		alert(select_item_del_str);
		return false;
	}
	var count_select=0;
	var select_num;
	if (mac_list_num == 1)
	{
		if(cf.MacSelect.checked == true)
		{
			count_select++;
			select_num=1;
		}
	}
	else
	{
	   for(i=0;i<mac_list_num;i++)
	   {
		  if(cf.MacSelect[i].checked == true)
		  {
			  count_select++;
			  select_num=i+1;
		  }
	    }
	}
	if(count_select==0)
	{
		alert(select_item_del_str);
		return false;
	}
	else
	{
		cf.select_del.value=select_num-1;
		cf.submit_flag.value="wlacl_del";
		cf.devname_del.value=" ";
		cf.mac_del.value="00:00:00:00:00:00";
		cf.guest_ssid_filter_del.value="1";
		document.getElementById("title").style.display="none";
	    document.getElementById("main").style.display="none";
	    document.getElementById("check_button").style.display="none";
	    document.getElementById("waiting_bar").style.display="";
		return true;
	}
}

function check_wlacl_apply(cf)
{
	if( cf.accessLimit.checked == true )
	{
		cf.wl_access_ctrl_on.value=1;
		cf.wlacl_policy.value=1;
	}
	else
	{
		cf.wl_access_ctrl_on.value=0;
		cf.wlacl_policy.value=0;
	}
	
	document.getElementById("title").style.display="none";
	document.getElementById("main").style.display="none";
	document.getElementById("check_button").style.display="none";
	document.getElementById("waiting_bar").style.display="";
	
	return true;
}

function mac_data_select(num)
{
	var cf = document.forms[0];
	if(attach_name_array[num] == "&lt;Unknown&gt;")
		cf.device.value = "";
	else
		cf.device.value = attach_name_array[num].replace(/&lt;/g,"<").replace(/&gt;/g,">");
	cf.adr.value=attach_mac_array[num].toUpperCase();
}
