<%
if Request_form("delnum") <> "" then
		tcWebApi_set("WebCurSet_Entry","route_id","delnum")
		tcWebApi_unset("Route_Entry")
		tcWebApi_commit("Route_Entry")
end if
%>
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/STR_routes.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="st_router_del">
<input type="hidden" name="Route_num" value="<%TcWebApi_get("Route","Route_num","s")%>">
<INPUT TYPE="HIDDEN" NAME="delnum">
<INPUT TYPE="HIDDEN" NAME="editnum">
<INPUT TYPE="HIDDEN" NAME="user_def_num" value="<%TcWebApi_get("Route","User_def_num","s")%>">
<INPUT TYPE="HIDDEN" NAME="add_num" value="<%TcWebApi_get("Route","add_num","s")%>">

<input type="hidden" name="select_edit">
<input type="hidden" name="select_del">

<div class="page_title"><%tcWebApi_multilingual("1","route_title_str")%></div>
<div id="main" class="main"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>

<SCRIPT language=javascript>
var timestamp = "<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
var table_Data = [
["1","<%tcwebApi_staticGet("Route_Entry0","Name","s")%>","<%tcwebApi_staticGet("Route_Entry0","Active","s")%>","<%tcwebApi_staticGet("Route_Entry0","DST_IP","s")%>","<%tcwebApi_staticGet("Route_Entry0","Sub_mask","s")%>","<%tcwebApi_staticGet("Route_Entry0","Gateway","s")%>","<%tcwebApi_staticGet("Route_Entry0","metric","s")%>"],
["2","<%tcwebApi_staticGet("Route_Entry1","Name","s")%>","<%tcwebApi_staticGet("Route_Entry1","Active","s")%>","<%tcwebApi_staticGet("Route_Entry1","DST_IP","s")%>","<%tcwebApi_staticGet("Route_Entry1","Sub_mask","s")%>","<%tcwebApi_staticGet("Route_Entry1","Gateway","s")%>","<%tcwebApi_staticGet("Route_Entry1","metric","s")%>"],
["3","<%tcwebApi_staticGet("Route_Entry2","Name","s")%>","<%tcwebApi_staticGet("Route_Entry2","Active","s")%>","<%tcwebApi_staticGet("Route_Entry2","DST_IP","s")%>","<%tcwebApi_staticGet("Route_Entry2","Sub_mask","s")%>","<%tcwebApi_staticGet("Route_Entry2","Gateway","s")%>","<%tcwebApi_staticGet("Route_Entry2","metric","s")%>"],
["4","<%tcwebApi_staticGet("Route_Entry3","Name","s")%>","<%tcwebApi_staticGet("Route_Entry3","Active","s")%>","<%tcwebApi_staticGet("Route_Entry3","DST_IP","s")%>","<%tcwebApi_staticGet("Route_Entry3","Sub_mask","s")%>","<%tcwebApi_staticGet("Route_Entry3","Gateway","s")%>","<%tcwebApi_staticGet("Route_Entry3","metric","s")%>"],
["5","<%tcwebApi_staticGet("Route_Entry4","Name","s")%>","<%tcwebApi_staticGet("Route_Entry4","Active","s")%>","<%tcwebApi_staticGet("Route_Entry4","DST_IP","s")%>","<%tcwebApi_staticGet("Route_Entry4","Sub_mask","s")%>","<%tcwebApi_staticGet("Route_Entry4","Gateway","s")%>","<%tcwebApi_staticGet("Route_Entry4","metric","s")%>"],
["6","<%tcwebApi_staticGet("Route_Entry5","Name","s")%>","<%tcwebApi_staticGet("Route_Entry5","Active","s")%>","<%tcwebApi_staticGet("Route_Entry5","DST_IP","s")%>","<%tcwebApi_staticGet("Route_Entry5","Sub_mask","s")%>","<%tcwebApi_staticGet("Route_Entry5","Gateway","s")%>","<%tcwebApi_staticGet("Route_Entry5","metric","s")%>"],
["7","<%tcwebApi_staticGet("Route_Entry6","Name","s")%>","<%tcwebApi_staticGet("Route_Entry6","Active","s")%>","<%tcwebApi_staticGet("Route_Entry6","DST_IP","s")%>","<%tcwebApi_staticGet("Route_Entry6","Sub_mask","s")%>","<%tcwebApi_staticGet("Route_Entry6","Gateway","s")%>","<%tcwebApi_staticGet("Route_Entry6","metric","s")%>"],
["8","<%tcwebApi_staticGet("Route_Entry7","Name","s")%>","<%tcwebApi_staticGet("Route_Entry7","Active","s")%>","<%tcwebApi_staticGet("Route_Entry7","DST_IP","s")%>","<%tcwebApi_staticGet("Route_Entry7","Sub_mask","s")%>","<%tcwebApi_staticGet("Route_Entry7","Gateway","s")%>","<%tcwebApi_staticGet("Route_Entry7","metric","s")%>"],
["9","<%tcwebApi_staticGet("Route_Entry8","Name","s")%>","<%tcwebApi_staticGet("Route_Entry8","Active","s")%>","<%tcwebApi_staticGet("Route_Entry8","DST_IP","s")%>","<%tcwebApi_staticGet("Route_Entry8","Sub_mask","s")%>","<%tcwebApi_staticGet("Route_Entry8","Gateway","s")%>","<%tcwebApi_staticGet("Route_Entry8","metric","s")%>"],
["10","<%tcwebApi_staticGet("Route_Entry9","Name","s")%>","<%tcwebApi_staticGet("Route_Entry9","Active","s")%>","<%tcwebApi_staticGet("Route_Entry9","DST_IP","s")%>","<%tcwebApi_staticGet("Route_Entry9","Sub_mask","s")%>","<%tcwebApi_staticGet("Route_Entry9","Gateway","s")%>","<%tcwebApi_staticGet("Route_Entry9","metric","s")%>"],
["11","<%tcwebApi_staticGet("Route_Entry10","Name","s")%>","<%tcwebApi_staticGet("Route_Entry10","Active","s")%>","<%tcwebApi_staticGet("Route_Entry10","DST_IP","s")%>","<%tcwebApi_staticGet("Route_Entry10","Sub_mask","s")%>","<%tcwebApi_staticGet("Route_Entry10","Gateway","s")%>","<%tcwebApi_staticGet("Route_Entry10","metric","s")%>"],
["12","<%tcwebApi_staticGet("Route_Entry11","Name","s")%>","<%tcwebApi_staticGet("Route_Entry11","Active","s")%>","<%tcwebApi_staticGet("Route_Entry11","DST_IP","s")%>","<%tcwebApi_staticGet("Route_Entry11","Sub_mask","s")%>","<%tcwebApi_staticGet("Route_Entry11","Gateway","s")%>","<%tcwebApi_staticGet("Route_Entry11","metric","s")%>"],
["13","<%tcwebApi_staticGet("Route_Entry12","Name","s")%>","<%tcwebApi_staticGet("Route_Entry12","Active","s")%>","<%tcwebApi_staticGet("Route_Entry12","DST_IP","s")%>","<%tcwebApi_staticGet("Route_Entry12","Sub_mask","s")%>","<%tcwebApi_staticGet("Route_Entry12","Gateway","s")%>","<%tcwebApi_staticGet("Route_Entry12","metric","s")%>"],
["14","<%tcwebApi_staticGet("Route_Entry13","Name","s")%>","<%tcwebApi_staticGet("Route_Entry13","Active","s")%>","<%tcwebApi_staticGet("Route_Entry13","DST_IP","s")%>","<%tcwebApi_staticGet("Route_Entry13","Sub_mask","s")%>","<%tcwebApi_staticGet("Route_Entry13","Gateway","s")%>","<%tcwebApi_staticGet("Route_Entry13","metric","s")%>"],
["15","<%tcwebApi_staticGet("Route_Entry14","Name","s")%>","<%tcwebApi_staticGet("Route_Entry14","Active","s")%>","<%tcwebApi_staticGet("Route_Entry14","DST_IP","s")%>","<%tcwebApi_staticGet("Route_Entry14","Sub_mask","s")%>","<%tcwebApi_staticGet("Route_Entry14","Gateway","s")%>","<%tcwebApi_staticGet("Route_Entry14","metric","s")%>"],
["16","<%tcwebApi_staticGet("Route_Entry15","Name","s")%>","<%tcwebApi_staticGet("Route_Entry15","Active","s")%>","<%tcwebApi_staticGet("Route_Entry15","DST_IP","s")%>","<%tcwebApi_staticGet("Route_Entry15","Sub_mask","s")%>","<%tcwebApi_staticGet("Route_Entry15","Gateway","s")%>","<%tcwebApi_staticGet("Route_Entry15","metric","s")%>"]
];

function doUserDefNumCheck(){
	if(document.forms[0].user_def_num.value>=16){
		alert(routes_max_str);
		return false;
	}
	window.location='/cgi-bin/STR_routes_add.asp?add_num='+document.forms[0].add_num.value
	return true;
}
function doDelete()
 {
	var k;
	var find_flag = 0;
	
	if(document.forms[0].select.checked==true)
	{
		find_flag = 1;
		document.forms[0].delnum.value=document.forms[0].select.value;
		document.forms[0].submit();
	}
	else
	{
		for(k=0;k<document.forms[0].select.length;k++)
		{
			if(document.forms[0].select[k].checked==true)
			{
				find_flag = 1;
				document.forms[0].delnum.value=document.forms[0].select[k].value;
				document.forms[0].submit();
	
			}
		}
	}
	if(find_flag==0)
		alert(routes_del_error_str);
 	return true;
}
function doedit()
 {
	var j;
	var find_flag = 0;
	if(document.forms[0].select.checked==true)
	{
		find_flag = 1;
		document.forms[0].action="/cgi-bin/STR_routes_edit.asp?id="+ timestamp;
		document.forms[0].editnum.value=document.forms[0].select.value;
		document.forms[0].submit();
		
	}
	else
	for(j=0;j<document.forms[0].select.length;j++)
	{
		if(document.forms[0].select[j].checked==true)
		{
			find_flag = 1;
			document.forms[0].action="/cgi-bin/STR_routes_edit.asp?id="+ timestamp;
			document.forms[0].editnum.value=document.forms[0].select[j].value;
			document.forms[0].submit();
			break;
		}
	}
	if(find_flag==0)
		alert(routes_edit_error_str);
 	return true;
}
var routes_del_error_str="<%tcWebApi_multilingual("1","routes_del_error_str")%>";
var routes_edit_error_str="<%tcWebApi_multilingual("1","routes_edit_error_str")%>";
var routes_max_str="<%tcWebApi_multilingual("1","routes_max_str")%>";
</SCRIPT>


<TR>
	<TD nowrap colspan=2>
	<TABLE name="StaticRoutes" id="static_route" class=tables border=0 cellpadding=2 cellspacing=0 width=100%>
	<TR class=table_header>
	<TD nowrap align=center>&nbsp; </TD>
	<TD nowrap align=center><span class="subhead"> # </span></TD>
	<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","active_str")%></span></TD>
	<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","name_str")%></span></TD>
	<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","destination_str")%></span></TD>
	<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","gateway_str")%></span></TD>
	</TR>
	
<script>
var array_num=1;

for(var i=0;i<table_Data.length;i++)
{
	if(table_Data[i][2]=="N/A")
		continue;
		
	document.write('<TR><TD nowrap align=center><input type="radio" name="select" id="route_select" value="'+i+'"></TD><td align=center class=tabdata>'+array_num+'</td><td align=center class=tabdata>'+table_Data[i][2]+'</TD><TD nowrap align=center>'+table_Data[i][1]+'</TD><TD nowrap align=center>'+table_Data[i][3]+'</TD><TD nowrap align=center>'+table_Data[i][5]+'</TD></TR>');
	
	array_num++;
}
</script>

	</TABLE>
	</TD>
</TR>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
<TR>
	<TD nowrap align=center>
	<input class="add_bt" type="button" name="Add" id="add" value="<%tcWebApi_multilingual("0","glbstr_add")%>" onClick="return doUserDefNumCheck()">
	<input class="edit_bt" type="submit" name="Edit" id="edit" value="<%tcWebApi_multilingual("0","glbstr_edit")%>" onClick="return doedit();">
	<input class="delete_bt" type="submit" name="Delete" id="delete" value="<%tcWebApi_multilingual("0","glbstr_delete")%>" onClick="return doDelete();">
	</TD>
</TR>
</TABLE>
</div>
<%tcWebApi_multilingual("2","_STR_routes_help.asp")%>
</FORM>
</BODY>
</HTML>
