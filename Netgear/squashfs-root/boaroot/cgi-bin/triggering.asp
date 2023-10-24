<%
If Request_Form("PortTriggering_SubmitFlag") = "1" Then
	if Request_Form("select_entry_num") <> "N/A" Then
		tcWebApi_set("WebCurSet_Entry","portTriggering_entry","select_entry_num")
		if Request_Form("del_flag") = "1" Then
			tcWebApi_unset("portTriggering_Entry")
		else
			if Request_Form("edit_flag") = "1" Then
				tcWebApi_unset("portTriggering_Entry")
			end if
			tcWebApi_set("portTriggering_Entry","Active","active")
			tcWebApi_set("portTriggering_Entry","Name","pt_name")
			tcWebApi_set("portTriggering_Entry","TSPort","pt_port")
			tcWebApi_set("portTriggering_Entry","TEPort","pt_port")
			tcWebApi_set("portTriggering_Entry","TProtocol","pt_type")
			tcWebApi_set("portTriggering_Entry","OSPort","in_port_start")
			tcWebApi_set("portTriggering_Entry","OEPort","in_port_end")
			tcWebApi_set("portTriggering_Entry","OProtocol","in_port_type")
			tcWebApi_set("portTriggering_Entry","Service_User","service_ip")
			
			
		end if
	end if 
	if Request_Form("disable_trigger_on") <> "N/A" Then
			tcWebApi_set("portTriggering_setting","Disable","disable_trigger_on")
	end if
	if Request_Form("hidden_timeout") <> "N/A" Then
		tcWebApi_set("portTriggering_Common","timeout","hidden_timeout")
	end if
	if Request_Form("triggering_flag") = "1" Then
		
		
		tcWebApi_set("portTriggering_Entry0","Active","rule1_active")
		tcWebApi_set("portTriggering_Entry1","Active","rule2_active")
		tcWebApi_set("portTriggering_Entry2","Active","rule3_active")
		tcWebApi_set("portTriggering_Entry3","Active","rule4_active")
		tcWebApi_set("portTriggering_Entry4","Active","rule5_active")
		tcWebApi_set("portTriggering_Entry5","Active","rule6_active")
		tcWebApi_set("portTriggering_Entry6","Active","rule7_active")
		tcWebApi_set("portTriggering_Entry7","Active","rule8_active")
		tcWebApi_set("portTriggering_Entry8","Active","rule9_active")
		tcWebApi_set("portTriggering_Entry9","Active","rule10_active")
		tcWebApi_set("portTriggering_Entry10","Active","rule11_active")
		tcWebApi_set("portTriggering_Entry11","Active","rule12_active")
		tcWebApi_set("portTriggering_Entry12","Active","rule13_active")
		tcWebApi_set("portTriggering_Entry13","Active","rule14_active")
		tcWebApi_set("portTriggering_Entry14","Active","rule15_active")
		tcWebApi_set("portTriggering_Entry15","Active","rule16_active")
		tcWebApi_set("portTriggering_Entry16","Active","rule17_active")
		tcWebApi_set("portTriggering_Entry17","Active","rule18_active")
		tcWebApi_set("portTriggering_Entry18","Active","rule19_active")
		tcWebApi_set("portTriggering_Entry19","Active","rule20_active")
	end if
	tcWebApi_commit("portTriggering_Entry")
	
End If
%>
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title>
<meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/triggering.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="triggering_apply">
<input type="hidden" name="hidden_timeout" value="<%If tcWebApi_get("portTriggering_Common", "timeout", "h") <>"N/A" then tcWebApi_get("portTriggering_Common", "timeout", "s") end if%>">
<div class="page_title"><%tcWebApi_multilingual("1","trigger_title_str")%></div>
<div class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
			<input class="cancel_bt" type="reset" name="Cancel" id="cancle" value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick=location.href="triggering.asp";>&nbsp;&nbsp;
			<input class="apply_bt" type="submit" name="Apply" id="apply" value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick="return check_triggering_apply(document.forms[0])">
        </TD>
</TR>
</TABLE>
</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>
<script>
var alert_invalid_port_used_str="<%tcWebApi_multilingual("0","invalid_port_used_str")%>";
var table_Data = [
["1","<%tcwebApi_staticGet("portTriggering_Entry0","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry0","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry0","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry0","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry0","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry0","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry0","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry0","Service_User","s")%>"],
["2","<%tcwebApi_staticGet("portTriggering_Entry1","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry1","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry1","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry1","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry1","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry1","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry1","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry1","Service_User","s")%>"],
["3","<%tcwebApi_staticGet("portTriggering_Entry2","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry2","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry2","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry2","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry2","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry2","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry2","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry2","Service_User","s")%>"],
["4","<%tcwebApi_staticGet("portTriggering_Entry3","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry3","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry3","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry3","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry3","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry3","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry3","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry3","Service_User","s")%>"],
["5","<%tcwebApi_staticGet("portTriggering_Entry4","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry4","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry4","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry4","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry4","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry4","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry4","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry4","Service_User","s")%>"],
["6","<%tcwebApi_staticGet("portTriggering_Entry5","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry5","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry5","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry5","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry5","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry5","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry5","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry5","Service_User","s")%>"],
["7","<%tcwebApi_staticGet("portTriggering_Entry6","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry6","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry6","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry6","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry6","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry6","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry6","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry6","Service_User","s")%>"],
["8","<%tcwebApi_staticGet("portTriggering_Entry7","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry7","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry7","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry7","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry7","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry7","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry7","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry7","Service_User","s")%>"],
["9","<%tcwebApi_staticGet("portTriggering_Entry8","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry8","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry8","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry8","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry8","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry8","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry8","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry8","Service_User","s")%>"],
["10","<%tcwebApi_staticGet("portTriggering_Entry9","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry9","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry9","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry9","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry9","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry9","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry9","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry9","Service_User","s")%>"],
["11","<%tcwebApi_staticGet("portTriggering_Entry10","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry10","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry10","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry10","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry10","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry10","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry10","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry10","Service_User","s")%>"],
["12","<%tcwebApi_staticGet("portTriggering_Entry11","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry11","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry11","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry11","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry11","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry11","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry11","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry11","Service_User","s")%>"],
["13","<%tcwebApi_staticGet("portTriggering_Entry12","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry12","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry12","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry12","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry12","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry12","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry12","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry12","Service_User","s")%>"],
["14","<%tcwebApi_staticGet("portTriggering_Entry13","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry13","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry13","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry13","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry13","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry13","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry13","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry13","Service_User","s")%>"],
["15","<%tcwebApi_staticGet("portTriggering_Entry14","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry14","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry14","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry14","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry14","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry14","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry14","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry14","Service_User","s")%>"],
["16","<%tcwebApi_staticGet("portTriggering_Entry15","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry15","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry15","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry15","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry15","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry15","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry15","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry15","Service_User","s")%>"],
["17","<%tcwebApi_staticGet("portTriggering_Entry16","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry16","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry16","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry16","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry16","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry16","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry16","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry16","Service_User","s")%>"],
["18","<%tcwebApi_staticGet("portTriggering_Entry17","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry17","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry17","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry17","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry17","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry17","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry17","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry17","Service_User","s")%>"],
["19","<%tcwebApi_staticGet("portTriggering_Entry18","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry18","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry18","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry18","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry18","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry18","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry18","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry18","Service_User","s")%>"],
["20","<%tcwebApi_staticGet("portTriggering_Entry19","Active","s")%>","<%tcwebApi_staticGet("portTriggering_Entry19","Name","s")%>","<%tcwebApi_staticGet("portTriggering_Entry19","TSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry19","TProtocol","s")%>","<%tcwebApi_staticGet("portTriggering_Entry19","OSPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry19","OEPort","s")%>","<%tcwebApi_staticGet("portTriggering_Entry19","OProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry19","Service_User","s")%>"]
];

var reach_Max_flag="0";
function loadvalue()
{
	parent.TriggerorForward = "trigger";
	var cf=document.forms[0];	
	nextEntry();
	var disable_pt = "<%If tcwebApi_staticGet("portTriggering_setting","Disable","h") <> "N/A" then tcwebApi_staticGet("portTriggering_setting","Disable","s") end if%>";
    document.forms[0].fwpt_timeout.value = document.forms[0].hidden_timeout.value;
	if(disable_pt=="Yes")
		cf.fwpt_enable.checked = true;
}
function nextEntry()
{
	var first_flag = 0;
	var free_rule = 0;
	var input_rule = 0;

	
	for(var z=0;z<table_Data.length;z++)
	{
		if(table_Data[z][2]!="N/A")
		{
			free_rule+=1;
		}
		else
		{
			if(first_flag == 0)
			{
				input_rule = z;
				first_flag = 1;
			}
		}
		
	}


	if (free_rule >= document.forms[0].PortTriggering_CanUseNumFlag.value)
	{
		reach_Max_flag="1";
		document.forms[0].sumEntry.value="20";
		return true;
	}
	else
	{
		if(first_flag == 1)
		{
			document.forms[0].nextEntry.value = input_rule;
			document.forms[0].sumEntry.value = free_rule;
			
		}
		else
		{
			document.forms[0].nextEntry.value = 0 ;
			document.forms[0].sumEntry.value = 0;
		}
	}
	
	
	return false;
}
function check_triggering_edit(cf)
{
	if(cf.sumEntry.value == 0)
	{
		location.href="edit_fail.asp";
		return false;
	}
	var count_select=0;
	var select_num;
	var parameters;
	if(cf.sumEntry.value == 1)
	{
		if(cf.serviceSelect.checked == true)
		{
			count_select++;
			select_num=cf.serviceSelect.value;
		}
	}
	else for(i=0;i<cf.sumEntry.value;i++)
		if(cf.serviceSelect[i].checked == true)
		{
			count_select++;
			//select_num=i+1;
			select_num=cf.serviceSelect[i].value;
			break;
		}
	if(count_select==0)
	{
		location.href="edit_fail.asp";
		return false;
	}
	else
	{
		
		cf.select_entry_num.value=select_num;
		cf.submit_flag.value="triggering_editnum";
		cf.edit_active.value = table_Data[select_num][1];
		cf.edit_name.value = table_Data[select_num][2];
		cf.edit_user.value = table_Data[select_num][8];
		cf.edit_tsport.value = table_Data[select_num][3];
		cf.edit_tprotocol.value = table_Data[select_num][4];
		cf.edit_osport.value = table_Data[select_num][5];
		cf.edit_oeport.value = table_Data[select_num][6];
		cf.edit_oprotocol.value = table_Data[select_num][7];
		
	//	cf.action="/cgi-bin/triggering_edit.htm timestamp="+ts;
	//	return true;
	}
	location.href="triggering_edit.asp?index="+cf.select_entry_num.value+";"+cf.edit_active.value+";"+cf.edit_name.value+";"+cf.edit_user.value+";"+cf.edit_tsport.value+";"+cf.edit_tprotocol.value+";"+cf.edit_osport.value+";"+cf.edit_oeport.value+";"+cf.edit_oprotocol.value;
	//location.href="triggering_edit.asp";
	//cf.submit();
	return false;
}
function check_triggering_del(cf)
{
	if( cf.sumEntry.value == "" )
	{
		location.href="del_fail.asp";
		return false;
	}
	var count_select=0;
	var select_num;
	if( cf.sumEntry.value == 1)
	{
		if(cf.serviceSelect.checked == true)
		{
			count_select++;
			select_num=cf.serviceSelect.value;
		}
	}
	else for(i=0;i<cf.sumEntry.value;i++)
		if(cf.serviceSelect[i].checked == true)
		{
			count_select++;
			select_num=cf.serviceSelect[i].value;
		}
	if(count_select==0)
	{
		location.href="del_fail.asp";
		return false;
	}
	else
	{
		cf.select_entry_num.value=select_num;
		cf.del_flag.value = 1 ;
		cf.PortTriggering_SubmitFlag.value = 1;
		cf.submit_flag.value="triggering_del";
		return true;
	}
}
function set_active_value(num,active)
{
	var temp_num;
	temp_num = eval(num);
	switch(temp_num)
	{
		case 0:
			document.forms[0].rule1_active.value = active ;
			break;
		case 1:
			document.forms[0].rule2_active.value = active ;
			break;
		case 2:
			document.forms[0].rule3_active.value = active ;
			break;
		case 3:
			document.forms[0].rule4_active.value = active ;
			break;
		case 4:
			document.forms[0].rule5_active.value = active ;
			break;
		case 5 :
			document.forms[0].rule6_active.value = active ;
			break;
		case 6 :
			document.forms[0].rule7_active.value = active ;
			break;
		case 7 :
			document.forms[0].rule8_active.value = active ;
			break;
		case 8 :
			document.forms[0].rule9_active.value = active ;
			break;
		case 9 :
			document.forms[0].rule10_active.value = active ;
			break;
		case 10 :
			document.forms[0].rule11_active.value = active ;
			break;
		case 11 :
			document.forms[0].rule12_active.value = active ;
			break;
		case 12 :
			document.forms[0].rule13_active.value = active ;
			break;
		case 13 :
			document.forms[0].rule14_active.value = active ;
			break;
		case 14 :
			document.forms[0].rule15_active.value = active ;
			break;
		case 15 :
			document.forms[0].rule16_active.value = active ;
			break;
		case 16 :
			document.forms[0].rule17_active.value = active ;
			break;
		case 17 :
			document.forms[0].rule18_active.value = active ;
			break;
		case 18 :
			document.forms[0].rule19_active.value = active ;
			break;
		case 19 :
			document.forms[0].rule20_active.value = active ;
			break;
		default:
			break;
	}
	return;
}
function check_triggering_apply(cf)
{
	if(cf.fwpt_enable.checked == true)
		cf.disable_trigger_on.value="Yes";
	else
		cf.disable_trigger_on.value="No";
	if(cf.fwpt_timeout.value=="")
	{
		alert(timeout_empty_str);
		return false;
	}	
        else if(!_isNumeric(cf.fwpt_timeout.value))
	{
		alert(timeout_invalid_str);
		return false;
	}

	cf.fwpt_timeout.value = parseInt(cf.fwpt_timeout.value, 10);
	
	if(cf.sumEntry.value == 0)
	{

	}
	else if ( cf.sumEntry.value == 1)
	{

		if(cf.pt_active.checked == true)
		{
			select_num = cf.serviceSelect.value;
			set_active_value(select_num,"Yes");
		}
		else
		{
			select_num = cf.serviceSelect.value;
			set_active_value(select_num,"No");
		}
	}
	else
	{

		for(var z=0;z < cf.sumEntry.value;z++)
		{
			
			if(cf.pt_active[z].checked == true)
			{

				select_num = cf.serviceSelect[z].value;
				set_active_value(select_num,"Yes");
			}
			else
			{

				select_num = cf.serviceSelect[z].value;
				set_active_value(select_num,"No");
			}
		}
	}
	cf.hidden_timeout.value = cf.fwpt_timeout.value;	
	cf.triggering_flag.value =1;
	cf.PortTriggering_SubmitFlag.value = 1;
	return true;
}
var rule_limit_str="<%tcWebApi_multilingual("1","rule_limit_str")%>";
var timeout_empty_str="<%tcWebApi_multilingual("1","timeout_empty_str")%>";
var timeout_invalid_str="<%tcWebApi_multilingual("1","timeout_invalid_str")%>";

function checkNum_before_add()
{
	if(reach_Max_flag=="1")
	{
		alert(rule_limit_str);
		return false;
	}
	else
		location.href="triggering_add.asp";
}

</script>
<input type="hidden" name="select_del">
<input type="hidden" name="edit_active">
<input type="hidden" name="edit_name">
<input type="hidden" name="edit_user">
<input type="hidden" name="edit_tsport">
<input type="hidden" name="edit_tprotocol">
<input type="hidden" name="edit_osport">
<input type="hidden" name="edit_oeport">
<input type="hidden" name="edit_oprotocol">
<input type="hidden" name="disable_trigger_on">
<INPUT type="HIDDEN" name="nextEntry">
<INPUT type="HIDDEN" name="sumEntry">
<INPUT type="hidden" name="PortTriggering_CanUseNumFlag" value="<%if TCWebAPI_get("portTriggering_setting", "canUseNum", "h") <> "N/A" then TCWebAPI_staticGet("portTriggering_setting", "canUseNum", "s") else asp_Write("20") end if %>">
<INPUT type="hidden" name="PortTriggering_SubmitFlag" >
<input type="hidden" name="select_entry_num">
<input type="hidden" name="del_flag">
<input type="hidden" name="triggering_flag">
<input type="hidden" name="rule1_active" value="N/A">
<input type="hidden" name="rule2_active" value="N/A">
<input type="hidden" name="rule3_active" value="N/A">
<input type="hidden" name="rule4_active" value="N/A">
<input type="hidden" name="rule5_active" value="N/A">
<input type="hidden" name="rule6_active" value="N/A">
<input type="hidden" name="rule7_active" value="N/A">
<input type="hidden" name="rule8_active" value="N/A">
<input type="hidden" name="rule9_active" value="N/A">
<input type="hidden" name="rule10_active" value="N/A">
<input type="hidden" name="rule11_active" value="N/A">
<input type="hidden" name="rule12_active" value="N/A">
<input type="hidden" name="rule13_active" value="N/A">
<input type="hidden" name="rule14_active" value="N/A">
<input type="hidden" name="rule15_active" value="N/A">
<input type="hidden" name="rule16_active" value="N/A">
<input type="hidden" name="rule17_active" value="N/A">
<input type="hidden" name="rule18_active" value="N/A">
<input type="hidden" name="rule19_active" value="N/A">
<input type="hidden" name="rule20_active" value="N/A">


<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_FW_trigger','select')">
	<B><%tcWebApi_multilingual("1","select_service_type_str")%></B>
	
	</a>
	</TD>
</TR>
<TR>
	<TD nowrap>
	<input type="radio" name="serv_type" id="serv_type" value="pf" onclick="doPortChange(0)"><%tcWebApi_multilingual("1","portforward_str")%>
	
	</TD>
</TR>
<TR>
	<TD nowrap><input type="radio" name="serv_type" id="serv_type" checked value="pt"><%tcWebApi_multilingual("1","porttrigger_str")%></TD>
</TR>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2>
	<input type="checkbox" name="fwpt_enable" id="fwpt_enable"><B><%tcWebApi_multilingual("1","dis_porttrigger_str")%></B>
	</TD>
</TR>
<TR>
	<TD nowrap><a tabindex=-1 href="javascript:loadhelp('_FW_trigger','pt_timeout')">
	<B><%tcWebApi_multilingual("1","timeout_part1_str")%></B><%tcWebApi_multilingual("1","timeout_part2_str")%>
	</TD></a>
	<TD nowrap>
<input type="text" name="fwpt_timeout" id="fwpt_timeout" size="5" maxlength="4" value="<%If tcWebApi_get("portTriggering_Common", "timeout", "h") <>"N/A" then tcWebApi_get("portTriggering_Common", "timeout", "s") end if%>" onKeyPress="return getkey('num', event)" onFocus="this.select();">
	</TD>
</TR>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
<TR>
	<TD nowrap><B><%tcWebApi_multilingual("1","porttrigger_table_str")%></B></TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<TABLE class=tables id="PortTrigger" border=0 cellpadding=2 cellspacing=0 width=100%>
	<TR class=table_header>
		<TD nowrap align=center>&nbsp; 	 	</TD>
		<TD nowrap align=center><span class="subhead"># </span></TD>
		<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("0","glbstr_enable")%></span></TD>
		<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","service_name_str")%></span></TD>
		<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","serveice_type_str")%></span></TD>
		<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","inbound_con_str")%></span></TD>
		<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","service_usr_str")%></span></TD>
		
	</TR>
	
<script>
var array_num=1;
var check_tmp;
for(var i=0;i<table_Data.length;i++)
{
	check_tmp = "";
	if(table_Data[i][2]=="N/A")
		continue;
		
	if( array_num %2 == 0 )
        document.write("<TR class=\"even_line\">");
    else
        document.write("<TR class=\"odd_line\">");		
	
	if(table_Data[i][1]=="Yes")
		check_tmp = "checked";
	document.write('<TD nowrap align=center><input type="radio" name="serviceSelect" id="service_select" value="'+i+'"></TD><TD nowrap align=center><span class="subhead">'+array_num+'</span></TD><TD nowrap align=center><input type="checkbox" name="pt_active"'+check_tmp+'></TD><TD nowrap align=center>'+table_Data[i][2]+'</TD><TD nowrap align=center>'+table_Data[i][4]+':'+table_Data[i][3]+'</TD><TD nowrap align=center>'+table_Data[i][7]+':'+table_Data[i][5]+'..'+table_Data[i][6]+'</TD><TD nowrap align=center>'+table_Data[i][8]+'</TD>');
	
	array_num++;
}
</script>
	</TABLE>
	</TD>
</TR>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2 align=center>
	<input class="add_bt" type="button" name="Add Service" id="service_add" value="<%tcWebApi_multilingual("1","add_service_str")%>" onClick="checkNum_before_add();">&nbsp;&nbsp;
	<input class="edit_bt" type="submit" name="Edit Service" id="service_edit" value="<%tcWebApi_multilingual("1","edit_service_str")%>" onClick="return check_triggering_edit(document.forms[0]);">&nbsp;&nbsp;
	<input class="delete_bt" type="submit" name="Delete Service" id="service_delete" value="<%tcWebApi_multilingual("1","del_service_str")%>" onClick="return check_triggering_del(document.forms[0]);">

	</TD>
</TR>
<TR><TD>&nbsp;</TD></TR>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
</TABLE>
</div>
<%tcWebApi_multilingual("2","_FW_trigger_help.asp")%>
</FORM>
</BODY>
</HTML>
