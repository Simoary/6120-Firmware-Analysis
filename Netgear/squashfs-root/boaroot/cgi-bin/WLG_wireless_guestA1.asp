
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/wlan.js"></script>
<script language=javascript type=text/javascript src="/advanced.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/WLG_wireless_guestA1.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="wlan_a1">

<div class="page_title">Guest Network Settings a/n</div>
<div class="fix_button">
<TABLE cellspacing=2 cellPadding=0 width=100% border=0>
<TR>
        <TD nowrap colspan=2 align=center>
	<input class="cancel_bt" type='button' value='Cancel' onClick='location.href="WLG_wireless_guestA1.asp";'>&nbsp;&nbsp;
        <input class="apply_bt" type='submit' value='Apply' onclick='return check_wlan_guest("an")'>
        </TD>
</TR>
</TABLE>
</div>
<div id="main" class="main_top_button"> 
<TABLE width=100%% border=0 cellpadding=0 cellspacing=3>
<!--TR><TD colSpan=2><H1>Guest Network Settings a/n</H1></TD></TR-->
<TR><TD colSpan=2></TD></TR>
<script>
var wl_simple_mode="3";
var wl_key1 = "";
var wl_key2 = "";
var wl_key3 = "";
var wl_key4 = "";

var wep_64_key1 = "";
var wep_64_key2 = "";
var wep_64_key3 = "";
var wep_64_key4 = "";

var wep_128_key1 = "";
var wep_128_key2 = "";
var wep_128_key3 = "";
var wep_128_key4 = "";

var lanIP = "192.168.1.1";
var lanSubnet = "255.255.255.0";
var wanIP = "172.17.144.126";
var wanSubnet = "255.255.254.0";
var guest_router_flag=parent.guest_router_flag;
var wire_iso_flag=parent.wire_iso_flag;
var old_wla_endis_wireless_isolation='0';

var str_none="";
var str_wep="";
var str_wpa="";
var str_wpa2="";
var str_wpas="";
var str_wpae="";
var wds_endis_fun="0";
var old_sectype="1";

var get_wpae_mode="WPAE-TKIPAES";
var get_radiusSerIp="";
var get_radiusPort="1812";
var get_endis_guestNet="0";
var get_endis_guestSSIDbro="1";
var get_enable_video_value="0";
var get_endis_allow_guest="0";

var StartChannel = new Array(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,1); 
var FinishChannel = new Array(11,13,13,13,11,13,13,13,13,11,13,13,11); 

</script>
<input type="hidden" name="old_length">
<input type="hidden" name="generate_flag">
<input type="hidden" name="sec_wpaphrase_len">
<input type="hidden" name="hidden_wpa_psk">
<input type="hidden" name="hidden_sec_type">
<input type="hidden" name="wep_press_flag">
<input type="hidden" name="wpa1_press_flag" value=0>
<input type="hidden" name="wpa2_press_flag" value=0>
<input type="hidden" name="wpas_press_flag" value=0>
<input type="hidden" name="wps_change_flag" value="5">

<input type="hidden" name="hidden_enable_guestNet">
<input type="hidden" name="hidden_enable_ssidbro">
<input type="hidden" name="hidden_enable_video">
<input type="hidden" name="hidden_allow_guest">
<input type="hidden" name="radiusServerIP">
<input type="hidden" name="s_gssid">
<input type="hidden" name="hidden_WpaeRadiusSecret">
<input type="hidden" name="wla_guest_endis_wireless_isolation">
<input type="hidden" name="hidden_guest_network_mode_flag">
<input type="hidden" name="wl_hidden_wlan_mode" value="">
<!--
<TR>
	<TD nowrap colspan=2><B>Network Profiles</B></TD>
</TR> -->
</TABLE>
<!--
<TABLE width=100% border=1 cellpadding=0>
<TR>
	<TD class=subhead>&nbsp;&nbsp;</TD>
	<TD class=subhead align=center>Profile</TD>
	<TD class=subhead align=center>SSID</TD>
	<TD class=subhead align=center>Security</TD>
	<TD class=subhead align=center>Enable</TD>
	<TD class=subhead align=center>Broadcast SSID</TD>
</TR>
<TR>
	<TD align=center><input type=radio name=guestID value=1></TD>
	<TD align=center>1</TD>
	<TD align=center>
	<script>
	var show_ssid="";
	show_ssid=old_ssid.replace(/>/g, '&gt;').replace(/</g, '&lt;').replace(/ /g,"&nbsp;");
	document.write(show_ssid);	
	</script>
	</TD>
	<TD align=center>None</TD>
	<TD align=center>No</TD>
	<TD align=center>Yes</TD>
</TR>
</TABLE>
<TR><TD>&nbsp;&nbsp;</TD></TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
-->
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_an','wireless')"><B>Wireless Settings</B></A>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2><input type=checkbox name="enable_guestNet" value='1'>
	<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_an','enable_guest')">Enable Guest Network</A>
	</TD>
</TR>
<TR>	
	<TD nowrap colspan=2><input type=checkbox name="enable_ssidbro" value='1'>
	<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_an','enable_ssid')">Enable SSID Broadcast</A>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2><input type=checkbox name="enable_video" value='1'>
	<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_an','video')">Enable Video Network</A>
	</TD>
</TR>	
<TR>	
	<TD nowrap colspan=2><input type=checkbox name="allow_guest" value='1'>
	<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_an','allow_guest')">Allow guest to access My Local Network</A>
	</TD>
</TR>
<TR id=guestiso_an>
	<TD nowrap>
	<input type="checkbox" name="guest_iso_an" value="1">
	<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_an','wl_guest_iso')">Enable Wireless Isolation
	</TD>
</TR>
<TR>	
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_an','guest_ssid')">Guest Wireless Network Name (SSID) :</A></TD>
	<TD nowrap colspan=2><input type="text" name="gssid" value="NETGEAR-5G-Guest" size="20" maxlength="32"></TD>
</TR>
<tr style="display:none">
	<td><input type="text" name="wlssid" value="NETGEAR" size="20" maxlength="32"></td>
	<td><input type="text" name="wlassid" value="NETGEAR-5G" size="20" maxlength="32"></td>
</tr>
</TABLE>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
	<TD nowrap colspan=2><A tabindex=-1 href="javascript:loadhelp('_wlan_guest_an','security')"><B>Security Options</B></A></TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="security_type" value="Disable" onClick=setSecurity(1)>None
	<TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="security_type" value="WEP" onClick=setSecurity(2)>WEP
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="security_type" value="WPA-PSK" onClick=setSecurity(3)>WPA-PSK [TKIP]
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="security_type" value="WPA2-PSK" onClick=setSecurity(4)>WPA2-PSK [AES]
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="security_type" value="AUTO-PSK" onClick=setSecurity(5)>WPA-PSK [TKIP] + WPA2-PSK [AES]
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="security_type" value="WPA-ENTER" onClick=setSecurity(6)>WPA/WPA2 Enterprise
	</TD>
</TR>
</TABLE>

<div id=view></div>

<div align="center" ID="none" style="position:absolute;top:0;left:0;visibility:hidden">
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<TR>
		<TD nowrap colspan=2></TD>
	</TR>
	</TABLE>
</div>   

<div align="center" ID="wep" style="position:absolute;top:0;left:0;visibility:hidden">
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_an','wep_auth')"><B>Security Encryption (WEP)</B></A>
		</TD>
	</TR>
	<TR>
		<TD nowrap>Authentication Type</TD>
		<TD nowrap>
			<select NAME="authAlgm" size="1">
				<option value=1  >Shared Key</option>
				<option value=2 SELECTED >Automatic</option>
			</select>
		</TD>
	</TR>
	<TR>
		<TD nowrap>Encryption Strength</TD>
		<TD nowrap> 
			<select NAME="wepenc" size="1" onChange="changekeylen(document.forms[0]);">
				<option value=5   >64-bit</option>
				<option value=13  >128-bit</option>
			</select>
		</TD>
	</TR>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_an','wepkey')"><B>Security Encryption (WEP) Key</B></A>
		</TD>
	</TR>
	<TR>
		<TD nowrap colspan=2>&nbsp;Passphrase :&nbsp;
			<input type="text" size="16" maxlength="32" NAME="passphraseStr" VALUE="">&nbsp;&nbsp;
			<input class="short_common_bt" type="button" name="Generate" VALUE="Generate" OnClick="clickgenerate(document.forms[0])">
		</TD>
	</TR>
	<TR>
		<TD nowrap colspan=2>
		<TABLE>
		<TR>
			<TD nowrap>Key 1
			<input type=radio NAME="wep_key_no" checked value="1">
			</TD>
			<TD nowrap>
			<input TYPE="TEXT" SIZE="document.forms[0].wepenc.value*2+2" MAXLENGTH="32" NAME="KEY1" VALUE="" OnFocus="this.maxLength=document.forms[0].wepenc.value*2;this.size=document.forms[0].wepenc.value*2+2;" onKeyPress="return getkey('wep', event)">
			</TD>
		</TR>
		<TR>
			<TD nowrap>Key 2
			<input type=radio NAME="wep_key_no" value="2">
			</TD>
			<TD nowrap>
			<input TYPE="TEXT" SIZE="document.forms[0].wepenc.value*2+2" MAXLENGTH="32" NAME="KEY2" VALUE="" OnFocus="this.maxLength=document.forms[0].wepenc.value*2;this.size=document.forms[0].wepenc.value*2+2;" onKeyPress="return getkey('wep', event)">
			</TD>
		</TR>
		<TR>
			<TD nowrap>Key 3
			<input type=radio NAME="wep_key_no" value="3">
			</TD>
			<TD nowrap><input TYPE="TEXT" SIZE="document.forms[0].wepenc.value*2+2" MAXLENGTH="32" NAME="KEY3" VALUE="" OnFocus="this.maxLength=document.forms[0].wepenc.value*2;this.size=document.forms[0].wepenc.value*2+2;" onKeyPress="return getkey('wep', event)">
			</TD>
		</TR>
		<TR>
			<TD nowrap>Key 4
			<input type=radio NAME="wep_key_no" value="4">
			</TD>
			<TD nowrap>
			<input TYPE="TEXT" SIZE="document.forms[0].wepenc.value*2+2" MAXLENGTH="32" NAME="KEY4" VALUE=""  OnFocus="this.maxLength=document.forms[0].wepenc.value*2;this.size=document.forms[0].wepenc.value*2+2;" onKeyPress="return getkey('wep', event)">
			</TD>
		</TR>
		</TABLE>
		</TD>
	</TR>
	</TABLE>
</div>

<div align="center" ID="wpa" style="position:absolute;top:0;left:0;visibility:hidden">
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_an','wpa-psk')"><B>Security Options (WPA-PSK)</B></A>
		</TD>
	</TR>
	<TR>
		<TD nowrap>Passphrase :</TD>
		<TD nowrap>
		<input type="text" id="textWpaPwdPhrase" size="20" maxlength="64" name="passphrase" value="" onFocus="document.forms[0].wpa1_press_flag.value=1" onKeyPress="document.forms[0].wpa1_press_flag.value=1">
		<span class="optiondesc" id="wpaPwdPhrExtText">(8-63 characters or 64 hex digits)</span>
		</TD>
	</TR>
	</TABLE>
</div>
 
<div align="center" ID="wpa2" style="position:absolute;top:0;left:0;visibility:hidden">  
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_an','wpa2-psk')"><B>Security Options (WPA2-PSK)</B></A>
		</TD>
	</TR>
	<TR>
		<TD nowrap>
		<span class="optiondesc" id="wpaPwdPhraseText">Passphrase :</span>
		</TD>
		<TD nowrap>
		<input type="text" id="textWpaPwdPhrase" maxlength="64" size="20" name="passphrase" value="" onFocus="document.forms[0].wpa2_press_flag.value=1" onKeyPress="document.forms[0].wpa2_press_flag.value=1">
		<span class="optiondesc" id="wpaPwdPhrExtText">(8-63 characters or 64 hex digits)</span>
		</TD>
	</TR>
	</TABLE>
</div>

<div align="center" ID="wpas" style="position:absolute;top:0;left:0;visibility:hidden">
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_an','wpa-psk+wpa2-psk')"><B>Security Options (WPA-PSK + WPA2-PSK)</B></A>
		</TD>
	</TR>
	<TR>
		<TD nowrap>
		<span class="optiondesc" id="wpaPwdPhraseText">Passphrase :</span>
		</TD>
		<TD nowrap>
		<input type="text" id="textWpaPwdPhrase" size="20" maxlength="64" name="passphrase" value="" onFocus="document.forms[0].wpas_press_flag.value=1" onKeyPress="document.forms[0].wpas_press_flag.value=1">
		<span class="optiondesc" id="wpaPwdPhrExtText">(8-63 characters or 64 hex digits)</span>
		</TD>	  
	</TR>
	</TABLE>
</div>

<div align="center" ID="wpae" style="position:absolute;top:0;left:0;visibility:hidden">
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<TR>
		<TD nowrap colspan=2>
		<A tabindex=-1 href="javascript:loadhelp('_wlan_guest_an','wpawpa2')"><B>Security Options ( WPA/WPA2 Enterprise )</B></A>
		</TD>
	</TR>
	<TR>
		<TD nowrap>WPA Mode:</TD>
		<TD>
		<select name="wpae_mode" size='1'>
			<option value='WPAE-TKIP'>WPA [TKIP]</option>
			<option value='WPAE-AES'>WPA2 [AES]</option>
			<option value='WPAE-TKIPAES'>WPA [TKIP] + WPA2 [AES]</option>
		</select>
		</TD>
	</TR>
	<TR>
		<TD nowrap>RADIUS server IP Address:</TD>
        <TD nowrap>
        <input type="text" size="3" autocomplete="off" maxlength="3" name="radiusIPAddr1" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
        <input type="text" size="3" autocomplete="off" maxlength="3" name="radiusIPAddr2" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
        <input type="text" size="3" autocomplete="off" maxlength="3" name="radiusIPAddr3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
        <input type="text" size="3" autocomplete="off" maxlength="3" name="radiusIPAddr4" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
        </TD>  
	</TR>
	<TR>
		<TD nowrap>RADIUS server Port:</TD>	
		<TD nowrap><input type="text" id="textWpaeRadiusPort" size="20" maxlength="5" name="textWpaeRadiusPort" value="1812" onKeyPress="return getkey('num',event);"></TD>	
	</TR>	
	<TR>
		<TD nowrap>RADIUS server Shared Secret:</TD>	
		<TD nowrap><input type="text" id="textWpaeRadiusSecret" size="20" maxlength="128" value="" name="textWpaeRadiusSecret" onKeyPress="return getkey('ssid', event)"></TD>	
	</TR>	
	</TABLE>
</div>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</div>
<%tcWebApi_multilingual("2","_wlan_guest_an_help.asp")%>
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
function changekeylen(form)
{
	if(form.wepenc.options[0].selected == true)
	{
		form.KEY1.size=form.KEY2.size=form.KEY3.size=form.KEY4.size=12;
		form.KEY1.value = wep_64_key1;
		form.KEY2.value = wep_64_key2;
		form.KEY3.value = wep_64_key3;
		form.KEY4.value = wep_64_key4;
	}
	else
	{
		form.KEY1.size=form.KEY2.size=form.KEY3.size=form.KEY4.size=28;
		form.KEY1.value = wep_128_key1;
		form.KEY2.value = wep_128_key2;
		form.KEY3.value = wep_128_key3;
		form.KEY4.value = wep_128_key4;
	}
	form.generate_flag.value=0;
}

var wl_sectype="1";
var wla_wds_endis_fun="0";
var endis_wla_radio="1";
var wl_get_keyno="1";
var wl_get_keylength="64";
var wps_status="5";

function setSecurity(num)
{
	var form=document.forms[0];
	form.wpa1_press_flag.value=0;
	form.wpa2_press_flag.value=0;
	form.wpas_press_flag.value=0;
	if(num==2)
	{
		getObj("view").innerHTML=str_wep;
		var form=document.forms[0];
		var keyno=wl_get_keyno;
		var keylength=wl_get_keylength;
		form.wep_key_no[eval(keyno)-1].checked = true;
		form.KEY1.value=wl_key1;
		form.KEY2.value=wl_key2;
		form.KEY3.value=wl_key3;
		form.KEY4.value=wl_key4;
		form.old_length.value=keylength;
	}
	else if(num==3)
	{
		getObj("view").innerHTML=str_wpa;
	}
	else if(num==4)
	{
		getObj("view").innerHTML=str_wpa2;
	}
	else if(num==5)
	{
		getObj("view").innerHTML=str_wpas;
	}
	else if (num==6)
	{
		getObj("view").innerHTML=str_wpae;
		form.wpae_mode.value = get_wpae_mode;
		if( get_radiusSerIp != "" && get_radiusSerIp != "0.0.0.0" )
		{
			radiusIPArray = get_radiusSerIp.split(".");
			form.radiusIPAddr1.value = radiusIPArray[0];
			form.radiusIPAddr2.value = radiusIPArray[1];
			form.radiusIPAddr3.value = radiusIPArray[2];
			form.radiusIPAddr4.value = radiusIPArray[3];
		}
		form.textWpaeRadiusPort.value = get_radiusPort;		
	}
	else
		getObj("view").innerHTML=str_none;
}
function loadvalue()
{
	top.enabled_wds=0;
	menu_color_change('guest_a');

	var form=document.forms[0];

	if( guest_router_flag == 1 && wire_iso_flag == 1)
        document.getElementById("guestiso_an").style.display="";
    else
        document.getElementById("guestiso_an").style.display="none";
	if(old_wla_endis_wireless_isolation=='1')
		form.guest_iso_an.checked = true;
	else
		form.guest_iso_an.checked = false;
	if( get_endis_guestNet == 1 )
		form.enable_guestNet.checked = true;
	else
		form.enable_guestNet.checked = false;
	if( get_endis_guestSSIDbro == 1 )
		form.enable_ssidbro.checked = true;
	else
		form.enable_ssidbro.checked = false;

	if( get_enable_video_value == 1 )
		form.enable_video.checked = true;
	else
		form.enable_video.checked = false;

	if( get_endis_allow_guest == 1 )
		form.allow_guest.checked = true;
	else
		form.allow_guest.checked = false;
	
	str_none=getObj("none").innerHTML;
	str_wep=getObj("wep").innerHTML;
	str_wpa=getObj("wpa").innerHTML;
	str_wpa2=getObj("wpa2").innerHTML;
	str_wpas=getObj("wpas").innerHTML;
	str_wpae=getObj("wpae").innerHTML;
	getObj("none").innerHTML='';	
	getObj("wep").innerHTML='';	
	getObj("wpa").innerHTML='';	
	getObj("wpa2").innerHTML='';	
	getObj("wpas").innerHTML='';
	getObj("wpae").innerHTML='';	
	setSecurity(wl_sectype);
	var sectype=wl_sectype;
	if ( wla_wds_endis_fun == '0' || endis_wla_radio == '0' )
		setDisabled(false,form.security_type[2],form.security_type[3],form.security_type[4],form.security_type[5]);	
	else
		setDisabled(true,form.security_type[2],form.security_type[3],form.security_type[4],form.security_type[5]);
	
	//Bug 19665, should not be both set to wep in main network and guest network.
	var wla_sectype="1";
	if(endis_wla_radio==1 && wla_sectype==2)
		form.security_type[1].disabled = true;

	form.security_type[parseInt(sectype)-1].checked=true;
	if(wl_sectype == '2')
	{
		var form=document.forms[0];
		var keyno=wl_get_keyno;
		var keylength=wl_get_keylength;
		changekeylen(document.forms[0]);
		form.wep_key_no[eval(keyno)-1].checked = true;
		form.KEY1.value=wl_key1;
		form.KEY2.value=wl_key2;
		form.KEY3.value=wl_key3;
		form.KEY4.value=wl_key4;
		form.old_length.value=keylength;
	}
	/*else if(wl_sectype==3)
	{
		form.passphrase.value=get_wpa1;
	}
	else if(wl_sectype==4)
	{
		form.passphrase.value=get_wpa2;
	}
	else if(wl_sectype==5)
	{
		form.passphrase.value=get_wpas;
	}*/
	else if(wl_sectype==6)
	{
		form.wpae_mode.value = get_wpae_mode;
		if( get_radiusSerIp != "" && get_radiusSerIp != "0.0.0.0" )
		{
			radiusIPArray = get_radiusSerIp.split(".");
			form.radiusIPAddr1.value = radiusIPArray[0];
			form.radiusIPAddr2.value = radiusIPArray[1];
			form.radiusIPAddr3.value = radiusIPArray[2];
			form.radiusIPAddr4.value = radiusIPArray[3];
		}
		form.textWpaeRadiusPort.value = get_radiusPort;
	}
}
</script>
</BODY>
</HTML>
