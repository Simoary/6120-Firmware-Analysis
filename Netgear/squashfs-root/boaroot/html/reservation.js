//var inval_del_alert = parent.invalid_reservation_del
function check_reservation_add(cf,flag)
{
	var rsvipaddr = new Array();
	if( cf.sumEntry.value== 8 && flag=='add')
	{
		alert(invalid_resevation_add_str);
		return false;
	}
	
	cf.IpAddr.value = cf.rsv_ip1.value+'.'+cf.rsv_ip2.value+'.'+cf.rsv_ip3.value+'.'+cf.rsv_ip4.value;
	rsvipaddr = cf.rsv_ip1.value+'.'+cf.rsv_ip2.value+'.'+cf.rsv_ip3.value+'.'+cf.rsv_ip4.value;
	if(cf.dv_name.value == "")
	{
		alert(device_name_null_str);
		return false;
	}
	if(!parent.aye_regex_IPV4.exec(rsvipaddr))
	{
		alert(invalid_ip_str);
		return false;
	}
	
	if(cf.rsv_mac.value.length==12 && cf.rsv_mac.value.indexOf(":")==-1)
	{
		var mac=cf.rsv_mac.value; 
		cf.rsv_mac.value=mac.substr(0,2)+":"+mac.substr(2,2)+":"+mac.substr(4,2)+":"+mac.substr(6,2)+":"+mac.substr(8,2)+":"+mac.substr(10,2);
	}
	else if ( cf.rsv_mac.value.split("-").length == 6 )
	{
		var tmp_mac = cf.rsv_mac.value.replace(/-/g,":");
		cf.rsv_mac.value=tmp_mac;
	}	
	if(!parent.aye_regex_MAC.exec(cf.rsv_mac.value))
	{
		alert(alert_invalid_mac_str);
		return false;
	}
	var dhcp_startip = cf.sysPoolStartingAddr.value;
	var tmp_ipaddr = new Array();
	tmp_ipaddr = dhcp_startip.split('.');

	if(!((eval(tmp_ipaddr[3])<= eval(cf.rsv_ip4.value)) && (eval(cf.rsv_ip4.value) < (eval(tmp_ipaddr[3])+eval(cf.PoolSize.value)) )))
	{
		alert(invalid_rsv_ip_str);
		return false;
	}

	if(!((eval(tmp_ipaddr[2])== eval(cf.rsv_ip3.value)) && (eval(tmp_ipaddr[1])== eval(cf.rsv_ip2.value)) && (eval(tmp_ipaddr[0])== eval(cf.rsv_ip1.value)) ))
	{
		alert(invalid_rsv_ip_str);
		return false;
	}
	
	if(flag=='add')
	{
		for(i=0;i<=eval(cf.sumEntry.value);i++)
		{
			switch(i)
			{
				case 0:
					if(cf.reserv_IP_0.value == rsvipaddr || cf.reserv_MAC_0.value == cf.rsv_mac.value)
					{
						if(confirm(invalid_rsv_ip_duplicate_str))
							cf.emptyEntry.value = 0;
						else
							return false;
					}
					break;
				case 1:
					if(cf.reserv_IP_1.value == rsvipaddr || cf.reserv_MAC_1.value == cf.rsv_mac.value)
					{
						if(confirm(invalid_rsv_ip_duplicate_str))
							cf.emptyEntry.value = 1;
						else
							return false;
					}
					break;
				case 2:
					if(cf.reserv_IP_2.value == rsvipaddr || cf.reserv_MAC_2.value == cf.rsv_mac.value)
					{
						if(confirm(invalid_rsv_ip_duplicate_str))
							cf.emptyEntry.value = 2;
						else
							return false;
					}
					break;
				case 3:
					if(cf.reserv_IP_3.value == rsvipaddr || cf.reserv_MAC_3.value == cf.rsv_mac.value)
					{
						if(confirm(invalid_rsv_ip_duplicate_str))
							cf.emptyEntry.value = 3;
						else
							return false;
					}
					break;
				case 4:
					if(cf.reserv_IP_4.value == rsvipaddr || cf.reserv_MAC_4.value == cf.rsv_mac.value)
					{
						if(confirm(invalid_rsv_ip_duplicate_str))
							cf.emptyEntry.value = 4;
						else
							return false;
					}
					break;
				case 5:
					if(cf.reserv_IP_5.value == rsvipaddr || cf.reserv_MAC_5.value == cf.rsv_mac.value)
					{
						if(confirm(invalid_rsv_ip_duplicate_str))
							cf.emptyEntry.value = 5;
						else
							return false;
					}
					break;
				case 6:
					if(cf.reserv_IP_6.value == rsvipaddr || cf.reserv_MAC_6.value == cf.rsv_mac.value)
					{
						if(confirm(invalid_rsv_ip_duplicate_str))
							cf.emptyEntry.value = 6;
						else
							return false;
					}
					break;
				case 7:
					if(cf.reserv_IP_7.value == rsvipaddr || cf.reserv_MAC_7.value == cf.rsv_mac.value)
					{
						if(confirm(invalid_rsv_ip_duplicate_str))
							cf.emptyEntry.value = 7;
						else
							return false;
					}
					break;
				default:
					alert("Exception in reservation duplicate");
					return false;
			}
	
		}
	}
	

	cf.IpAddr.value = address_parseInt(rsvipaddr);
	if(flag == 'edit')
		cf.editflag.value = 1;
	
	if(flag == 'add')
	{
		cf.reservation_Flag.value = 1;
		cf.addflag.value = 1;
	}

	document.getElementById("title").style.display="none";
	document.getElementById("main").style.display="none";
	document.getElementById("check_button").style.display="none";
	document.getElementById("waiting_bar").style.display="";
	cf.submit();
	return true;
}
function check_reservation_del(cf)
{
	
	if(cf.sumEntry.value == 0)
	{
		return false;
	}
	var count_select=0;
	var select_num;
	if( cf.sumEntry.value == 1)
	{
		if(cf.ruleSelect.checked == true)
		{
			count_select++;
			select_num=cf.ruleSelect.value;;
		}
	}
	else for(i=0;i<cf.sumEntry.value;i++)
		if(cf.ruleSelect[i].checked == true)
		{
			count_select++;
			select_num=cf.ruleSelect[i].value;
			break;
		}
	if(count_select==0)
	{
		alert(invalid_reservation_del);
		return false;
	}
	else
	{
		/*
		if(select_num==0)
			cf.delnum.value=0;
		else
			cf.delnum.value=eval(select_num)-1;
		*/
		cf.delnum.value=select_num;
		cf.submit();
		return true;
	}	
}

function check_reservation_editnum(cf)
{
	if (cf.sumEntry.value == 0)
	{
		alert(invali_resevation_edit);
		return false;
	}
	var count_select=0;
	var select_num;
	if( cf.sumEntry.value == 1)
	{
		if(cf.ruleSelect.checked == true)
		{
			count_select++;
			select_num=cf.ruleSelect.value;
		}
	}
	else for(i=0;i<cf.sumEntry.value;i++)
		if(cf.ruleSelect[i].checked == true)
		{
			count_select++;
			select_num=cf.ruleSelect[i].value;;
			break;
		}
	if(count_select==0)
	{
		alert(invali_resevation_edit);
		return false;
	}
	else
	{
		cf.select_edit.value=select_num;
		
		cf.submit_flag.value="reservation_editnum";
		cf.action="/cgi-bin/reservation_edit.asp?id="+ts;
		cf.submit();
		
		return false;
	}	
}

function data_select(num)
{
	var cf=document.forms[0];
	var select_ip;
	var tmp_ipaddr = new Array();
		//case 1:
			select_ip = tmp_attach_ip_array[num];
			tmp_ipaddr = select_ip.split('.');
			cf.rsv_ip1.value=tmp_ipaddr[0];
			cf.rsv_ip2.value=tmp_ipaddr[1];
			cf.rsv_ip3.value=tmp_ipaddr[2];
			cf.rsv_ip4.value=tmp_ipaddr[3];
			cf.rsv_mac.value=tmp_attach_mac_array[num];
			cf.dv_name.value=tmp_attach_name_array[num];
		/*
		case 2:
			select_ip = cf.reserv_IP_1.value;;
			tmp_ipaddr = select_ip.split('.');
			cf.rsv_ip1.value=tmp_ipaddr[0];
			cf.rsv_ip2.value=tmp_ipaddr[1];
			cf.rsv_ip3.value=tmp_ipaddr[2];
			cf.rsv_ip4.value=tmp_ipaddr[3];
			select_mac = cf.reserv_MAC_1.value;
			cf.rsv_mac.value=select_mac;
			break;
		
		default:
			return false;
		*/
}
