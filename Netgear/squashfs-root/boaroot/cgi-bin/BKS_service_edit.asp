
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/block_services.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/BKS_service.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="block_services_edit">

<div class="page_title"><%tcWebApi_multilingual("1","block_services_setup_str")%></div>
<div class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
		<input class="cancel_bt" name="Cancel" id="cancel" type="button" value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick='location.href="BKS_service.asp";'>&nbsp;&nbsp;
		<input class="apply_bt" name="apply" id="apply" type="submit" value="<%tcWebApi_multilingual("0","glbstr_accept")%>" onClick="return check_block_services_add(document.forms[0],'edit')">
		</TD>
</TR>
</TABLE>

</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>
<script>
var alert_the_router_can_support_only20_str="<%tcWebApi_multilingual("1","alert_the_router_can_support_only20_str")%>";
var alert_invalid_starting_str="<%tcWebApi_multilingual("1","alert_invalid_starting_str")%>";
var alert_invalid_starting_port_str="<%tcWebApi_multilingual("1","alert_invalid_starting_port_str")%>";
var alert_invalid_ending_port_str="<%tcWebApi_multilingual("1","alert_invalid_ending_port_str")%>";
var alert_ending_port_should_greater_str="<%tcWebApi_multilingual("1","alert_ending_port_should_greater_str")%>";
var alert_invalid_user_define_str="<%tcWebApi_multilingual("1","alert_invalid_user_define_str")%>";
var alert_invalid_user_define_servicetype_str="<%tcWebApi_multilingual("1","alert_invalid_user_define_servicetype_str")%>";
var alert_the_blocked_service_already_exist_str="<%tcWebApi_multilingual("1","alert_the_blocked_service_already_exist_str")%>";
var alert_you_could_not_add_same_rule_str="<%tcWebApi_multilingual("1","alert_you_could_not_add_same_rule_str")%>";
var alert_invalid_ip_address_str="<%tcWebApi_multilingual("1","alert_invalid_ip_address_str")%>";
var alert_this_ip_should_be_in_the_same_subnet_str="<%tcWebApi_multilingual("1","alert_this_ip_should_be_in_the_same_subnet_str")%>";
var alert_invalid_ip_range_str="<%tcWebApi_multilingual("1","alert_invalid_ip_range_str")%>";
var alert_starting_ip_should_be_inthesame_subnet_str="<%tcWebApi_multilingual("1","alert_starting_ip_should_be_inthesame_subnet_str")%>";
var alert_ending_ip_should_be_inthesame_subnet_str="<%tcWebApi_multilingual("1","alert_ending_ip_should_be_inthesame_subnet_str")%>";
var array_num=0;

var tableData = [
["1","<%tcWebApi_get("IpMacFilter_Entry0", "Active","s")%>","<%tcWebApi_get("IpMacFilter_Entry0", "Name","s")%>","<%tcWebApi_get("IpMacFilter_Entry0", "DesPort","s") if tcWebApi_get("IpMacFilter_Entry0", "DesPortEnd","h") <> "N/A" then asp_write("-") tcWebApi_get("IpMacFilter_Entry0", "DesPortEnd","s") end if%>","<%if tcWebApi_get("IpMacFilter_Entry0", "IPType","h") = "single" then tcWebApi_get("IpMacFilter_Entry0", "SrcIPAddr","s") elseif tcWebApi_get("IpMacFilter_Entry0", "IPType","h") = "range" then tcWebApi_get("IpMacFilter_Entry0", "SrcIPAddr","s") asp_write("-") tcWebApi_get("IpMacFilter_Entry0", "SrcIPAddrEnd","s") else asp_write("all") end if%>","<%tcWebApi_get("IpMacFilter_Entry0", "Protocol","s")%>"],
["2","<%tcWebApi_get("IpMacFilter_Entry1", "Active","s")%>","<%tcWebApi_get("IpMacFilter_Entry1", "Name","s")%>","<%tcWebApi_get("IpMacFilter_Entry1", "DesPort","s") if tcWebApi_get("IpMacFilter_Entry1", "DesPortEnd","h") <> "N/A" then asp_write("-") tcWebApi_get("IpMacFilter_Entry1", "DesPortEnd","s") end if%>","<%if tcWebApi_get("IpMacFilter_Entry1", "IPType","h") = "single" then tcWebApi_get("IpMacFilter_Entry1", "SrcIPAddr","s") elseif tcWebApi_get("IpMacFilter_Entry1", "IPType","h") = "range" then tcWebApi_get("IpMacFilter_Entry1", "SrcIPAddr","s") asp_write("-") tcWebApi_get("IpMacFilter_Entry1", "SrcIPAddrEnd","s") else asp_write("all") end if%>","<%tcWebApi_get("IpMacFilter_Entry1", "Protocol","s")%>"],
["3","<%tcWebApi_get("IpMacFilter_Entry2", "Active","s")%>","<%tcWebApi_get("IpMacFilter_Entry2", "Name","s")%>","<%tcWebApi_get("IpMacFilter_Entry2", "DesPort","s") if tcWebApi_get("IpMacFilter_Entry2", "DesPortEnd","h") <> "N/A" then asp_write("-") tcWebApi_get("IpMacFilter_Entry2", "DesPortEnd","s") end if%>","<%if tcWebApi_get("IpMacFilter_Entry2", "IPType","h") = "single" then tcWebApi_get("IpMacFilter_Entry2", "SrcIPAddr","s") elseif tcWebApi_get("IpMacFilter_Entry2", "IPType","h") = "range" then tcWebApi_get("IpMacFilter_Entry2", "SrcIPAddr","s") asp_write("-") tcWebApi_get("IpMacFilter_Entry2", "SrcIPAddrEnd","s") else asp_write("all") end if%>","<%tcWebApi_get("IpMacFilter_Entry2", "Protocol","s")%>"],
["4","<%tcWebApi_get("IpMacFilter_Entry3", "Active","s")%>","<%tcWebApi_get("IpMacFilter_Entry3", "Name","s")%>","<%tcWebApi_get("IpMacFilter_Entry3", "DesPort","s") if tcWebApi_get("IpMacFilter_Entry3", "DesPortEnd","h") <> "N/A" then asp_write("-") tcWebApi_get("IpMacFilter_Entry3", "DesPortEnd","s") end if%>","<%if tcWebApi_get("IpMacFilter_Entry3", "IPType","h") = "single" then tcWebApi_get("IpMacFilter_Entry3", "SrcIPAddr","s") elseif tcWebApi_get("IpMacFilter_Entry3", "IPType","h") = "range" then tcWebApi_get("IpMacFilter_Entry3", "SrcIPAddr","s") asp_write("-") tcWebApi_get("IpMacFilter_Entry3", "SrcIPAddrEnd","s") else asp_write("all") end if%>","<%tcWebApi_get("IpMacFilter_Entry3", "Protocol","s")%>"],
["5","<%tcWebApi_get("IpMacFilter_Entry4", "Active","s")%>","<%tcWebApi_get("IpMacFilter_Entry4", "Name","s")%>","<%tcWebApi_get("IpMacFilter_Entry4", "DesPort","s") if tcWebApi_get("IpMacFilter_Entry4", "DesPortEnd","h") <> "N/A" then asp_write("-") tcWebApi_get("IpMacFilter_Entry4", "DesPortEnd","s") end if%>","<%if tcWebApi_get("IpMacFilter_Entry4", "IPType","h") = "single" then tcWebApi_get("IpMacFilter_Entry4", "SrcIPAddr","s") elseif tcWebApi_get("IpMacFilter_Entry4", "IPType","h") = "range" then tcWebApi_get("IpMacFilter_Entry4", "SrcIPAddr","s") asp_write("-") tcWebApi_get("IpMacFilter_Entry4", "SrcIPAddrEnd","s") else asp_write("all") end if%>","<%tcWebApi_get("IpMacFilter_Entry4", "Protocol","s")%>"],
["6","<%tcWebApi_get("IpMacFilter_Entry5", "Active","s")%>","<%tcWebApi_get("IpMacFilter_Entry5", "Name","s")%>","<%tcWebApi_get("IpMacFilter_Entry5", "DesPort","s") if tcWebApi_get("IpMacFilter_Entry5", "DesPortEnd","h") <> "N/A" then asp_write("-") tcWebApi_get("IpMacFilter_Entry5", "DesPortEnd","s") end if%>","<%if tcWebApi_get("IpMacFilter_Entry5", "IPType","h") = "single" then tcWebApi_get("IpMacFilter_Entry5", "SrcIPAddr","s") elseif tcWebApi_get("IpMacFilter_Entry5", "IPType","h") = "range" then tcWebApi_get("IpMacFilter_Entry5", "SrcIPAddr","s") asp_write("-") tcWebApi_get("IpMacFilter_Entry5", "SrcIPAddrEnd","s") else asp_write("all") end if%>","<%tcWebApi_get("IpMacFilter_Entry5", "Protocol","s")%>"],
["7","<%tcWebApi_get("IpMacFilter_Entry6", "Active","s")%>","<%tcWebApi_get("IpMacFilter_Entry6", "Name","s")%>","<%tcWebApi_get("IpMacFilter_Entry6", "DesPort","s") if tcWebApi_get("IpMacFilter_Entry6", "DesPortEnd","h") <> "N/A" then asp_write("-") tcWebApi_get("IpMacFilter_Entry6", "DesPortEnd","s") end if%>","<%if tcWebApi_get("IpMacFilter_Entry6", "IPType","h") = "single" then tcWebApi_get("IpMacFilter_Entry6", "SrcIPAddr","s") elseif tcWebApi_get("IpMacFilter_Entry6", "IPType","h") = "range" then tcWebApi_get("IpMacFilter_Entry6", "SrcIPAddr","s") asp_write("-") tcWebApi_get("IpMacFilter_Entry6", "SrcIPAddrEnd","s") else asp_write("all") end if%>","<%tcWebApi_get("IpMacFilter_Entry6", "Protocol","s")%>"],
["8","<%tcWebApi_get("IpMacFilter_Entry7", "Active","s")%>","<%tcWebApi_get("IpMacFilter_Entry7", "Name","s")%>","<%tcWebApi_get("IpMacFilter_Entry7", "DesPort","s") if tcWebApi_get("IpMacFilter_Entry7", "DesPortEnd","h") <> "N/A" then asp_write("-") tcWebApi_get("IpMacFilter_Entry7", "DesPortEnd","s") end if%>","<%if tcWebApi_get("IpMacFilter_Entry7", "IPType","h") = "single" then tcWebApi_get("IpMacFilter_Entry7", "SrcIPAddr","s") elseif tcWebApi_get("IpMacFilter_Entry7", "IPType","h") = "range" then tcWebApi_get("IpMacFilter_Entry7", "SrcIPAddr","s") asp_write("-") tcWebApi_get("IpMacFilter_Entry7", "SrcIPAddrEnd","s") else asp_write("all") end if%>","<%tcWebApi_get("IpMacFilter_Entry7", "Protocol","s")%>"],
["9","<%tcWebApi_get("IpMacFilter_Entry8", "Active","s")%>","<%tcWebApi_get("IpMacFilter_Entry8", "Name","s")%>","<%tcWebApi_get("IpMacFilter_Entry8", "DesPort","s") if tcWebApi_get("IpMacFilter_Entry8", "DesPortEnd","h") <> "N/A" then asp_write("-") tcWebApi_get("IpMacFilter_Entry8", "DesPortEnd","s") end if%>","<%if tcWebApi_get("IpMacFilter_Entry8", "IPType","h") = "single" then tcWebApi_get("IpMacFilter_Entry8", "SrcIPAddr","s") elseif tcWebApi_get("IpMacFilter_Entry8", "IPType","h") = "range" then tcWebApi_get("IpMacFilter_Entry8", "SrcIPAddr","s") asp_write("-") tcWebApi_get("IpMacFilter_Entry8", "SrcIPAddrEnd","s") else asp_write("all") end if%>","<%tcWebApi_get("IpMacFilter_Entry8", "Protocol","s")%>"],
["10","<%tcWebApi_get("IpMacFilter_Entry9", "Active","s")%>","<%tcWebApi_get("IpMacFilter_Entry9", "Name","s")%>","<%tcWebApi_get("IpMacFilter_Entry9", "DesPort","s") if tcWebApi_get("IpMacFilter_Entry9", "DesPortEnd","h") <> "N/A" then asp_write("-") tcWebApi_get("IpMacFilter_Entry9", "DesPortEnd","s") end if%>","<%if tcWebApi_get("IpMacFilter_Entry9", "IPType","h") = "single" then tcWebApi_get("IpMacFilter_Entry9", "SrcIPAddr","s") elseif tcWebApi_get("IpMacFilter_Entry9", "IPType","h") = "range" then tcWebApi_get("IpMacFilter_Entry9", "SrcIPAddr","s") asp_write("-") tcWebApi_get("IpMacFilter_Entry9", "SrcIPAddrEnd","s") else asp_write("all") end if%>","<%tcWebApi_get("IpMacFilter_Entry9", "Protocol","s")%>"],
["11","<%tcWebApi_get("IpMacFilter_Entry10", "Active","s")%>","<%tcWebApi_get("IpMacFilter_Entry10", "Name","s")%>","<%tcWebApi_get("IpMacFilter_Entry10", "DesPort","s") if tcWebApi_get("IpMacFilter_Entry10", "DesPortEnd","h") <> "N/A" then asp_write("-") tcWebApi_get("IpMacFilter_Entry10", "DesPortEnd","s") end if%>","<%if tcWebApi_get("IpMacFilter_Entry10", "IPType","h") = "single" then tcWebApi_get("IpMacFilter_Entry10", "SrcIPAddr","s") elseif tcWebApi_get("IpMacFilter_Entry10", "IPType","h") = "range" then tcWebApi_get("IpMacFilter_Entry10", "SrcIPAddr","s") asp_write("-") tcWebApi_get("IpMacFilter_Entry10", "SrcIPAddrEnd","s") else asp_write("all") end if%>","<%tcWebApi_get("IpMacFilter_Entry10", "Protocol","s")%>"],
["12","<%tcWebApi_get("IpMacFilter_Entry11", "Active","s")%>","<%tcWebApi_get("IpMacFilter_Entry11", "Name","s")%>","<%tcWebApi_get("IpMacFilter_Entry11", "DesPort","s") if tcWebApi_get("IpMacFilter_Entry11", "DesPortEnd","h") <> "N/A" then asp_write("-") tcWebApi_get("IpMacFilter_Entry11", "DesPortEnd","s") end if%>","<%if tcWebApi_get("IpMacFilter_Entry11", "IPType","h") = "single" then tcWebApi_get("IpMacFilter_Entry11", "SrcIPAddr","s") elseif tcWebApi_get("IpMacFilter_Entry11", "IPType","h") = "range" then tcWebApi_get("IpMacFilter_Entry11", "SrcIPAddr","s") asp_write("-") tcWebApi_get("IpMacFilter_Entry11", "SrcIPAddrEnd","s") else asp_write("all") end if%>","<%tcWebApi_get("IpMacFilter_Entry11", "Protocol","s")%>"],
["13","<%tcWebApi_get("IpMacFilter_Entry12", "Active","s")%>","<%tcWebApi_get("IpMacFilter_Entry12", "Name","s")%>","<%tcWebApi_get("IpMacFilter_Entry12", "DesPort","s") if tcWebApi_get("IpMacFilter_Entry12", "DesPortEnd","h") <> "N/A" then asp_write("-") tcWebApi_get("IpMacFilter_Entry12", "DesPortEnd","s") end if%>","<%if tcWebApi_get("IpMacFilter_Entry12", "IPType","h") = "single" then tcWebApi_get("IpMacFilter_Entry12", "SrcIPAddr","s") elseif tcWebApi_get("IpMacFilter_Entry12", "IPType","h") = "range" then tcWebApi_get("IpMacFilter_Entry12", "SrcIPAddr","s") asp_write("-") tcWebApi_get("IpMacFilter_Entry12", "SrcIPAddrEnd","s") else asp_write("all") end if%>","<%tcWebApi_get("IpMacFilter_Entry12", "Protocol","s")%>"],
["14","<%tcWebApi_get("IpMacFilter_Entry13", "Active","s")%>","<%tcWebApi_get("IpMacFilter_Entry13", "Name","s")%>","<%tcWebApi_get("IpMacFilter_Entry13", "DesPort","s") if tcWebApi_get("IpMacFilter_Entry13", "DesPortEnd","h") <> "N/A" then asp_write("-") tcWebApi_get("IpMacFilter_Entry13", "DesPortEnd","s") end if%>","<%if tcWebApi_get("IpMacFilter_Entry13", "IPType","h") = "single" then tcWebApi_get("IpMacFilter_Entry13", "SrcIPAddr","s") elseif tcWebApi_get("IpMacFilter_Entry13", "IPType","h") = "range" then tcWebApi_get("IpMacFilter_Entry13", "SrcIPAddr","s") asp_write("-") tcWebApi_get("IpMacFilter_Entry13", "SrcIPAddrEnd","s") else asp_write("all") end if%>","<%tcWebApi_get("IpMacFilter_Entry13", "Protocol","s")%>"],
["15","<%tcWebApi_get("IpMacFilter_Entry14", "Active","s")%>","<%tcWebApi_get("IpMacFilter_Entry14", "Name","s")%>","<%tcWebApi_get("IpMacFilter_Entry14", "DesPort","s") if tcWebApi_get("IpMacFilter_Entry14", "DesPortEnd","h") <> "N/A" then asp_write("-") tcWebApi_get("IpMacFilter_Entry14", "DesPortEnd","s") end if%>","<%if tcWebApi_get("IpMacFilter_Entry14", "IPType","h") = "single" then tcWebApi_get("IpMacFilter_Entry14", "SrcIPAddr","s") elseif tcWebApi_get("IpMacFilter_Entry14", "IPType","h") = "range" then tcWebApi_get("IpMacFilter_Entry14", "SrcIPAddr","s") asp_write("-") tcWebApi_get("IpMacFilter_Entry14", "SrcIPAddrEnd","s") else asp_write("all") end if%>","<%tcWebApi_get("IpMacFilter_Entry14", "Protocol","s")%>"],
["16","<%tcWebApi_get("IpMacFilter_Entry15", "Active","s")%>","<%tcWebApi_get("IpMacFilter_Entry15", "Name","s")%>","<%tcWebApi_get("IpMacFilter_Entry15", "DesPort","s") if tcWebApi_get("IpMacFilter_Entry15", "DesPortEnd","h") <> "N/A" then asp_write("-") tcWebApi_get("IpMacFilter_Entry15", "DesPortEnd","s") end if%>","<%if tcWebApi_get("IpMacFilter_Entry15", "IPType","h") = "single" then tcWebApi_get("IpMacFilter_Entry15", "SrcIPAddr","s") elseif tcWebApi_get("IpMacFilter_Entry15", "IPType","h") = "range" then tcWebApi_get("IpMacFilter_Entry15", "SrcIPAddr","s") asp_write("-") tcWebApi_get("IpMacFilter_Entry15", "SrcIPAddrEnd","s") else asp_write("all") end if%>","<%tcWebApi_get("IpMacFilter_Entry15", "Protocol","s")%>"],
["17","<%tcWebApi_get("IpMacFilter_Entry16", "Active","s")%>","<%tcWebApi_get("IpMacFilter_Entry16", "Name","s")%>","<%tcWebApi_get("IpMacFilter_Entry16", "DesPort","s") if tcWebApi_get("IpMacFilter_Entry16", "DesPortEnd","h") <> "N/A" then asp_write("-") tcWebApi_get("IpMacFilter_Entry16", "DesPortEnd","s") end if%>","<%if tcWebApi_get("IpMacFilter_Entry16", "IPType","h") = "single" then tcWebApi_get("IpMacFilter_Entry16", "SrcIPAddr","s") elseif tcWebApi_get("IpMacFilter_Entry16", "IPType","h") = "range" then tcWebApi_get("IpMacFilter_Entry16", "SrcIPAddr","s") asp_write("-") tcWebApi_get("IpMacFilter_Entry16", "SrcIPAddrEnd","s") else asp_write("all") end if%>","<%tcWebApi_get("IpMacFilter_Entry16", "Protocol","s")%>"],
["18","<%tcWebApi_get("IpMacFilter_Entry17", "Active","s")%>","<%tcWebApi_get("IpMacFilter_Entry17", "Name","s")%>","<%tcWebApi_get("IpMacFilter_Entry17", "DesPort","s") if tcWebApi_get("IpMacFilter_Entry17", "DesPortEnd","h") <> "N/A" then asp_write("-") tcWebApi_get("IpMacFilter_Entry17", "DesPortEnd","s") end if%>","<%if tcWebApi_get("IpMacFilter_Entry17", "IPType","h") = "single" then tcWebApi_get("IpMacFilter_Entry17", "SrcIPAddr","s") elseif tcWebApi_get("IpMacFilter_Entry17", "IPType","h") = "range" then tcWebApi_get("IpMacFilter_Entry17", "SrcIPAddr","s") asp_write("-") tcWebApi_get("IpMacFilter_Entry17", "SrcIPAddrEnd","s") else asp_write("all") end if%>","<%tcWebApi_get("IpMacFilter_Entry17", "Protocol","s")%>"],
["19","<%tcWebApi_get("IpMacFilter_Entry18", "Active","s")%>","<%tcWebApi_get("IpMacFilter_Entry18", "Name","s")%>","<%tcWebApi_get("IpMacFilter_Entry18", "DesPort","s") if tcWebApi_get("IpMacFilter_Entry18", "DesPortEnd","h") <> "N/A" then asp_write("-") tcWebApi_get("IpMacFilter_Entry18", "DesPortEnd","s") end if%>","<%if tcWebApi_get("IpMacFilter_Entry18", "IPType","h") = "single" then tcWebApi_get("IpMacFilter_Entry18", "SrcIPAddr","s") elseif tcWebApi_get("IpMacFilter_Entry18", "IPType","h") = "range" then tcWebApi_get("IpMacFilter_Entry18", "SrcIPAddr","s") asp_write("-") tcWebApi_get("IpMacFilter_Entry18", "SrcIPAddrEnd","s") else asp_write("all") end if%>","<%tcWebApi_get("IpMacFilter_Entry18", "Protocol","s")%>"],
["20","<%tcWebApi_get("IpMacFilter_Entry19", "Active","s")%>","<%tcWebApi_get("IpMacFilter_Entry19", "Name","s")%>","<%tcWebApi_get("IpMacFilter_Entry19", "DesPort","s") if tcWebApi_get("IpMacFilter_Entry19", "DesPortEnd","h") <> "N/A" then asp_write("-") tcWebApi_get("IpMacFilter_Entry19", "DesPortEnd","s") end if%>","<%if tcWebApi_get("IpMacFilter_Entry19", "IPType","h") = "single" then tcWebApi_get("IpMacFilter_Entry19", "SrcIPAddr","s") elseif tcWebApi_get("IpMacFilter_Entry19", "IPType","h") = "range" then tcWebApi_get("IpMacFilter_Entry19", "SrcIPAddr","s") asp_write("-") tcWebApi_get("IpMacFilter_Entry19", "SrcIPAddrEnd","s") else asp_write("all") end if%>","<%tcWebApi_get("IpMacFilter_Entry19", "Protocol","s")%>"]
];

var url=window.location.toString();
var editId= parseInt(url.split("?")[1].split("=")[1]);

function loadvalue()
{
	var cf=document.forms[0];
	
	cf.IndexID.value = editId;
	cf.userdefined.value = tableData[editId][2];
	
	ayechange_radio(tableData[editId][2],cf);
	if(tableData[editId][5]=="BOTH")
		cf.protocol.value= "TCP/UDP"
	else
		cf.protocol.value= tableData[editId][5];
		
	if(tableData[editId][3].indexOf("-")!=-1)
	{
		var getPortRange = tableData[editId][3].split('-');
		cf.portstart.value = getPortRange[0];
		cf.portend.value = getPortRange[1];
	}else
	{
		cf.portstart.value = tableData[editId][3];
		cf.portend.value = tableData[editId][3];
	}
	
	if(tableData[editId][4]=="all")
	{
		cf.iptype[2].checked =true;
		change_radio(2,document.forms[0])
	}
	else
	{
		var ip_array="";
		var each_ipvalue="";
		if(tableData[editId][4].indexOf("-")!=-1)
		{
			cf.iptype[1].checked =true;
			change_radio(1,document.forms[0])
			
			ip_array=tableData[editId][4].split('-');
			each_ipvalue = ip_array[0].split('.');
			cf.f_startip1.value=each_ipvalue[0];
			cf.f_startip2.value=each_ipvalue[1];
			cf.f_startip3.value=each_ipvalue[2];
			cf.f_startip4.value=each_ipvalue[3];
			
			each_ipvalue = ip_array[1].split('.');
			cf.f_endip1.value=each_ipvalue[0];
			cf.f_endip2.value=each_ipvalue[1];
			cf.f_endip3.value=each_ipvalue[2];
			cf.f_endip4.value=each_ipvalue[3];
		}
		else
		{
			ip_array=tableData[editId][4];
			each_ipvalue = ip_array.split('.');
			cf.f_pcip1.value=each_ipvalue[0];
			cf.f_pcip2.value=each_ipvalue[1];
			cf.f_pcip3.value=each_ipvalue[2];
			cf.f_pcip4.value=each_ipvalue[3];
			cf.iptype[0].checked =true;
			change_radio(0,document.forms[0])
		}
	}
}
</script>
<input type="hidden" name="iplist">
<input type="hidden" name="hidden_protocol">
<input type="hidden" name="hidden_portstart">
<input type="hidden" name="hidden_portend">
<input type="hidden" name="hidden_userdefined">
<input type="hidden" name="iprange_start">
<input type="hidden" name="iprange_end">
<input type="hidden" name="only_ip">
<input type="hidden" name="Active" value="Yes">
<input type="hidden" name="Interface" value="ALL">
<input type="hidden" name="Direction" value="Outgoing">
<input type="hidden" name="RuleType" value="IP">
<input type="hidden" name="DUMMYIP" value="0.0.0.0">
<input type="hidden" name="DSCP" value="64">
<input type="hidden" name="IPType" value="">
<input type="hidden" name="SrcIPMask" value="255.255.255.255">
<input type="hidden" name="SrcPort" value="0">
<input type="hidden" name="IndexID" value="0">
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","service_type_str")%></TD>
	<TD nowrap>
	<select name="service_type" id="service_type" size="1" onchange="chg_by_service(0,document.forms[0]);">
		<option value="User_Defined"><%tcWebApi_multilingual("1","user_defined_str")%></option>
		<option value="Any">Any</option>
		<option value="Any(TCP)">Any(TCP)</option>
		<option value="Any(UDP)">Any(UDP)</option>
		<option value="AIM">AIM</option>
<!--		<option value="AIM6.x/SSL">AIM6.x/SSL</option> -->
		<option value="Age-of-Empire">Age-of-Empire</option>
                <option value="BGP">BGP</option>
                <option value="BOOTP-CLIENT">BOOTP-CLIENT</option>
                <option value="BOOTP-SERVER">BOOTP-SERVER</option>
                <option value="CU-SEEME">CU-SEEME</option>
                <option value="DNS">DNS</option>
                <option value="FINGER">FINGER</option>
                <option value="FTP">FTP</option>
                <option value="H.323">H.323</option>
                <option value="HTTP">HTTP</option>
                <option value="HTTPS">HTTPS</option>
                <option value="ICUII">ICUII</option>
                <option value="IDENT">IDENT</option>
                <option value="IP_Phone">IP_Phone</option>
                <option value="IRC">IRC</option>
                <option value="NetMeeting">NetMeeting</option>
                <option value="NFS">NFS</option>
                <option value="News">News</option>
                <option value="PPTP">PPTP</option>
                <option value="QuakeII/III">QuakeII/III</option>
                <option value="RCMD">RCMD</option>
                <option value="Real-Audio">Real-Audio</option>
                <option value="REXEC">REXEC</option>
                <option value="RLOGIN">RLOGIN</option>
                <option value="RTELNET">RTELNET</option>
                <option value="RTSP">RTSP</option>
                <option value="SFTP">SFTP</option>
                <option value="SMTP">SMTP</option>
                <option value="SNMP">SNMP</option>
                <option value="SNMP_TRAPS">SNMP-TRAPS</option>
                <option value="SQL-NET">SQL-NET</option>
                <option value="SSH">SSH</option>
                <option value="STRMWORKS">STRMWORKS</option>
                <option value="TACACS">TACACS</option>
                <option value="Telnet">Telnet</option>
                <option value="TFTP">TFTP</option>
                <option value="VDOLIVE">VDOLIVE</option>
                <option value="VPN-IPSEC">VPN-IPSEC</option>
                <option value="VPN-L2TP">VPN-L2TP</option>
                <option value="VPN-PPTP">VPN-PPTP</option>
	</select>
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","protocol_str")%></TD>	
	<TD nowrap>
	<select NAME="protocol" id="protocol" size="1" >
		<option value="TCP">TCP</option>
		<option value="UDP">UDP</option>
		<option value="TCP/UDP">TCP/UDP</option>
	</select>
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","start_port_str")%></TD>
	<TD nowrap>
	<input type="text" name="portstart" id="port_start" size="7" maxlength="5" onKeyPress="return getkey('num', event)">(1~65535)
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","end_port_str")%></TD>
	<TD nowrap>
	<input type="text" name="portend" id="port_end" size="7" maxlength="5" onKeyPress="return getkey('num', event)">(1~65535)
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","service_type_user_defined_str")%></TD>
	<TD nowrap>
	<input type="text" name="userdefined" id="user_defined_name" size="20" maxlength="30">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_BKS_service_edit','ip')"><B><%tcWebApi_multilingual("1","filter_services_for_str")%> :</B></A>
	</TD>
</TR>
<TR>
	<TD nowrap>
	<input type="radio" name="iptype" id="filter_ip_type" value="Only This IP" onClick="change_radio(0,document.forms[0])"><%tcWebApi_multilingual("1","only_this_ip_address_str")%>:
	</TD>
	<TD nowrap>
	<input type="text" name="f_pcip1" id="single_ipaddress1" disabled size="3" maxlength="3" onFocus="this.select();" onKeyPress="return getkey('num',event)" >.
	<input type="text" name="f_pcip2" id="single_ipaddress2" disabled size="3" maxlength="3" onFocus="this.select();" onKeyPress="return getkey('num',event)">.
	<input type="text" name="f_pcip3" id="single_ipaddress3" disabled size="3" maxlength="3" onFocus="this.select();" onKeyPress="return getkey('num',event)">.
	<input type="text" name="f_pcip4" id="single_ipaddress4" size="3" maxlength="3" onFocus="this.select();" onKeyPress="return getkey('num',event)">
	</TD>
</TR>
<TR>
	<TD nowrap><BR>
	<input type="radio" name="iptype" id="filter_ip_type" value="IP Address Range" onClick="change_radio(1,document.forms[0])"><%tcWebApi_multilingual("1","ip_address_range_str")%>:
	</TD>
	<TD nowrap><BR>
	<input type="text" name="f_startip1" id="range_start_ipaddress1" disabled size="3" maxlength="3" onFocus="this.select();" onKeyPress="return getkey('num',event)" >.
	<input type="text" name="f_startip2" id="range_start_ipaddress2" disabled size="3" maxlength="3" onFocus="this.select();" onKeyPress="return getkey('num',event)">.
	<input type="text" name="f_startip3" id="range_start_ipaddress3" disabled size="3" maxlength="3" onFocus="this.select();" onKeyPress="return getkey('num',event)">.
	<input type="text" name="f_startip4" id="range_start_ipaddress4" size="3" maxlength="3" onFocus="this.select();" onKeyPress="return getkey('num',event)">
	</TD>
</TR>
<TR>
	<TD nowrap align=right>to&nbsp;</TD>
	<TD nowrap>
	<input type="text" name="f_endip1" id="range_end_ipaddress1" disabled size="3" maxlength="3" onFocus="this.select();" onKeyPress="return getkey('num',event)" >.
	<input type="text" name="f_endip2" id="range_end_ipaddress2" disabled size="3" maxlength="3" onFocus="this.select();" onKeyPress="return getkey('num',event)">.
	<input type="text" name="f_endip3" id="range_end_ipaddress3" disabled size="3" maxlength="3" onFocus="this.select();" onKeyPress="return getkey('num',event)">.
	<input type="text" name="f_endip4" id="range_end_ipaddress4" size="3" maxlength="3" onFocus="this.select();" onKeyPress="return getkey('num',event)">
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" checked name="iptype" id="filter_ip_type" value="All IP Addresses" onClick="change_radio(2,document.forms[0])"><%tcWebApi_multilingual("1","all_ip_addresses_str")%>
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</TABLE>
</div>
<%tcWebApi_multilingual("2","_BKS_service_edit_help.asp")%>
<script>
var cf=document.forms[0];
var lan_ip='<% tcWebApi_get("Lan_Entry0","IP","s"); %>';
var lan_subnet='<% tcWebApi_get("Lan_Entry0","netmask","s"); %>';
var lanip_array = lan_ip.split(".");
cf.f_pcip1.value=cf.f_startip1.value=cf.f_endip1.value=lanip_array[0];
cf.f_pcip2.value=cf.f_startip2.value=cf.f_endip2.value=lanip_array[1];
cf.f_pcip3.value=cf.f_startip3.value=cf.f_endip3.value=lanip_array[2];
</script>
</FORM>
</BODY>
</HTML>
