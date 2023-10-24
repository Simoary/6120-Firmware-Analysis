<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<link rel="stylesheet" href="/style/advanced_home.css">
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>


<BODY onLoad="loadhelp('_info');loadvalue();" bgcolor=#ffffff>
<!--% table_header("Router Status") %-->
<!--TABLE width=100%% border=0 cellpadding=0 cellspacing=3>
<TR><TD colSpan=2><H1>Router Status</H1></TD></TR>
<TR><TD colSpan=2></TD></TR>
</table-->
<script>
var test='<%tcWebApi_get("WanInfo_Entry","Update","h")%>';
var on_mark="On"
var off_mark="Off"
var wanproto="DHCP";
var endis_wl_radio="<%If tcWebApi_get("WLan_Common","APOn","h") <> "N/A" then tcWebApi_get("WLan_Common","APOn","s") end if%>";
var endis_wla_radio="<%If tcWebApi_get("WLan11ac_Common","APOn","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","APOn","s") end if%>";
var endis_wl_ssid="<%If tcWebApi_get("WLan_Entry0","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan_Entry0","EnableSSID","s") end if%>";
var wl_currnet_channel="<%If tcWebApi_get("Info_WLan","CurrentChannel","h") <> "N/A" then tcWebApi_get("Info_WLan","CurrentChannel","s") end if%>";
var endis_wla_ssid="<%If tcWebApi_get("WLan11ac_Entry0","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry0","EnableSSID","s") end if%>";
var endis_wl_guest_ssid="<%If tcWebApi_get("WLan_Entry1","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan_Entry1","EnableSSID","s") end if%>";
var endis_wla_guest_ssid="<%If tcWebApi_get("WLan11ac_Entry1","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","EnableSSID","s") end if%>";
var internet_type="1";
var internet_ppp_type="0";
var wan_status="<% if tcWebApi_staticGet("WanInfo_Entry","Active","h") <> "N/A" then tcWebApi_staticGet("WanInfo_Entry","Active","s") end if%>";
var wl_sectype="<%If tcWebApi_get("WLan_Entry0","AuthMode","h") <> "N/A" then tcWebApi_get("WLan_Entry0","AuthMode","s") end if%>";
var wla_sectype="<%If tcWebApi_get("WLan11ac_Entry0","AuthMode","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry0","AuthMode","s") end if%>";
var guest_sectype="<%If tcWebApi_get("WLan_Entry1","AuthMode","h") <> "N/A" then tcWebApi_get("WLan_Entry1","AuthMode","s") end if%>";
var guest_sectype_an="<%If tcWebApi_get("WLan11ac_Entry1","AuthMode","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","AuthMode","s") end if%>";

var an_router_flag = 1; //201403171535, Tony, Enable wireless 5g flag.
var guest_router_flag=1; //201403171535, Tony, Enable guest flag.
var wire_iso_flag=parent.wire_iso_flag;
var gui_region='English';
var netgear_region="WW";
//var dns_third_flag=(top.dns_third_flag == 1 && gui_region == "Russian" && (netgear_region == "WW" || netgear_region == "RU")) ? 1 : 0 ;
var dns_third_flag=top.dns_third_flag;
var adv_icon_num = 2; /*to count the number of the modules in advanced home: 2 = Router Information + (WAN or repeater) */
var enable_ap_flag="0";//bug 24666 according to the page 128 of spec 2.0,add AP mode
var dyn_get_ip_flag="1";
function loadvalue()
{
	if(enable_ap_flag == 1)
	{	//bug 22934:there will be no "Internet Port" info after AP mode is on
		//document.getElementById("ap_lan_port").style.display="";
		document.getElementById("ap_wan_port").style.display="none";
		document.getElementById("ap1").style.display="none";
		document.getElementById("ap2").style.display="none";
		document.getElementById("ap3").style.display="none";
		document.getElementById("ap4").style.display="none";
		document.getElementById("ap5").style.display="none";
		document.getElementById("ap6").style.display="none";
		document.getElementById("ap7").style.display="none";
		document.getElementById("ap8").style.display="none";
	}
	else
	{
		//document.getElementById("ap_lan_port").style.display="none";
		document.getElementById("ap_wan_port").style.display="";
		document.getElementById("ap1").style.display="";
		document.getElementById("ap2").style.display="";
		document.getElementById("ap3").style.display="";
		document.getElementById("ap4").style.display="";
		document.getElementById("ap5").style.display="";
		document.getElementById("ap6").style.display="";
		document.getElementById("ap7").style.display="";
		document.getElementById("ap8").style.display="";
	}
	if( wire_iso_flag == 1 )
	{
		document.getElementById("wliso").style.display="";
		document.getElementById("wliso_line").style.display="";
	}
	else
	{
		document.getElementById("wliso").style.display="none";
		document.getElementById("wliso_line").style.display="none";
	}

	if( an_router_flag == 0)
	{
		adv_icon_num++;
		if( guest_router_flag == 1 )
		{
			adv_icon_num++;
			document.getElementById("wl_title_bgn").style.display="";
			if( wire_iso_flag == 1 )
			{
				document.getElementById("wlaniso").style.display="";
				document.getElementById("wlaniso_line").style.display="";
			}
			else
			{
				document.getElementById("wlaniso").style.display="none";
				document.getElementById("wlaniso_line").style.display="none";
			}
		}
		else
			document.getElementById("wl_title_bgn").style.display="none";
		document.getElementById("head_an").style.display="none";
		document.getElementById("wl_head_an").style.display="none";
	}

	if( an_router_flag == 1)
	{
		adv_icon_num += 2;
		if( wire_iso_flag == 1 )
		{
			document.getElementById("wliso_an").style.display=""; 
			document.getElementById("wliso_an_line").style.display="";
		}
		else
		{
			document.getElementById("wliso_an").style.display="none";
			document.getElementById("wliso_an_line").style.display="none";
		}
		if( guest_router_flag == 1)
		{
			adv_icon_num += 2;
			document.getElementById("wl_title_bgn").style.display="";
			document.getElementById("wl_head_an").style.display="";
			if( wire_iso_flag == 1 )
			{
				document.getElementById("wlaniso_an").style.display="";
				document.getElementById("wlaniso_an_line").style.display="";
			}
			else
			{
				document.getElementById("wlaniso_an").style.display="none";
				document.getElementById("wlaniso_an_line").style.display="none";
			}
		}
		else
		{
			document.getElementById("wl_head_an").style.display="none";
			document.getElementById("wl_title_bgn").style.display="none";
		}
	}
	if( adv_icon_num > 6 )
	{
		document.getElementById("pl_3").style.display="";
		document.getElementById("pl_2_1").style.display="";
		document.getElementById("pl_1").style.display="";
	}
	else if( adv_icon_num > 4 )
	{
		if( an_router_flag == 1 )
			document.getElementById("pl_2_1").style.display="";
		else
			document.getElementById("pl_2_2").style.display="";
		document.getElementById("pl_1").style.display="";
	}
	else if( adv_icon_num > 2 )
	{
		document.getElementById("pl_1").style.display="";
	}
}

function wds_repeater_mac( num )
{
        var name;
	/*name="Repeater"+num+" Address";
        Bug 19830, according to Spec1.9, repeater address name shows on the status page changed to "Repeater1 Address".*/
		
	  /* bug 20791 repeater address name shows on the status page changed to "Repeater MAC Address 1"*/
	switch( num )
        {
                case 1:
                        name="Repeater MAC Address 1";
                        break;
                case 2:
                        name="Repeater MAC Address 2";
                        break;
                case 3:
                        name="Repeater MAC Address 3";
                        break;
                case 4:
                        name="Repeater MAC Address 4";
                        break
                default:
                        name="Repeater MAC Address 1";
        }
        return name;
}

function setTitleClass(str,id)
{
	var title_div = document.getElementById(id);

	if( str.length >=46 )
	{
		title_div.className = "title_doubleline";
	}
	else if(gui_region=='Polish' && wan_status != '1' && str.length >=42)
	{
		title_div.className = "title_doubleline";
	}
	else if(str.length >=30 )
	{
		title_div.className = "title_smallFonts";
	}
	else
	{
		title_div.className = "title";
	}
}
//onclick='location.href="BAS_basic.asp";'
function click_direct(str1,str2)
{
   var sub_name= str1+"_sub";
    if(top.document.getElementById(sub_name).style.display == "none")
	parent.open_or_close_sub(str1);
	
	parent.click_adv_action(str2);
}
</script>

<input type="hidden" name="endis_connect">
<input type="hidden" name="wifi_interface">
<input type="hidden" name="wifi_radio">

<div id="content_icons">
<div id="icon1" class="adv_icon">
	<div class="title">
		<img src="/image/icon/advanced-status-good.gif" />
		<b><%tcWebApi_multilingual("1","router_info_str")%></b>
	</div>
<div class="icon_status_info">	
	<TABLE id="RouterInfo" class="icon_table" width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
	<TD width="60%"><B><%tcWebApi_multilingual("1","hardware_ver_str")%></B></TD>
	<TD><%tcWebApi_get("SkuId_Entry","ProductName","s")%>  (<%If tcWebApi_get("SkuId_Entry","Annex","h") = "1" Then asp_write("B") else asp_write("A") end if%>)</TD>
</TR>
<TR><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR>
	<TD><B><%tcWebApi_multilingual("1","firmware_ver_str")%></B></TD>
	<TD><%If tcWebApi_get("DeviceInfo","BasicInfo_FwVer","h") <> "N/A" Then tcWebApi_staticGet("DeviceInfo","BasicInfo_FwVer","s") end if%></TD>
</TR>
<TR><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR>
	<TD width="60%"><B><%tcWebApi_multilingual("1","gui_language_ver_str")%></B></TD>
	<TD><%If tcWebApi_get("LanguageSwitch_Entry","LanguageVersion","h") <> "N/A" Then asp_write("V1.0.0.") tcWebApi_get("LanguageSwitch_Entry","LanguageVersion","s") else tcWebApi_staticGet("DeviceInfo","BasicInfo_FwVer","s") end if%></TD>
</TR>
<TR id=ap1><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR id=ap2>
	<TD colspan=2><span class="subhead_blue"><%tcWebApi_multilingual("1","lan_port_str")%></span></TD>
</TR>
<TR id=ap3><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR id=ap4>
	<TD width="60%"><B><%tcWebApi_multilingual("1","mac_addr_str")%></B></TD>
	<TD><%If tcWebApi_get("Lan_Entry0","MAC","h") <> "N/A" Then tcWebApi_staticGet("Lan_Entry0","MAC","s") end if%></TD>
</TR>
<TR id=ap5><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR id=ap6>
	<TD><B><%tcWebApi_multilingual("1","ip_addr_str")%></B></TD>
	<TD><%If tcWebApi_staticGet("Info_Ether","ip","h") <> "N/A" Then tcWebApi_staticGet("Info_Ether","ip","s") end if%></TD>
</TR>
<TR id=ap7><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<!--TR>
	<TD><B>DHCP</B></TD>
	<TD>192.168.1.1</TD>
</TR-->
<TR id=ap8>
	<TD><B><%tcWebApi_multilingual("1","dhcp_server_str")%></B></TD>
	<TD><script><%If tcWebApi_get("Lan_Dhcp","type","h") = "1" Then %>
		  document.write('<%tcWebApi_multilingual("1","on_str")%>');
		  <%else%>
		  document.write('<%tcWebApi_multilingual("1","off_str")%>');
		  <%end if%></script></TD>
</TR>
<!--TR>
	<TD><B>IP Subnet Mask</B></TD>
	<TD>255.255.255.0</TD>
</TR-->
</table>
</div>
	<div class="reboot_div">
		<input type="submit" class="reboot" name="Reboot" id="reboot"  value="<%tcWebApi_multilingual("0","glbstr_reboot")%>" onClick="location.href = 'reboot.asp';">
	</div>
</div>
 
<!--<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>-->
	
<div id="icon2" class="adv_icon"> 
	<div id="icon2_title" class="title" onclick='click_direct("setup","internet");' style="cursor:pointer">
		<script>
		if( wan_status == '1' )
			document.write('<img src="/image/icon/advanced-status-good.gif" />');
		else
			document.write('<img src="/image/icon/advanced-status-error.gif" />');
		if(enable_ap_flag == 1)
			document.write('<b>LAN Port</b>');
		else
		{
			document.write('<b>' + '<%tcWebApi_multilingual("1","internet_port_str")%>'+ '</b>');
			setTitleClass("Internet Port","icon2_title");
		}
		</script>
	</div>
	<div class="info_div" id="ap_wan_port">
	<TABLE id="internet_info" class="icon_table" width=100% border=0 cellpadding=0 cellspacing=3>
<!--TR>
	<TD colspan=2>
	<span class="subhead">Internet Port</span>
	</TD>
</TR-->

<TR>
	<TD width="60%"><B><%tcWebApi_multilingual("1","mac_addr_str")%></B></TD>
	<TD><%If tcWebApi_get("Wan_PVC","Mac_Assign","h") <> "0" Then tcWebApi_staticGet("Wan_PVC","Mac_Spoofing","s") elseif tcWebApi_get("WanInfo_Entry","MAC","h") <> "N/A" Then tcWebApi_staticGet("WanInfo_Entry","MAC","s") end if%></TD>
</TR> 
<TR><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR>
	<TD><B><%tcWebApi_multilingual("1","ip_addr_str")%></B></TD>
	<TD><script>
          var info_get_wanproto="<% if tcWebApi_get("WanInfo_Entry","Connetion","h") <> "N/A" then tcWebApi_staticGet("WanInfo_Entry","Connetion","s")  end if %>";
          var ip = "<% if tcWebApi_staticGet("WanInfo_Entry","Active","h") = "1" then tcWebApi_staticGet("WanInfo_Entry","IP","s") else asp_Write("0.0.0.0") end if%>";
          var InternetDemandLED = "<% if tcWebApi_staticGet("Wan_Common","InternetDemandLED","h") <> "N/A" then tcWebApi_staticGet("Wan_Common","InternetDemandLED","s") end if%>";
          if (info_get_wanproto == "PPPoE" || info_get_wanproto == "PPPoA")
          {
              if (InternetDemandLED == "0" || InternetDemandLED == "")
              {
	             document.write("0.0.0.0");
              }
              else
              {
	             document.write(ip);
              }
          }
          else
          {
			  document.write(ip);
          }
	</script></TD>
</TR>
<TR><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR>
	<TD><B><%tcWebApi_multilingual("1","connect_str")%></B></TD>
	<TD><% if tcWebApi_get("WanInfo_Entry","Connetion","h") <> "" then tcWebApi_staticGet("WanInfo_Entry","Connetion","s")  end if %></TD>
</TR>
<TR><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR>
	<TD><B><%tcWebApi_multilingual("1","ip_subnet_mask_str")%></B></TD>
	<TD><% if tcWebApi_staticGet("WanInfo_Entry","Active","h") = "1" then tcWebApi_staticGet("WanInfo_Entry","Mask","s") else asp_Write("0.0.0.0") end if%></TD>
</TR>	
<TR><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR>
	<TD><B><%tcWebApi_multilingual("1","domain_name_str")%></B></TD>
	<TD><% if tcWebApi_staticGet("WanInfo_Entry","Active","h") = "1" then tcWebApi_staticGet("WanInfo_Entry","DNS1","s") end if%>	
	<script>
	<%if tcWebApi_staticGet("WanInfo_Entry","Active","h") = "1" then%>
		<%if tcWebApi_staticGet("WanInfo_Entry","DNS1","h") <> "N/A" then%>
			var dns1 = "<%tcWebApi_staticGet("WanInfo_Entry","DNS1","s")%>";
			var dns2 = "<%tcWebApi_staticGet("WanInfo_Entry","DNS2","s")%>";
			if(dns1 != dns2 && dns2!="N/A")
			document.write("<BR/>"+dns2);
		<%end if%>
	<%end if%>
	</script>
	</TD>
</TR>	
</table>
</div>
<div class="button_div"> <!--201310251312, Tony, disable Show Statistics and Connection Status button-->
<TABLE class="icon_table" width=100% border=0 cellpadding=0 cellspacing=3>
<TR>
	<TD nowrap colspan=2 align=center>
	<input class="middle_common_bt" type="button" name="Show Statistics" id="show_statistics" value="<%tcWebApi_multilingual("0","glbstr_Show_Statistics")%>" onClick="window.open('RST_statistic.asp', 'show_statistic', 'width=961,height=400,top=200,left=200,status=yes');">
	<input name="Connection Status" id="conn_status" class="common_bt" type="button" value="<%tcWebApi_multilingual("0","glbstr_connect_status")%>" onClick="click_status()">
	<script>
        if (wanproto == "Static IP") document.getElementById("conn_status").style.display="none";
        </script>
        </TD>
</TR>
</TABLE>
</div>	
</div>

<div id="wds2_4_repeater" class="adv_icon">
	<div id="wds2_4_title" class="title" >
		<img src="/image/icon/advanced-status-good.gif" />
		<b>Wireless Repeater<script>if(an_router_flag == 1)document.write('&nbsp;(2.4GHz)');</script></b>
	</div>
	<script>setTitleClass("Wireless Repeater (2.4GHz)","wds2_4_title");</script>
	<TABLE class="icon_table" width=100% border=0 cellpadding=0 cellspacing=3>
	<TR>
	<TD width="60%"><B>Base Station MAC Address</B></TD>
	<TD></TD>
</TR>
</table>
</div>	

<div id="wds5_repeater" class="adv_icon">
	<div id="wds5_title" class="title">
		<img src="/image/icon/advanced-status-good.gif" />
		<b>Wireless Repeater (5.0GHz)</b>
	</div>
	<script>setTitleClass("Wireless Repeater (5.0GHz)","wds5_title");</script>
	<TABLE class="icon_table" width=100% border=0 cellpadding=0 cellspacing=3>
	<TR id=base_an>
       <TD width="60%"><B>Base Station MAC Address</B></TD>
       <TD></TD>
</TR>
</table>
</div>

<img id="pl_1" style="display:none;" class="page_line" src="/image/icon/advanced_page_line.gif"/>


<div id="title_bgn" class="adv_icon">
	<div id="words_title" class="title" onclick='click_direct("setup","wireless");' style="cursor:pointer">
		<script>
		if ( endis_wl_radio == '0')
			    document.write('<img src="/image/icon/advanced-status-error.gif" />');
		else
		{
			if ( wl_sectype == 'OPEN')
			     document.write('<img src="/image/icon/advanced-status-warning.gif" />');
			else 
			     document.write('<img src="/image/icon/advanced-status-good.gif" />');
		}
		</script>
		<b><%tcWebApi_multilingual("1","wireless_setting_str")%> <script> if(an_router_flag == 1)document.write('&nbsp;(2.4GHz)');</script></b>
	</div>
	<script>setTitleClass("Wireless Settings (2.4GHz)","words_title");</script>
	<TABLE id="Wireless2.4G" class="icon_table" width=100% border=0 cellpadding=0 cellspacing=3>
<!--TR>
	<TD colspan=2><span class="subhead">Wireless Port</span></TD>
</TR>

<TR id=title_bgn  icon4>
	<TD colspan=2><B>Wireless Settings b/g/n</B></TD>
</TR-->
<TR>
	<TD width="60%"><!--script>if(an_router_flag == 1) document.write("&nbsp;&nbsp;&nbsp;&nbsp;");</script--><B><%tcWebApi_multilingual("1","name_ssid_str")%></B></TD>
	<TD><pre><%If tcWebApi_get("WLan_Entry0","SSID","h") <> "N/A" then tcWebApi_get("WLan_Entry0","SSID","s") end if%></pre></TD><!-- bug 24183:XSS Protection,when output ssid use "cfg_sed_ssid" to convert -->
</TR>
<TR><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR>
	<TD><!--script>if(an_router_flag == 1) document.write("&nbsp;&nbsp;&nbsp;&nbsp;");</script--><B><%tcWebApi_multilingual("1","region_str")%></B></TD>
    <TD>
	<script>
		<%if tcWebApi_get("WLan_Common","Country","h") <> "N/A" then%>
	     <%if tcWebApi_get("WLan_Common","Country","h") = "SOUTH AFRICA" then%>
	         document.write('<%tcWebApi_multilingual("1","africa_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "THAILAND" then%>
	         document.write('<%tcWebApi_multilingual("1","asia_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "AUSTRALIA" then%>
	         document.write('<%tcWebApi_multilingual("1","australia_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "CANADA" then%>
	         document.write('<%tcWebApi_multilingual("1","canada_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "CHINA" then%>
	         document.write('<%tcWebApi_multilingual("1","china_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "GERMANY" then%>
	         document.write('<%tcWebApi_multilingual("1","europe_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "INDIA" then%>
	         document.write('<%tcWebApi_multilingual("1","india_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "ISRAEL" then%>
	         document.write('<%tcWebApi_multilingual("1","israel_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "JAPAN" then%>
	         document.write('<%tcWebApi_multilingual("1","japan_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "KOREA REPUBLIC" then%>
	         document.write('<%tcWebApi_multilingual("1","korea_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "MALAYSIA" then%>
	         document.write('<%tcWebApi_multilingual("1","malaysia_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "MEXICO" then%>
	         document.write('<%tcWebApi_multilingual("1","mexico_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "YEMEN" then%>
	         document.write('<%tcWebApi_multilingual("1","middle_algeria_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "IRAN" then%>
	         document.write('<%tcWebApi_multilingual("1","middle_iran_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "TURKEY" then%>
	         document.write('<%tcWebApi_multilingual("1","middle_turkey_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "SAUDI ARABIA" then%>
	         document.write('<%tcWebApi_multilingual("1","middle_saudi_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "UNITED ARAB EMIRATES" then%>
	         document.write('<%tcWebApi_multilingual("1","middle_united_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "RUSSIA" then%>
	         document.write('<%tcWebApi_multilingual("1","russia_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "SINGAPORE" then%>
	         document.write('<%tcWebApi_multilingual("1","singapore_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "BRAZIL" then%>
	         document.write('<%tcWebApi_multilingual("1","south_america_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "TAIWAN" then%>
	         document.write('<%tcWebApi_multilingual("1","taiwan_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "UNITED STATES" then%>
	         document.write('<%tcWebApi_multilingual("1","united_states_str")%>');
		 <%end if%>
	<%end if%>
	</script>
	</TD>

</TR>
<TR><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR>
	<TD><!--script>if(an_router_flag == 1) document.write("&nbsp;&nbsp;&nbsp;&nbsp;");</script--><B><%tcWebApi_multilingual("1","channel_str")%></B></TD>
	<TD>
    <script>
    <%if tcWebApi_get("WLan_Common","Channel","h") = "0" then%>
	    <%if tcWebApi_get("WLan_Common","APOn","h") = "1" then%>
			if(wl_currnet_channel <= 6)
			  var secondary_channel = parseInt(wl_currnet_channel) + 4;
			else
			  var secondary_channel = parseInt(wl_currnet_channel) - 4;
			<%if tcWebApi_get("WLan_Common","WirelessModeIndex","h") = "3" then%>
				document.write('<%tcWebApi_multilingual("1","auto_str")%>' + " ( " + wl_currnet_channel+ "(P)" + " + " + secondary_channel + "(S)" + " ) ");
			<%else%>
				document.write('<%tcWebApi_multilingual("1","auto_str")%>' + "   " + wl_currnet_channel);
			<%end if%>
		<%else%>
           document.write('<%tcWebApi_multilingual("1","auto_str")%>');
	    <%end if%>
	<%else%>
		var primary_channel="<%If tcWebApi_get("WLan_Common","Channel","h") <> "N/A" then tcWebApi_get("WLan_Common","Channel","s") end if%>";
		if(primary_channel <= 6)
			var secondary_channel = parseInt(primary_channel) + 4;
		else
			var secondary_channel = parseInt(primary_channel) - 4;
		<%if tcWebApi_get("WLan_Common","WirelessModeIndex","h") = "3" then%>
			document.write(primary_channel+"(P)" + " + " + secondary_channel+"(S)");
		<%else%>
			document.write(primary_channel);
	    <%end if%>
    <%end if%>
    </script>
    </TD>
</TR>
<TR><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR>
	<TD><!--script>if(an_router_flag == 1) document.write("&nbsp;&nbsp;&nbsp;&nbsp;");</script--><B><%tcWebApi_multilingual("1","mode_str")%></B></TD>
	<TD>
	<script>
	<%if tcWebApi_get("WLan_Common","WirelessModeIndex","h") = "1" then%>
	    document.write('<%tcWebApi_multilingual("1","up_to_54Mbps_str")%>');
    <%elseif tcWebApi_get("WLan_Common","WirelessModeIndex","h") = "2" then%>
	    document.write('<%tcWebApi_multilingual("1","up_to_145Mbps_str")%>');
	<%elseif tcWebApi_get("WLan_Common","WirelessModeIndex","h") = "3" then%>
	    document.write('<%tcWebApi_multilingual("1","up_to_300Mbps_str")%>');
	<%end if%>
	</script>
	</TD>
</TR>
<TR><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR>
	<TD><!--script>if(an_router_flag == 1) document.write("&nbsp;&nbsp;&nbsp;&nbsp;");</script--><B><%tcWebApi_multilingual("1","wireless_ap_str")%></B></TD>
<TD><script>
	if(endis_wl_radio == "0")
	    document.write('<%tcWebApi_multilingual("1","off_str")%>');
	else if(endis_wl_ssid == "1")
	    document.write('<%tcWebApi_multilingual("1","on_str")%>');
	else
		document.write('<%tcWebApi_multilingual("1","off_str")%>');		
	</script></TD>
</TR>
<TR><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR>
	<TD><!--script>if(an_router_flag == 1) document.write("&nbsp;&nbsp;&nbsp;&nbsp;");</script--><B><%tcWebApi_multilingual("1","broadcast_name_str")%></B></TD>
	<TD><script>
	     <%if tcWebApi_get("WLan_Entry0","HideSSID","h") = "0" then %>
	         document.write('<%tcWebApi_multilingual("1","on_str")%>');
	     <%else%> 
		     document.write('<%tcWebApi_multilingual("1","off_str")%>');
	     <%end if%>
		 </script></TD>
</TR>
<TR><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR id=wliso>
	<TD><!--script>if(an_router_flag == 1) document.write("&nbsp;&nbsp;&nbsp;&nbsp;");</script--><B><%tcWebApi_multilingual("1","wireless_isolation_str")%></B></TD>
		<TD><script>
	     <%if tcWebApi_get("WLan_Entry0","NoForwarding","h") = "1" then %>
	         document.write('<%tcWebApi_multilingual("1","on_str")%>');
	     <%else%> 
		     document.write('<%tcWebApi_multilingual("1","off_str")%>');
	     <%end if%>
		 </script></TD>
</TR>
<TR id=wliso_line><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR>
	<TD><B><%tcWebApi_multilingual("1","wifi_protect_setup_str")%><!--script> if( an_router_flag == 1) document.write("b/g/n")</script--></B></TD>
	<TD>
	<script>
	<%If tcWebApi_get("WLan_Entry0", "WPSConfStatus", "h") = "1" then%>
		 document.write('<%tcWebApi_multilingual("1","not_configure_str")%>');
	<%else%>
         document.write('<%tcWebApi_multilingual("1","configure_str")%>');
	<%end if%>
	</script>
	</TD>
</TR>
<TR id=wliso_an_line><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR id=wlbroad_an>
        <TD><B>BSSID</B></TD>
        <TD><%tcWebApi_get("SkuId_Entry","TE_wlan_mac","s")%></TD>
</TR>
</table>
</div>

<!-- wireless a/n -->
<div id="head_an" class="adv_icon">
	<div id="words_title_5G" class="title" onclick='click_direct("setup","wireless");' style="cursor:pointer"><!--onclick='click_direct("setup","wireless");' style="cursor:pointer"-->
		<script>
	      if ( endis_wla_radio == '0')
			    document.write('<img src="/image/icon/advanced-status-error.gif" />');
			else
			{
			  if ( wla_sectype == 'OPEN')
			     document.write('<img src="/image/icon/advanced-status-warning.gif" />');
			  else 
			     document.write('<img src="/image/icon/advanced-status-good.gif" />');
			}
		</script>	
		<b><%tcWebApi_multilingual("1","wireless_setting_5g_str")%> (5.0GHz)</b>
	</div>
	<script>setTitleClass("Wireless Settings (5.0GHz)","words_title_5G");</script>
	<TABLE id="Wireless5G" class="icon_table" width=100% border=0 cellpadding=0 cellspacing=3>
<!--TR id=head_an    icon5>
	<TD colspan=2><B>Wireless Settings a/n</B></TD>
</TR-->
<TR id=ssid_an>
	<TD width="60%"><B><%tcWebApi_multilingual("1","name_ssid_str")%></B></TD>  <!--&nbsp;&nbsp;&nbsp;&nbsp;-->
	<TD><pre><%If tcWebApi_get("WLan11ac_Entry0","SSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry0","SSID","s") end if%></pre></TD>
</TR>
<TR><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR id=country_an>
	<TD><B><%tcWebApi_multilingual("1","region_str")%></B></TD>  <!--&nbsp;&nbsp;&nbsp;&nbsp;-->
    <TD>
	<script>
		<%if tcWebApi_get("WLan_Common","Country","h") <> "N/A" then%>
	     <%if tcWebApi_get("WLan_Common","Country","h") = "SOUTH AFRICA" then%>
	         document.write('<%tcWebApi_multilingual("1","africa_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "THAILAND" then%>
	         document.write('<%tcWebApi_multilingual("1","asia_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "AUSTRALIA" then%>
	         document.write('<%tcWebApi_multilingual("1","australia_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "CANADA" then%>
	         document.write('<%tcWebApi_multilingual("1","canada_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "CHINA" then%>
	         document.write('<%tcWebApi_multilingual("1","china_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "GERMANY" then%>
	         document.write('<%tcWebApi_multilingual("1","europe_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "INDIA" then%>
	         document.write('<%tcWebApi_multilingual("1","india_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "ISRAEL" then%>
	         document.write('<%tcWebApi_multilingual("1","israel_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "JAPAN" then%>
	         document.write('<%tcWebApi_multilingual("1","japan_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "KOREA REPUBLIC" then%>
	         document.write('<%tcWebApi_multilingual("1","korea_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "MALAYSIA" then%>
	         document.write('<%tcWebApi_multilingual("1","malaysia_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "MEXICO" then%>
	         document.write('<%tcWebApi_multilingual("1","mexico_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "YEMEN" then%>
	         document.write('<%tcWebApi_multilingual("1","middle_algeria_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "IRAN" then%>
	         document.write('<%tcWebApi_multilingual("1","middle_iran_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "TURKEY" then%>
	         document.write('<%tcWebApi_multilingual("1","middle_turkey_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "SAUDI ARABIA" then%>
	         document.write('<%tcWebApi_multilingual("1","middle_saudi_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "UNITED ARAB EMIRATES" then%>
	         document.write('<%tcWebApi_multilingual("1","middle_united_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "RUSSIA" then%>
	         document.write('<%tcWebApi_multilingual("1","russia_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "SINGAPORE" then%>
	         document.write('<%tcWebApi_multilingual("1","singapore_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "BRAZIL" then%>
	         document.write('<%tcWebApi_multilingual("1","south_america_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "TAIWAN" then%>
	         document.write('<%tcWebApi_multilingual("1","taiwan_str")%>');
		 <%elseif tcWebApi_get("WLan_Common","Country","h") = "UNITED STATES" then%>
	         document.write('<%tcWebApi_multilingual("1","united_states_str")%>');
		 <%end if%>
	<%end if%>
	</script>
	</TD>
</TR>
<TR><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR id=channel_an>
	<TD><B><%tcWebApi_multilingual("1","channel_str")%></B></TD>  <!--&nbsp;&nbsp;&nbsp;&nbsp;-->
    <TD>
	<script>
	var country = "<%tcWebApi_get("WLan11ac_Common","Country","s")%>";
	var primary_channel_5g = "<%tcWebApi_get("WLan11ac_Common","Channel","s")%>";
	var wireless_mode_5g = "<%tcWebApi_get("WLan11ac_Common","WirelessModeIndex","s")%>";
	var productname = "<%tcWebApi_get("SkuId_Entry","ProductName","s")%>";
	var AChannel = new Array(36, 40, 44, 48, 149, 153, 157, 161, 165);
	var Channel_5G = new Array(56, 60, 64, 149, 153, 157, 161, 165);
	if(country == "TAIWAN")
	{
	   for(i=0;i<9;i++)
	   {
	      if(primary_channel_5g == Channel_5G[i])
	      {
		  	if(wireless_mode_5g == "1")
	           document.write(primary_channel_5g);
	        else if(wireless_mode_5g == "2")
	        {
	           if( i%2 == 0)
	           {
	              var secondary_channel_5g = parseInt(primary_channel_5g) - 4;
	              document.write(primary_channel_5g + "(P)" + "+" + secondary_channel_5g + "(S)");
	           }
	           else
	           {
	              var secondary_channel_5g = parseInt(primary_channel_5g) + 4;
	              document.write(primary_channel_5g + "(P)" + "+" + secondary_channel_5g + "(S)");
	           }
	        }
			else if(wireless_mode_5g == "3" && productname.substr(0,3) == "D36")
			{
				if( i%2 == 0)
	           {
	              var secondary_channel_5g = parseInt(primary_channel_5g) - 4;
	              document.write(primary_channel_5g + "(P)" + "+" + secondary_channel_5g + "(S)");
	           }
	           else
	           {
	              var secondary_channel_5g = parseInt(primary_channel_5g) + 4;
	              document.write(primary_channel_5g + "(P)" + "+" + secondary_channel_5g + "(S)");
	           }
			}
			else
			{
			   if( i == 0)
	           {
	              document.write(primary_channel_5g + "(p)" + " + " + AChannel[i+1] + " + " + AChannel[i+2] + " + " + AChannel[i+3]);
	           }
	           else if(i == 1)
	           {
			      document.write(AChannel[i-1] + " + " + primary_channel_5g + "(p)" + " + " + AChannel[i+1] + " + " + AChannel[i+2]);
	           }
			   else if(i == 2)
	           {
			      document.write(AChannel[i-2] + " + " + AChannel[i-1] + " + " + primary_channel_5g + "(p)" + " + " + AChannel[i+1]);
	           }
			   else if(i == 3)
	           {
			      document.write(AChannel[i-3] + " + " + AChannel[i-2] + " + " + AChannel[i-1] + " + " + primary_channel_5g + "(p)");
	           }
			   else if(i == 4)
	           {
			      document.write(primary_channel_5g + "(p)" + " + " + AChannel[i+1] + " + " + AChannel[i+2] + " + " + AChannel[i+3]);
	           }
			   else if(i == 5)
	           {
			      document.write(AChannel[i-1] + " + " + primary_channel_5g + "(p)" + " + " + AChannel[i+1] + " + " + AChannel[i+2]);
	           }
			   else if(i == 6)
	           {
			      document.write(AChannel[i-2] + " + " + AChannel[i-1] + " + " + primary_channel_5g + "(p)" + " + " + AChannel[i+1]);
	           }
			   else
	           {
			       document.write(AChannel[i-3] + " + " + AChannel[i-2] + " + " + AChannel[i-1] + " + " + primary_channel_5g + "(p)");
	           }
			}
	        break;
	      }
	   }
	}
	else
	{
	   for(i=0;i<9;i++)
	   {
          if(primary_channel_5g == AChannel[i])
		  {
		  	if(wireless_mode_5g == "1")
	           document.write(primary_channel_5g);
	        else if(wireless_mode_5g == "2")
	        {
	           if( i%2 == 0)
	           {
	              var secondary_channel_5g = parseInt(primary_channel_5g) + 4;
	              document.write(primary_channel_5g + "(P)" + "+" + secondary_channel_5g + "(S)");
	           }
	           else
	           {
	              var secondary_channel_5g = parseInt(primary_channel_5g) - 4;
	              document.write(primary_channel_5g + "(P)" + "+" + secondary_channel_5g + "(S)");
	           }
	        }
			else if(wireless_mode_5g == "3" && productname.substr(0,3) == "D36")
			{
				if( i%2 == 0)
	           {
	              var secondary_channel_5g = parseInt(primary_channel_5g) + 4;
	              document.write(primary_channel_5g + "(P)" + "+" + secondary_channel_5g + "(S)");
	           }
	           else
	           {
	              var secondary_channel_5g = parseInt(primary_channel_5g) - 4;
	              document.write(primary_channel_5g + "(P)" + "+" + secondary_channel_5g + "(S)");
	           }
			}
			else
			{
			   if( i == 0)
	           {
	              document.write(primary_channel_5g + "(p)" + " + " + AChannel[i+1] + " + " + AChannel[i+2] + " + " + AChannel[i+3]);
	           }
	           else if(i == 1)
	           {
			      document.write(AChannel[i-1] + " + " + primary_channel_5g + "(p)" + " + " + AChannel[i+1] + " + " + AChannel[i+2]);
	           }
			   else if(i == 2)
	           {
			      document.write(AChannel[i-2] + " + " + AChannel[i-1] + " + " + primary_channel_5g + "(p)" + " + " + AChannel[i+1]);
	           }
			   else if(i == 3)
	           {
			      document.write(AChannel[i-3] + " + " + AChannel[i-2] + " + " + AChannel[i-1] + " + " + primary_channel_5g + "(p)");
	           }
			   else if(i == 4)
	           {
			      document.write(primary_channel_5g + "(p)" + " + " + AChannel[i+1] + " + " + AChannel[i+2] + " + " + AChannel[i+3]);
	           }
			   else if(i == 5)
	           {
			      document.write(AChannel[i-1] + " + " + primary_channel_5g + "(p)" + " + " + AChannel[i+1] + " + " + AChannel[i+2]);
	           }
			   else if(i == 6)
	           {
			      document.write(AChannel[i-2] + " + " + AChannel[i-1] + " + " + primary_channel_5g + "(p)" + " + " + AChannel[i+1]);
	           }
			   else
	           {
			       document.write(AChannel[i-3] + " + " + AChannel[i-2] + " + " + AChannel[i-1] + " + " + primary_channel_5g + "(p)");
	           }
			}
			break;
	      }
	   }
	}
	</script></TD>
</TR>
<TR><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR id=mode_an>
	<TD><B><%tcWebApi_multilingual("1","mode_str")%></B></TD>  <!--&nbsp;&nbsp;&nbsp;&nbsp;-->
	<TD>
    <script>
	<%if tcWebApi_get("WLan11ac_Common","WirelessModeIndex","h") = "1" then%>
	    document.write('<%tcWebApi_multilingual("1","up_to_54Mbps_str")%>');
	<%elseif tcWebApi_get("WLan11ac_Common","WirelessModeIndex","h") = "2" then%>
		document.write('<%tcWebApi_multilingual("1","up_to_150Mbps_str")%>');
	<%elseif tcWebApi_get("WLan11ac_Common","WirelessModeIndex","h") = "3" then%>
	   <%if tcWebApi_get("SkuId_Entry","WiFi5GMode","h") = "0" then%>
		   document.write('<%tcWebApi_multilingual("1","up_to_300Mbps_str")%>');
		<%else%>
		   document.write('<%tcWebApi_multilingual("1","up_to_433Mbps_str")%>');
		<%end if%>
	<%end if%>
    </script>
	</TD>
</TR>
<TR><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR id=wlan_an>
<TD><B><%tcWebApi_multilingual("1","wireless_ap_str")%></B></TD>   <!--&nbsp;&nbsp;&nbsp;&nbsp;-->
<TD><script>

	if( endis_wla_radio == "0" )
		document.write('<%tcWebApi_multilingual("1","off_str")%>');
	else if( endis_wla_ssid == "1" )
		document.write('<%tcWebApi_multilingual("1","on_str")%>');
	else
		document.write('<%tcWebApi_multilingual("1","off_str")%>');
	</script></TD>
</TR>
<TR><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR id=broadcase_an>
        <TD><B><%tcWebApi_multilingual("1","broadcast_name_str")%></B></TD>   <!--&nbsp;&nbsp;&nbsp;&nbsp;-->
        <TD><script>
	     <%if tcWebApi_get("WLan11ac_Entry0","HideSSID","h") = "0" then %>
	         document.write('<%tcWebApi_multilingual("1","on_str")%>');
	     <%else%> 
		     document.write('<%tcWebApi_multilingual("1","off_str")%>');
	     <%end if%>
		 </script></TD>
</TR>
<TR><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR id=wliso_an>
	<TD><B><%tcWebApi_multilingual("1","wireless_isolation_str")%></B></TD>    <!--&nbsp;&nbsp;&nbsp;&nbsp;-->
	<TD><script>
	     <%if tcWebApi_get("WLan11ac_Entry0","NoForwarding","h") = "1" then %>
	         document.write('<%tcWebApi_multilingual("1","on_str")%>');
	     <%else%> 
		     document.write('<%tcWebApi_multilingual("1","off_str")%>');
	     <%end if%>
		 </script></TD>
</TR>
 
<TR id=wliso_an_line><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR id=wlbroad_an>
        <TD><B><%tcWebApi_multilingual("1","wifi_protect_setup_str")%></B></TD>
        <TD>
		<script>
		<%If tcWebApi_get("WLan11ac_Entry0", "WPSConfStatus", "h") = "1" then%>
		    document.write('<%tcWebApi_multilingual("1","not_configure_str")%>');
		<%else%>
           	document.write('<%tcWebApi_multilingual("1","configure_str")%>');
		<%end if%>
		</script>
		</TD>
</TR>
<TR id=wliso_an_line><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR id=wlbroad_an>
        <TD><B>BSSID</B></TD>
        <TD><%tcWebApi_get("SkuId_Entry","TE_wlan11ac_mac","s")%></TD>
</TR>
</table>

</div>

<!--  end this -->
<img id="pl_2_1" style="display:none;" class="page_line" src="/image/icon/advanced_page_line.gif"/>

<!--script>
	if( guest_router_flag == 1 ){
		document.write('<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>');
	}
</script>
<TR id=wlanguest>
	<TD colspan=2><span class="subhead">Guest Network</span></TD>
</TR>
<TR id=wl_title_bgn  icon>
	<TD colspan=2><B>Wireless Settings b/g/n</B></TD>
</TR-->


<div id="wl_title_bgn" class="adv_icon">
	<div id="guest_bgn" class="title" onclick='click_direct("setup","guest");' style="cursor:pointer">
		<script>			
			if ( endis_wl_radio == '0')
			    document.write('<img src="/image/icon/advanced-status-error.gif" />');
			else
			{
			  if (guest_sectype == 'OPEN')
			     document.write('<img src="/image/icon/advanced-status-warning.gif" />');
			  else 
			     document.write('<img src="/image/icon/advanced-status-good.gif" />');
			}
			
		</script>
		<b><%tcWebApi_multilingual("1","guest_network_str")%><script>if(an_router_flag == 1)document.write('&nbsp;(2.4GHz)');</script></b>
	</div>
	<script>setTitleClass("Guest Network (2.4GHz)","guest_bgn");</script>
	<TABLE id="GuestNetwork2.4G" class="icon_table" width=100% border=0 cellpadding=0 cellspacing=3>
<TR id=wlanssid>
	<TD><!--script>if(an_router_flag == 1) document.write("&nbsp;&nbsp;&nbsp;&nbsp;");</script--><B><%tcWebApi_multilingual("1","name_ssid_str")%></B></TD>
	<TD><pre><%If tcWebApi_get("WLan_Entry1","SSID","h") <> "N/A" then tcWebApi_get("WLan_Entry1","SSID","s") end if%></pre></TD>
</TR>
<TR><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR id=wlanap>
	<TD><!--script>if(an_router_flag == 1) document.write("&nbsp;&nbsp;&nbsp;&nbsp;");</script--><B><%tcWebApi_multilingual("1","wireless_ap_str")%></B></TD>
<TD><script>
	if(endis_wl_radio == "0")
	    document.write('<%tcWebApi_multilingual("1","off_str")%>');
	else if(endis_wl_guest_ssid == "1")
	    document.write('<%tcWebApi_multilingual("1","on_str")%>');	
	else
	    document.write('<%tcWebApi_multilingual("1","off_str")%>');	
	</script></TD>
</TR>
<TR><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR id=wlanbro>
	<TD><!--script>if(an_router_flag == 1) document.write("&nbsp;&nbsp;&nbsp;&nbsp;");</script--><B><%tcWebApi_multilingual("1","broadcast_name_str")%></B></TD>
		<TD><script>
	     <%if tcWebApi_get("WLan_Entry1","HideSSID","h") = "0" then %>
	         document.write('<%tcWebApi_multilingual("1","on_str")%>');
	     <%else%> 
		     document.write('<%tcWebApi_multilingual("1","off_str")%>');
	     <%end if%>
		 </script></TD>
</TR>
<TR><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR id=wlaniso>
	<TD><!--script>if(an_router_flag == 1) document.write("&nbsp;&nbsp;&nbsp;&nbsp;");</script--><B><%tcWebApi_multilingual("1","wireless_isolation_str")%></B></TD>
			<TD><script>
	     <%if tcWebApi_get("WLan_Entry1","NoForwarding","h") = "1" then %>
	         document.write('<%tcWebApi_multilingual("1","on_str")%>');
	     <%else%> 
		     document.write('<%tcWebApi_multilingual("1","off_str")%>');
	     <%end if%>
		 </script></TD>
</TR>
<TR id=wlaniso_line><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR id=wlanallow>
	<TD width="60%"><B><%tcWebApi_multilingual("1","allow_guest_str")%></B></TD>
	<TD><script>
	     <%if tcWebApi_get("WLan_Entry1","GuestAllowLocal","h") = "1" then %>
	         document.write('<%tcWebApi_multilingual("1","on_str")%>');
	     <%else%> 
		     document.write('<%tcWebApi_multilingual("1","off_str")%>');
	     <%end if%>
		 </script></TD>
</TR>
</table>
</div>

<img id="pl_2_2" style="display:none;" class="page_line" src="/image/icon/advanced_page_line.gif"/>

<div id="wl_head_an" class="adv_icon">
	<div id="guest_an" class="title" onclick='click_direct("setup","guest");' style="cursor:pointer">
		<script>
	        if ( endis_wla_radio == '0')
			    document.write('<img src="/image/icon/advanced-status-error.gif" />');
			else
			{
			  if (guest_sectype_an == 'OPEN')
			     document.write('<img src="/image/icon/advanced-status-warning.gif" />');
			  else 
			     document.write('<img src="/image/icon/advanced-status-good.gif" />');
			}
			
	
		</script>
		<b><%tcWebApi_multilingual("1","guest_network5g_str")%> (5.0GHz)</b>
	</div>
	<script>setTitleClass("Guest Network (5.0GHz)","guest_an");</script>
	<TABLE id="GuestNetwork5G" class="icon_table" width=100% border=0 cellpadding=0 cellspacing=3>
<!--TR id=wl_head_an   icon7>
	<TD colspan=2><B>Wireless Settings a/n</B></TD>
</TR-->
<TR id=wlanssid_an>
	<TD><B><%tcWebApi_multilingual("1","name_ssid_str")%></B></TD>   <!--&nbsp;&nbsp;&nbsp;&nbsp;-->
	<TD><pre><%If tcWebApi_get("WLan11ac_Entry1","SSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","SSID","s") end if%></pre></TD>
</TR>
<TR><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR id=wlanap_an>
	<TD><B><%tcWebApi_multilingual("1","wireless_ap_str")%></B></TD>   <!--&nbsp;&nbsp;&nbsp;&nbsp;-->
	<TD>
	<script>
		if ( endis_wla_radio  == "0" )
			document.write('<%tcWebApi_multilingual("1","off_str")%>');
		else if ( endis_wla_guest_ssid  == "1" )
			document.write('<%tcWebApi_multilingual("1","on_str")%>');
		else
		    document.write('<%tcWebApi_multilingual("1","off_str")%>');
	</script>
	</TD>
</TR>
<TR><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR id=wlanbro_an>
	<TD><B><%tcWebApi_multilingual("1","broadcast_name_str")%></B></TD>  <!--&nbsp;&nbsp;&nbsp;&nbsp;-->
	<TD><script>
	     <%if tcWebApi_get("WLan11ac_Entry1","HideSSID","h") = "0" then %>
	         document.write('<%tcWebApi_multilingual("1","on_str")%>');
	     <%else%> 
		     document.write('<%tcWebApi_multilingual("1","off_str")%>');
	     <%end if%>
		 </script></TD>
</TR>
<TR><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR id=wlaniso_an>
	<TD><B><%tcWebApi_multilingual("1","wireless_isolation_str")%></B></TD>   <!--&nbsp;&nbsp;&nbsp;&nbsp;-->
	<TD><script>
	     <%if tcWebApi_get("WLan11ac_Entry1","NoForwarding","h") = "1" then %>
	         document.write('<%tcWebApi_multilingual("1","on_str")%>');
	     <%else%> 
		     document.write('<%tcWebApi_multilingual("1","off_str")%>');
	     <%end if%>
		 </script></TD>
</TR>
<TR id=wlaniso_an_line><TD colspan=2><img src="/image/icon/advanced_icon_line.gif" /></TD></TR>
<TR id=wlanallow_an>
	<TD width="60%"><B><%tcWebApi_multilingual("1","allow_guest_str")%></B></TD>   <!--&nbsp;&nbsp;&nbsp;&nbsp;-->
	<TD><script>
	     <%if tcWebApi_get("WLan11ac_Entry1","GuestAllowLocal","h") = "1" then %>
	         document.write('<%tcWebApi_multilingual("1","on_str")%>');
	     <%else%> 
		     document.write('<%tcWebApi_multilingual("1","off_str")%>');
	     <%end if%>
		 </script></TD>
</TR>
</table>
</div>

<img id="pl_3" style="display:none;" class="page_line" src="/image/icon/advanced_page_line.gif"/>
<script>

var wds_endis_fun="0";
var wds_repeater_basic="0";
var wla_wds_endis_fun="0";
var wds_repeater_basic_a="0";

var repeater_mac1="";
var repeater_mac2="";
var repeater_mac3="";
var repeater_mac4="";
var basic_station_mac="";  /*when choose repeater mode, it should show mac address*/

var repeater_mac1_a="";
var repeater_mac2_a="";
var repeater_mac3_a="";
var repeater_mac4_a="";
var basic_station_mac_a=""; /*when choose repeater mode, it should show mac address*/

	//begin: for wds
//	if((wds_endis_fun=="1" &&  wds_repeater_basic=="0") || (wla_wds_endis_fun=="1" && wds_repeater_basic_a=="0"))
//	{
	    if(wds_endis_fun=="1" &&  wds_repeater_basic=="0")   /* 1.For Repeater mode,the section MUST include the status for Base Station  MAC Address. 2.For Repeater mode,router status page should not includethe "Internet Port"item. */
	      {
	      document.getElementById("icon2").style.display="none";
	      document.getElementById("wds2_4_repeater").style.display="";
		   document.getElementById("wds5_repeater").style.display="none";
	       }
	     else if(wla_wds_endis_fun=="1" && wds_repeater_basic_a=="0")
	       {
	       document.getElementById("icon2").style.display="none";
		   document.getElementById("wds2_4_repeater").style.display="none";
	       document.getElementById("wds5_repeater").style.display="";
	       }
	//}
	     else
		 {
	     document.getElementById("icon2").style.display="";
		  document.getElementById("wds2_4_repeater").style.display="none";
	       document.getElementById("wds5_repeater").style.display="none";
		 
		 }

if( ( wds_endis_fun == 1 && wds_repeater_basic == 1 ) && ( wla_wds_endis_fun == 1 && wds_repeater_basic_a == 1 ) )
{
	/*document.write('<div id="wds2_4_base" class="adv_icon">');
	document.write('<div class="title">');
	document.write('<img src="/image/icon/advanced-status-good.gif" />');
	document.write('<b>Wireless Repeating</b>');
	document.write('</div>');*/
	//document.write('<TABLE class="icon_table" width=100% border=0 cellpadding=0 cellspacing=3><TR><TD colspan=2><span class="subhead">Wireless Repeating</span></TD></TR>');
//}

if ( wds_endis_fun == 1 && wds_repeater_basic == 1 )
{
	/*var repeater_mac1="";
    var repeater_mac2="";
    var repeater_mac3="";
    var repeater_mac4="";*/
	
	var stalist="";
	macModeArray=stalist.split(" #@# "); //macModeArray[0]:mac, macModeArray[1]:link_rate, macModeArray[2]:rssi;
	if( an_router_flag == 1)	
	{
	adv_icon_num++;
	document.write('<div id="wds2_4_base" class="adv_icon">');
	document.write('<div class="title">');
	document.write('<img src="/image/icon/advanced-status-good.gif" />');
	document.write('<b>Wireless Repeating (2.4GHz)</b>');
	document.write('</div>');
	setTitleClass("Wireless Repeating (2.4GHz)","wds2_4_base");
	document.write('<TABLE class="icon_table" width=100% border=0 cellpadding=0 cellspacing=3>');
	//document.write("<TR><TD><b>Wireless Repeating Function (2.4GHz b/g/n)</b></TD></TR>");
	}
		

        for ( i=1;i<=4;i++ )
        {
		var show_repeater_mac=wds_repeater_mac(i);
        	str_mac=eval('repeater_mac'+i);
		if( an_router_flag == 1)
			document.write("<tr><TD width=\"60%\"><b>"+show_repeater_mac+"</b></td><TD>"+str_mac+"</td></tr>");
		else
			document.write("<tr><TD width=\"60%\"><b>"+show_repeater_mac+"</b></td><TD>"+str_mac+"</td></tr>");
		document.write("<TR><TD colspan=2><img src=\"/image/icon/advanced_icon_line.gif\" /></TD></TR>");
	    }	
	//if( an_router_flag != 1)
	//	document.write("<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>");  
	/*Bug 19830, according to Spec1.9 just show the mac address on the page.
            	if( str_mac != "" )
            	{
                	flag=0;
                	if ( stalist != "" )
                	{
                    		for ( j=0; j<macModeArray.length; j++)
                    		{
					each_info=macModeArray[j].split(" ");
                        		if( str_mac.toLowerCase() == each_info[0].toLowerCase() )
                        		{

						if ( linknum == 0 )
							continue;
						else if ( linknum >= 1000 )
                            			{
                                			linknum=parseInt(linknum/1000);
                                			linknum=linknum+" Mbps";
                            			}
						else
							linknum="1 Mbps";
                            			flag++;
                            			document.write("<tr><TD><b>"+show_repeater_mac+"</b></td><TD>"+str_mac+"</td></tr>");
						document.write("<tr><TD>  Link Status</td><TD> "+linknum+" </td></tr>");
                        		}
                    		}
                	}
                	if ( flag == 0 )
                	{
                    		document.write("<tr><TD><b>"+show_repeater_mac+"</b></td><TD>"+str_mac+"</td></tr>");
				document.write("<tr><TD>Link Status</td><TD>"+" disconnected "+"</td></tr>");
                	}
            	}
        }
    	document.write("<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>");*/
document.write('</table>');
document.write('</div>');
}

if ( wla_wds_endis_fun == 1 && wds_repeater_basic_a == 1 )
{
	/*var repeater_mac1_a="";
	var repeater_mac2_a="";
	var repeater_mac3_a="";
	var repeater_mac4_a="";*/
	
	if( endis_wl_radio == 1 )
        	var stalist="";
	else 
		var stalist="";
        macModeArray=stalist.split(" #@# "); //macModeArray[0]:mac, macModeArray[1]:link_rate, macModeArray[2]:rssi;
	adv_icon_num++;
	document.write('<div id="wds5_base" class="adv_icon">');
	document.write('<div class="title">');
	document.write('<img src="/image/icon/advanced-status-good.gif" />');
	document.write('<b>Wireless Repeating (5.0GHz)</b>');
	document.write('</div>');
	setTitleClass("Wireless Repeating (5.0GHz)","wds5_base");
	document.write('<TABLE class="icon_table" width=100% border=0 cellpadding=0 cellspacing=3>');
		
       // document.write("<tr><TD><b>Wireless Repeating Function (5GHz a/n)</b></td></tr>");
        for ( i=1;i<=4;i++ )
        {
		var show_repeater_mac_a=wds_repeater_mac(i);
		str_mac=eval('repeater_mac'+i+'_a');
		document.write("<tr><TD width=\"60%\"><b>"+show_repeater_mac_a+"</b></td><TD>"+str_mac+"</td></tr>");
		document.write("<TR><TD colspan=2><img src=\"/image/icon/advanced_icon_line.gif\" /></TD></TR>");
	   }
		/*Bug 19830, according to Spec1.9 just show the mac address on the page.
		if( str_mac != "" )
		{
			 flag=0;
			if ( stalist != "" )
		        {
				for ( j=0; j<macModeArray.length; j++)
				{
					each_info=macModeArray[j].split(" ");
					if( str_mac.toLowerCase() == each_info[0].toLowerCase() )
					{
						linknum=each_info[1];
						if ( linknum == 0 )
							continue;
						else if ( linknum >= 1000 )
						{
							linknum=parseInt(linknum/1000);
							linknum=linknum+" Mbps";
						}
						else
							linknum="1 Mbps";
						flag++;
						document.write("<tr><TD><b>"+show_repeater_mac_a+"</b></td><TD>"+str_mac+"</td></tr>");
						document.write("<tr><TD>  Link Status</td><TD> "+linknum+" </td></tr>");
					}
				}
			}
			if ( flag == 0 )
			{
				document.write("<tr><TD><b>"+show_repeater_mac_a+"</b></td><TD>"+str_mac+"</td></tr>");
		                document.write("<tr><TD>Link Status</td><TD>"+" disconnected "+"</td></tr>");
			}
		}
	}*/
	//document.write("<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>");
}
document.write('</table>');
document.write('</div>');
}

else if(( wds_endis_fun == 1 && wds_repeater_basic == 1 ) && !( wla_wds_endis_fun == 1 && wds_repeater_basic_a == 1 ))
{
	adv_icon_num++;
	document.write('<div id="wds_base" class="adv_icon">');
	document.write('<div class="title">');
	document.write('<img src="/image/icon/advanced-status-good.gif" />');
	document.write('<b>Wireless Repeating</b>');
	document.write('</div>');
	setTitleClass("Wireless Repeating","wds_base");
	document.write('<TABLE class="icon_table" width=100% border=0 cellpadding=0 cellspacing=3>');
	 for ( i=1;i<=4;i++ )
        {
		var show_repeater_mac=wds_repeater_mac(i);
        	str_mac=eval('repeater_mac'+i);
		if( an_router_flag == 1)
			document.write("<tr><TD width=\"60%\"><b>"+show_repeater_mac+"</b></td><TD>"+str_mac+"</td></tr>");
		else
			document.write("<tr><TD width=\"60%\"><b>"+show_repeater_mac+"</b></td><TD>"+str_mac+"</td></tr>");
		document.write("<TR><TD colspan=2><img src=\"/image/icon/advanced_icon_line.gif\" /></TD></TR>");
	    }	
	document.write('</table>');
    document.write('</div>');	
	
}
else if(!( wds_endis_fun == 1 && wds_repeater_basic == 1 ) && ( wla_wds_endis_fun == 1 && wds_repeater_basic_a == 1 ))
{
	adv_icon_num++;
	document.write('<div id="wds_base" class="adv_icon">');
	document.write('<div class="title">');
	document.write('<img src="/image/icon/advanced-status-good.gif" />');
	document.write('<b>Wireless Repeating</b>');
	document.write('</div>');
	setTitleClass("Wireless Repeating","wds_base");
	document.write('<TABLE class="icon_table" width=100% border=0 cellpadding=0 cellspacing=3>');
	
	        for ( i=1;i<=4;i++ )
        {
		var show_repeater_mac_a=wds_repeater_mac(i);
		str_mac=eval('repeater_mac'+i+'_a');
		document.write("<tr><TD width=\"60%\"><b>"+show_repeater_mac_a+"</b></td><TD>"+str_mac+"</td></tr>");
		document.write("<TR><TD colspan=2><img src=\"/image/icon/advanced_icon_line.gif\" /></TD></TR>");
	   }
	
	document.write('</table>');
    document.write('</div>');	
	
}

var g_ssid="";
/*var get_endis_guestNet="0";
if(get_endis_guestNet == 1)
{
        if( an_router_flag == 1)
                document.write("<tr><TD colspan=2><span class=\"subhead\">Wireless Port - Guest Profile 1 (2.4GHz b/g/n)</span></td></tr>");
	else
                document.write("<tr><TD colspan=2><span class=\"subhead\">Wireless Port - Guest Profile 1 </span></td></tr>");
	document.write("<TR><TD><B>Name (SSID)</B></TD>");	
	g_ssid="NETGEAR-Guest".replace(/\\\\\\\\/g,"\\").replace(/\\\"/g,"\"").replace(/\\\\\\`/g,"`");
	g_ssid=g_ssid.replace(/ /g,"&nbsp;").replace(/>/g,"&gt;").replace(/</g,"&lt;");
	document.write("<TD>"+g_ssid+"</TD></TR>");
	document.write("<TR><TD><B>Broadcast Name</B></TD>");
	document.write("<TD>On</TD></TR>");
	document.write("<TR><TD><B>My LAN access</B></TD>");
	document.write("<TD>Off</TD></TR>");

	document.write("<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>");
}

var get_endis_guestNet_a="0";
if( an_router_flag == 1 && get_endis_guestNet_a == 1)
{
	document.write("<tr><TD colspan=2><span class=\"subhead\">Wireless Port - Guest Profile 1  (5GHz a/n)</span></td></tr>");
	document.write("<TR><TD><B>Name (SSID)</B></TD>");
        g_ssid="NETGEAR-5G-Guest".replace(/\\\\\\\\/g,"\\").replace(/\\\"/g,"\"").replace(/\\\\\\`/g,"`");
        g_ssid=g_ssid.replace(/ /g,"&nbsp;").replace(/>/g,"&gt;").replace(/</g,"&lt;");
        document.write("<TD>"+g_ssid+"</TD></TR>");
        document.write("<TR><TD><B>Broadcast Name</B></TD>");
        document.write("<TD>On</TD></TR>");
        document.write("<TR><TD><B>My LAN access</B></TD>");
        document.write("<TD>Off</TD></TR>");
	
	document.write("<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>");
}*/
</script>
<!--TABLE id="bottom_buttons" class="icon_table" width=100% border=0 cellpadding=0 cellspacing=3>
<TR>
	<TD colspan=2 align=center>
	<input type="button" name="Show Statistics" value="Show Statistics" onClick="window.open('RST_statistic.asp', 'show_statistic', 'width=900,height=400,top=200,left=200,status=yes');">
	<div id="line2_1" class="common_button" name="Show Statistics" onClick='window.open("RST_statistic.asp", "show_statistic", "width=900,height=400,top=200,left=200,status=yes");'><b>Add Custom Service</b></div>
	<script>
	if (wanproto != "Static IP")
	//document.write('<input type="button" name="Connection Status" value="Connection Status"' + 'onClick="click_status()">');
	document.write('<div id="line2_2" class="common_button" name="Connection Status" onclick=\'click_status();\'><b>Connection Status</b></div>');
	</script>
	</TD>
</TR>
</table-->

<script>
function click_status()
{
	if (internet_type == "0" && internet_ppp_type == "3")
		window.open('RST_conn_status.asp','connect_status','width=625,height=550,top=50,left=200,status=yes');
	else
		window.open('RST_conn_status.asp','connect_status','width=625,height=400,top=50,left=200,status=yes');
}

</script>
<!--/TABLE-->
</div><!-- end of content_icons -->
</BODY>
</HTML>
