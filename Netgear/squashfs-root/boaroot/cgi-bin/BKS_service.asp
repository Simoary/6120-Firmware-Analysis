<%
IF request_Form("submit_flag") = "block_services_apply" then
	/* Block Service Change */
	tcWebApi_set("IpMacFilter_Common","Active","skeyword")
Elseif request_Form("submit_flag") = "block_services_del" then
	/* Block Service Del */
	tcWebApi_set("GUITemp_Entry0","IndexTmp","ruleSelect")
	tcWebApi_set("WebCurSet_Entry","ipfilter_id","ruleSelect")
	tcWebApi_Unset("IpMacFilter_Entry")
Elseif request_Form("submit_flag") <> "" then
	/* Block Service Add or Edit */
	if request_Form("submit_flag") = "block_services_edit" then	
		tcWebApi_set("GUITemp_Entry0","IndexTmp","IndexID")
		tcWebApi_set("WebCurSet_Entry","ipfilter_id","IndexID")
	end if
	
	tcWebApi_Unset("IpMacFilter_Entry")
	if request_Form("userdefined") <> "" then	
		tcWebApi_set("IpMacFilter_Entry","Name","userdefined")
	else
		tcWebApi_set("IpMacFilter_Entry","Name","hidden_userdefined")
	end if
	tcWebApi_set("IpMacFilter_Entry","Active","Active")
	tcWebApi_set("IpMacFilter_Entry","Interface","Interface")
	tcWebApi_set("IpMacFilter_Entry","Direction","Direction")
	tcWebApi_set("IpMacFilter_Entry","RuleType","RuleType")
	tcWebApi_set("IpMacFilter_Entry","SrcPort","SrcPort")
	tcWebApi_set("IpMacFilter_Entry","DesIPAddr","DUMMYIP")
	tcWebApi_set("IpMacFilter_Entry","DesIPMask","DUMMYIP")
	tcWebApi_set("IpMacFilter_Entry","DesPort","hidden_portstart")
	tcWebApi_set("IpMacFilter_Entry","DesPortEnd","hidden_portend")
	tcWebApi_set("IpMacFilter_Entry","DSCP","DSCP")
	tcWebApi_set("IpMacFilter_Entry","Protocol","hidden_protocol")
	tcWebApi_set("IpMacFilter_Entry","IPType","IPType")

	if request_Form("IPType") = "range" then
		tcWebApi_set("IpMacFilter_Entry","SrcIPAddr","iprange_start")
		tcWebApi_set("IpMacFilter_Entry","SrcIPAddrEnd","iprange_end")
	elseif request_Form("IPType") = "single" then
		tcWebApi_set("IpMacFilter_Entry","SrcIPAddr","only_ip")
		tcWebApi_set("IpMacFilter_Entry","SrcIPMask","SrcIPMask")
	else
		tcWebApi_set("IpMacFilter_Entry","SrcIPAddr","DUMMYIP")
		tcWebApi_set("IpMacFilter_Entry","SrcIPMask","DUMMYIP")
	end if	
End if
	tcWebApi_Commit("IpMacFilter_Entry")
%>

<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/block_services.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>
<script language=JavaScript>
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


var avaible_indexId=-1;	
for(var i=0;i<tableData.length;i++)
{
	if(tableData[i][1]=="N/A")
	{
		avaible_indexId = i;
		break;
	}
}
			
function add_service()
{
	var cf = document.forms[0];
	if(avaible_indexId == -1)
	{
		alert(alert_the_router_can_support_only20_str);
		return;
	}
	cf.AvaibleIndexID.value=avaible_indexId;
	cf.action="/cgi-bin/BKS_service_add.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
	cf.submit();
}	
</script>

<body bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/BKS_service.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="block_services">

<div class="page_title"><%tcWebApi_multilingual("1","block_services_str")%></div>
<div class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
		<input class="cancel_bt" name="Cancel" id="cancel" type="reset" value="<%tcWebApi_multilingual("0","glbstr_cancel")%>">&nbsp;&nbsp;
        <input class="apply_bt" name="Apply" id="apply" type="submit"  value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick="return check_block_services_apply(document.forms[0])">
		</TD>
</TR>
</TABLE>
</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>
<input type="hidden" name="select_edit">
<input type="hidden" name="select_del">
<input type="hidden" name="AvaibleIndexID" value="0">
<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_BKS_servic','block')"><B><%tcWebApi_multilingual("1","services_blocking_str")%></B></A>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type='radio' name='skeyword' id="skeyword" value='Never' <%if tcWebApi_get("IpMacFilter_Common", "Active", "h") = "N/A" then asp_write("checked") elseif tcWebApi_get("IpMacFilter_Common", "Active", "h") = "Never" then asp_write("checked") elseif tcWebApi_get("IpMacFilter_Common", "Active", "h") = "" then asp_write("checked") end if%>><%tcWebApi_multilingual("1","never_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="skeyword" id="skeyword" value="Perschedule" <%if tcWebApi_get("IpMacFilter_Common", "Active", "h") = "Perschedule" then asp_write("checked") end if%>><%tcWebApi_multilingual("1","per_schedule_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type=radio name="skeyword" id="skeyword" value="Always" <%if tcWebApi_get("IpMacFilter_Common", "Active", "h") = "Always" then asp_write("checked") end if%>><%tcWebApi_multilingual("1","always_str")%>
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_BKS_servic','table')"><B><%tcWebApi_multilingual("1","service_table_str")%></B></A>
	</TD>
</TR>
<TR>
	<TD  nowrap colspan=2>
	<TABLE id="services_table" class=tables border=0 cellpadding=2 cellspacing=0 width=100%>
	<TR class=table_header>
	<TD nowrap align=center width=20%>&nbsp; </TD>
	<TD nowrap align=center><span class="subhead">#</span></TD>
	<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","service_tyep_str")%></span></TD>
	<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","port_str")%></span></TD>
	<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","ip_str")%></span></TD>
	</TR>
<script>
var array_num=0;
for(var i=0;i<tableData.length;i++)
{
	if(tableData[i][1]=="N/A")
		continue;
		
	if( array_num %2 == 0 )
        document.write("<TR class=\"even_line\">");
    else
        document.write("<TR class=\"odd_line\">");		

	document.write('<TD nowrap align=center><input type="radio" name="ruleSelect" id="service_select" value="'+i+'"></TD><TD nowrap align=center><span class="subhead">'+array_num+'</span></TD><TD nowrap align=center>'+tableData[i][2]+'</TD><TD nowrap align=center>'+tableData[i][3]+'</TD><TD nowrap align=center>'+tableData[i][4]+'</TD></TR>');
	array_num++;
}
</script>
	</TABLE>
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2 align=center>
	<input class="add_bt" name="Add" id="add" type="button" value="<%tcWebApi_multilingual("0","glbstr_add")%>" onClick="add_service();return false;">&nbsp;&nbsp;
	<input class="edit_bt" name="Edit" id="edit" type="button" value="<%tcWebApi_multilingual("0","glbstr_edit")%>" onClick="return check_block_services_edit(document.forms[0]);">&nbsp;&nbsp;
	<input class="delete_bt" name="Delete" id="delete" type="button" value="<%tcWebApi_multilingual("0","glbstr_delete")%>" onClick="return check_block_services_del(document.forms[0]);">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</TABLE>
</div>
<%tcWebApi_multilingual("2","_BKS_servic_help.asp")%>
</FORM>
</BODY>
</HTML>
