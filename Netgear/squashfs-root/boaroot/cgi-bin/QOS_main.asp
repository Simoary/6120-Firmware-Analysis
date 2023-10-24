<%
    if request_Form("qos_apply_Flag") = "1" then
	   tcWebApi_set("WLan_Entry","WMM","qos_endis_wmm")
	   tcWebApi_set("WLan11ac_Entry","WMM","qos_endis_wmm_a")
	   tcWebApi_commit("WLan_Entry")
	   tcWebApi_commit("WLan11ac_Entry")
	end if
%>
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/qos.js"></script>
<title><%tcWebApi_multilingual("1","glbstr_title")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/QOS_main.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="apply_qos">

<div class="page_title"><%tcWebApi_multilingual("1","qos_setup_str")%></div>
<div class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
    <TD nowrap colspan=2 align=center>
	<input class="cancel_bt" type='button' name='Cancel' id="cancel" value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick='qosMain();'> &nbsp;&nbsp;
    <input class="apply_bt" type="submit" name="Apply" id="apply" value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick="return check_qos_apply(document.forms[0]);">
    </TD>
</TR>
</TABLE>
</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<script>

var ts='90475232';

var endis_wl_wmm="<%If tcWebApi_get("WLan_Entry","WMM","h") <> "N/A" then tcWebApi_get("WLan_Entry","WMM","s") end if%>";
var mode_11n="<%tcWebApi_get("WLan_Common","11nMode","s")%>";
var mode_11_an="<%tcWebApi_get("WLan11ac_Common","11nMode","s")%>";
var endis_wla_wmm="<%If tcWebApi_get("WLan11ac_Entry","WMM","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry","WMM","s") end if%>";
var qos_endis_on="0";
var qos_endis_bandwidth="0";
var tcbw_unit="";
var tcbw_value="256";

var qos_bandwidth_type = "0";
var qos_auto_uprate = ""; //bug 24170:if WAN is disconnected,the uplink bandwidth record don't disappear
var wan_status=1;

if (wan_status == 1)
	qos_auto_uprate = "";

var max_bandwidth = parent.max_bandwidth;
var an_router_flag = parent.an_router_flag;
var enable_ap_flag="0";//bug 24666 according to the page 128 of spec 2.0,add AP mode
function change_web_format()
{
	if( an_router_flag == 1 )
	{
		document.getElementById("wmm_an").style.display="";  
		document.getElementById("access_qos").style.display="none";  //201311181512, Tony, Disable Internet Access QoS On
		document.getElementById("bw_ctrl").style.display="none";  //201311181512, Tony, Disable Turn Bandwidth Control
		document.getElementById("bw_uplink").style.display="none";  //201311181512, Tony, Disable Uplink bandwidth
		document.getElementById("bw_uplink_auto").style.display="none";  //201311181512, Tony, Disable Automatically check Internet Uplink bandwidth
		document.getElementById("qos_priority").style.display="none";  //201311181512, Tony, Disable QoS Priority Rule list 
	}
	else
	{
		document.getElementById("wmm_an").style.display="none";	
	}

}
function loadvalue()
{
	cf=document.forms[0];

	change_web_format();

	if(enable_ap_flag == "1")
		setDisabled(true,cf.qosEnable,cf.bwEnable);
	else
		setDisabled(false,cf.qosEnable,cf.bwEnable);
	if( mode_11n == "1")
	{
		cf.wmm_enable.disabled = true;
		cf.wmm_enable.checked = true;
	}
	else
	{
		cf.wmm_enable.disabled = false;
		if( endis_wl_wmm == "1" )
			cf.wmm_enable.checked = true;
		else
			cf.wmm_enable.checked = false;
	}
	
	if(mode_11_an == "1")
	{
		cf.wmm_enable_an.disabled = true;
		cf.wmm_enable_an.checked = true;
	}
	else
	{
		cf.wmm_enable_an.disabled = false;
        if( endis_wla_wmm == "1" )
                cf.wmm_enable_an.checked = true;
        else
                cf.wmm_enable_an.checked = false;
	}
	if( qos_endis_on == "1" )
		cf.qosEnable.checked =true;
	else
		cf.qosEnable.checked = false;
/*
	if ( "" == 2 )
	{
		alert("The WAN IP address is not correct. The value of the uplink bandwidth is set to the same value as before.");
	}
*/	
    if( qos_endis_bandwidth == "1") 
        cf.bwEnable.checked = true; 
    else 
        cf.bwEnable.checked = false; 
	
	if(qos_auto_uprate == "") 
	{	//bug 23291:if the value of qos_auto_uprate is not null,use this value to overwrite tcbw_value
		if(tcbw_unit == "Mbps") 
    	{ 
       		cf.tcbw_value.value = parseInt(tcbw_value/1024); 
	        cf.tcbw_unit.selectedIndex=1; 
    	} 
		else 
    	{ 
       		cf.tcbw_value.value = tcbw_value; 
       		cf.tcbw_unit.selectedIndex=0; 
    	}
	}
	else
	{
		cf.tcbw_value.value = qos_auto_uprate; 
		cf.tcbw_unit.selectedIndex=0; 
	}
		
	if(qos_bandwidth_type == "0")
		cf.bw_sel[0].checked = true;
	else if(qos_bandwidth_type == "1")
		cf.bw_sel[1].checked = true;

	//if((cf.bwEnable.checked == true) && (cf.qos_bandwidth[1].checked == true))
		if(qos_auto_uprate == "") 	//bug 21685
			cf.Bandwidth.value = 0;
		else
			cf.Bandwidth.value = qos_auto_uprate;
	//else
		//cf.Bandwidth.value = "";

	trun_bandwidth();

	cf.wan_ip.value="172.17.144.126";
	cf.dns_ip.value="172.17.151.2";
}

function check_auto_bandwidth()
{
	var cf = document.forms[0];
	parent.qos_check_time = 0;
	cf.qos_hidden_check.value = "1";
	cf.action = "/apply.cgi?/pls_wait_qos_check.asp timestamp="+ts;
	check_qos_apply(cf);
}

function trun_bandwidth()
{
	var cf = document.forms[0];
	
	if(cf.bwEnable.checked == false)
		setDisabled(true, cf.bw_sel[0], cf.bw_sel[1], cf.tcbw_value, cf.tcbw_unit);
	else
		setDisabled(false, cf.bw_sel[0], cf.bw_sel[1], cf.tcbw_value, cf.tcbw_unit);
	
	change_band_width_type();
}

function change_band_width_type()
{
	var cf = document.forms[0];

	if(cf.bwEnable.checked == true)
	{
		if(cf.bw_sel[0].checked == true)
		{
			//cf.Bandwidth.value = "";
			//cf.qos_auto_check.disabled = true; bug 22021 Check button should always be allowed clicked
			cf.tcbw_value.disabled = false;
			cf.tcbw_unit.disabled = false;
		}
		else if(cf.bw_sel[1].checked == true)
		{
			//cf.qos_auto_check.disabled = false;
			cf.tcbw_value.disabled = true;
			cf.tcbw_unit.disabled = true;
		}
	}
	//else
		//cf.Bandwidth.value = "";

	return true;
}
</script>
<input type="hidden" name="qos_endis_wmm">
<input type="hidden" name="qos_endis_wmm_a">
<input type="hidden" name="qos_endis_on">
<input type="hidden" name="qos_endis_bandwidth"> 
<input type="hidden" name="qos_hidden_uprate"> 
<input type="hidden" name="qos_hidden_bandwidth_type">
<input type="hidden" name="wan_ip"> 
<input type="hidden" name="dns_ip"> 
<input type="hidden" name="qos_hidden_check" value="0">
<input type="hidden" name="qos_apply_Flag" value="0">

<TR>
	<TD><input type="checkbox" name="wmm_enable" id="wmm_enable" value="1"><a tabindex=-1 href="javascript:loadhelp('_qos','wifi')"><b><%tcWebApi_multilingual("1","wmm_setting_enable_str")%><script> if(an_router_flag) document.write("(2.4GHz b/g/n)");</script></b></a></TD>
</TR>
<TR id=wmm_an>
	<TD><input type="checkbox" name="wmm_enable_an" id="wmm_enable_an" value="1"><a tabindex=-1 href="javascript:loadhelp('_qos','wifi')"><b><%tcWebApi_multilingual("1","wmm_setting_5g_enable_str")%> (5GHz a/n)</b></a></TD>
</TR>
<TR style="display:none"><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR id=access_qos>  <!--201311181512, Tony, Disable Internet Access QoS On-->
	<TD><input type="checkbox" name="qosEnable" id="qos_enable" value="1"><a tabindex=-1 href="javascript:loadhelp('_qos','qos_on')"><b><%tcWebApi_multilingual("1","turn_internet_str")%></b></a></TD>
</TR>
<TR style="display:none"><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>  <!--201311181512, Tony, Disable line liteblue-->
<TR id=bw_ctrl>  <!--201311181512, Tony, Disable Turn Bandwidth Control-->
	<TD><input type="checkbox" name="bwEnable" id="bw_enable" onClick="trun_bandwidth();" value="0"><a tabindex=-1 href="javascript:loadhelp('_qos','Bandwidth')"><b><%tcWebApi_multilingual("1","turn_bandwidth_str")%></b></TD>
</TR>
<TR id=bw_uplink>  <!--201311181512, Tony, Disable Uplink bandwidth-->
    	<TD><img src=/spacer.gif width=20 height=12 border=0>
	<input type="radio" name="bw_sel" id="bw_select" value="1" onClick="change_band_width_type();"><b><%tcWebApi_multilingual("1","uplink_bandwidth_str")%> :</b>&nbsp;&nbsp;&nbsp;&nbsp;<b><%tcWebApi_multilingual("1","maximum_str")%></b>&nbsp;&nbsp;
	<input type="text" name="tcbw_value" id="tcbw_value" size="6" onKeyPress="return getkey('num',event)" >
    	<select name="tcbw_unit" id="tcbw_unit" size="1">
        <option value="Kbps"><%tcWebApi_multilingual("1","kbps_str")%></option>
        <option value="Mbps"><%tcWebApi_multilingual("1","mbps_str")%></option>
    </TD>
</TR>
<TR id=bw_uplink_auto>  <!--201311181512, Tony, Disable Automatically check Internet Uplink bandwidth-->
	<TD><img src=/spacer.gif width=20 height=12 border=0>
	<input type="radio" name="bw_sel" id="bw_select" value="2" onClick="return change_band_width_type();"><b><%tcWebApi_multilingual("1","uplink_bandwidth_auto_str")%> :</b>&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="text" name="bandwidth" id="bandwidth" tabindex="-1" size="3" readonly onfocus="this.blur()" style="border:none" value=""><%tcWebApi_multilingual("1","kbps_str")%>
	&nbsp;&nbsp;
	<input class="short_common_bt" type="submit" name="checkbandwidth" id="check_bandwidth" value="Check" onClick='check_auto_bandwidth();'>
	</TD>
</TR>
<TR style="display:none">
	<TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD>  <!--201311181512, Tony, Disable line liteblue-->
</TR>
<TR id=qos_priority>  <!--201311181512, Tony, Disable QoS Priority Rule list-->
	<TD><b>QoS Priority Rule list</b>
    <img src="/spacer.gif" width="60" height="18" border="0" alt="" />
	<input class="common_bt" type="button" name="list_qos" id="list_qos" value="Setup QoS rule" onclick="qosRule();">
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</TABLE>
</div>
<%tcWebApi_multilingual("2","_qos_help.asp")%>
</FORM>
</BODY>
</HTML>
