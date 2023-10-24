<%
   if request_Form("WDSFlag") = "1" then
      if request_Form("wds_endis_fun") = "1" then
         tcWebApi_set("WebCurSet_Entry","wlan_id","hidden_wlan_id")
	     tcWebApi_set("WLan_Entry","WPSConfMode","wl_hidden_wps_disable")
	     tcWebApi_set("WLan_WDS","WdsEnable","wds_endis_fun")
	     tcWebApi_set("WLan_WDS","RepeatMode","hidden_wds_mode")
	     if request_Form("hidden_wds_mode") = "0" then
	        tcWebApi_set("WLan_WDS","repeater_ip","repeater_ip")
	        tcWebApi_set("WLan_WDS","client_disable_repeat","wds_endis_ip_client")
	        tcWebApi_set("WLan_WDS","basic_station_mac","basic_station_mac")
		    tcWebApi_commit("WebCurSet_Entry")
            tcWebApi_commit("WLan_Entry")
	     elseif request_Form("hidden_wds_mode") = "1" then
	        tcWebApi_set("WLan_WDS","client_disable_base","wds_endis_mac_client")
	        if request_Form("repeater_mac1") <> "" then
	           tcWebApi_set("WLan_WDS","Wds_MAC0","repeater_mac1")
	        end if
	        if request_Form("repeater_mac2") <> "" then
	           tcWebApi_set("WLan_WDS","Wds_MAC1","repeater_mac2")
	        end if
	        if request_Form("repeater_mac3") <> "" then
	           tcWebApi_set("WLan_WDS","Wds_MAC2","repeater_mac3")
	        end if
	        if request_Form("repeater_mac4") <> "" then
	           tcWebApi_set("WLan_WDS","Wds_MAC3","repeater_mac4")
	        end if
	        tcWebApi_commit("WebCurSet_Entry")
            tcWebApi_commit("WLan_Entry")
         end if
      elseif request_Form("wds_endis_fun") = "0" then
         tcWebApi_set("WebCurSet_Entry","wlan_id","hidden_wlan_id")
         tcWebApi_set("WLan_Entry","WPSConfMode","wl_hidden_wps_enable")
	     tcWebApi_commit("WebCurSet_Entry")
         tcWebApi_commit("WLan_Entry")
      end if
   end if
   
   if request_Form("WDS_5G_Flag") = "1" then
      if request_Form("wds_endis_fun_a") = "1" then
         tcWebApi_set("WebCurSet_Entry","wlan_ac_id","hidden_wlan_ac_id")
	     tcWebApi_set("WLan11ac_Entry","WPSConfMode","wl_hidden_wps_disable")
	     tcWebApi_set("WLan11ac_WDS","WdsEnable","wds_endis_fun_a")
	     tcWebApi_set("WLan11ac_WDS","RepeatMode","hidden_wds_mode_a")
	     if request_Form("hidden_wds_mode_a") = "0" then
	        tcWebApi_set("WLan11ac_WDS","repeater_ip","repeater_ip_a")
	        tcWebApi_set("WLan11ac_WDS","client_disable_repeat","wds_endis_ip_client_a")
	        tcWebApi_set("WLan11ac_WDS","basic_station_mac","basic_station_mac_a")
			tcWebApi_commit("WebCurSet_Entry")
            tcWebApi_commit("WLan1ac_Entry")
	     elseif request_Form("hidden_wds_mode_a") = "1" then
	        tcWebApi_set("WLan11ac_WDS","client_disable_base","wds_endis_mac_client_a")
	        if request_Form("repeater_mac1_a") <> "" then
	           tcWebApi_set("WLan11ac_WDS","Wds_MAC0","repeater_mac1_a")
	        end if
	        if request_Form("repeater_mac2_a") <> "" then
	           tcWebApi_set("WLan11ac_WDS","Wds_MAC1","repeater_mac2_a")
	        end if
	        if request_Form("repeater_mac3_a") <> "" then
	           tcWebApi_set("WLan11ac_WDS","Wds_MAC2","repeater_mac3_a")
	        end if
	        if request_Form("repeater_mac4_a") <> "" then
	           tcWebApi_set("WLan11ac_WDS","Wds_MAC3","repeater_mac4_a")
	        end if
	        tcWebApi_commit("WebCurSet_Entry")
            tcWebApi_commit("WLan11ac_Entry")
         end if
      elseif request_Form("wds_endis_fun_a") = "0" then
         tcWebApi_set("WebCurSet_Entry","wlan_ac_id","hidden_wlan_ac_id")
         tcWebApi_set("WLan11ac_Entry","WPSConfMode","wl_hidden_wps_enable")
	     tcWebApi_commit("WebCurSet_Entry")
         tcWebApi_commit("WLan11ac_Entry")
      end if
   end if
%>
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/wds.js"></script>
<script language=javascript type=text/javascript src="/advanced.js"></script>
<title><%tcWebApi_multilingual("1","glbstr_title")%></title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/WLG_wds.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="wds">

<div class="page_title" id="title"><%tcWebApi_multilingual("1","wireless_repeat_function_str")%></div>
<div class="fix_button" id="check_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
	<input class="cancel_bt" type='reset' name='Cancel' id='cancel' value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick='location.href="WLG_wds.asp";'>&nbsp;&nbsp;
        <input class="apply_bt" type="submit" name="Apply" id="apply" value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick="return check_wds(document.forms[0]);">
        </TD>
</TR>
</TABLE>
</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>


<script>
<%if tcWebApi_get("WLan_Entry0","AuthMode","h") <> "N/A" then%>
	 <%if tcWebApi_get("WLan_Entry0","AuthMode","h") = "OPEN" then%>
	      var security_mode = 1;
     <%elseif tcWebApi_get("WLan_Entry0","AuthMode","h") = "WEP-64Bits" then%>
          var security_mode = 2;
	 <%elseif tcWebApi_get("WLan_Entry0","AuthMode","h") = "WEP-128Bits" then%>
		  var security_mode = 2;
     <%elseif tcWebApi_get("WLan_Entry0","AuthMode","h") = "WPAPSK" then%>
		  var security_mode = 3;
     <%elseif tcWebApi_get("WLan_Entry0","AuthMode","h") = "WPA2PSK" then%>
		  var security_mode = 4;
	 <%elseif tcWebApi_get("WLan_Entry0","AuthMode","h") = "WPAPSKWPA2PSK" then%>
		  var security_mode = 5;
	 <%elseif tcWebApi_get("WLan_Entry0","AuthMode","h") = "WPA" then%>;
		  var security_mode = 6;
	 <%elseif tcWebApi_get("WLan_Entry0","AuthMode","h") = "WPA2" then%>
		  var security_mode = 6;
	 <%else%>
		  var security_mode = 6;
	 <%end if%>
<%end if%>

<%if tcWebApi_get("WLan11ac_Entry0","AuthMode","h") <> "N/A" then%>
	 <%if tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "OPEN" then%>
	      var security_mode_a = 1;
     <%elseif tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "WEP-64Bits" then%>
          var security_mode_a = 2;
	 <%elseif tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "WEP-128Bits" then%>
		  var security_mode_a = 2;
     <%elseif tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "WPAPSK" then%>
		  var security_mode_a = 3;
     <%elseif tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "WPA2PSK" then%>
		  var security_mode_a = 4;
	 <%elseif tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "WPAPSKWPA2PSK" then%>
		  var security_mode_a = 5;
	 <%elseif tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "WPA" then%>;
		  var security_mode_a = 6;
	 <%elseif tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "WPA2" then%>
		  var security_mode_a = 6;
	 <%else%>
		  var security_mode_a = 6;
	 <%end if%>
<%end if%>

var wireless_repeat_auto_str="<%tcWebApi_multilingual("1","wireless_repeat_auto_str")%>";
var wireless_repeat_security_str="<%tcWebApi_multilingual("1","wireless_repeat_security_str")%>";
var wireless_repeat_wps_str="<%tcWebApi_multilingual("1","wireless_repeat_wps_str")%>";
var operate_repeat_str="<%tcWebApi_multilingual("1","operate_repeat_str")%>";
var invalid_base_mac_str="<%tcWebApi_multilingual("1","invalid_base_mac_str")%>";
var enter_base_mac_str="<%tcWebApi_multilingual("1","enter_base_mac_str")%>";
var base_station_mac_str="<%tcWebApi_multilingual("1","base_station_mac_str")%>";
var duplict_mac_str="<%tcWebApi_multilingual("1","duplict_mac_str")%>";
var enter_repeat_mac_str="<%tcWebApi_multilingual("1","enter_repeat_mac_str")%>";
var invalid_repeat_ip_str="<%tcWebApi_multilingual("1","invalid_repeat_ip_str")%>";
var invalid_repeat_mac1_str="<%tcWebApi_multilingual("1","invalid_repeat_mac1_str")%>";
var invalid_repeat_mac2_str="<%tcWebApi_multilingual("1","invalid_repeat_mac2_str")%>";
var invalid_repeat_mac3_str="<%tcWebApi_multilingual("1","invalid_repeat_mac3_str")%>";
var invalid_repeat_mac4_str="<%tcWebApi_multilingual("1","invalid_repeat_mac4_str")%>";

var the_mac,the_mac1,the_mac2,the_mac3,the_mac4;
var wl_channel="<%if tcWebApi_get("WLan_Common","Channel","h") <> "N/A" then tcWebApi_get("WLan_Common","Channel","s") end if%>";
var wla_channel="44";
var old_lanip="192.168.1.1";
var lan_subnet="255.255.255.0";
var old_wds_endis_fun="<%if tcWebApi_get("WLan_WDS","WdsEnable","h") <> "N/A" then tcWebApi_get("WLan_WDS","WdsEnable","s") end if%>";
var old_wds_endis_fun_a="<%if tcWebApi_get("WLan11ac_WDS","WdsEnable","h") <> "N/A" then tcWebApi_get("WLan11ac_WDS","WdsEnable","s") end if%>";
var old_repeater_ip="<%if tcWebApi_get("WLan_WDS","repeater_ip","h") <> "N/A" then tcWebApi_get("WLan_WDS","repeater_ip","s") end if%>";
var old_repeater_ip_a="<%if tcWebApi_get("WLan11ac_WDS","repeater_ip","h") <> "N/A" then tcWebApi_get("WLan11ac_WDS","repeater_ip","s") end if%>";
var old_wds_repeater_basic="<%if tcWebApi_get("WLan_WDS","RepeatMode","h") <> "N/A" then tcWebApi_get("WLan_WDS","RepeatMode","s") end if%>";
var old_wds_repeater_basic_a="<%if tcWebApi_get("WLan11ac_WDS","RepeatMode","h") <> "N/A" then tcWebApi_get("WLan11ac_WDS","RepeatMode","s") end if%>";
var endis_wl_radio='1';
var endis_wla_radio='1';
var lan_mac="C4:3D:C7:98:18:F5";
var lan_mac_a="C4:3D:C7:98:18:F7";
var an_router_flag = parent.an_router_flag;
var rep_old_lanip="192.168.1.1";
var client_disable_repeat = "<%if tcWebApi_get("WLan_WDS","client_disable_repeat","h") <> "N/A" then tcWebApi_get("WLan_WDS","client_disable_repeat","s") end if%>";
var client_disable_base = "<%if tcWebApi_get("WLan_WDS","client_disable_base","h") <> "N/A" then tcWebApi_get("WLan_WDS","client_disable_base","s") end if%>";
var client_disable_repeat_5g = "<%if tcWebApi_get("WLan11ac_WDS","client_disable_repeat","h") <> "N/A" then tcWebApi_get("WLan11ac_WDS","client_disable_repeat","s") end if%>";
var client_disable_base_5g = "<%if tcWebApi_get("WLan11ac_WDS","client_disable_base","h") <> "N/A" then tcWebApi_get("WLan11ac_WDS","client_disable_base","s") end if%>";

var old_type_is_repeater="0";
var new_type_is_repeater="0";
function change_web_format()
{
        if( an_router_flag == 1 ){
        document.getElementById("wds_an").style.display="";
		document.getElementById("mac_an").style.display="";
		document.getElementById("mode_an").style.display="";
		document.getElementById("repeater_an").style.display="";
		document.getElementById("client_an").style.display="";
		document.getElementById("base_an").style.display="";
		document.getElementById("sta_mode_an").style.display="";
		document.getElementById("pmp_sta_an").style.display="";
		document.getElementById("mac1_an").style.display="";
		document.getElementById("mac2_an").style.display="";
		document.getElementById("mac3_an").style.display="";
		document.getElementById("mac4_an").style.display="";
		document.getElementById("blue_an").style.display="";
	}
        else{
        document.getElementById("wds_an").style.display="none";
		document.getElementById("mac_an").style.display="none";
		document.getElementById("mode_an").style.display="none";
		document.getElementById("repeater_an").style.display="none";
		document.getElementById("client_an").style.display="none";
		document.getElementById("base_an").style.display="none";
		document.getElementById("sta_mode_an").style.display="none";
		document.getElementById("pmp_sta_an").style.display="none";
		document.getElementById("mac1_an").style.display="none";
		document.getElementById("mac2_an").style.display="none";
		document.getElementById("mac3_an").style.display="none";
		document.getElementById("mac4_an").style.display="none";
		document.getElementById("blue_an").style.display="none";
	}
}

function loadvalue()
{
	var cf=document.forms[0];

	top.enabled_wds=0;
	top.enabled_wps=1;

	/* bug23114: after set wireless, the wps button in menu maybe need change to grey, so , refresh the menu color */
	menu_color_change('advanced_wds');

	change_web_format();

	if (old_wds_endis_fun == "1")
	{
		cf.wds_enable.checked = true;
	}
	else
	{
		cf.wds_enable.checked = false;
		click_endis_wds();
	}
	cf.repeater_ip.value=old_repeater_ip;
	if (old_repeater_ip != "" && old_repeater_ip != "0.0.0.0")
	{
		var repeater_ip=old_repeater_ip;
		var ip_array=repeater_ip.split('.');
		cf.sysLANIPAddr1.value=ip_array[0];
		cf.sysLANIPAddr2.value=ip_array[1];
		cf.sysLANIPAddr3.value=ip_array[2];
		cf.sysLANIPAddr4.value=ip_array[3];
	}
	else
	{
		var repeater_ip=old_lanip;
		var ip_array=repeater_ip.split('.');
		cf.sysLANIPAddr1.value=ip_array[0];
		cf.sysLANIPAddr2.value=ip_array[1];
		cf.sysLANIPAddr3.value=ip_array[2];
		cf.sysLANIPAddr4.value="";
	}
	cf.hidden_wds_mode.value=old_wds_repeater_basic;
	if (old_wds_repeater_basic == "1")
		cf.wds_mode[1].checked=true;
	else
		cf.wds_mode[0].checked=true;
	if ((old_wds_endis_fun == "1" && old_wds_repeater_basic == "0") || (old_wds_endis_fun_a == "1" && old_wds_repeater_basic_a == "0"))
	{
		old_type_is_repeater="1";	
	}

	var repeater_mac1="<%if tcWebApi_get("WLan_WDS","Wds_MAC0","h") <> "N/A" then tcWebApi_get("WLan_WDS","Wds_MAC0","s") end if%>";
	var repeater_mac2="<%if tcWebApi_get("WLan_WDS","Wds_MAC1","h") <> "N/A" then tcWebApi_get("WLan_WDS","Wds_MAC1","s") end if%>";
	var repeater_mac3="<%if tcWebApi_get("WLan_WDS","Wds_MAC2","h") <> "N/A" then tcWebApi_get("WLan_WDS","Wds_MAC2","s") end if%>";
	var repeater_mac4="<%if tcWebApi_get("WLan_WDS","Wds_MAC3","h") <> "N/A" then tcWebApi_get("WLan_WDS","Wds_MAC3","s") end if%>";
	var basic_station_mac="<%if tcWebApi_get("WLan_WDS","basic_station_mac","h") <> "N/A" then tcWebApi_get("WLan_WDS","basic_station_mac","s") end if%>";
	if (cf.wds_mode[0].checked == true)
	{
		if (client_disable_repeat == "1")
			cf.ptp_sta.checked = true;
		else
			cf.ptp_sta.checked = false;
		if (basic_station_mac != "")
		{
			cf.ptp_mac.value=basic_station_mac;
		}
	}	
	else if (cf.wds_mode[1].checked == true)
	{
		if (client_disable_base == "1")
			cf.pmp_sta.checked =true;
		else
			cf.pmp_sta.checked =false;
		if (repeater_mac1!="")
		{
			cf.pmp_mac1.value=repeater_mac1;
		}
		if (repeater_mac2!="")
		{
			cf.pmp_mac2.value=repeater_mac2;
		}
		if (repeater_mac3!="")
		{
			cf.pmp_mac3.value=repeater_mac3;
		}
		if (repeater_mac4!="")
		{
			cf.pmp_mac4.value=repeater_mac4;
		}
	}
	if (cf.wds_enable.checked)
		click_repeater_basic();

        //loadvalue for a/n
        if (old_wds_endis_fun_a == "1")
        {
                cf.wds_enable_an.checked = true;
        }
        else
        {
                cf.wds_enable_an.checked = false;
                click_endis_wds_a();
        }
        cf.repeater_ip_a.value=old_repeater_ip_a;
        if (old_repeater_ip_a != "" && old_repeater_ip_a != "0.0.0.0")
        {
                var repeater_ip_a=old_repeater_ip_a;
                var ip_array_a=repeater_ip_a.split('.');
                cf.sysLANIPAddr1_an.value=ip_array_a[0];
                cf.sysLANIPAddr2_an.value=ip_array_a[1];
                cf.sysLANIPAddr3_an.value=ip_array_a[2];
                cf.sysLANIPAddr4_an.value=ip_array_a[3];
        }
        else
        {
                var repeater_ip_a=old_lanip;
                var ip_array_a=repeater_ip_a.split('.');
                cf.sysLANIPAddr1_an.value=ip_array_a[0];
                cf.sysLANIPAddr2_an.value=ip_array_a[1];
                cf.sysLANIPAddr3_an.value=ip_array_a[2];
                cf.sysLANIPAddr4_an.value="";
        }
        cf.hidden_wds_mode_a.value=old_wds_repeater_basic_a;
        if (old_wds_repeater_basic_a == "1")
                cf.wds_mode_an[1].checked=true;
        else
                cf.wds_mode_an[0].checked=true;

        var repeater_mac1_a="<%if tcWebApi_get("WLan11ac_WDS","Wds_MAC0","h") <> "N/A" then tcWebApi_get("WLan11ac_WDS","Wds_MAC0","s") end if%>";
        var repeater_mac2_a="<%if tcWebApi_get("WLan11ac_WDS","Wds_MAC1","h") <> "N/A" then tcWebApi_get("WLan11ac_WDS","Wds_MAC1","s") end if%>";
        var repeater_mac3_a="<%if tcWebApi_get("WLan11ac_WDS","Wds_MAC2","h") <> "N/A" then tcWebApi_get("WLan11ac_WDS","Wds_MAC2","s") end if%>";
        var repeater_mac4_a="<%if tcWebApi_get("WLan11ac_WDS","Wds_MAC3","h") <> "N/A" then tcWebApi_get("WLan11ac_WDS","Wds_MAC3","s") end if%>";
        var basic_station_mac_a="<%if tcWebApi_get("WLan11ac_WDS","basic_station_mac","h") <> "N/A" then tcWebApi_get("WLan11ac_WDS","basic_station_mac","s") end if%>";
        if (cf.wds_mode_an[0].checked == true)
        {
                if (client_disable_repeat_5g == "1")
                        cf.ptp_sta_an.checked = true;
                else
                        cf.ptp_sta_an.checked = false;
                if (basic_station_mac_a != "")
                {
                        cf.ptp_mac_an.value=basic_station_mac_a;
                }
        }
        else if (cf.wds_mode_an[1].checked == true)
        {
                if (client_disable_base_5g == "1")
                        cf.pmp_sta_an.checked =true;
                else
                        cf.pmp_sta_an.checked =false;
                if (repeater_mac1_a!="")
                {
                        cf.pmp_mac1_an.value=repeater_mac1_a;
                }
                if (repeater_mac2_a!="")
                {
                        cf.pmp_mac2_an.value=repeater_mac2_a;
                }
                if (repeater_mac3_a!="")
                {
                        cf.pmp_mac3_an.value=repeater_mac3_a;
                }
                if (repeater_mac4_a!="")
                {
                        cf.pmp_mac4_an.value=repeater_mac4_a;
                }
        }
        if (cf.wds_enable_an.checked)
               click_repeater_basic_a();
}
</script>
<input type="hidden" name="basic_station_mac">
<input type="hidden" name="repeater_mac1">
<input type="hidden" name="repeater_mac2">
<input type="hidden" name="repeater_mac3">
<input type="hidden" name="repeater_mac4">
<input type="hidden" name="wds_endis_mac_client">
<input type="hidden" name="wds_endis_ip_client">
<input type="hidden" name="wds_endis_fun">
<input type="hidden" name="change_ip_flag">
<input type="hidden" name="repeater_ip">
<input type="hidden" name="hidden_wds_mode">
<input type="hidden" name="WDSFlag" value="0">
<input type="hidden" name="WDS_5G_Flag" value="0">
<input type="hidden" name="hidden_wlan_id" value="0">
<input type="hidden" name="hidden_wlan_ac_id" value="0">
<input type="hidden" name="wl_hidden_wps_disable" value="0">
<input type="hidden" name="wl_hidden_wps_enable" value="7">

<input type="hidden" name="basic_station_mac_a">
<input type="hidden" name="repeater_mac1_a">
<input type="hidden" name="repeater_mac2_a">
<input type="hidden" name="repeater_mac3_a">
<input type="hidden" name="repeater_mac4_a">
<input type="hidden" name="wds_endis_mac_client_a">
<input type="hidden" name="wds_endis_ip_client_a">
<input type="hidden" name="wds_endis_fun_a">
<input type="hidden" name="change_ip_flag_a">
<input type="hidden" name="repeater_ip_a">
<input type="hidden" name="hidden_wds_mode_a">
<input type="hidden" name="rep_old_lan_ipaddr">
<input type="hidden" name="change_to_old_ip">
<TR>
	<TD nowrap colspan=2>
	<input type="checkbox" name="wds_enable" id="wds_enable" value="1" onclick="click_endis_wds();wdsWaring();">
	<A tabindex=-1 href="javascript:loadhelp('_wds','en_repeat')"><B><%tcWebApi_multilingual("1","wireless_repeat_function_enable_str")%><script>if(an_router_flag == 1) document.write("(2.4GHz b/g/n)");</script></B></A>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2><img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","wireless_router_mac_str")%> : <%If tcWebApi_get("SkuId_Entry","TE_wlan_mac","h") <> "N/A" Then tcWebApi_staticGet("SkuId_Entry","TE_wlan_mac","s") end if%></TD>
</TR>
<TR>
	<TD nowrap colspan=2><img src=/spacer.gif width=20 height=12 border=0>
	<input type="radio" name="wds_mode" value="0" onclick="click_repeater_basic();">
	<A tabindex=-1 href="javascript:loadhelp('_wds','repeat')"><B><%tcWebApi_multilingual("1","wireless_repeater_str")%></B></A>
	</TD>
</TR>
<TR>
	<TD nowrap><img src=/spacer.gif width=20 height=12 border=0><img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","repeat_ip_address_str")%>
	</TD>
	<TD nowrap align=right>
	<input type="text" name="sysLANIPAddr1" id="sys_lan_ipaddress1" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="sysLANIPAddr2" id="sys_lan_ipaddress2" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="sysLANIPAddr3" id="sys_lan_ipaddress3" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="sysLANIPAddr4" id="sys_lan_ipaddress4" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2><img src=/spacer.gif width=20 height=12 border=0><img src=/spacer.gif width=20 height=12 border=0>
	<input type="checkbox" name="ptp_sta" value="1"><%tcWebApi_multilingual("1","wireless_client_association_disable_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap><img src=/spacer.gif width=20 height=12 border=0><img src=/spacer.gif width=20 height=12 border=0><img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","base_mac_address_str")%>
	</TD>
	<TD nowrap align=right>
	<input type="text" value="" name="ptp_mac" id="ptp_mac" maxlength="17" size=16 onKeyPress="return getkey('mac',event)">
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2><img src=/spacer.gif width=20 height=12 border=0>
	<input type="radio" name="wds_mode" value="1" onclick="click_repeater_basic();">
	<A tabindex=-1 href="javascript:loadhelp('_wds','base')"><B><%tcWebApi_multilingual("1","wireless_base_station_str")%></B></A>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2><img src=/spacer.gif width=20 height=12 border=0><img src=/spacer.gif width=20 height=12 border=0>
	<input type="checkbox" name="pmp_sta" id="pmp_sta" value="1"><%tcWebApi_multilingual("1","wireless_client_association_disable_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap><img src=/spacer.gif width=20 height=12 border=0><img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","repeat_mac_1_str")%>
	</TD>
	<TD nowrap align=right>
	<input type="text" value="" name="pmp_mac1" id="pmp_mac1" maxlength="17" size=16 onKeyPress="return getkey('mac',event)">
	</TD>
</TR>
<TR>
	<TD nowrap><img src=/spacer.gif width=20 height=12 border=0><img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","repeat_mac_2_str")%>
	</TD>
	<TD nowrap align=right>
	<input type="text" value="" name="pmp_mac2" id="pmp_mac2" maxlength="17" size=16 onKeyPress="return getkey('mac',event)">
	</TD>
</TR>
<TR>
	<TD nowrap><img src=/spacer.gif width=20 height=12 border=0><img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","repeat_mac_3_str")%>
	</TD>
	<TD nowrap align=right>
	<input type="text" value="" name="pmp_mac3" id="pmp_mac3" maxlength="17" size=16 onKeyPress="return getkey('mac',event)">
	</TD>
</TR>
<TR>
	<TD nowrap><img src=/spacer.gif width=20 height=12 border=0><img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","repeat_mac_4_str")%>
	</TD>
	<TD nowrap align=right>
	<input type="text" value="" name="pmp_mac4" id="pmp_mac4" maxlength="17" size=16 onKeyPress="return getkey('mac',event)">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<!--for WDS a/n-->
<TR id=wds_an>
       <TD nowrap colspan=2>
       <input type="checkbox" name="wds_enable_an" id="wds_enable_an" value="1" onclick="click_endis_wds_a();wdsWaring();">
       <A tabindex=-1 href="javascript:loadhelp('_wds','en_repeat')"><B><%tcWebApi_multilingual("1","wireless_repeat_function_enable_5g_str")%> (5GHz a/n)</B></A>
       </TD>
</TR>
<TR id=mac_an>
       <TD nowrap colspan=2><img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","wireless_router_mac_str")%> : <%If tcWebApi_get("SkuId_Entry","TE_wlan11ac_mac","h") <> "N/A" Then tcWebApi_staticGet("SkuId_Entry","TE_wlan11ac_mac","s") end if%></TD>
</TR>
<TR id=mode_an>
       <TD nowrap colspan=2><img src=/spacer.gif width=20 height=12 border=0>
       <input type="radio" name="wds_mode_an" id="wds_mode_an" value="0" onclick="click_repeater_basic_a();">
       <A tabindex=-1 href="javascript:loadhelp('_wds','repeat')"><B><%tcWebApi_multilingual("1","wireless_repeater_str")%></B></A>
       </TD>
</TR>
<TR id=repeater_an>
       <TD nowrap><img src=/spacer.gif width=20 height=12 border=0><img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","repeat_ip_address_str")%>
       </TD>
       <TD nowrap align=right>
       <input type="text" name="sysLANIPAddr1_an" id="sys_lan_ipaddress1_an" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
       <input type="text" name="sysLANIPAddr2_an" id="sys_lan_ipaddress2_an" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
       <input type="text" name="sysLANIPAddr3_an" id="sys_lan_ipaddress3_an" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
       <input type="text" name="sysLANIPAddr4_an" id="sys_lan_ipaddress4_an" size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
       </TD>
</TR>
<TR id=client_an>
       <TD nowrap colspan=2><img src=/spacer.gif width=20 height=12 border=0><img src=/spacer.gif width=20 height=12 border=0>
       <input type="checkbox" name="ptp_sta_an" value="1"><%tcWebApi_multilingual("1","wireless_client_association_disable_str")%>
       </TD>
</TR>
<TR id=base_an>
       <TD nowrap><img src=/spacer.gif width=20 height=12 border=0><img src=/spacer.gif width=20 height=12 border=0><img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","base_mac_address_str")%>
       </TD>
       <TD nowrap align=right>
       <input type="text" value="" name="ptp_mac_an" maxlength="17" size=16 onKeyPress="return getkey('mac',event)">
       </TD>
</TR>
<TR id=sta_mode_an>
       <TD nowrap colspan=2><img src=/spacer.gif width=20 height=12 border=0>
       <input type="radio" name="wds_mode_an" value="1" onclick="click_repeater_basic_a();">
       <A tabindex=-1 href="javascript:loadhelp('_wds','base')"><B><%tcWebApi_multilingual("1","wireless_base_station_str")%></B></A>
       </TD>
</TR>
<TR id=pmp_sta_an>
       <TD nowrap colspan=2><img src=/spacer.gif width=20 height=12 border=0><img src=/spacer.gif width=20 height=12 border=0>
       <input type="checkbox" name="pmp_sta_an" id="pmp_sta_an" value="1"><%tcWebApi_multilingual("1","wireless_client_association_disable_str")%>
       </TD>
</TR>
<TR id=mac1_an>
       <TD nowrap><img src=/spacer.gif width=20 height=12 border=0><img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","repeat_mac_1_str")%>
       </TD>
       <TD nowrap align=right>
       <input type="text" value="" name="pmp_mac1_an" maxlength="17" size=16 onKeyPress="return getkey('mac',event)">
       </TD>
</TR>
<TR id=mac2_an>
       <TD nowrap><img src=/spacer.gif width=20 height=12 border=0><img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","repeat_mac_2_str")%>
       </TD>
       <TD nowrap align=right>
       <input type="text" value="" name="pmp_mac2_an" maxlength="17" size=16 onKeyPress="return getkey('mac',event)">
       </TD>
</TR>
<TR id=mac3_an>
       <TD nowrap><img src=/spacer.gif width=20 height=12 border=0><img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","repeat_mac_3_str")%>
       </TD>
       <TD nowrap align=right>
       <input type="text" value="" name="pmp_mac3_an" maxlength="17" size=16 onKeyPress="return getkey('mac',event)">
       </TD>
</TR>
<TR id=mac4_an>
       <TD nowrap><img src=/spacer.gif width=20 height=12 border=0><img src=/spacer.gif width=20 height=12 border=0><%tcWebApi_multilingual("1","repeat_mac_4_str")%>
       </TD>
       <TD nowrap align=right>
       <input type="text" value="" name="pmp_mac4_an" maxlength="17" size=16 onKeyPress="return getkey('mac',event)">
       </TD>
</TR>
<TR id=blue_an><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</TABLE>
</div>
<div id="waiting_bar" style="display:none">
<div  align="center"><BR><BR><TR><TD align="center"><B><%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%></B></TD></TR><BR><BR></div>
<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" alt="waiting" /></div>
</div>
<%tcWebApi_multilingual("2","_wds_help.asp")%>
</FORM>
</BODY>
</HTML>
