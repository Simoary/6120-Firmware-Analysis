
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/bas_pppoe.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/BAS_update.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="wizard_pppoe">

<div class="page_title">PPPoE</div>
<div class="fix_button">
    <div id="line3_1" class="common_button_short" name="Test" onClick='return check_wizard_pppoe_new(1);'><b>Test</b></div>
    <div id="line3_2" class="cancel_button" name="Cancel" onclick='location.href="BAS_basic.asp";'><b>Cancel</b></div>
    <div id="line3_3" class="apply_button" name="Apply" onclick='return check_wizard_pppoe_new(0);'><b>Apply</b></div>
</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>


<script>
var run_test="no";
var pppoe_get_ip="0.0.0.0";
var pppoe_get_wan_assign='0';
var pppoe_get_dns_assign='0';
var russian_pppoe_flag=0;      //top.russian_pppoe_flag;
var gui_region="English";
var ts="90393952";



function loadvalue()
{
	var form = document.forms[0];

        if(pppoe_get_wan_assign == '0')
                form.WANAssign[0].checked = true;
        else
                form.WANAssign[1].checked = true;
	setIP(form,'wiz');
        if(pppoe_get_ip!="")
        {
                var ip_array=pppoe_get_ip.split('.');
                form.WPethr1.value=ip_array[0];
                form.WPethr2.value=ip_array[1];
                form.WPethr3.value=ip_array[2];
                form.WPethr4.value=ip_array[3];
        }
        if(pppoe_get_dns_assign == '0')
                form.DNSAssign[0].checked = true;
        else
                form.DNSAssign[1].checked = true;
        var pppoe_get_dns1="";
        if(pppoe_get_dns1!="")
        {
                var dns1_array=pppoe_get_dns1.split('.');
                form.DAddr1.value=dns1_array[0];
                form.DAddr2.value=dns1_array[1];
                form.DAddr3.value=dns1_array[2];
                form.DAddr4.value=dns1_array[3];
        }
        var pppoe_get_dns2="";
        if(pppoe_get_dns2!="")
        {
                var dns2_array=pppoe_get_dns2.split('.');
                form.PDAddr1.value=dns2_array[0];
                form.PDAddr2.value=dns2_array[1];
                form.PDAddr3.value=dns2_array[2];
                form.PDAddr4.value=dns2_array[3];
        }
	setDNS(form);

        goTestApply();	
}
</script>

<input type="hidden" name="pppoe_ipaddr">
<input type="hidden" name="pppoe_dnsaddr1">
<input type="hidden" name="pppoe_dnsaddr2">
<input type="hidden" name="run_test" value="">
<input type="hidden" name="WIZ_type" value="pppoe">
<TR>
	<TD nowrap><B>Login</B></TD>
	<TD nowrap>
	<input type="text" name="pppoe_username" maxLength="64" size="16" onKeyPress="return getkey('ssid', event)" value="guest">
	</TD>
</TR>
<TR>
	<TD nowrap><B>Password</B></TD>
	<TD nowrap>
	<input type="password" name="pppoe_passwd" size="16" maxlength="64" onFocus="this.select();" onKeyPress="return getkey('ssid', event)" value="">
	</TD>
</TR>
<TR>
	<TD nowrap><b>Service Name</b> (If Required)</TD>
	<TD nowrap>
	<input type="text" name="pppoe_servicename" maxLength="50" size="16" onKeyPress="return getkey('ssid', event)" value="">
	</TD>
</TR>
<TR>
	<TD nowrap><b>Idle Timeout</b> (In Minutes)</TD>
	<TD nowrap>
	<input type="text" name="pppoe_idletime" maxLength="5" size="16" value="5" onKeyPress="return getkey('num', event)">
	</TD>
</TR>
<TR><TD nowrap colspan=2><B>Internet IP Address</B></TD></TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="WANAssign" value="Dynamic" onClick="setIP_welcome_pppoe()" checked>Get Dynamically from ISP
	</TD>
</TR>
<TR>
	<TD nowrap><input type="radio" name="WANAssign" value="Fixed" onClick="setIP_welcome_pppoe()">Use Static IP Address</TD>
	<TD nowrap>
	<input type="text" name="WPethr1"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="WPethr2"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="WPethr3"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="WPethr4"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR><TD nowrap colspan=2><B>Domain Name Server (DNS) Address</B></A></TD></TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="DNSAssign" value="0" onClick="setDNS(document.forms[0])" checked>Get Automatically from ISP
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="DNSAssign" value="1" onClick="setDNS(document.forms[0])">Use These DNS Servers
	</TD>
</TR>
<TR>
	<TD nowrap>&nbsp;&nbsp;Primary DNS</TD>
	<TD nowrap>
	<input type="text" name="DAddr1"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="DAddr2"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="DAddr3"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="DAddr4"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD>
</TR>
<TR>
	<TD nowrap>&nbsp;&nbsp;Secondary DNS</TD>
	<TD nowrap>
	<input type="text" name="PDAddr1"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="PDAddr2"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="PDAddr3"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="PDAddr4"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<!--TR>
	<TD nowrap colspan=2 align=center>
	<input type='submit' name='Apply' value='Apply' onClick='return check_wizard_pppoe_new(0);'>
	<input type='reset' name='Cancel' value='Cancel' onClick='location.href="BAS_basic.asp";'>
	<input type='submit' name='Test' value='Test' onClick='return check_wizard_pppoe_new(1);'>
	</TD>
</TR-->
</TABLE>
</div>

</FORM>
</BODY>
</HTML>
