<%
	if Request_form("editnum") <> "" then
		tcWebApi_set("WebCurSet_Entry","route_id","editnum")
	end if

	if Request_form("EditFlag") = "1" then
		tcWebApi_unset("Route_Entry")
		tcWebApi_commit("Route_Entry")
		tcWebApi_set("Route_Entry","Active","RouteActive")
		tcWebApi_set("Route_Entry","Name","route_name")
		tcWebApi_set("Route_Entry","DST_IP","SRouteDestAddr")
		tcWebApi_set("Route_Entry","Sub_mask","SRouteSubnetMask")
		tcWebApi_set("Route_Entry","User_def","EditFlag")
		if Request_form("route_dev") <> "" then
			tcWebApi_set("Route_Entry","Device","route_dev")
		end if
		
		tcWebApi_set("Route_Entry","Gateway","SRouteGatewayAddr")
		
		tcWebApi_set("Route_Entry","metric","route_metric")
		tcWebApi_commit("WebCurSet_Entry")
		tcWebApi_commit("Route_Entry")
	end if
%>
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="onloadCheck();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/STR_routes_edit.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="st_router_edit">

<div class="page_title"><%tcWebApi_multilingual("1","str_route_title")%></div>
<div class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
			<input class="cancel_bt" type="reset" name="Cancel" id="cancel" value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick=javascript:window.location="/cgi-bin/STR_routes.asp">&nbsp;&nbsp;
			<input class="apply_bt" type="submit" name="Apply" id="apply" value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick="return doSubmit(1);">
        </TD>
</TR>
</TABLE>
</div>
<div id="main" class="main_top_button"> 
<table name="StaticRoutes" id="static_routers" width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>


<script>
<%if Request_form("EditFlag") = "1" then%>
window.location.href = "/cgi-bin/STR_routes.asp";
<%end if%>

var lan_ip="<%tcWebApi_get("Lan_Entry","IP","s")%>";
var lan_subnet="<%tcWebApi_get("Lan_Entry","netmask","s")%>";

var table_Data = [
"<%tcwebApi_staticGet("Route_Entry0","Name","s")%>",
"<%tcwebApi_staticGet("Route_Entry1","Name","s")%>",
"<%tcwebApi_staticGet("Route_Entry2","Name","s")%>",
"<%tcwebApi_staticGet("Route_Entry3","Name","s")%>",
"<%tcwebApi_staticGet("Route_Entry4","Name","s")%>",
"<%tcwebApi_staticGet("Route_Entry5","Name","s")%>",
"<%tcwebApi_staticGet("Route_Entry6","Name","s")%>",
"<%tcwebApi_staticGet("Route_Entry7","Name","s")%>",
"<%tcwebApi_staticGet("Route_Entry8","Name","s")%>",
"<%tcwebApi_staticGet("Route_Entry9","Name","s")%>",
"<%tcwebApi_staticGet("Route_Entry10","Name","s")%>",
"<%tcwebApi_staticGet("Route_Entry11","Name","s")%>",
"<%tcwebApi_staticGet("Route_Entry12","Name","s")%>",
"<%tcwebApi_staticGet("Route_Entry13","Name","s")%>",
"<%tcwebApi_staticGet("Route_Entry14","Name","s")%>",
"<%tcwebApi_staticGet("Route_Entry15","Name","s")%>"
];

function onloadCheck()
{
	var addr_array1 = new Array()
	var addr_array2 = new Array()
	var addr_array3 = new Array()
	
	addr_array1 = document.forms[0].SRouteDestAddr.value.split('.');
	document.forms[0].SRouteDestAddr1.value = addr_array1[0];
	document.forms[0].SRouteDestAddr2.value = addr_array1[1];
	document.forms[0].SRouteDestAddr3.value = addr_array1[2];
	document.forms[0].SRouteDestAddr4.value = addr_array1[3];
	
	addr_array2 = document.forms[0].SRouteSubnetMask.value.split('.');
	document.forms[0].SRouteSubnetMask1.value = addr_array2[0];
	document.forms[0].SRouteSubnetMask2.value = addr_array2[1];
	document.forms[0].SRouteSubnetMask3.value = addr_array2[2];
	document.forms[0].SRouteSubnetMask4.value = addr_array2[3];
	
	addr_array3 = document.forms[0].SRouteGatewayAddr.value.split('.');
	document.forms[0].SRouteGatewayAddr1.value = addr_array3[0];
	document.forms[0].SRouteGatewayAddr2.value = addr_array3[1];
	document.forms[0].SRouteGatewayAddr3.value = addr_array3[2];
	document.forms[0].SRouteGatewayAddr4.value = addr_array3[3];
	
	var router_active="<%tcwebApi_get("Route_Entry","Active","s")%>";
	if(router_active=="Yes")
		document.forms[0].SRouteActive.checked=true;
	else
		document.forms[0].SRouteActive.checked=false;
	
	<%if tcwebApi_get("Route_Entry","Device","h")<>"N/A" then%>
	var dev = "<%tcwebApi_get("Route_Entry","Device","s")%>";
	if (dev == "br0")
	{
		document.forms[0].SRoutePrivate.checked = true;
	}
	<%end if%>
	
}
function metricCheck() {

	var value = document.forms[0].route_metric.value;
	/*
	if (!isNumeric(value)) {
		alert("<%tcWebApi_get("String_Entry","StaticRouteJS3Text","s")%>");
		return true;
	}
	*/
	if(value=="")
	{
		value=0;
		document.forms[0].route_metric.value=0;
	}
	if ((value < 2 || value > 15)&& value!=0) {
		//alert("<%tcWebApi_get("String_Entry","StaticRouteJS4Text","s")%>");
		alert(invalid_metric_str);
		return true;
	}

	return false;
}

var routecount = 16;
function stStaticRoute(domain,DestIPAddress)
{
	this.domain = domain;
	this.DestIPAddress = DestIPAddress;
}
function getStaticRouteInfo()
{
	var	nCurTemp = 0;
	var	vDestIPAddress = new Array(routecount);
	var	vcurLinks = new Array(routecount);
	
	vDestIPAddress[0] = "<% tcWebApi_get("Route_Entry0","DST_IP","s") %>";
	vDestIPAddress[1] = "<% tcWebApi_get("Route_Entry1","DST_IP","s") %>";
	vDestIPAddress[2] = "<% tcWebApi_get("Route_Entry2","DST_IP","s") %>";
	vDestIPAddress[3] = "<% tcWebApi_get("Route_Entry3","DST_IP","s") %>";
	vDestIPAddress[4] = "<% tcWebApi_get("Route_Entry4","DST_IP","s") %>";
	vDestIPAddress[5] = "<% tcWebApi_get("Route_Entry5","DST_IP","s") %>";
	vDestIPAddress[6] = "<% tcWebApi_get("Route_Entry6","DST_IP","s") %>";
	vDestIPAddress[7] = "<% tcWebApi_get("Route_Entry7","DST_IP","s") %>";
	vDestIPAddress[8] = "<% tcWebApi_get("Route_Entry8","DST_IP","s") %>";
	vDestIPAddress[9] = "<% tcWebApi_get("Route_Entry9","DST_IP","s") %>";
	vDestIPAddress[10] = "<% tcWebApi_get("Route_Entry10","DST_IP","s") %>";
	vDestIPAddress[11] = "<% tcWebApi_get("Route_Entry11","DST_IP","s") %>";
	vDestIPAddress[12] = "<% tcWebApi_get("Route_Entry12","DST_IP","s") %>";
	vDestIPAddress[13] = "<% tcWebApi_get("Route_Entry13","DST_IP","s") %>";
	vDestIPAddress[14] = "<% tcWebApi_get("Route_Entry14","DST_IP","s") %>";
	vDestIPAddress[15] = "<% tcWebApi_get("Route_Entry15","DST_IP","s") %>";
	
	for(var i=0; i<routecount; i++)
	{
		if(vDestIPAddress[i] != "N/A")
			vcurLinks[nCurTemp++] = new stStaticRoute(i, vDestIPAddress[i]);
	}
	var	vObjRet = new Array(nCurTemp+1);
	for(var m=0; m<nCurTemp; m++)
	{
		vObjRet[m] = vcurLinks[m];
	}
	vObjRet[nCurTemp] = null;
	return vObjRet;
}
function SubnetCheckRouter(mask,IPAddr) {
	var v=mask;
	var addr = IPAddr.split('.');
	var digits = v.split('.');
	if ( !((v == "0.0.0.0")||
		(v == "128.0.0.0")||
		(v == "192.0.0.0")||
		(v == "224.0.0.0")||
		(v == "240.0.0.0")||
		(v == "248.0.0.0")||
		(v == "252.0.0.0")||
		(v == "254.0.0.0")||
		(v == "255.0.0.0")||
		(v == "255.128.0.0")||
		(v == "255.192.0.0")||
		(v == "255.224.0.0")||
		(v == "255.240.0.0")||
		(v == "255.248.0.0")||
		(v == "255.252.0.0")||
		(v == "255.254.0.0")||
		(v == "255.255.0.0")||
		(v == "255.255.128.0")||
		(v == "255.255.192.0")||
		(v == "255.255.224.0")||
		(v == "255.255.240.0")||
		(v == "255.255.252.0")||
		(v == "255.255.254.0")||
		(v == "255.255.255.0")||
		(v == "255.255.255.128")||
		(v == "255.255.255.192")||
		(v == "255.255.255.224")||
		(v == "255.255.255.240")||
		(v == "255.255.255.248")||
		(v == "255.255.255.252")||
		(v == "255.255.255.254")||
		(v == "255.255.255.255")) )
	{
		alert(invalid_mask_str);//mask.focus();
		document.forms[0].SRouteSubnetMask.focus();
		v = "0.0.0.0";
		return false;
	}
	if((Number(addr[3])==0)&&(Number(digits[3])==255)){
		alert(invalid_mask_str);return false;
	}
	if(!((Number(addr[0]&digits[0])==Number(addr[0]))
		&&(Number(addr[1]&digits[1])==Number(addr[1]))
		&&(Number(addr[2]&digits[2])==Number(addr[2]))
		&&(Number(addr[3]&digits[3])==Number(addr[3])))){
		alert(invalid_mask_str);return false;
	}
	return true;
}
var StaticRouteInfo = getStaticRouteInfo();

function doSubmit(index) {
	//var pvc= document.forms[0].Route_PVC_Index.options.selectedIndex;
	

	document.forms[0].SRouteDestAddr.value = document.forms[0].SRouteDestAddr1.value+'.'+document.forms[0].SRouteDestAddr2.value+'.'+document.forms[0].SRouteDestAddr3.value+'.'+document.forms[0].SRouteDestAddr4.value;
	document.forms[0].SRouteSubnetMask.value = document.forms[0].SRouteSubnetMask1.value+'.'+document.forms[0].SRouteSubnetMask2.value+'.'+document.forms[0].SRouteSubnetMask3.value+'.'+document.forms[0].SRouteSubnetMask4.value;
	document.forms[0].SRouteGatewayAddr.value = document.forms[0].SRouteGatewayAddr1.value+'.'+document.forms[0].SRouteGatewayAddr2.value+'.'+document.forms[0].SRouteGatewayAddr3.value+'.'+document.forms[0].SRouteGatewayAddr4.value;
	
	var mask = document.forms[0].SRouteSubnetMask.value;
	var destIP = document.forms[0].SRouteDestAddr.value;
	
	if(document.forms[0].SRouteActive.checked==true)
		document.forms[0].RouteActive.value="Yes";
	else
		document.forms[0].RouteActive.value="No";

	if(index)
	{
	
		//name check
		if(document.forms[0].route_name.value == "" )
		{
			alert(empty_name_str);
			return false;
		}
		
		for(i=0;i<table_Data.length;i++)
		{
				if(i==document.forms[0].editnum.value)
				{
					continue;
				}
				if(table_Data[i]==document.forms[0].route_name.value)
				{
					alert(duplicate_name_str);
					return false;
				}
			
		}
		
		//Duplicate Destination IP check
		var strdstIPtmp = "<% tcWebApi_get("Route_Entry","DST_IP","s") %>";
		var stripvalue = document.forms[0].SRouteDestAddr.value;
		if ((strdstIPtmp == "N/A") || ((strdstIPtmp != "N/A") && (stripvalue != strdstIPtmp))) {
			for (i = 0; i < StaticRouteInfo.length - 1; i++)
			{
				if (StaticRouteInfo[i].DestIPAddress == stripvalue)
				{
					if(i==document.forms[0].editnum.value)
					{
						continue;
					}
					else
					{
						alert(dupulic_des_ip_str);
						return false;
					}
				}
			}
		}
		
		// metric,Dest IP, Gateway IP, mask Check
		if (metricCheck()) return false;
		if(!parent.aye_regex_IPV4.exec(document.forms[0].SRouteDestAddr.value)){
			alert(invalid_des_ip_str);
			return false;
		}
		if(!parent.aye_regex_IPV4.exec(document.forms[0].SRouteGatewayAddr.value)){
			alert(invalid_gateway_ip_str);
			return false;
		}
		if(!SubnetCheckRouter(mask,destIP))
		{ 
			return false;
		}
		if((destIP.value != "0.0.0.0") && (mask.value == "0.0.0.0") ){
			alert(invalid_mask_str);
			document.forms[0].staticSubnetMask.focus();
			return false;
		}
		if(document.forms[0].SRoutePrivate.checked == true)
		{
			
			if(isSameSubNet(document.forms[0].SRouteGatewayAddr.value,lan_subnet,lan_ip,lan_subnet) == false)
			{
				alert(invalid_gateway_ip_private_str);
				return false;
			}
			document.forms[0].route_dev.value = "br0";
		}
	}
	document.forms[0].EditFlag.value=index;
	document.forms[0].submit();	
}
var invalid_des_ip_str="<%tcWebApi_multilingual("1","invalid_des_ip_str")%>";
var invalid_gateway_ip_str="<%tcWebApi_multilingual("1","invalid_gateway_ip_str")%>";
var invalid_gateway_ip_private_str="<%tcWebApi_multilingual("1","invalid_gateway_ip_private_str")%>";
var invalid_mask_str="<%tcWebApi_multilingual("1","invalid_mask_str")%>";
var invalid_metric_str="<%tcWebApi_multilingual("1","invalid_metric_str")%>";
var dupulic_des_ip_str="<%tcWebApi_multilingual("1","dupulic_des_ip_str")%>";
var invalid_name_str="<%tcWebApi_multilingual("1","invalid_name_str")%>";
var empty_name_str="<%tcWebApi_multilingual("1","empty_name_str")%>";
var duplicate_name_str="<%tcWebApi_multilingual("1","duplicate_name_str")%>";

</script>
<INPUT TYPE="HIDDEN" NAME="editnum" value="<%If TcWebApi_get("WebCurSet_Entry","route_id","h") <> "N/A" then TcWebApi_get("WebCurSet_Entry","route_id","s") end if%>">
<input type="hidden" name="RouteActive">
<input type="hidden" name="route_dest">
<input type="hidden" name="route_pr">
<input type="hidden" name="route_ac">
<input type="hidden" name="count">
<input type="hidden" name="totalnum" value="">
<input type="hidden" name="SRouteDestAddr" value="<%If TcWebApi_get("Route_Entry","DST_IP","h") <> "N/A" then TcWebApi_get("Route_Entry","DST_IP","s") else asp_Write("0.0.0.0") end if %>">
<input type="hidden" name="SRouteSubnetMask" value="<%If TcWebApi_get("Route_Entry","Sub_mask","h") <> "N/A" then TcWebApi_get("Route_Entry","Sub_mask","s")  else asp_Write("0.0.0.0")  end if%>">
<input type="hidden" name="SRouteGatewayAddr" value="<%If TcWebApi_get("Route_Entry","Gateway","h") <> "N/A" then TcWebApi_get("Route_Entry","Gateway","s")  else asp_Write("0.0.0.0")  end if%>">
<INPUT type="hidden" value="0" name="EditFlag">
<input type="hidden" name="route_dev">
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","route_name_str")%></TD>
	<TD nowrap>
	<input type="text" name="route_name" id="route_name" size="16" maxlength="30" value="<%If TcWebApi_get("Route_Entry","Name","h") <> "N/A" then TcWebApi_get("Route_Entry","Name","s")  end if %>">
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="checkbox" name="SRoutePrivate" id="route_private"><%tcWebApi_multilingual("1","private_str")%></script>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="checkbox" name="SRouteActive" id="route_active"><%tcWebApi_multilingual("1","active_str")%></TD>
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","destination_ip_str")%></TD>
	<TD nowrap>
	<input type="text" name="SRouteDestAddr1" id="route_dest_address1" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="SRouteDestAddr2" id="route_dest_address2" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="SRouteDestAddr3" id="route_dest_address3" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="SRouteDestAddr4" id="route_dest_address4" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">      
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","subnet_mask_str")%></TD>
	<TD nowrap>
	<input type="text" name="SRouteSubnetMask1" id="route_net_mask1" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="SRouteSubnetMask2" id="route_net_mask2" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="SRouteSubnetMask3" id="route_net_mask3" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="SRouteSubnetMask4" id="route_net_mask4" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","gateway_ip_str")%></TD>
	<TD nowrap>
	<input type="text" name="SRouteGatewayAddr1" id="route_gateway1" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="SRouteGatewayAddr2" id="route_gateway2" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="SRouteGatewayAddr3" id="route_gateway3" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="SRouteGatewayAddr4" id="route_gateway4" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD>
</TR>
<TR>
	<TD nowrap><%tcWebApi_multilingual("1","metric_str")%></TD>
	<TD nowrap>
	<input type="text" name="route_metric" id="route_metric" size="3" maxlength="2" value="<%If TcWebApi_get("Route_Entry","metric","h") <> "N/A" then if TcWebApi_get("Route_Entry","metric","h") <> "0" then TcWebApi_get("Route_Entry","metric","s") else asp_Write("") end if  end if%>" onKeyPress="return getkey('num',event);">
	</TD>
</TR>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
</TABLE>
</div>
<%tcWebApi_multilingual("2","_STR_routes_help.asp")%>
</FORM>
</BODY>
</HTML>
