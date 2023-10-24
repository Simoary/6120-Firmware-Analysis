
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/bas_ether.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/BAS_update.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="wizard_static">

 <div class="page_title">Static IP (Fixed) Addresses</div>
<div class="fix_button">
    <div id="line3_1" class="common_button_short" name="Test" onClick='return check_wizard_static(1,"wiz");'><b>Test</b></div>
    <div id="line3_2" class="cancel_button" name="Cancel" onClick='location.href="BAS_basic.asp";'><b>Cancel</b></div>
    <div id="line3_3" class="apply_button" name="Apply" onclick='return check_wizard_static(0,"wiz");'><b>Apply</b></div>
</div>
<div id="main" class="main_top_button"> 
<script>
var lan_ip="192.168.1.1";
var lan_subnet="255.255.255.0";
var old_wan_ip="172.17.144.167";
var dns_third_flag=0;

var run_test="no";
var ts="42143176";


function loadvalue()
{
	var form=document.forms[0];

        var ether_get_ip=old_wan_ip;
        if (ether_get_ip!="")
        {
                var ip_array=ether_get_ip.split('.');
                form.WPethr1.value=ip_array[0];
                form.WPethr2.value=ip_array[1];
                form.WPethr3.value=ip_array[2];
                form.WPethr4.value=ip_array[3];
        }
        var ether_get_subnet="255.255.254.0";
        if (ether_get_subnet!="")
        {
                var mask_array=ether_get_subnet.split('.');
                form.WMask1.value=mask_array[0];
                form.WMask2.value=mask_array[1];
                form.WMask3.value=mask_array[2];
                form.WMask4.value=mask_array[3];
        }
        var ether_get_gateway="172.17.145.254";
        if (ether_get_gateway!="")
        {
                var gtw_array=ether_get_gateway.split('.');
                form.WGateway1.value=gtw_array[0];
                form.WGateway2.value=gtw_array[1];
                form.WGateway3.value=gtw_array[2];
                form.WGateway4.value=gtw_array[3];
        }
        var ether_get_dns1="172.17.151.2";
        if (ether_get_dns1!="" && ether_get_dns1.indexOf(":")==-1)
        {
                var dns1_array=ether_get_dns1.split('.');
                form.DAddr1.value=dns1_array[0];
                form.DAddr2.value=dns1_array[1];
                form.DAddr3.value=dns1_array[2];
                form.DAddr4.value=dns1_array[3];
        }
        var ether_get_dns2="172.17.151.1";
        if (ether_get_dns2!="" && ether_get_dns2.indexOf(":")==-1)
        {
                var dns2_array=ether_get_dns2.split('.');
                form.PDAddr1.value=dns2_array[0];
                form.PDAddr2.value=dns2_array[1];
                form.PDAddr3.value=dns2_array[2];
                form.PDAddr4.value=dns2_array[3];
        }

	
	goTestApply();

}
</script>
<input type="hidden" name="run_test" value="">
<input type="hidden" name="ether_ipaddr">
<input type="hidden" name="ether_subnet">
<input type="hidden" name="ether_gateway">
<input type="hidden" name="ether_dnsaddr1">
<input type="hidden" name="ether_dnsaddr2">
<input type="hidden" name="WIZ_type" value="static">
<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<!--TR><TD nowrap colspan=2><H1>Static IP (Fixed) Addresses</H1></TD></TR-->
<!--TR>
	<TD colspan=2>Your Internet service provides the static IP (Fixed) settings.
	<P>Be sure to enter the correct IP address for each static IP settings. For example, be sure to enter the Gateway IP Address in the Gateway Address fields and the IP Address in the IP Address fields without mixing them up.
	</TD>
</TR-->
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR><TD nowrap colspan=2><B>Internet IP Address</B></TD></TR>
<TR>
	<TD nowrap><img src=/spacer.gif width=20 height=12 border=0>IP Address</TD>
	<TD nowrap align=right>
	<input type="text" name="WPethr1"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="WPethr2"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="WPethr3"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="WPethr4"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD>
</TR>
<TR>
	<TD nowrap><img src=/spacer.gif width=20 height=12 border=0>IP Subnet Mask</TD>
	<TD nowrap align=right>
	<input type="text" name="WMask1"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="WMask2"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="WMask3"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="WMask4"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD>
</TR>
<TR>
	<TD nowrap><img src=/spacer.gif width=20 height=12 border=0>Gateway IP Address</TD>
	<TD nowrap align=right>
	<input type="text" name="WGateway1"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="WGateway2"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="WGateway3"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="WGateway4"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD>
</TR>
<TR><TD nowrap colspan=2><B>Domain Name Server (DNS) Address</B></TD></TR>
<TR>
	<TD nowrap><img src=/spacer.gif width=20 height=12 border=0>Primary DNS</TD>
	<TD nowrap align=right>
	<input type="text" name="DAddr1"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="DAddr2"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="DAddr3"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="DAddr4"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD>
</TR>
<TR>
	<TD nowrap><img src=/spacer.gif width=20 height=12 border=0>Secondary DNS</TD>
	<TD nowrap align=right>
	<input type="text" name="PDAddr1"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="PDAddr2"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="PDAddr3"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="PDAddr4"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">	
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<!--TR>
	<TD nowrap colspan=2 align=center>
	<input type='submit' name='Apply' value='Apply' onClick='return check_wizard_static(0,"wiz");'>
	<input type='reset' name='Cancel' value='Cancel' onClick='location.href="BAS_basic.asp"'>
	<input type="submit" name="Test" value="Test" onClick="return check_wizard_static(1,'wiz');">
	</TD>
</TR-->
</TABLE>
</div>
</FORM>
</BODY>
</HTML>
