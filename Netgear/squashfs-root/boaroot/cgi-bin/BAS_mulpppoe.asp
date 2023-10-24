
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/bas_mulpppoe.js"></script>
<script language=javascript type=text/javascript src="/mp_lang.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/BAS_update.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="mulpppoe">

<div class="page_title">Basic Settings</div>

<script>
var array_num=0;



var ts='35660388';
var run_test="no";
var mul_testnum="";



var pppoe1_get_dns1="0.0.0.0";var pppoe1_get_dns2="0.0.0.0";
var pppoe2_get_dns1="0.0.0.0";var pppoe2_get_dns2="0.0.0.0";

var lan_ip="192.168.1.1";
var lan_subnet="255.255.255.0";
var disableHTML="";
var enableHTML="";
var westHTML="";
var eastHTML="";
var otherHTML="";
var pppoe2_policy="0"

var east_username="guest@flets";
var east_password="guest";
var west_username="flets@flets";
var west_password="flets";
var other_username="guest";
var other_password="";
var username="";
var password="";	
var east_servicename="";
var west_servicename="";
var other_servicename="";
var servicename="";
var wanproto_type="mulpppoe1";
var wan_mtu_now='1500';
var netgear_region=top.netgear_region;

var old_wan_type="dhcp";
var old_wan_ip="";
if ( old_wan_ip == "" )
	old_wan_ip = "0.0.0.0";

var old_pppoe_wan_assign="0";
var old_wan_ip2="";
if( old_wan_ip2 == "" )
	old_wan_ip2 = "0.0.0.0";
var old_pppoe_wan_assign2="";


function loadvalue()
{
	loadMPhelp("_BAS_mulpppoe");
	var form=document.forms[0];
	form.pppoe_username.value="";
	form.pppoe_passwd.value="";
	form.pppoe_servername.value="";
	form.pppoe2_servicename.value="";
	
	form.mulpppoe_demand.value="";
	show_idleout(form,form.mulpppoe_demand.value);	
	disableHTML=getObj("disable").innerHTML;
	enableHTML=getObj("enable").innerHTML;
	
	if( old_pppoe_wan_assign == "0")
     	   	form.WANAssign[0].checked = true;
        else
           	form.WANAssign[1].checked = true;
	setIP(form);		
	var pppoe_get_ip=old_wan_ip;
        if(pppoe_get_ip!="")
        {
                var ip_array=pppoe_get_ip.split('.');
                form.WPethr1.value=ip_array[0];
                form.WPethr2.value=ip_array[1];
                form.WPethr3.value=ip_array[2];
                form.WPethr4.value=ip_array[3];
        }


	if('0' == '0')
	    form.DNSAssign[0].checked = true;
	else
	    form.DNSAssign[1].checked = true;
        if(pppoe1_get_dns1!="")
        {
                var dns1_array=pppoe1_get_dns1.split('.');
                form.PDAddr1.value=dns1_array[0];
                form.PDAddr2.value=dns1_array[1];
                form.PDAddr3.value=dns1_array[2];
                form.PDAddr4.value=dns1_array[3];
        }
        if(pppoe1_get_dns2!="")
        {
                var dns2_array=pppoe1_get_dns2.split('.');
                form.DAddr1.value=dns2_array[0];
                form.DAddr2.value=dns2_array[1];
                form.DAddr3.value=dns2_array[2];
                form.DAddr4.value=dns2_array[3];
        }
	setDNS(form);	

	getObj("disable").innerHTML="";
	getObj("enable").innerHTML="";


	if('' == '0')
	{
		form.enable_session2[0].checked = true;
		enablepppoe2(0);
	}
	else
	{
		form.enable_session2[1].checked = true;	
		enablepppoe2(1);
	}

	form.old_internet_type.value='1';
	form.old_ppp_type.value='0';
	form.login_type.selectedIndex=3;
	if( parent.gui_region != "Japanese" && parent.jp_multiPPPoE == 1 ) 
		form.login_type.disabled = true;
	
//	change_session();
	goTestApply();	
}


function show_idleout(form,time)
{
        if( time == 1 )
                form.pppoe_idletime.disabled = false;
        else
                form.pppoe_idletime.disabled = true;
}



</script>

<input type="hidden" name="conflict_wanlan">
<input type="hidden" name="select_edit">
<input type="hidden" name="select_del">
<input type="hidden" name="change_wan_type">
<input type="hidden" name="run_test" value="">
<input type="hidden" name="mul_testnum">
<input type="hidden" name="pppoe_ipaddr">
<input type="hidden" name="pppoe2_ipaddr">
<input type="hidden" name="pppoe_dnsaddr1">
<input type="hidden" name="pppoe_dnsaddr2">
<input type="hidden" name="pppoe2_dnsaddr1">
<input type="hidden" name="pppoe2_dnsaddr2">
<input type="hidden" name="old_internet_type">
<input type="hidden" name="old_ppp_type">
<input type="hidden" name="pppoe_idletime_value">
<input type="hidden" name="hid_mtu_value">
<div class="fix_button">
<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<TR>
    <script>document.write(hd2_center)</script>
	<script>
	document.write("<input class="common_bt" type="submit"  value="'+test_mark+'" onClick="return check_mulpppoe(document.forms[0],1)">&nbsp;&nbsp;');
	document.write("<input class='cancel_bt' type='button' value='"+cancel_mark+"' onClick='location.href=\"bas_mulpppoe.asp\";'>&nbsp;&nbsp;");
	document.write("<input class="apply_bt" type="submit"  value="'+apply_mark+'" onClick="return check_mulpppoe(document.forms[0],0)"> &nbsp;&nbsp;');
	</script>
  </td>
  </TR>
</TABLE>
</div> <!--button -->

<div id="bas_top" style="width: 625px; height: 85px; background-color: #ffffff; position: absolute; top: 50px; left: 0px;">
<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<TR><TD nowrap>
<A tabindex=-1 href="javascript:loadhelp('_BAS_mulpppoe','question')"><B><script>document.write(basic_top_info)</script></B></A>
</TD></TR>
<TR>
        <TD nowrap>
        <input type="radio" name="loginreq" value="pppoe" checked="true"><script>document.write(yes_mark)</script>
        </TD>
</TR>
<TR>
        <TD nowrap>
        <input onclick='location.href="BAS_ether.asp";' type="radio" name="loginreq" value="dhcp"><script>document.write(no_mark)</script>
        </TD>
</TR>
<TR><td colspan=2><img src="/liteblue.gif" width=100% height=12></td></TR>
</TABLE>
</div> <!-- bas_top -->

<div id="main" class="main_bas">
<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<tr>
	<td nowrap><a tabindex=-1 href="javascript:loadMPhelp('_BAS_mulpppoe','isp')"><b><script>document.write(basic_intserv_provider)</script></b></a></td>
	<td nowrap align=right>
		<SELECT name="login_type" onChange="change_serv(document.forms[0])">
			<OPTION value="PPTP" ><script>document.write(basic_intserv_pptp)</script></OPTION>
			<OPTION value="Telstra Bigpond" ><script>document.write(basic_intserv_bpa)</script></OPTION>
			<OPTION value="Other" ><script>document.write(basic_intserv_pppoe)</script></OPTION>
			<OPTION value="multiPPPoE" ><script>document.write(basic_intserv_mulpppoe)</script></OPTION>
		</SELECT>
	</td>
</tr>
<TR><td colspan=2><img src="/liteblue.gif" width=100% height=12></td></TR>
<TR>
	<td nowrap><B><script>document.write(pppoe1)</script></b></a> </TD></TR>
<TR>
	<td nowrap><a tabindex=-1 href="javascript:loadMPhelp('_BAS_mulpppoe','login')"><B><script>document.write(basic_pppoe_login)</script></b></a></TD>
	<td nowrap align=right><INPUT type="text" name="pppoe_username" maxLength="64" size="16" onKeyPress="return getkey('ssid', event)" value=""></TD>
</TR>
<tr>
	<td nowrap><a tabindex=-1 href="javascript:loadMPhelp('_BAS_mulpppoe','password')"><b><script>document.write(basic_pppoe_passwd)</script></b></a></td>
	<td nowrap align=right><input type="password" name="pppoe_passwd" size="16" maxlength="64" onFocus="this.select();" onKeyPress="return getkey('ssid', event)" value="">
</tr>
<TR>
	<td nowrap><a tabindex=-1 href="javascript:loadMPhelp('_BAS_mulpppoe','serv_name')"><B><script>document.write(basic_pppoe_serv_name)</script></b></a></TD>
	<td nowrap align=right><INPUT type="text" name="pppoe_servername" maxLength="50" size="16" onKeyPress="return getkey('ssid', event)" value=""></TD>
</TR>

<tr>
        <TD><b><script>document.write(basic_int_connection_mode)</script></b></td>
        <TD align=right>
            <SELECT name="mulpppoe_demand" onchange="show_idleout(document.forms[0],this.value)">
                <option value="0"><script>document.write(basic_mode_always)</script></option>
                <option value="1"><script>document.write(basic_mode_dial)</script></option>
                <option value="2"><script>document.write(basic_mode_manual)</script></option>
                        </SELECT>
        </td>
</tr>


<TR>
	<td nowrap><a tabindex=-1 href="javascript:loadMPhelp('_BAS_mulpppoe','pppoe_idletime')"><B><script>document.write(basic_pppoe_idle)</script></b></a></TD>
	<td nowrap align=right><INPUT type="text" name="pppoe_idletime" maxLength="5" size="16" value="5" onKeyPress="return getkey('num', event)"></TD>
</TR>
<TR><td colspan=2><img src="/liteblue.gif" width=100% height=12></td></TR>
<tr><script>document.write(hd2)</script><a tabindex=-1 href="javascript:loadMPhelp('_BAS_mulpppoe','InternetIP')"><b><script>document.write(basic_int_intip)</script></b></a></td></tr>
<tr><script>document.write(hd2)</script><input type="radio" name="WANAssign" value="0" onClick="setIP(document.forms[0])"><script>document.write(basic_int_autoip)</script></td></tr>
<tr><script>document.write(hd2)</script><input type="radio" name="WANAssign" value="1" onClick="setIP(document.forms[0])"><script>document.write(basic_int_static_ip)</script></td></tr>
<tr>
	<td nowrap><script>document.write(spacebar)</script><script>document.write(lan_mark_ip)</script></td>
	<td nowrap align=right>
        <input type="text" name="WPethr1"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);" >.
        <input type="text" name="WPethr2"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);">.
        <input type="text" name="WPethr3"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);">.
        <input type="text" name="WPethr4"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);">
        </TD>
</tr>
<TR><td colspan=2><img src="/liteblue.gif" width=100% height=12></td></TR>
<tr><script>document.write(hd2)</script><a tabindex=-1 href="javascript:loadMPhelp('_BAS_mulpppoe','DNSaddress')"><b><script>document.write(basic_int_dns)</script></b></a></td></tr>
<tr><script>document.write(hd2)</script><input type="radio" name="DNSAssign" value="0" onClick="setDNS(document.forms[0])"><script>document.write(basic_int_autodns)</script></td></tr>
<tr><script>document.write(hd2)</script><input type="radio" name="DNSAssign" value="1" onClick="setDNS(document.forms[0])"><script>document.write(basic_int_these)</script></td></tr>
<tr>
  <td nowrap><script>document.write(spacebar)</script><script>document.write(basic_int_primary_dns)</script></td>
	<td nowrap align=right>
        <input type="text" name="PDAddr1"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)"  onkeyup="keyup(event,this);">.
        <input type="text" name="PDAddr2"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);">.
        <input type="text" name="PDAddr3"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);">.
        <input type="text" name="PDAddr4"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);">
        </TD>
<tr>
	<td nowrap><script>document.write(spacebar)</script><script>document.write(basic_int_second_dns)</script></td>
	<td nowrap align=right>
        <input type="text" name="DAddr1"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)"  onkeyup="keyup(event,this);">.
        <input type="text" name="DAddr2"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);">.
        <input type="text" name="DAddr3"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);">.
        <input type="text" name="DAddr4"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);">
	</td>
</tr>
<TR><td colspan=2><img src="/liteblue.gif" width=100% height=12></td></TR>
<TR>
<td nowrap><B><script>document.write(mulpppoe_MTU_Size)</script></b></a></TD>
<td nowrap align=right><INPUT type="text" name="pppoe1_mtusize" maxLength="8" size="8" onKeyPress="return getkey('num', event)" value="1454"></TD>
</TR>
<TR><td colspan=2><img src="/liteblue.gif" width=100% height=12></td></TR>
<TR>
    <script>document.write(hd2_center)</script> 
	  <script> document.write('<input type="submit"  value="'+test_mark+'" onClick="return check_mulpppoe_session1(document.forms[0],1)">')</script>
	  </td>
  </TR>
<TR><td colspan=2><img src="/liteblue.gif" width=100% height=12></td></TR>
<TR><td nowrap><B><script>document.write(flet_square_pppoe_session)</script></b></a></TD></TR>
<tr><script>document.write(hd2)</script><input type="radio" name="enable_session2" value="0" onClick=enablepppoe2(0)><script>document.write(pppoe2_disable)</script><td></tr>
<tr><script>document.write(hd2)</script><input type="radio" name="enable_session2" value="1" onClick=enablepppoe2(1)><script>document.write(pppoe2_enable)</script></td></tr>
<TR><td colspan=2><img src="/liteblue.gif" width=100% height=12></td></TR>
</table>
<div id=view>
</div>
<div align="center" ID="disable" style="position:absolute;top:0;left:0;visibility:hidden">
<TABLE cellspacing=5 cellPadding=0 width=100% border=0><tr><script>document.write(hd2)</script></td></tr></table>
</div>
<div align="center" ID="enable" style="position:absolute;top:0;left:0;visibility:hidden">
<TABLE cellspacing=5 cellPadding=0 width=100% border=0><tr><script>document.write(hd2)</script></td></tr>
<TR>
	<td nowrap><b><script>document.write(pppoe2_type)</script></b></td>
	<td nowrap align=right>
			<SELECT name="pppoe2_session" onChange="change_session();">
				<option value="0"><script>document.write(pppoe2_west)</script></option>
				<option value="1"><script>document.write(pppoe2_east)</script></option>
				<option value="2"><script>document.write(pppoe2_other)</script></option>
			</SELECT>
		</td>
  </TR>	
<TR><td colspan=2><img src="/liteblue.gif" width=100% height=12></td></TR>
<TR>
    <td nowrap><B><script>document.write(basic_pppoe_login)</script></B></TD>
    <td nowrap align=right><INPUT type="text" name="pppoe2_username" maxLength="64" size="16" onKeyPress="return getkey('ssid', event)" value=""></TD>
</TR>
<tr>
	<td nowrap><b><script>document.write(basic_pppoe_passwd)</script></b></td>
	<td nowrap align=right><input type="password" name="pppoe2_password" size="16" maxlength="64" onFocus="this.select();"  onKeyPress="return getkey('ssid', event)" value="">
</tr>
<TR>
    <td nowrap><B><script>document.write(basic_pppoe_serv_name)</script></B></TD>
    <td nowrap align=right><INPUT type="text" name="pppoe2_servicename" maxLength="50" size="16" onKeyPress="return getkey('ssid', event)" value=""></TD>
</TR> 
<!--
<TR>
	<td nowrap><B><script>document.write(basic_pppoe_idle)</script></b></a></TD>
	<td nowrap align=right><INPUT type="text" name="pppoe2_idle_time" maxLength="5" size="16" value="" onKeyPress="return getkey('num', event)"></TD>
</TR>
-->
<TR><td colspan=2><img src="/liteblue.gif" width=100% height=12></td></TR>

<tr><script>document.write(hd2)</script><b><script>document.write(basic_int_intip)</script></b></a></td></tr>
<tr><script>document.write(hd2)</script><input type="radio" name="WANAssign2" value="0" onClick="setIP2(document.forms[0])"><script>document.write(basic_int_autoip)</script></td></tr>
<tr>
<tr><script>document.write(hd2)</script><input type="radio" name="WANAssign2" value="1" onClick="setIP2(document.forms[0])"><script>document.write(basic_int_autoip)</script></td></tr>
 <tr>

	<td nowrap><script>document.write(spacebar)</script><script>document.write(lan_mark_ip)</script></td>
	<td nowrap align=right>
        <input type="text" name="pppoe2_ip1"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);">.
        <input type="text" name="pppoe2_ip2"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);">.
        <input type="text" name="pppoe2_ip3"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);">.
        <input type="text" name="pppoe2_ip4"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);">
        </TD>
</tr>
<TR><td colspan=2><img src="/liteblue.gif" width=100% height=12></td></TR>
<tr><script>document.write(hd2)</script><b><script>document.write(basic_int_dns)</script></b></a></td></tr>
<tr><script>document.write(hd2)</script><input type="radio" name="DNSAssign2" value="0" onClick="setDNS2(document.forms[0])"><script>document.write(basic_int_autodns)</script></td></tr>
<tr><script>document.write(hd2)</script><input type="radio" name="DNSAssign2" value="1" onClick="setDNS2(document.forms[0])"><script>document.write(basic_int_these)</script></td></tr>
<tr>
  <td nowrap><script>document.write(spacebar)</script><script>document.write(basic_int_primary_dns)</script></td>
	<td nowrap align=right>
        <input type="text" name="pppoe2_dnsp1"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)"  onkeyup="keyup(event,this);">.
        <input type="text" name="pppoe2_dnsp2"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);">.
        <input type="text" name="pppoe2_dnsp3"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);">.
        <input type="text" name="pppoe2_dnsp4"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);">
        </TD>
<tr>
	<td nowrap><script>document.write(spacebar)</script><script>document.write(basic_int_second_dns)</script></td>
	<td nowrap align=right>
        <input type="text" name="pppoe2_dnss1"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)"  onkeyup="keyup(event,this);">.
        <input type="text" name="pppoe2_dnss2"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);">.
        <input type="text" name="pppoe2_dnss3"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);">.
        <input type="text" name="pppoe2_dnss4"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);">
	</td>
</tr>
<TR><td colspan=2><img src="/liteblue.gif" width=100% height=12></td></TR>
<TR>
<td nowrap><B><script>document.write(mulpppoe_MTU_Size)</script></b></a></TD>
<td nowrap align=right><INPUT type="text" name="pppoe2_mtusize" maxLength="8" size="8" onKeyPress="return getkey('num', event)" value=""></TD>
</TR>
<TR><td colspan=2><img src="/liteblue.gif" width=100% height=12></td></TR>

<TR>
    <script>document.write(hd2_center)</script> 
      
	  <script>
		  document.write('<input type="submit"  value="'+test_mark+'" onClick="return check_mulpppoe_session2(document.forms[0],2)">')</script>
	  </td>
  </TR>

<TR><td colspan=2><img src="/liteblue.gif" width=100% height=12></td></TR>
</table>
<!-- div 2222222222222222222222222222222222222222head--------------->
<div ID="view_session">
</div>
<div align="center" ID="NTTwest" style="position:absolute;top:0;left:0;visibility:hidden">
<TABLE cellspacing=5 cellPadding=0 width=100% border=0><tr><script>document.write(hd2)</script></td></tr>
<TR><td nowrap><B><script>document.write(mulpppoe_setting)</script></B></TD></tr>
<tr>
	<script>document.write(hd2_center)</script>

	<script>document.write(table_bolder)</script>
	<TR>
		<script>document.write(hd_center)</script> &nbsp;</TD>
		<script>document.write(hd_center)</script> <span class="subhead"><script>document.write(pppoe2_session_type)</script></span></TD>
		<script>document.write(hd_center)</script> <span class="subhead"><script>document.write(pppoe2_domain_name)</script></span></TD>
		<script>document.write(hd_center)</script> <span class="subhead"><script>document.write(pppoe2_ip_address)</script></span></TD>
		<script>document.write(hd_center)</script> <span class="subhead"><script>document.write(pppoe2_port)</script></span></TD>
		<script>document.write(hd_center)</script> <span class="subhead"><script>document.write(pppoe2_protocol)</script></span></TD>

	</TR> 
<script>
		document.write('<tr>'+hd_center+'<input type="radio" name="select_mulpppoe" value="'+1+'"></td>');
		document.write(hd_center+' '+pppoe2_west+'</td>');
		document.write(hd_center+'*.flets'+'</td>');
		document.write(hd_center+' --</td>');	
		document.write(hd_center+'--</td>');
		document.write(hd_center+' --</td></tr>');
</script>	
	</table>	
	</td>
</tr>	
<TR><td colspan=2><img src="/liteblue.gif" width=100% height=12></td></TR>
</table>
</div>

<div align="center" ID="NTTeast" style="position:absolute;top:0;left:0;visibility:hidden">
<TABLE cellspacing=5 cellPadding=0 width=100% border=0><tr><script>document.write(hd2)</script></td></tr>

<TR><td nowrap><B><script>document.write(mulpppoe_setting)</script></B></TD></tr>
<tr>

	<script>document.write(hd2_center)</script>

	<script>document.write(table_bolder)</script>
	<TR>
		<script>document.write(hd_center)</script> &nbsp;</TD>
		<script>document.write(hd_center)</script> <span class="subhead"><script>document.write(pppoe2_session_type)</script></span></TD>

		<script>document.write(hd_center)</script> <span class="subhead"><script>document.write(pppoe2_domain_name)</script></span></TD>
		<script>document.write(hd_center)</script> <span class="subhead"><script>document.write(pppoe2_ip_address)</script></span></TD>
		<script>document.write(hd_center)</script> <span class="subhead"><script>document.write(pppoe2_port)</script></span></TD>
		<script>document.write(hd_center)</script> <span class="subhead"><script>document.write(pppoe2_protocol)</script></span></TD>

	</TR> 
<script>
		document.write('<tr>'+hd_center+'<input type="radio" name="select_mulpppoe" value="'+1+'"></td>');
		document.write(hd_center+' '+pppoe2_east+'</td>');
		document.write(hd_center+'*.flets'+'</td>');
		document.write(hd_center+' --</td>');	
		document.write(hd_center+'--</td>');
		document.write(hd_center+' --</td></tr>');				
</script>	
	</table>	
	</td>
</tr>	
<TR><td colspan=2><img src="/liteblue.gif" width=100% height=12></td></TR>
</table>
</div>

<div align="center" ID="Other" style="position:absolute;top:0;left:0;visibility:hidden">
<TABLE cellspacing=5 cellPadding=0 width=100% border=0><tr><script>document.write(hd2)</script></td></tr>
<tr>
	<td nowrap><b><script>document.write(pppoe2_policy_setting)</script></b></td>
	<td nowrap align=right>

		<SELECT name="pppoe2_policy">
			<option value="0"><script>document.write(pppoe2_domain_name)</script></option>
			<option value="1"><script>document.write(pppoe2_ip_protocol)</script></option>
			<option value="2"><script>document.write(pppoe2_port_protocol)</script></option>
		</SELECT>
	</td>
</tr>
<tr>

	<script>document.write(hd2_center)</script>
	<br>
	<script>document.write('<input type="submit" name="add" value="'+add_mark+'" onClick="return check_mulpppoe_addnum(document.forms[0]);">');
	document.write('<input type="submit" name="edit" value="'+edit_mark+'" onClick="return check_mulpppoe_editnum(document.forms[0]);">');
	document.write('<input type="submit" name="del" value="'+delete_mark+'" onClick="return check_mulpppoe_del(document.forms[0]);">')</script>
	</td>
</tr> 
<TR><td colspan=2><img src="/liteblue.gif" width=100% height=12></td></TR>


<TR><td nowrap><B><script>document.write(mulpppoe_setting)</script></B></TD></tr>
<tr>

	<script>document.write(hd2_center)</script>
	<script>document.write(table_bolder)</script>
	<TR>
		<script>document.write(hd_center)</script> &nbsp;</TD>
		<script>document.write(hd_center)</script> <span class="subhead"><script>document.write(pppoe2_session_type)</script></span></TD>
		<script>document.write(hd_center)</script> <span class="subhead"><script>document.write(pppoe2_domain_name)</script></span></TD>
		<script>document.write(hd_center)</script> <span class="subhead"><script>document.write(pppoe2_ip_address)</script></span></TD>
		<script>document.write(hd_center)</script> <span class="subhead"><script>document.write(pppoe2_port)</script></span></TD>
		<script>document.write(hd_center)</script> <span class="subhead"><script>document.write(pppoe2_protocol)</script></span></TD>

	</TR> 
<script>

if( array_num > 0 )
{
	for(i=1;i<=array_num;i++)
	{
		var str = eval ( 'mulpppoeArray' + i );
		var each_info=str.split(' ');

		document.write('<tr>'+hd_center+'<input type="radio" name="select_mulpppoe" value="'+i+'"></td>');

		document.write(hd_center+' '+pppoe2_other+'</td>');
		document.write(hd_center+each_info[1]+'</td>');
		if(each_info[2]!='--')
			document.write(hd_center+each_info[2]+'-'+each_info[3]+'</td>');
		else
			document.write(hd_center+' --</td>');	
		if(each_info[4]!='--')	
			document.write(hd_center+each_info[4]+'-'+each_info[5]+'</td>');
		else
			document.write(hd_center+'--</td>');	
		document.write(hd_center+each_info[6]+'</td></tr>');

	}
}

</script>	
	</table>	
	</td>
</tr>	
<TR><td colspan=2><img src="/liteblue.gif" width=100% height=12></td></TR>
</table>
</div>
<!--div 22222222222222222222222222222222222222222222--->
<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
</table></div>

</div> <!-- main -->
<%tcWebApi_multilingual("2","_BAS_mulpppoe_help.asp")%>
</FORM>
<script>
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
function enablepppoe2(num)
{

	if(num==1)
	{
		getObj("view").innerHTML=enableHTML;

	}
	else
	{
		getObj("view").innerHTML=disableHTML;
	
	}

	if(num==1)
	{
         	//loadvalue of div "enable"
		var form=document.forms[0];

		westHTML=getObj("NTTwest").innerHTML;
		eastHTML=getObj("NTTeast").innerHTML;
		otherHTML=getObj("Other").innerHTML;	

		if( old_pppoe_wan_assign2 == '0')
			form.WANAssign2[0].checked = true;
		else
			form.WANAssign2[1].checked = true;
        
		setIP2(form);
         	var pppoe2_get_ip=old_wan_ip2;
         	if(pppoe2_get_ip!="")
         	{
                  	var ip2_array=pppoe2_get_ip.split('.');
                  	form.pppoe2_ip1.value=ip2_array[0];
                  	form.pppoe2_ip2.value=ip2_array[1];
                  	form.pppoe2_ip3.value=ip2_array[2];
                  	form.pppoe2_ip4.value=ip2_array[3];
          	}


          	if('' == '0')
              		form.DNSAssign2[0].checked = true;
          	else
              		form.DNSAssign2[1].checked = true;
          	if(pppoe2_get_dns1!="")
          	{
                  	var dns1_array2=pppoe2_get_dns1.split('.');
                  	form.pppoe2_dnsp1.value=dns1_array2[0];
                  	form.pppoe2_dnsp2.value=dns1_array2[1];
                  	form.pppoe2_dnsp3.value=dns1_array2[2];
                  	form.pppoe2_dnsp4.value=dns1_array2[3];
          	}
          	if(pppoe2_get_dns2!="")
          	{
                  	var dns2_array2=pppoe2_get_dns2.split('.');
                  	form.pppoe2_dnss1.value=dns2_array2[0];
                  	form.pppoe2_dnss2.value=dns2_array2[1];
                  	form.pppoe2_dnss3.value=dns2_array2[2];
                  	form.pppoe2_dnss4.value=dns2_array2[3];
          	}
          	setDNS2(form);

		
		getObj("NTTwest").innerHTML="";
		getObj("NTTeast").innerHTML="";
		getObj("Other").innerHTML="";

	 	form.pppoe2_session.value='0';	

                change_session();
	}

}




</script>
</body>
</html>
