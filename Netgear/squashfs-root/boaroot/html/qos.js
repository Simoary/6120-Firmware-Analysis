function qosMain()
{
	location.href="QOS_main.asp";
}
function qosRule()
{
	location.href="QOS_rule.asp";
}
function getObj(name)
{
    if (document.getElementById)
    {
        return document.getElementById(name);
    }
    else if (document.all)
    {
        return document.all[name];
    }
    else if (document.layers)
    {
        return document.layers[name];
    }
}
function check_name_space(name)
{
	var allowed_str_array=["MSN messenger","Yahoo Messenger","IP Phone","Vonage IP Phone","Google Talk","Netgear EVA",
	"LAN Port 1","LAN Port 2","LAN Port 3","LAN Port 4","Counter Strike", "Age of Empires","Diablo II","Half Life",
	"Quake 2","Quake 3","Unreal Tourment","Return to Castle Wolfenstein"];
	var flag = 0;
	for(i=0;i<allowed_str_array.length;i++)
	{
		if(name == allowed_str_array[i])
		{
			flag = 1;
		}
	}		
	
	if(flag == 0)
	{
		for(i=0;i<name.length;i++)
		{
			if(isValidChar(name.charCodeAt(i))==false)
			{
				alert("QoS Policy"+" "+"can not input with space or 2 bytes characters!");
				return false;
			}
		}
	}	
}
function check_qos()
{
	var cf=document.forms[0];
	if(cf.wmm_enable.checked == true)
		cf.qos_endis_wmm.value=1;
	else
		cf.qos_endis_wmm.value=0;
		
	if(cf.qosEnable.checked == true)
		cf.qos_endis_on.value=1;
	else
		cf.qos_endis_on.value=0;
	cf.submit_flag.value="apply_qos";
	cf.submit();
}

function change_priority()
{
	var cf=document.forms[0];
	if( cf.category.selectedIndex == 0)
		location.href="QOS_adva_add.asp";
	else if( cf.category.selectedIndex == 1)
		location.href="QOS_online_add.asp";
	else if( cf.category.selectedIndex == 2)
		location.href="QOS_ether_add.asp";
	else if( cf.category.selectedIndex == 3)
		location.href="QOS_mac_add.asp";
}

function change_serv_adva()
{
	var cf=document.forms[0];
	if (cf.apps.selectedIndex == 8)
	{
		cf.name.value='';
		cf.priority.selectedIndex=0;
		getObj("real_app_port").innerHTML=str_div;
	}
	else
	{
		getObj("real_app_port").innerHTML='';
		var i=cf.apps.selectedIndex;
		if(serv_array[i][3]=="MSN_messenger")
			cf.name.value="MSN messenger";
		else if(serv_array[i][3]=="Yahoo_Messenger")
			cf.name.value="Yahoo Messenger";
		else if(serv_array[i][3]=="IP_Phone")
			cf.name.value="IP Phone";
		else if(serv_array[i][3]=="Vonage_IP_Phone")
			cf.name.value="Vonage IP Phone";
		else if(serv_array[i][3]=="Google_Talk")
			cf.name.value="Google Talk";
		else if(serv_array[i][3]=="Netgear_EVA")
			cf.name.value="Netgear EVA";
		else
			cf.name.value=serv_array[i][3];
		cf.priority.selectedIndex=serv_array[i][4];
	}
}
function change_serv_online()
{
	var cf=document.forms[0];
	if (cf.apps.selectedIndex == 7)
	{
		cf.name.value='';
		cf.priority.selectedIndex=1;
		getObj("real_app_port").innerHTML=str_div;
	}
	else
	{
		getObj("real_app_port").innerHTML='';
		var i=cf.apps.selectedIndex;
		if(serv_array[i][3]=="Counter-Strike")
			cf.name.value="Counter Strike";
		else if(serv_array[i][3]=="Age-of-Empires")
			cf.name.value="Age of Empires";
		else if(serv_array[i][3]=="Quake-2")
			cf.name.value="Quake 2";
		else if(serv_array[i][3]=="Quake-3")
			cf.name.value="Quake 3";
		else if(serv_array[i][3]=="Unreal-Tourment")
			cf.name.value="Unreal Tourment";	
		else
			cf.name.value=serv_array[i][3];
		cf.hidden_qos_policy_name.value=serv_array[i][3];
		cf.priority.selectedIndex=serv_array[i][4];
	}
}

function change_name_online(name)
{
		if(name=="Counter-Strike")
			new_name="Counter Strike";
		else if(name=="Age-of-Empires")
			new_name="Age of Empires";
		else if(name=="Diablo-II")
			new_name="Diablo II";
		else if(name=="Half-Life")
			new_name="Half Life";
		else if(name=="Quake-2")
			new_name="Quake 2";
		else if(name=="Quake-3")
			new_name="Quake 3";
		else if(name=="Unreal-Tourment")
			new_name="Unreal Tourment";	
		else if(name=="Return-to-Castle-Wolfenstein")
			new_name="Return to Castle Wolfenstein";		
		else if(name=="LAN_Port_1")
			new_name="LAN Port 1";
		else if(name=="LAN_Port_2")
			new_name="LAN Port 2";
		else if(name=="LAN_Port_3")
			new_name="LAN Port 3";
		else if(name=="LAN_Port_4")
			new_name="LAN Port 4";			
		else if(name=="MSN_messenger")
			new_name="MSN messenger";
		else if(name=="Yahoo_Messenger")
			new_name="Yahoo Messenger";
		else if(name=="IP_Phone")
			new_name="IP Phone";
		else if(name=="Vonage_IP_Phone")
			new_name="Vonage IP Phone";
		else if(name=="Google_Talk")
			new_name="Google Talk";	
		else if(name=="Netgear_EVA")
			new_name="Netgear EVA";
		else
			new_name=name;
		return new_name;
}

function change_serv_ether()
{
	var cf=document.forms[0];
	if(cf.name.value=="LAN Port 1" ||cf.name.value=="LAN Port 2"||cf.name.value=="LAN Port 3" || cf.name.value=="LAN Port 4" || cf.name.value=="")
	{
		cf.name.value="LAN Port "+cf.port_num.options[cf.port_num.selectedIndex].value;
		cf.hidden_qos_policy_name.value="LAN_Port_"+cf.port_num.options[cf.port_num.selectedIndex].value;
	}
		
}

function qosmac_data_select(num)
{
	var cf=document.forms[0];
	var str = eval ( 'qosmac_Array' + num );
	var each_info=str.split(' ');
	cf.dev_name.value=each_info[2];
	if(each_info[0]!='----')
		cf.name.value=each_info[0];
	else
		cf.name.value='';
	var edit_mac=each_info[3];
	cf.mac.value=edit_mac;
	/*var mac_array=edit_mac.split(':');
	cf.mac_addr1.value=mac_array[0];
	cf.mac_addr2.value=mac_array[1];
	cf.mac_addr3.value=mac_array[2];
	cf.mac_addr4.value=mac_array[3];
	cf.mac_addr5.value=mac_array[4];
	cf.mac_addr6.value=mac_array[5];*/
	cf.priority.value=each_info[1];
	cf.select_editnum_mac.value=num;
	var new_num=0;
	for(i=1;i<=qos_array_num;i++)
	{
		var str = eval ( 'qosArray' + i );
		var each_qoslist_info=str.split(' ');
		if( each_qoslist_info[0].toLowerCase() == each_info[0].toLowerCase())
			new_num=i;
	}
	cf.select_qoslist_num.value=new_num;
}

function attached_qosmac_data_select(num,j)
{
	var cf=document.forms[0];
	cf.name.value=attach_policy[j];
	if( attach_mac_array[j] == "&lt;Unknown&gt;" )
		cf.mac.value="";
	else
		cf.mac.value=attach_mac_array[j];

	if( attach_name_array[j] == "&lt;Unknown&gt;" )
		cf.dev_name.value="";
	else
		cf.dev_name.value=attach_name_array[j].replace(/&gt;/g, ">").replace(/&lt;/g, "<");
	cf.priority.value='2';
	cf.select_editnum_mac.value=num;
}

function check_qoslist_editnum(cf)
{
	if( qos_array_num == 0 )
	{
		alert("Please select an item to edit.");
		return false;
	}
	var count_select=0;
	var select_num;
	if( qos_array_num == 1)
	{
		if(cf.ruleSelect.checked == true)
		{
			count_select++;
			select_num=1;
		}
	}
	else for(i=0;i<qos_array_num;i++)
		if(cf.ruleSelect[i].checked == true)
		{
			count_select++;
			select_num=i+1;
		}
	if(count_select==0)
	{
		alert("Please select an item to edit.");
		return false;
	}
	else
	{
		cf.select_edit.value=select_num;
		cf.submit_flag.value="qos_editnum";
		var edit_str=eval('qosArray' + select_num);
		var edit_each_info=edit_str.split(' ');
		if(edit_each_info[1]=='0')
			//cf.action="/apply.cgi?/QOS_adva_edit.htm timestamp="+ts;
			location.href="QOS_adva_edit.asp";
		else if(edit_each_info[1]=='1')
			//cf.action="/apply.cgi?/QOS_online_edit.htm timestamp="+ts;
			location.href="QOS_online_edit.asp";
		else if(edit_each_info[1]=='2')
			//cf.action="/apply.cgi?/QOS_ether_edit.htm timestamp="+ts;	
			location.href="QOS_ether_edit.asp";
		else if(edit_each_info[1]=='3')
			//cf.action="/apply.cgi?/QOS_mac_edit.htm timestamp="+ts;	
			location.href="QOS_mac_edit.asp";
	//	cf.submit();
	}
}

function check_qos_port(cf)
{
	if(cf.port_start.value==""||cf.port_end.value=="")
	{
		alert("Invalid Starting or Ending Port value.");
		return false;
	}
	txt=cf.port_start.value;
	for(i=0;i<txt.length;i++)
	{
		c=txt.charAt(i);
		if("0123456789".indexOf(c,0)<0)
		{
			alert("Invalid Starting Port value.");
			return false;
		}
	}
	txt=cf.port_end.value;
	for(i=0;i<txt.length;i++)
	{
		c=txt.charAt(i);
		if("0123456789".indexOf(c,0)<0)
		{
			alert("Invalid Ending Port value.");
			return false;
		}
	}
	if(parseInt(cf.port_start.value)<1||parseInt(cf.port_start.value)>65535)
	{
		alert("Invalid Starting Port value.");
		return false;
	}
	if(parseInt(cf.port_end.value)<1||parseInt(cf.port_end.value)>65535)
	{
		alert("Invalid Ending Port value.");
		return false;
	}
	if(parseInt(cf.port_end.value)<parseInt(cf.port_start.value))
	{
		alert("The Ending Port value should be greater than or equal to the Starting Port value.");
		return false;
	}
	return true;
}
function check_qos_adva(cf,flag)
{
	if(cf.name.value == "")
	{
		alert("The name of the QoS policy cannot be blank.");
		return false;
	}
	if(check_name_space(cf.name.value)==false)
		return false;
    	if (cf.apps.selectedIndex == 8)
    	{
        	if (check_qos_port(cf)==false)
            	return false;
    	}

 	if(cf.apps.selectedIndex == 8)
	{
		var input_start_port=cf.port_start.value;
    		var input_end_port=cf.port_end.value;
	}
	for(i=1;i<=qos_array_num;i++)
	{
		var str = eval ( 'qosArray' + i );
		var each_info=str.split(' ');
        	var startport=each_info[5];
 		var endport=each_info[6];
		if(flag == 'edit')
		{
			if(cf.name.value == change_name_online(each_info[0]) && select_editnum!=i )
			{
				alert("Duplicate policy name.");
				return false;
			}
			if( cf.apps.value == each_info[2] &&  cf.apps.value != "Add" && select_editnum!=i )
			{
				alert("Port conflicts with another rule.");
				return false;
			}
            		if(cf.apps.selectedIndex == 8)//each_info[4] : Connection Type
			{
	                        if(cf.protocol.value == "TCP\/UDP" || each_info[4] == "TCP\/UDP" || cf.protocol.value == each_info[4])
	                        {
					if((!(parseInt(endport)<parseInt(input_start_port)||parseInt(input_end_port)<parseInt(startport))) && select_editnum!=i && each_info[2]=="Add")
        	    			{
               					alert("Port conflicts with another rule.");
                				return false;
            				}
				}
			}
		}
		else
		{
			if( cf.name.value == change_name_online(each_info[0]))
			{
				alert("Duplicate policy name.");
				return false;
			}
                        if( cf.apps.value == each_info[2] &&  cf.apps.value != "Add" )
                        {
                                alert("Port conflicts with another rule.");
                                return false;
                        }

            		if(cf.apps.selectedIndex == 8)
            		{
	                        if(cf.protocol.value == "TCP\/UDP" || each_info[4] == "TCP\/UDP" || cf.protocol.value == each_info[4])
	                        {
					if(!(parseInt(endport)<parseInt(input_start_port)||parseInt(input_end_port)<parseInt(startport)) && each_info[2]=="Add")
            				{
                				alert("Port conflicts with another rule.");
                				return false;
            				}
				}
			}
		}
	}

//add new info	
	if (cf.apps.selectedIndex == 8)
	{
		cf.hidden_port_type.value=cf.protocol.options[cf.protocol.selectedIndex].value;
		cf.hidden_portstart.value=cf.port_start.value
		cf.hidden_portend.value=cf.port_end.value;
	}
	else
	{
		var i=cf.apps.selectedIndex;
		cf.hidden_port_type.value=serv_array[i][0];
		cf.hidden_portstart.value=serv_array[i][1];
		cf.hidden_portend.value=serv_array[i][2];
	}
        var str_adva=cf.name.value;
        var str_new="";
        for(var j=0;j<=str_adva.length;j++)
        {
                if(str_adva.substr(j,1)==' ')
                        str_new+='_';
                else
                        str_new+=str_adva.substr(j,1);
        }
        cf.name.value=str_new;
}

function check_qos_online(cf,flag)
{
	if(cf.name.value=='')
	{
		alert("The name of the QoS policy cannot be blank.");
		return false;
	}
	if(check_name_space(cf.name.value)==false)
		return false;    
	if (cf.apps.selectedIndex == 7)
    	{
        	if (check_qos_port(cf)==false)
            		return false;
    	}
	if (cf.apps.selectedIndex == 7)
	{
    	var input_start_port=cf.port_start.value;
    	var input_end_port=cf.port_end.value;
	}
	for(i=1;i<=qos_array_num;i++)
	{
		var str = eval ( 'qosArray' + i );
		var each_info=str.split(' ');
        startport=each_info[5];
        endport=each_info[6];
    	if(flag == 'edit')
	{
		if( cf.name.value == change_name_online(each_info[0]) && select_editnum!=i )
		{
			alert("Duplicate policy name.");
			return false;
		}
                if( cf.apps.value == each_info[2] &&  cf.apps.value != "Add" && select_editnum!=i )
                {
                        alert("Port conflicts with another rule.");
                        return false;
                }
       		if (cf.apps.selectedIndex == 7)//each_info[4] : Connection Type
 		{
			if(cf.protocol.value == "TCP\/UDP" || each_info[4] == "TCP\/UDP" || cf.protocol.value == each_info[4])
			{
				if((!(parseInt(endport)<parseInt(input_start_port)||parseInt(input_end_port)<parseInt(startport))) && select_editnum!=i  && each_info[2]=="Add")
            			{
                			alert("Port conflicts with another rule.");
                			return false;
            			}
			}
		}
	}
	else
	{
		if( cf.name.value == change_name_online(each_info[0]))
		{
			alert("Duplicate policy name.");
			return false;
		}
                if( cf.apps.value == each_info[2] &&  cf.apps.value != "Add" )
                {
                        alert("Port conflicts with another rule.");
                        return false;
                }

            	if (cf.apps.selectedIndex == 7)
            	{
			if(cf.protocol.value == "TCP\/UDP" || each_info[4] == "TCP\/UDP" || cf.protocol.value == each_info[4])
			{
				if(!(parseInt(endport)<parseInt(input_start_port)||parseInt(input_end_port)<parseInt(startport))  && each_info[2]=="Add")
            			{
                			alert("Port conflicts with another rule.");
                			return false;
            			}
			}
		}
	}
	}
//add new info	
	if (cf.apps.selectedIndex == 7)
	{
		cf.hidden_port_type.value=cf.protocol.options[cf.protocol.selectedIndex].value;
		cf.hidden_portstart.value=cf.port_start.value;
		cf.hidden_portend.value=cf.port_end.value;
	}
	else
	{
		var i=cf.apps.selectedIndex;
		cf.hidden_port_type.value=serv_array[i][0];
		cf.hidden_portstart.value=serv_array[i][1];
		cf.hidden_portend.value=serv_array[i][2];
    	}
    	var str_game=cf.name.value;
	var str_new="";
	for(var j=0;j<=str_game.length;j++)
	{
		if(str_game.substr(j,1)==' ')
			str_new+='-';
		else
			str_new+=str_game.substr(j,1);
	}
	cf.hidden_qos_policy_name.value=str_new;
}

function check_qos_ether(cf,flag)
{	
	if(cf.name.value=='')
	{
		cf.name.value="LAN Port "+cf.port_num.options[cf.port_num.selectedIndex].value;
		cf.hidden_qos_policy_name.value="LAN_Port_"+cf.port_num.options[cf.port_num.selectedIndex].value;
	}
	else if(cf.name.value=='LAN Port 1' || cf.name.value=='LAN Port 2' || cf.name.value=='LAN Port 3' || cf.name.value=='LAN Port 4')
	{
		cf.hidden_qos_policy_name.value = cf.name.value.replace(/ /g, "_");
	}
	else
	        cf.hidden_qos_policy_name.value = cf.name.value;
	if(check_name_space(cf.name.value)==false)
		return false;	
	for(i=1;i<=qos_array_num;i++)
	{
		var str = eval ( 'qosArray' + i );
		var each_info=str.split(' ');
		if(flag == 'edit')
		{
			if( cf.name.value == change_name_online(each_info[0]) && select_editnum!=i )
			{
				alert("Duplicate policy name.");
				return false;
			}
			if(cf.port_num.options[cf.port_num.selectedIndex].value==each_info[2] && select_editnum!=i )
			{
				alert("Duplicate Ethernet LAN port.");
				return false;
			}
		}
		else
		{
			if( cf.name.value == change_name_online(each_info[0]))
			{
				alert("Duplicate policy name.");
				return false;
			}
				if(cf.port_num.options[cf.port_num.selectedIndex].value==each_info[2] )
			{
				alert("Duplicate Ethernet LAN port.");
				return false;
			}
		}
	}
}

function valid_add_qosmac(cf,flag,from_page)
{
	if (qosmac_array_num ==0 && attach_array.length ==0 && flag == 'edit')
	{
		alert("Please select an item to edit.");
		return false;
	}
	else if( cf.select_editnum_mac.value == '' && flag == 'edit')
	{
		alert("Please select an item to edit.");
		return false;
	}
	if(cf.dev_name.value=='')
	{
		alert("Device name can not be null.");
		return false;
	}
	if(check_name_space(cf.dev_name.value)==false)
		return false;
	for(i=0;i<cf.dev_name.value.length;i++)
        {
                if(isValidChar(cf.dev_name.value.charCodeAt(i))==false)
                {
                        alert("Invalid device name.");
                        cf.dev_name.focus();
                        return false;
                }
        }
	//cf.the_mac.value = cf.mac_addr1.value+':'+cf.mac_addr2.value+':'+cf.mac_addr3.value+':'+
	//				  cf.mac_addr4.value+':'+cf.mac_addr5.value+':'+cf.mac_addr6.value;
	
	cf.the_mac.value = cf.mac.value;
	var mac_addr = cf.the_mac.value;
        if ( mac_addr.indexOf(":")==-1 && mac_addr.length=="12" )
	{
		var tmp_mac=mac_addr.substr(0,2)+":"+mac_addr.substr(2,2)+":"+mac_addr.substr(4,2)+":"+mac_addr.substr(6,2)+":"+mac_addr.substr(8,2)+":"+mac_addr.substr(10,2);
		mac_addr = tmp_mac;
	}
	cf.the_mac.value = mac_addr;
	if(maccheck(cf.the_mac.value) == false)
		return false;

	for(i=1; i <= qosmac_array_num; i++)
	{
		var str = eval ( 'qosmac_Array' + i );
		var each_info=str.split(' ');
		if( (flag == 'edit' && cf.select_editnum_mac.value != i ) || flag == 'add')
		{
			if( cf.dev_name.value == each_info[2])
			{
				alert("Duplicate device name.");
				return false;
			}
			if( cf.name.value == each_info[0])
			{
				alert("Duplicate policy name.");
				return false;
			}
			if( cf.the_mac.value.toLowerCase() == each_info[3].toLowerCase())
			{
				alert("Duplicate MAC address.");
				return false;
			}
		}
	}
        for(i=0; i<attach_array.length; i++)
        {
                if( attach_mac_array[i].toLowerCase() != cf.the_mac.value.toLowerCase())
                {
                        if( attach_name_array[i] == cf.dev_name.value && attach_name_array[i] != "" )
                        {
                                alert("Duplicate device name.");
                                return false;
                        }
                        if( attach_policy[i] == cf.name.value && attach_policy[i] != "")
                        {
                                alert("Duplicate policy name.");
                                return false;
                        }
                }
        }
	
	if(flag == 'edit')
		cf.submit_flag.value="qos_editmac";
	else if(flag == 'add')
		cf.submit_flag.value="qos_addmac";
	var def_name=cf.the_mac.value.substring(9,11)+cf.the_mac.value.substring(12,14)+cf.the_mac.value.substring(15,17);
	if(cf.name.value=='')
		cf.name.value='Pri_MAC_'+def_name;
	if(check_name_space(cf.name.value)==false)
		return false;
        for(i=0;i<cf.name.value.length;i++)
        {
                if(isValidChar(cf.name.value.charCodeAt(i))==false)
                {
                        alert("Policy name can not input with 2 bytes!");
                        cf.name.focus();
                        return false;
                }
        }
	if( from_page == "add_page" )
		cf.action="/cgi-bin/QOS_mac_add.asp timestamp="+ts;
	else
		cf.action="/cgi-bin/QOS_mac_edit.asp timestamp="+ts;	
}

function valid_delete_qosmac(cf)
{
	if (qosmac_array_num ==0)
	{
		alert("Please select an item to delete.");
		return false;
	}
	else if( cf.select_editnum_mac.value == '')
	{
		alert("Please select an item to delete.");
		return false;
	}
	else
	{
		cf.submit_flag.value="qos_delmac";
		cf.action="/cgi-bin/QOS_mac_add.asp timestamp="+ts;
	}
}

function check_qos_info(cf,flag)
{
	if(cf.dev_name.value=='')
	{
		alert("Device name can not be null.");
		return false;
	}
	if(check_name_space(cf.dev_name.value)==false)
		return false;
	for(i=0;i<cf.dev_name.value.length;i++)
        {
                if(isValidChar(cf.dev_name.value.charCodeAt(i))==false)
                {
                        alert("Invalid device name.");
                        cf.dev_name.focus();
                        return false;
                }
        }
	cf.the_mac.value = cf.mac.value;
	var mac_addr = cf.the_mac.value;
        if ( mac_addr.indexOf(":")==-1 && mac_addr.length=="12" )
	{
		var tmp_mac=mac_addr.substr(0,2)+":"+mac_addr.substr(2,2)+":"+mac_addr.substr(4,2)+":"+mac_addr.substr(6,2)+":"+mac_addr.substr(8,2)+":"+mac_addr.substr(10,2);
		mac_addr = tmp_mac;
	}
	cf.the_mac.value = mac_addr;
	if(maccheck(cf.the_mac.value) == false)
		return false;

	for(i=1; i <= qos_array_num; i++)
	{
		var str = eval ( 'qosArray' + i );
		var each_info=str.split(' ');
		if((flag == 'edit' && select_editnum != i) || flag == 'add')
		{
			if(cf.dev_name.value == each_info[7])
			{
				alert("Duplicate device name.");
				return false;
			}
			if(cf.name.value == each_info[0])
			{
				alert("Duplicate policy name.");
				return false;
			}
			if(cf.the_mac.value.toLowerCase() == each_info[8].toLowerCase())
			{
				alert("Duplicate MAC address.");
				return false;
			}
		}
	}

        for(i=1;i<=qosmac_array_num;i++)
        {
                var str = eval ( 'qosmac_Array' + i );
                        var each_info=str.split(' ');
                if( cf.dev_name.value == each_info[2] && cf.select_editnum_mac.value!=i )
                {
                        alert("Duplicate device name.");
                        return false;
                }
                if( cf.name.value == each_info[0] && cf.select_editnum_mac.value!=i)
                {
                        alert("Duplicate policy name.");
                        return false;
                }
                if( cf.the_mac.value.toLowerCase()  == each_info[3].toLowerCase()  && cf.select_editnum_mac.value!=i)
                {
                        alert("Duplicate MAC address.");
                        return false;
                }
        }

	for(i=0; i<attach_array.length; i++)
	{
		if( attach_mac_array[i].toLowerCase() != cf.the_mac.value.toLowerCase())
		{
			if( attach_name_array[i] == cf.dev_name.value && attach_name_array[i] != "" )
			{
				alert("Duplicate device name.");
				return false;
			}
			if( attach_policy[i] == cf.name.value && attach_policy[i] != "")
			{
				alert("Duplicate policy name.");
				return false;
			}
		}
	}

	var def_name=cf.the_mac.value.substring(9,11)+cf.the_mac.value.substring(12,14)+cf.the_mac.value.substring(15,17);
	if(cf.name.value=='')
		cf.name.value='Pri_MAC_'+def_name;
	if(check_name_space(cf.name.value)==false)
		return false;
        for(i=0;i<cf.name.value.length;i++)
        {
                if(isValidChar(cf.name.value.charCodeAt(i))==false)
                {
                        alert("Policy name can not input with 2 bytes!");
                        cf.name.focus();
                        return false;
                }
        }
	return true;
}

function check_qos_mac(cf,flag)
{
	var cf=document.forms[0];	
	if(!check_qos_info(cf, flag))
		return false;
	if(cf.select_editnum_mac.value > qos_array_num)
		cf.attached_mac.value = "1";
}

function check_qoslist_delnum(cf)
{
	if( qos_array_num == 0 )
	{
		alert("Please select an item to delete.");
		return false;
	}
	var count_select=0;
	var select_num;
	if( qos_array_num == 1)
	{
		if(cf.ruleSelect.checked == true)
		{
			count_select++;
			select_num=1;
		}
	}
	else for(i=0;i<qos_array_num;i++)
		if(cf.ruleSelect[i].checked == true)
		{
			count_select++;
			select_num=i+1;
		}
	if(count_select==0)
	{
		alert("Please select an item to delete.");
		return false;
	}
	else
	{
		cf.select_del.value=select_num;
		cf.submit_flag.value="qos_del";
		str=eval("qosArray"+select_num);
		each_info=str.split(' ');
		if ( each_info[1] == 3 )
		{
			var new_num=0;
			for(i=1;i<=qosmac_array_num;i++)
			{
				var str_mac = eval ( 'qosmac_Array' + i );
				var each_qosmac_info=str_mac.split(' ');
				if( each_qosmac_info[3].toLowerCase() == each_info[8].toLowerCase())
					new_num=i;
			}
			cf.select_del_mac.value=new_num;		
		}
		cf.action="/cgi-bin/QOS_rule.asp timestamp="+ts;	
		cf.submit();
	}
}
function check_qoslist_delall(cf)
{
	if( qos_array_num == 0 )
	{
		alert("Please select an item to delete.");
		return false;
	}
	if ( !confirm("These items will be all deleted. Are you sure you want to delete them?"))
		return false;
	else
	{
		cf.submit_flag.value="qos_del_all";
		cf.action="/cgi-bin/QOS_rule.asp timestamp="+ts;
		cf.submit();
	}
}
function check_qos_apply(cf)
{
	cf.qos_apply_Flag.value=1;
	if(cf.wmm_enable.checked == true)
		cf.qos_endis_wmm.value=1;
	else
		cf.qos_endis_wmm.value=0;
	if(cf.wmm_enable_an.checked == true)
                cf.qos_endis_wmm_a.value=1;
        else
                cf.qos_endis_wmm_a.value=0;
		
	if(cf.qosEnable.checked == true)
		cf.qos_endis_on.value=1;
	else
		cf.qos_endis_on.value=0;
	if(cf.bwEnable.checked == true)
		cf.qos_endis_bandwidth.value=1;
	else
		cf.qos_endis_bandwidth.value=0;

	if(cf.bw_sel[0].checked == true)
	{
		cf.qos_hidden_bandwidth_type.value = "0";
		qos_bandwith=parseInt(cf.tcbw_value.value);
	}
	else if(cf.bw_sel[1].checked == true)
	{
		cf.qos_hidden_bandwidth_type.value = "1";
		cf.tcbw_unit.value = "Kbps";
		qos_bandwith=cf.Bandwidth.value;
	}
	if ( cf.bwEnable.checked == true )
	{
		if (max_bandwidth == 1000)
		{
			if(cf.bw_sel[0].checked == true)
			{
				if(cf.tcbw_unit.selectedIndex == 0)
				{
					if(!(qos_bandwith>0&&qos_bandwith<1024001))
					{
						alert("Qos bandwith of Mbps should be 1 to 1000.");
						return false;
					}
					else
						cf.qos_hidden_uprate.value = parseInt(cf.tcbw_value.value);
				}
				else
				{
					if(!(qos_bandwith>0&&qos_bandwith<1001))
					{
						alert("Qos bandwith of Mbps should be 1 to 1000.");
						return false;
					}
					else
						cf.qos_hidden_uprate.value = parseInt(cf.tcbw_value.value)*1024;
				}
			}
			else if(cf.bw_sel[1].checked == true)
			{
				if(qos_bandwith == 0 || qos_bandwith == "")
				{
					/* to fix bug 25724 */
					parent.qos_check_time = 0;
					cf.qos_hidden_check.value = "1";
					cf.action = "/cgi-bin/pls_wait_qos_check.asp timestamp="+ts;
					cf.qos_hidden_uprate.value = "0";

					qos_bandwith=parseInt(cf.tcbw_value.value);
					if(cf.tcbw_unit.selectedIndex == 0)
					{
						if(!(qos_bandwith>0&&qos_bandwith<1024001))
						{
							alert("Qos bandwith of Mbps should be 1 to 1000.");
							return false;
						}
						else
							cf.qos_hidden_uprate.value = parseInt(cf.tcbw_value.value);
					}
					else
					{
						if(!(qos_bandwith>0&&qos_bandwith<1001))
						{
							alert("Qos bandwith of Mbps should be 1 to 1000.");
							return false;
						}
						else
							cf.qos_hidden_uprate.value = parseInt(cf.tcbw_value.value)*1024;
					}
				}
				else
				{
					if(!(qos_bandwith>0&&qos_bandwith<1024001))
					{
						alert("Qos bandwith of Mbps should be 1 to 1000.");
						return false;
					}
					else
						cf.qos_hidden_uprate.value = parseInt(cf.Bandwidth.value);
				}
			}
		}
		else if (max_bandwidth == 100)
		{
			if(cf.bw_sel[0].checked == true)
			{
				if(cf.tcbw_unit.selectedIndex == 0)
				{
					if(!(qos_bandwith>0&&qos_bandwith<102401))
					{
						alert("Qos bandwith of Mbps should be 1 to 100. ");
						return false;
					}
					else
						cf.qos_hidden_uprate.value = parseInt(cf.tcbw_value.value);
				}	
				else
				{
					if(!(qos_bandwith>0&&qos_bandwith<101))
					{
						alert("Qos bandwith of Mbps should be 1 to 100. ");
						return false;
					}
					else
						cf.qos_hidden_uprate.value = parseInt(cf.tcbw_value.value)*1024;
				}
			}
			else if(cf.bw_sel[1].checked == true)
			{
				if(qos_bandwith == 0 || qos_bandwith == "")
				{
					/* to fix bug 25724 */
					parent.qos_check_time = 0;
					cf.qos_hidden_check.value = "1";
					cf.action = "/cgi-bin/pls_wait_qos_check.asp timestamp="+ts;
					cf.qos_hidden_uprate.value = "0";

					qos_bandwith=parseInt(cf.tcbw_value.value);
					if(cf.tcbw_unit.selectedIndex == 0)
					{
						if(!(qos_bandwith>0&&qos_bandwith<102401))
						{
							alert("Qos bandwith of Mbps should be 1 to 100. ");
							return false;
						}
						else
							cf.qos_hidden_uprate.value = parseInt(cf.tcbw_value.value);
					}	
					else
					{
						if(!(qos_bandwith>0&&qos_bandwith<101))
						{
							alert("Qos bandwith of Mbps should be 1 to 100. ");
							return false;
						}
						else
							cf.qos_hidden_uprate.value = parseInt(cf.tcbw_value.value)*1024;
					}
				}
				else
				{
					if(!(qos_bandwith>0&&qos_bandwith<102401))
					{
						alert("Qos bandwith of Mbps should be 1 to 100. ");
						return false;
					}
					else
						cf.qos_hidden_uprate.value = parseInt(cf.Bandwidth.value);
				}
			}
		}
	}
	else
	{
		cf.qos_hidden_uprate.value=tcbw_value;
		cf.tcbw_unit.value=tcbw_unit;
	}
}
