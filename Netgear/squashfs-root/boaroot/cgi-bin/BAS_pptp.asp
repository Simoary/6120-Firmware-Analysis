<%
	if request_Form("wan_pvc") <> "" then
		tcWebApi_set("WebCurSet_Entry","wan_pvc","wan_pvc")
		tcWebApi_set("WebCurSet_Entry","nat_pvc","wan_pvc")
		tcWebApi_set("Wan_Common","TransMode","TransMode")
		tcWebApi_set("Wan_PVC","Active","Active")
		
		tcWebApi_set("Wan_PVC","IPVERSION","ipVerRadio")
		tcWebApi_set("Wan_PVC","ISP","WANAssign")
		TCWebApi_set("Dproxy_Entry","type","DNSAssign")
		TCWebApi_set("Wan_PVC","NATENABLE","NATEnable")
		tcWebApi_set("Wan_PVC","DEFAULTROUTE","WAN_DefaultRoute")
		
		if request_Form("WANAssign") = "1" then	
			tcWebApi_set("Wan_PVC","IPADDR","pptp_myip")
			tcWebApi_set("Wan_PVC","NETMASK","pptp_subnet")
			tcWebApi_set("Wan_PVC","GATEWAY","pptp_gateway")
		end if
		
		if request_Form("Spoofmac") <> "" then
			tcWebApi_set("Wan_PVC","Mac_Assign","WAN_MAC_ASSIGN")
			tcWebApi_set("Wan_PVC","Mac_Spoofing","Spoofmac")
		end if	
		
		if request_Form("DNSAssign") = "1" then
			if request_Form("pptp_dnsaddr1") <> "" then
				TCWebApi_set("Dproxy_Entry","Primary_DNS","pptp_dnsaddr1")
			end if	
			if request_Form("pptp_dnsaddr2") <> "" then
				TCWebApi_set("Dproxy_Entry","Secondary_DNS","pptp_dnsaddr2")
			end if
		end if
		
		tcWebApi_set("L2tp_Entry","Active","DISABLE")
		tcWebApi_commit("L2tp_Entry")
		
		tcWebApi_set("Pptp_Entry","Active","Active")
		tcWebApi_set("Pptp_Entry","ServerIp","pptp_serv_ip")
		TCWebApi_set("Pptp_Entry","Username","pptp_username")
		TCWebApi_set("Pptp_Entry","Password","pptp_passwd")
		TCWebApi_set("Pptp_Entry","Timeout","pptp_idletime")
		TCWebApi_set("Pptp_Entry","CallID","PPTPCallID")
		tcWebApi_commit("Pptp_Entry")
		
		tcWebApi_commit("Wan_PVC")
		tcWebApi_commit("Dproxy_Entry")
		tcWebApi_save()
	end	if
%>
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/bas_pptp.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/BAS_pptp.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="pptp">

<div class="page_title"><%tcWebApi_multilingual("1","internet_setup_str")%></div>

<script>
var run_test="no";


var ipv6_type = "disabled";
var connection_type = "";
var wan_curr_mac="<%if tcWebApi_get("Wan_PVC","Mac_Spoofing","h") <> "N/A"  then tcWebApi_get("Wan_PVC","Mac_Spoofing","s") end if%>";
var wan_factory_mac="<%if tcWebApi_get("Lan_Entry0","MAC","h") <> "N/A"  then tcWebApi_get("Lan_Entry0","MAC","s") end if%>";
var wan_remote_mac="<%if tcWebApi_get("Lan_Entry0","Client_MAC","h") <> "N/A"  then tcWebApi_get("Lan_Entry0","Client_MAC","s") end if%>";
var pptp_get_this_mac="<%if tcWebApi_get("Wan_PVC","Mac_Assign","h") <> "N/A"  then tcWebApi_get("Wan_PVC","Mac_Assign","s") end if%>";
var pptp_get_mac_assign= "<%if tcWebApi_get("Wan_PVC","Mac_Assign","h") <> "N/A"  then tcWebApi_get("Wan_PVC","Mac_Assign","s") end if%>";
var russian_ppp_flag=parent.parent.russian_ppp_flag;
var gui_region="English";
var lan_ip="192.168.1.1";
var lan_subnet="255.255.255.0";
var netgear_region=top.netgear_region;

//Add a new checkbox 'Enable automatic Internet connection reset at'
var bas_auto_conn_flag="0";
var bas_conn_time_num="0";
if ( bas_conn_time_num == "" ) // to fix bug 23294
	bas_conn_time_num="0";
var auto_conn_flag=parent.parent.auto_conn_flag;
var autoconn_flag=(auto_conn_flag == 1 && ((gui_region == "German" &&  (netgear_region == "" || netgear_region.toUpperCase() == "WW")) || netgear_region.toUpperCase() == "GR")) ? 1 : 0;
var wan_mtu_now='1500';
var wanproto_type="pptp";

function loadvalue()
{
	var form=document.forms[0];
	
	if(bas_auto_conn_flag == "1")
 		form.auto_conn_24hr.checked = true;
 	else
 		form.auto_conn_24hr.checked = false;

	/* to fix bug 23647 */
	form.hidden_conn_time_num.value = bas_conn_time_num;
	sel_div.getElementsByTagName("li")[bas_conn_time_num].style.background = "#3868ca";
	document.getElementById("auto_conn_time_show").innerHTML=sel_div.getElementsByTagName("li")[bas_conn_time_num].innerHTML;

 	if(autoconn_flag == 1)
 		document.getElementById("auto_conn_play").style.display="";
 	else
 		document.getElementById("auto_conn_play").style.display="none";
	
	//Dial on demand
	var dod_timeout = "<%if tcWebApi_get("Pptp_Entry","Timeout","h") <> "N/A"  then tcWebApi_get("Pptp_Entry","Timeout","s") end if%>";
	if(dod_timeout==0)
	{
		form.pptp_dod.selectedIndex=0;
		form.pptp_idletime.disabled = true;	
	}
	else
		form.pptp_dod.selectedIndex=1;

	var pptp_get_myip="<%tcWebApi_get("Wan_PVC","IPADDR","s")%>";
	var pptp_get_wan_assign="0";
	var pptp_get_gateway="<%tcWebApi_get("Wan_PVC","GATEWAY","s")%>";
	var pptp_get_subnet="<%tcWebApi_get("Wan_PVC","NETMASK","s")%>";
	<% if tcWebApi_get("Wan_PVC","ISP","h") = "1" then %>
		if(pptp_get_myip!="")
        {
			var ip_array=pptp_get_myip.split('.');
			form.myip_1.value=ip_array[0];
			form.myip_2.value=ip_array[1];
			form.myip_3.value=ip_array[2];
			form.myip_4.value=ip_array[3];
		}
		if( pptp_get_gateway!="" )
    	{
			var gateway_array=pptp_get_gateway.split('.');
			form.mygw_1.value=gateway_array[0];
        	form.mygw_2.value=gateway_array[1];
        	form.mygw_3.value=gateway_array[2];
        	form.mygw_4.value=gateway_array[3];
    	}

		if(pptp_get_subnet!="")
        {
            var subnet_array=pptp_get_subnet.split('.');
            form.mymask_1.value=subnet_array[0];
            form.mymask_2.value=subnet_array[1];
        	form.mymask_3.value=subnet_array[2];
        	form.mymask_4.value=subnet_array[3];
       	}
	<% else %>	
		form.myip_1.value=form.myip_2.value=form.myip_3.value=form.myip_4.value="";
		setDisabled(true, form.mygw_1, form.mygw_2, form.mygw_3, form.mygw_4);
		setDisabled(true, form.mymask_1, form.mymask_2, form.mymask_3, form.mymask_4);
	<% end if%>
	
	//DNS
	<% if tcWebApi_get("Dproxy_Entry","type","h") = "0" then %>
		form.DNSAssign[0].checked = true;
	<% else %>
		form.DNSAssign[1].checked = true;
		var pptp_get_dns1="<%if tcWebApi_get("Dproxy_Entry","Primary_DNS","h") <> "" then tcWebApi_get("Dproxy_Entry","Primary_DNS","s") end if%>";
		if(pptp_get_dns1 != "")
		{
			var dns1_array=pptp_get_dns1.split('.');
			form.DAddr1.value=dns1_array[0];
			form.DAddr2.value=dns1_array[1];
			form.DAddr3.value=dns1_array[2];
			form.DAddr4.value=dns1_array[3];
		}
		var pptp_get_dns2="<%if tcWebApi_get("Dproxy_Entry","Secondary_DNS","h") <> "" then tcWebApi_get("Dproxy_Entry","Secondary_DNS","s") end if%>";
		if(pptp_get_dns2 != "")
		{
			var dns2_array=pptp_get_dns2.split('.');
			form.PDAddr1.value=dns2_array[0];
			form.PDAddr2.value=dns2_array[1];
			form.PDAddr3.value=dns2_array[2];
			form.PDAddr4.value=dns2_array[3];
		}
	<% end if %>
	
	//MAC Spoofing		
	if (pptp_get_mac_assign == '0')
		form.MACAssign[0].checked = true;
	else
		form.MACAssign[2].checked = true;

	form.Spoofmac.value = wan_curr_mac;
	
	goTestApply();	
}
function show_idleout(form,time)
{
	if( time == 1 )
	{

		form.pptp_idletime.disabled = false;
		form.auto_conn_24hr.disabled = true;
		document.getElementById("select_div").className = "disable_select";
		document.getElementById("auto_conn_time_show").className = "disable_span";
	}
	else
	{
		form.pptp_idletime.disabled = true;
		form.auto_conn_24hr.disabled = false;
		document.getElementById("select_div").className = "enable_select";
		document.getElementById("auto_conn_time_show").className = "enable_span";
	}		

}

function aye_setMAC(n)
{
	var form=document.forms[0];	
	if (n == '0')
		form.Spoofmac.value=wan_factory_mac;
	else if (n == '1')
		form.Spoofmac.value=wan_remote_mac.toUpperCase();
	else
		form.Spoofmac.value=wan_curr_mac;
}

var old_wan_type="dhcp";
</script>

<input type="hidden" name="change_wan_type">
<input type="hidden" name="run_test" value="">
<input type="hidden" name="pptp_myip">
<input type="hidden" name="pptp_gateway">
<input type="hidden" name="pptp_subnet">
<input type="hidden" name="pptp_dnsaddr1">
<input type="hidden" name="pptp_dnsaddr2">
<input type="hidden" name="hidden_pptp_idle_time">
<input type="hidden" name="conflict_wanlan">
<input type="hidden" name="hid_mtu_value">
<input type="hidden" name="hid_pptp_dod"><!--bug 22322:when connection mode gray out,need a hidden-value to transfer -->
<input type="hidden" name="hidden_conn_time_num">
<input type="hidden" name="hidden_auto_conn_flag">
<input type="hidden" name="wan_pvc" value="10">
<input type="hidden" name="Active" value="Yes">
<input type="hidden" name="TransMode" value="Ethernet">
<input type=hidden name=wanType value="0">
<input type=hidden name=ipVerRadio value="IPv4">
<input type=hidden name=DNSproxy value="Yes">
<input type=hidden name=WAN_DefaultRoute value="Yes">
<input type=hidden name=WAN_MAC_ASSIGN value="0">
<input type=hidden name=NATEnable value="Enable">
<input type=hidden name=PPTPCallID value="">
<input type=hidden name=DISABLE value="No">

<div class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
	<input class="common_bt" type="submit" name="Test" value="Test" onClick="return check_wizard_pptp(document.forms[0],1)">&nbsp;&nbsp;
	<input class="cancel_bt" type='button' name='Cancel' value='Cancel' onClick='location.href="BAS_pptp.asp";'>&nbsp;&nbsp;
        <input class="apply_bt" type="submit" name="Apply" value="Apply" onClick="return check_wizard_pptp(document.forms[0],0)">
        </TD>
</TR>
</TABLE>

</div> <!-- button -->
<div id="bas_top" style="width: 625px; height: 85px; background-color: #ffffff; position: absolute; top: 50px; left: 0px;">
<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<TR><TD nowrap>
<A tabindex=-1 href="javascript:loadhelp('_BAS_pptp','question')"><B><%tcWebApi_multilingual("1","does_your_internet_conection_str")%></B></A>
</TD></TR>
<TR>
        <TD nowrap>
        <input onclick=''  type="radio" name="loginreq" id="loginreq" value="pppoe" checked="true"><%tcWebApi_multilingual("1","yes_str")%>
        </TD>
</TR>
<TR>
        <TD nowrap>
        <input onclick='location.href="BAS_ether.asp";' type="radio" name="loginreq" value="dhcp"><%tcWebApi_multilingual("1","no_str")%>
        </TD>
</TR>
</TABLE>
</div> <!-- bas_top -->
<div id="main" class="main_bas">
<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_pptp','isp')"><B><%tcWebApi_multilingual("1","internet_service_provider_str")%></B></A>
	</TD>
	<TD nowrap align=right>
	<select name="login_type" id="login_type" onChange="change_serv(document.forms[0])">
		<option value="pptp" selected><%tcWebApi_multilingual("1","pptp_str")%></option>
		<option value="l2tp"><%tcWebApi_multilingual("1","l2tp_str")%></option>
		<option value="pppoe"><%tcWebApi_multilingual("1","pppoe_str")%></option>
		<%if tcWebApi_get("Wan_Common","TransMode","h") = "ATM" then %>
		<option value="pppoa"><%tcWebApi_multilingual("1","pppoa_str")%></option>
		<%end if%>
	</select>
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_pptp','login')"><B><%tcWebApi_multilingual("1","login_str")%></B></A>
	</TD>
	<TD nowrap align=right>
	<input type="text" name="pptp_username" maxLength="60" size="16" onKeyPress="return getkey('ssid', event)" value="<%if tcWebApi_get("Pptp_Entry","Username","h") <> "N/A"  then tcWebApi_get("Pptp_Entry","Username","s") end if%>">
	</TD>
</TR>
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_pptp','password')"><B><%tcWebApi_multilingual("1","password_str")%></B></A>
	</TD>
	<TD nowrap align=right>
	<input type="password" name="pptp_passwd" maxlength="50" size="16" onFocus="change_pptp_password(this);" onKeyPress="return getkey('ssid', event)" value="<%if tcWebApi_get("Pptp_Entry","Password","h") <> "N/A"  then tcWebApi_get("Pptp_Entry","Password","s") end if%>">
	</TD>
</TR>
<TR> 
	<TD><A tabindex=-1 href="javascript:loadhelp('_BAS_pptp','conn_mode')"><B><%tcWebApi_multilingual("1","connection_mode_str")%></B></A></TD> 
	<TD align=right>
	<select name="pptp_dod" onchange="show_idleout(document.forms[0],this.value)"> 
		<option value="0"><%tcWebApi_multilingual("1","always_on_str")%></option>
		<option value="1"><%tcWebApi_multilingual("1","dial_on_demand_str")%></option>
		<option value="2"><%tcWebApi_multilingual("1","manually_connect_str")%></option>
	</select>
	</TD>
</TR>
<TR>
	<TD>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_pptp','idletime')"><%tcWebApi_multilingual("1","idle_timeout_str")%></A>
	</TD>
	<TD nowrap align=right>
	<input type="text" name="pptp_idletime" maxLength="5" size="16" value="<%if tcWebApi_get("Pptp_Entry","Timeout","h") = ""  then asp_write("0") elseif tcWebApi_get("Pptp_Entry","Timeout","h") = "N/A" then asp_write("0") else tcWebApi_get("Pptp_Entry","Timeout","s") end if%>" onKeyPress="return getkey('num', event)">
	</TD>
</TR>
<TR id=auto_conn_play>
	<td colspan="2">
	<div id="select_div" class="enable_select">
		<input type="checkbox" name="auto_conn_24hr" value="">
			<div id="select_title"><%tcWebApi_multilingual("1","enable_automatic_internet_str")%></div>
		<div id="select_content">
			<span id="auto_conn_time_show" class="enable_span" onClick="show_options();" >00:00</span>
			<div id="auto_conn_time" style="display:none;" onClick="select_value();">
				<li value="1">00:00</li>
				<li value="2">00:30</li>
				<li value="3">01:00</li>
				<li value="4">01:30</li>
				<li value="5">02:00</li>
				<li value="6">02:30</li>
				<li value="7">03:00</li>
				<li value="8">03:30</li>
				<li value="9">04:00</li>
				<li value="10">04:30</li>
				<li value="11">05:00</li>
				<li value="12">05:30</li>
				<li value="13">06:00</li>
				<li value="14">06:30</li>
				<li value="15">07:00</li>
				<li value="16">07:30</li>
				<li value="17">08:00</li>
				<li value="18">08:30</li>
				<li value="19">09:00</li>
				<li value="20">09:30</li>
				<li value="21">10:00</li>
				<li value="22">10:30</li>
				<li value="23">11:00</li>
				<li value="24">11:30</li>
				<li value="25">12:00</li>
				<li value="26">12:30</li>
				<li value="27">13:00</li>
				<li value="28">13:30</li>
				<li value="29">14:00</li>
				<li value="30">14:30</li>
				<li value="31">15:00</li>
				<li value="32">15:30</li>
				<li value="33">16:00</li>
				<li value="34">16:30</li>
				<li value="35">17:00</li>
				<li value="36">17:30</li>
				<li value="37">18:00</li>
				<li value="38">18:30</li>
				<li value="39">19:00</li>
				<li value="40">19:30</li>
				<li value="41">20:00</li>
				<li value="42">20:30</li>
				<li value="43">21:00</li>
				<li value="44">21:30</li>
				<li value="45">22:00</li>
				<li value="46">22:30</li>
				<li value="47">23:00</li>
				<li value="48">23:30</li>
			</div>
		</div>
	</div>
	</td>
</TR>
<script>
/* to fix bug 23647 */
var sel_div = document.getElementById("auto_conn_time");
var click_sel = 0;
var over_opt = -1;

for( var i = 0; i < 48; i++){
	var li_div = sel_div.getElementsByTagName("li")[i];
	li_div.onmouseover=function(){
		for(var j=0; j < 48; j++)
		{
			if( j != this.value-1)
				sel_div.getElementsByTagName("li")[j].style.background = "#FFFFFF";
			else
			{
				this.style.background="#3868ca";
				over_opt = j;
			}
		}
	};

	li_div.onclick=function() {
		document.getElementById("auto_conn_time_show").innerHTML = this.innerHTML;
		sel_div.style.display="none";
		document.forms[0].hidden_conn_time_num.value = this.value-1;
	};
}

var main_div = document.body;
main_div.onclick = function() {
	click_sel++;
	if(sel_div.style.display != "none" && click_sel != 2)
	{
		sel_div.style.display = "none";
		click_sel = 0;
		if( over_opt != -1 )
			sel_div.getElementsByTagName("li")[over_opt].style.background = "#FFFFFF";
	}
};

function show_options()
{
	var cf = document.forms[0];
	if( document.getElementById("auto_conn_time_show").className == "disable_span" )
		return false;

	sel_div.getElementsByTagName("li")[cf.hidden_conn_time_num.value].style.background = "#3868ca";
	if(sel_div.style.display == "none")
	{
		sel_div.style.display = "";
		click_sel=1;
	}
	else
	{
		sel_div.style.display = "none";
		click_sel=0;
	}
}
</script>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_pptp','myip')"><B><%tcWebApi_multilingual("1","my_ip_address_str")%></B></A>
	</TD>
	<TD nowrap align=right><!--bug 22411:when manually input IP,don't click the mouse,the subnet mask can be used -->
	<input type="text" name="myip_1"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onChange="myip_update('bas');" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);myip_update('bas');" >.
	<input type="text" name="myip_2"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onChange="myip_update('bas');" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);myip_update('bas');" >.
	<input type="text" name="myip_3"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onChange="myip_update('bas');" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);myip_update('bas');" >.
	<input type="text" name="myip_4"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onChange="myip_update('bas');" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);myip_update('bas');" >
	<input type="hidden" name="WANAssign" value="1">
	</TD>
</TR>
<TR id=pptp_sub>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_pptp','myip')"><B><%tcWebApi_multilingual("1","ip_subnet_mask_str")%></B></A>
	</TD><TD nowrap align=right>
        <input type="text" name="mymask_1" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);">.
        <input type="text" name="mymask_2" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);">.
        <input type="text" name="mymask_3" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);">.
        <input type="text" name="mymask_4" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);">
	</TD>
</TR>
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_pptp','serverip')"><B><%tcWebApi_multilingual("1","server_address_str")%></B></A>
	</TD>
	<TD nowrap align=right><!--bug 20279:when use set my ip and pptp server with domain-name,don't click the mouse,the dns acquire dynamic should gray out -->
	<input type="text" size="33" name="pptp_serv_ip" maxlength="255" onFocus="this.select();"  onKeyPress="return getkey('ddns_hostname', event)" value="<%if tcWebApi_get("Pptp_Entry","ServerIp","h") <> "N/A"  then tcWebApi_get("Pptp_Entry","ServerIp","s") end if%>" onkeyup="pptp_servip_update();" onblur="pptp_servip_update();">
	</TD>
</TR>
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_pptp','gateway')"><B><%tcWebApi_multilingual("1","gateway_ip_address_str")%></B></A>
	</TD>
	<TD nowrap align=right>
	<input type="text" name="mygw_1" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="mygw_2" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="mygw_3" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="mygw_4" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	<input type="hidden" name="Gateway" value="">
	</TD>
</TR>
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_pptp','id')"><B><%tcWebApi_multilingual("1","connection_id_str")%></B></A>
	</TD>
	<TD nowrap align=right>
	<input type="text" size="20" maxlength="63" name="pptp_conn_id" onFocus="this.select();" onKeyPress="return getkey('ssid', event)" value="<%if tcWebApi_get("Pptp_Entry","CallID","h") <> "N/A" then if tcWebApi_get("Pptp_Entry","CallID","h") <> "" then  if tcWebApi_get("Pptp_Entry","CallID","h") <> "_NULL_" then tcWebApi_get("Pptp_Entry","CallID","s") end if end if end if%>">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_pptp','DNSaddress')"><B><%tcWebApi_multilingual("1","domain_name_server_str")%></B></A>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="DNSAssign" value="0" onClick="setDNS(document.forms[0])"><%tcWebApi_multilingual("1","get_auto_from_isp_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="DNSAssign" value="1" onClick="setDNS(document.forms[0])"><%tcWebApi_multilingual("1","use_these_dns_servers_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap><img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","primary_dns_str")%></TD>
	<TD nowrap align=right>
	<input type="text" name="DAddr1"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="DAddr2"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="DAddr3"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="DAddr4"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD>
</TR>
<TR>
	<TD nowrap><img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","secondary_dns_str")%></TD>
	<TD nowrap align=right>
	<input type="text" name="PDAddr1"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="PDAddr2"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="PDAddr3"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="PDAddr4"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_pptp','localaddress')"><B><%tcWebApi_multilingual("1","router_mac_address_str")%></B></A>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="MACAssign" value="0" onClick="aye_setMAC(0)"><%tcWebApi_multilingual("1","use_default_address_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="MACAssign" value="1" onClick="aye_setMAC(1)"><%tcWebApi_multilingual("1","use_computer_mac_address_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap>
	<input type="radio" name="MACAssign" value="2" onClick="aye_setMAC(2)"><%tcWebApi_multilingual("1","use_this_mac_address_str")%>
	</TD>
	<TD nowrap align=right>
	<input type="text" value="" name="Spoofmac" maxlength="17" size="20" onKeyPress="return getkey('mac',event)">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<!--TR>
	<TD nowrap colspan=2 align=center>
	<input type="submit" name="Apply" value="Apply" onClick="return check_pptp(document.forms[0],0)">&nbsp;&nbsp;
	<input type='button' name='Cancel' value='Cancel' onClick='location.href="BAS_pptp.asp";'>&nbsp;&nbsp;
	<input type="submit" name="Test" value="Test" onClick="return check_pptp(document.forms[0],1)">
	</TD>
</TR-->
</TABLE>
</div><!--main-->
<%tcWebApi_multilingual("2","_BAS_pptp_help.asp")%>
</FORM>
</BODY>
</HTML>
