<%
if request_Form("submit_flag") <> "" then
	tcWebApi_set("Wan_Common","TransMode","TransMode")
end if

if request_Form("submit_flag") = "1" then
    /* Switch WAN to LAN */
    tcWebApi_set("DynamicWan_Entry","LAN","WANTOLAN")

	/* DSL Mode Change */
	tcWebApi_set("DynamicWan_Entry","Active","DeACTIVE_VALUE")
	tcWebApi_commit("DynamicWan_Entry")
	if request_Form("dsl_mode") <> tcWebApi_get("Adsl_Entry","MODULATIONTYPE","h") then
		tcWebApi_set("Adsl_Entry","MODULATIONTYPE","MODULATIONTYPE")
		tcWebApi_commit("Adsl_Entry")
	end if
elseif request_Form("submit_flag") = "0" then
	/* Restore Ethernet WAN Setup */
	TCWebApi_unset("WanExt_PVC10e0")
	tcWebApi_set("WanExt_PVC10e0","Active","Active_No")
	tcWebApi_set("WanExt_PVC10e0","ISP","ISP3_default")
	tcWebApi_set("WanExt_PVC10e0","IPVERSION","IPVERSION_default")
	tcWebApi_set("WanExt_PVC10e0","PPPv6Mode","PPPv6Mode_default")
	tcWebApi_set("WanExt_PVC10e0","PPPv6PD","PPPv6PD_default")
	tcWebApi_set("WanExt_PVC10e0","MLDproxy","MLDproxy_default")
	tcWebApi_commit("WanExt_PVC10e0")
	/* DSL WAN Setup */
	if request_Form("SwitchPVCFlag") = "1" then
		tcWebApi_set("WebCurSet_Entry","wan_pvc","WANNumber")
	elseif request_Form("WAN_type") <> "" then
		tcWebApi_set("WebCurSet_Entry","wan_pvc","wan_pvc")
		tcWebApi_set("WebCurSet_Entry","nat_pvc","wan_pvc")
		
		tcWebApi_set("Wan_PVC","Active","Active")
	
		if request_Form("WAN_type") = "1" then
			tcWebApi_set("Wan_PVC","QOS","AdslQoS")
			tcWebApi_set("Wan_PVC","VPI","dsl_vpi")
			tcWebApi_set("Wan_PVC","VCI","dsl_vci")
			tcWebApi_set("Wan_PVC","ENCAP","ENCAP")
			if request_Form("AdslQoSPcrRate") <> "" then
				tcWebApi_set("Wan_PVC","PCR","AdslQoSPcrRate")
			end if	
			if request_Form("AdslQoSScrRate") <> "" then
				tcWebApi_set("Wan_PVC","SCR","AdslQoSScrRate")
			end if
			if request_Form("AdslQoSMbs") <> "" then		
				tcWebApi_set("Wan_PVC","MBS","AdslQoSMbs")
			end if	
		end if

		/* Switch WAN to LAN */
	    tcWebApi_set("DynamicWan_Entry","LAN","WANTOLAN")
		/* DSL Mode Change */
		tcWebApi_set("DynamicWan_Entry","Active","DeACTIVE_VALUE")
		tcWebApi_commit("DynamicWan_Entry")
		
		if request_Form("WAN_COMMIT_FLAG") = "1" then
			tcWebApi_commit("Wan_PVC")
		end if
	end if	
elseif request_Form("submit_flag") = "2" then
	/* Restore ATM Setup */
	TCWebApi_unset("Wan_PVC0")
	tcWebApi_set("Wan_PVC0","Active","Active_Yes")
	tcWebApi_set("Wan_PVC0","PVCScanReserved","PVCScanReserved_default")
	tcWebApi_set("Wan_PVC0","VPI","VPI_default")
	tcWebApi_set("Wan_PVC0","VCI","VCI_default")
	tcWebApi_set("Wan_PVC0","QOS","QOS_default")
	tcWebApi_set("Wan_PVC0","PCR","PCR_default")
	tcWebApi_set("Wan_PVC0","SCR","SCR_default")
	tcWebApi_set("Wan_PVC0","MBS","MBS_default")
	tcWebApi_set("Wan_PVC0","CDVT","CDVT_default")
	tcWebApi_set("Wan_PVC0","ISP","ISP2_default")
	tcWebApi_set("Wan_PVC0","ENCAP","ENCAP_default")
	tcWebApi_set("Wan_PVC0","IPVERSION","IPVERSION_default")
	tcWebApi_set("Wan_PVC0","PPPv6Mode","PPPv6Mode_default")
	tcWebApi_set("Wan_PVC0","PPPv6PD","PPPv6PD_default")
	tcWebApi_set("Wan_PVC0","MLDproxy","MLDproxy_default")
	tcWebApi_set("Wan_PVC0","IPv6Extension","IPv6Extension_default")
	tcWebApi_set("Wan_PVC0","Mac_Spoofing","Mac_Spoofing_default")
	tcWebApi_set("Wan_PVC0","Mac_Assign","Mac_Assign_default")
	tcWebApi_set("Wan_PVC0","IGMPproxy","IGMPproxy_default")
	tcWebApi_set("Wan_PVC0","LASTmss","LASTmss_default")
	tcWebApi_set("Wan_PVC0","MTU","MTU_default")
	tcWebApi_set("Wan_PVC0","USERNAME","USERNAME_default")
	tcWebApi_commit("Wan_PVC0")
	/* Ethernet WAN Setup */
	
	/* Switch LAN to WAN */
	tcWebApi_set("DynamicWan_Entry","Active","ACTIVE_VALUE")
	tcWebApi_set("DynamicWan_Entry","LAN","DYNAMICLAN")
	tcWebApi_commit("DynamicWan_Entry")
	
	/* Default Ether WAN is DHCP */
	tcWebApi_set("WebCurSet_Entry","wan_pvc","WANNumber")
	tcWebApi_set("WebCurSet_Entry","wan_pvc","wan_pvc")
	tcWebApi_set("WebCurSet_Entry","nat_pvc","wan_pvc")
	tcWebApi_set("Wan_PVC","Active","Active")
	
	tcWebApi_set("Wan_PVC","Active","Active")
	tcWebApi_set("Wan_PVC","ISP","ETH_Default_ISP")
	tcWebApi_set("Wan_PVC","NATENABLE","ETH_Default_NATENABLE")
	tcWebApi_set("Wan_PVC","ENCAP","ETH_Default_ENCAP")
	tcWebApi_set("Wan_PVC","DEFAULTROUTE","ETH_Default_DEFAULTROUTE")
	tcWebApi_set("Wan_PVC","Mac_Assign","ETH_Default_Mac_Assign")
	tcWebApi_set("Wan_PVC","HOSTNAME","system_name")
	tcWebApi_commit("Wan_PVC")
end if
%>

<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_title");%></title>
<meta http-equiv="Content-Type" content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<meta content="MSHTML 6.00.2800.1141" name="GENERATOR">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/wan_type_setting.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe name="wanForm">
<input type=hidden name=submit_flag value="wan_type_setting">
<input type=hidden name=WAN_COMMIT_FLAG value="1">

<input type=hidden name=ETH_Default_ISP value="0">
<input type=hidden name=ETH_Default_NATENABLE value="Enable">
<input type=hidden name=ETH_Default_ENCAP value="1483 Bridged IP LLC">
<input type=hidden name=ETH_Default_DEFAULTROUTE value="Yes">
<input type=hidden name=ETH_Default_Mac_Assign value="0">

<input type=hidden name=Active_No value="No">
<input type=hidden name=ISP2_default value="2">
<input type=hidden name=ISP3_default value="3">
<input type=hidden name=IPVERSION_default value="IPv4">
<input type=hidden name=PPPv6Mode_default value="1">
<input type=hidden name=PPPv6PD_default value="Yes">
<input type=hidden name=MLDproxy_default value="No">

<input type=hidden name=Active_Yes value="Yes">
<input type=hidden name=PVCScanReserved_default value="No">
<input type=hidden name=VPI_default value="0">
<input type=hidden name=VCI_default value="38">
<input type=hidden name=QOS_default value="ubr">
<input type=hidden name=PCR_default value="0">
<input type=hidden name=SCR_default value="0">
<input type=hidden name=MBS_default value="0">
<input type=hidden name=CDVT_default value="0">
<input type=hidden name=ENCAP_default value="PPPoA VC-Mux">
<input type=hidden name=IPv6Extension_default value="0">
<input type=hidden name=Mac_Spoofing_default value="00:11:22:33:44:55">
<input type=hidden name=Mac_Assign_default value="0">
<input type=hidden name=IGMPproxy_default value="No">
<input type=hidden name=LASTmss_default value="">
<input type=hidden name=MTU_default value="1458">
<input type=hidden name=USERNAME_default value="guest">






<div class="page_title" id="title" ><%tcWebApi_multilingual("1","xdsl_setup_str")%></div>
<div id="main" class="main"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<script>
var wan_phy_mode="eth";
var wan_pvc_port="1";
var logs_checkbox_flag = 1;
var thank_login_flag = 0;
var host_name="VEGN2200";
var usb_router_flag = 1; 
var readyShareSupportedLevel = 7; 
var an_router_flag = 0;
var wireless_schedule_flag = 1;
var guest_router_flag = 1;
var traffic_router_flag=1;
var qos_router_flag=1;
var multi_lang_router_flag=1;
var wds_router_flag=1;
var video_router_flag=1;
var transmit_router_flag=1;
var pppoe_mac_router_flag=1;
var ddns_oray_router_flag=0;
var ddns_wildcards_flag=0;
var dfs_channel_router_flag=1;
var russian_ppp_flag=1;
var russian_pppoe_flag=1;
var l2tp_flag=1;
var igmp_flag=1;
var pppoe_intranet_flag=0;
var dns_third_flag=0;
var tr069_router_flag=1;
var block_sites_flag=1;
var ipv6_flag=1;
var mode_is_300=1;
var is_vc_release=0;
var vpn_show_flag=1;
var router_type="RangeMax(TM)";
var max_bandwidth=1000;
var wire_iso_flag=0;
var bigpond_flag=0;
var apmode_flag=0;
var tivo_flag=0;
var auto_conn_flag=0;
var bridge_iptv_flag=0;
var parental_ctrl_flag=1;
var dfs_channel2_router_flag=0;
var new_multiple_lang=0;

var snmpd_flag = 0;
var xdsl_auto=1;	
var xDSL_fallback=0;
var qosArray=["UBR","CBR","VBR-nrt","VBR-rt"];	

var maxchars = 120;
var delay_time = 300;
var charcount = 0;

function loadvalue()
{
   
    var F = document.forms[0];
    var mode=""; 
		
	<% if tcWebApi_get("Wan_Common","TransMode","h") = "ATM" then %>
	mode = "ATM";
	<% else %>
	mode = "Ethernet";
	<% end if %>
	
	if(mode=="ATM"){
		F.WAN_type.selectedIndex=1;
		
		F.dsl_vpi.value = "<% if tcWebApi_get("Wan_PVC","VPI","h") = "N/A" then asp_write("0") else tcWebApi_get("Wan_PVC","VPI","s") end if%>";
		F.dsl_vci.value = "<% if tcWebApi_get("Wan_PVC","VCI","h") = "N/A" then asp_write("33") else tcWebApi_get("Wan_PVC","VCI","s") end if%>";
		F.enable_pvc.checked = <% if tcWebApi_get("Wan_PVC","Active","h") = "Yes" then asp_Write("true") else asp_Write("false") end if%>;
		
		var qos_index =0;
		qos_index=<% if tcWebApi_get("Wan_PVC","QOS","h") = "ubr" then asp_Write("0")
			elseif tcWebApi_get("Wan_PVC","QOS","h") = "cbr" then asp_Write("1")
			elseif tcWebApi_get("Wan_PVC","QOS","h") = "rt-vbr" then asp_Write("2")
			elseif tcWebApi_get("Wan_PVC","QOS","h") = "nrt-vbr" then asp_Write("3")
			else   asp_Write("0")
			end if%>;
		F.AdslQoS.selectedIndex=qos_index;
		SelQOS(qos_index);
		
		switch(qos_index){
			case 1:
				<% if tcWebApi_get("Wan_PVC","PCR","h") <> "" then %>
					F.AdslQoSPcrRate.value=<% tcWebApi_get("Wan_PVC","PCR","s") %>;
				<% end if %>
				break;
			case 2:
				<% if tcWebApi_get("Wan_PVC","PCR","h") <> "" then %>
					F.AdslQoSPcrRate.value=<% tcWebApi_get("Wan_PVC","PCR","s") %>;
				<% end if %>
				
				<% if tcWebApi_get("Wan_PVC","SCR","h") <> "" then %>
					F.AdslQoSScrRate.value=<% tcWebApi_get("Wan_PVC","SCR","s") %>;
				<% end if %>
				
				<% if tcWebApi_get("Wan_PVC","MBS","h") <> "" then %>
					F.AdslQoSMbs.value=<% tcWebApi_get("Wan_PVC","MBS","s") %>;
				<% end if %>
				break;
			case 3:
				<% if tcWebApi_get("Wan_PVC","PCR","h") <> "" then %>
					F.AdslQoSPcrRate.value=<% tcWebApi_get("Wan_PVC","PCR","s") %>;
				<% end if %>
				
				<% if tcWebApi_get("Wan_PVC","SCR","h") <> "" then %>
					F.AdslQoSScrRate.value=<% tcWebApi_get("Wan_PVC","SCR","s") %>;
				<% end if %>
				
				<% if tcWebApi_get("Wan_PVC","MBS","h") <> "" then %>
					F.AdslQoSMbs.value=<% tcWebApi_get("Wan_PVC","MBS","s") %>;
				<% end if %>
				break;
		}
		
		var adsl_mode = "<% tcWebApi_get("Adsl_Entry","MODULATIONTYPE","s") %>";
		if(adsl_mode=="Auto Sync-Up")
			F.dsl_mode.selectedIndex=0;
		else if	(adsl_mode=="G.DMT")
			F.dsl_mode.selectedIndex=1;
		else if	(adsl_mode=="ADSL2")
			F.dsl_mode.selectedIndex=2;
		else if	(adsl_mode=="ADSL2+")
			F.dsl_mode.selectedIndex=3;	

		//Encapsulation
		var wan_type = "<%tcWebApi_get("Wan_PVC","ENCAP","s")%>";
		if(wan_type=="PPPoE LLC" || wan_type=="PPPoA LLC" || wan_type=="1483 Bridged IP LLC" || wan_type=="1483 Bridged Only LLC")
			F.dsl_multiplex.selectedIndex = 0;
	    else if (wan_type.search("IPoA") != -1)
		    F.dsl_multiplex.selectedIndex = 0;
		else	
			F.dsl_multiplex.selectedIndex = 1;
	}else{
		F.WAN_type.selectedIndex=0;
		F.enable_pvc.checked= true;
		SelQOS(0);
	}
	
	change_wan_type(F);	
	change_auto_type(F);
	tstr=0;
}

function change_wan_type(F)
{
  	if ( F.WAN_type.selectedIndex == 1 || (F.WAN_type.selectedIndex == 3 && wan_phy_mode == "adsl")) {
		document.getElementById("isADSL").style.display="";
		document.getElementById("isATM").style.display="";
	}
	else {
		document.getElementById("isADSL").style.display="none";
		document.getElementById("isATM").style.display="none";
	}
}

function change_tc_type(F)
{
	if ( F.TC_type.selectedIndex == 0 )
		document.getElementById("isATM").style.display="none";
	else
		document.getElementById("isATM").style.display="";
}

function SelQOS(num)
{
	if(document.getElementById("id_adslqos")[num].value == "nrt-vbr") {
		choose_enable(document.forms[0].AdslQoSMcrRate);
		choose_enable(document.forms[0].AdslQoSScrRate);
		choose_enable(document.forms[0].AdslQoSMbs);
	}
	else if(document.getElementById("id_adslqos")[num].value == "rt-vbr") {
		choose_disable(document.forms[0].AdslQoSMcrRate);
		choose_enable(document.forms[0].AdslQoSScrRate);
		choose_enable(document.forms[0].AdslQoSMbs);
	}
	else {
		choose_disable(document.forms[0].AdslQoSMcrRate);
		choose_disable(document.forms[0].AdslQoSScrRate);
		choose_disable(document.forms[0].AdslQoSMbs);
	}
}

function CheckValueStyle(a)
{
	var i;
	var c = document.getElementById(a);
	
	if((c.value.charAt(0)=='0')||(check_integer(c.value)))
	{
		c.value = parseInt(c.value,10);
	}
}

function SelAuto(a)
{
	if(a==1)
	{
		choose_disable(document.getElementById("dsl_vpi"));
		choose_disable(document.getElementById("dsl_vci"));
	}
	else if(a==0)
	{
		choose_enable(document.getElementById("dsl_vpi"));
		choose_enable(document.getElementById("dsl_vci"));
	}
}

function choose_disable(dis_object)
{
	if(!dis_object) return;
		dis_object.disabled = true;

	if(!ns4)
		dis_object.style.backgroundColor = "#e0e0e0";
}

function choose_enable(en_object)
{
	if(!en_object) return;
		en_object.disabled = false;

	if(!ns4)
		en_object.style.backgroundColor = "";
}

function check_integer(a)
{
	var i;
	var c;
	
	if(a.length==0)
	{
		if((a>='0')&&(a<='9'))
			return true;
		else
			return false;
	}
	else
	{
		for(i=0; i<a.length; i++)
		{
			c=a.charAt(i);
		
			if((c>='0')&&(c<='9'))
				continue;
			else
				return false;
		}
	}	
	return true;
}

function submit_xdsl(dslModeApply)
{
	with (document.forms[0])
	{
		var xdslMode=WAN_type.selectedIndex;
		if(dslModeApply=="0"){
			//Dsl Mode check each field value
			if(xdslMode==1){
				TransMode.value = "ATM";
				//wan_pvc.value=wan_pvc_port.selectedIndex;
				wan_pvc.value="0";
				if(!enable_pvc.checked)
					Active.value= "No";
				
				if (dsl_vpi.value < 0 || dsl_vpi.value > 32)
				{
					 alert("<%tcWebApi_multilingual("1","error_wrong_vpi_str")%>");
					 return;
				}
				if (dsl_vci.value < 32 || dsl_vci.value > 65535)
				{
					alert("<%tcWebApi_multilingual("1","error_wrong_vci_str")%>");
					return;
				}
										
				//Encapsulation
				var wan_type = <%tcWebApi_get("Wan_PVC","ISP","s")%>;
				var wan_encap = "<%tcWebApi_get("Wan_PVC","ENCAP","s")%>";
				switch(wan_type)
				{
					case 0:
					case 1:
						if(dsl_multiplex.value=="LLC")
						{
						    if(wan_encap == "1483 Routed IP VC-Mux")
							   ENCAP.value = "1483 Routed IP LLC(IPoA)";
							else
							   ENCAP.value = "1483 Bridged IP LLC";
						}
						else
                        {
                            if(wan_encap.search("IPoA") != -1)
							   ENCAP.value = "1483 Routed IP VC-Mux";
                            else							
							   ENCAP.value = "1483 Bridged IP VC-Mux";
						}
						break;
					case 2:
					case 3:
						if(dsl_multiplex.value=="LLC")
						{
						    if(wan_encap.search("PPPoA") == -1)
							   ENCAP.value = "PPPoE LLC";
							else
							   ENCAP.value = "PPPoA LLC";
						}
						else
                        {
                            if(wan_encap.search("PPPoA") == -1)						
							   ENCAP.value = "PPPoE VC-Mux";
							else
							   ENCAP.value = "PPPoA VC-Mux";
						}
						var password = "<%if tcWebApi_get("Wan_PVC","PASSWORD","h") <> "N/A" then tcWebApi_get("Wan_PVC","PASSWORD","s") end if%>";
						if(password=="")
							WAN_COMMIT_FLAG.value="0";
						break;	
				}
			}else{
				TransMode.value = "Ethernet";
				wan_pvc.value=10;
			}
		}
		else
		{
			if(xdslMode==1)
			{
				if(dsl_mode.value=="Auto")
					MODULATIONTYPE.value="Auto Sync-Up";
				else if(dsl_mode.value=="ADSL")
					MODULATIONTYPE.value="G.DMT";
				else if(dsl_mode.value=="ADSL2")
					MODULATIONTYPE.value="ADSL2";
				else if(dsl_mode.value=="ADSL2+")
					MODULATIONTYPE.value="ADSL2+";
				
				TransMode.value = "ATM";
			}
			else
			{
				TransMode.value = "Ethernet";
				wan_pvc.value=10;
				dslModeApply=2;
				parent.menu_internet = "ipoe";
			}
		}	
		submit_flag.value=dslModeApply;
		
		//Display Wait Bar
		document.getElementById("title").style.display = "none";
		document.getElementById("main").style.display = "none";
		document.getElementById("waiting_bar").style.display = "";
		updateProgress();
		wanForm.submit();
	}
}

function SelQOS(type)
{
     var F = document.forms[0];

     F.AdslQoSPcrRate.disabled=false;
     F.AdslQoSScrRate.disabled=false;
     F.AdslQoSMbs.disabled=false;      

     if (type == "0") {
         F.AdslQoSPcrRate.disabled=true;
         F.AdslQoSScrRate.disabled=true;
         F.AdslQoSMbs.disabled=true;                                
     }
     else if (type == "1") {
         F.AdslQoSScrRate.disabled=true;
         F.AdslQoSMbs.disabled=true;
     }	     
}

function change_auto_type(F)
{
	if ( xDSL_fallback == "1" )
		F.WAN_type.selectedIndex = 3;
}

function change_pvc_port()
{
	with (document.forms[0])
	{
		//WANNumber.value = wan_pvc_port.selectedIndex;
		SwitchPVCFlag.value=1;
		wanForm.submit();
	}	
}
</script>
<INPUT type=hidden name=TransMode value="">
<INPUT type=hidden name=wan_pvc value="0">
<INPUT type=hidden name=Active value="Yes">
<INPUT type=hidden name=SwitchPVCFlag value="0">
<INPUT type=hidden name=WANNumber value="0">
<INPUT type=hidden name=PVC_enable value="">
<INPUT type=hidden name=Atm_qos_str value="">
<INPUT type=hidden name=ENCAP value="">
<INPUT type=hidden name=MODULATIONTYPE value="">
<INPUT type=hidden name=ACTIVE_VALUE value="Yes">
<INPUT type=hidden name=DeACTIVE_VALUE value="No">
<INPUT type=hidden name=DYNAMICLAN value="3">
<INPUT type=hidden name=WANTOLAN value="4">
<INPUT type=hidden name=HOSTNAME value="<%if tcWebApi_get("Wan_PVC","HOSTNAME","h") = "N/A" then tcWebApi_get("SkuId_Entry","ProductName","s") elseif tcWebApi_get("Wan_PVC","HOSTNAME","h") = "" then tcWebApi_get("SkuId_Entry","ProductName","s") else tcWebApi_get("Wan_PVC","HOSTNAME","s") end if%>">

	<TR>	
    <TD nowrap><%tcWebApi_multilingual("1","physical_wan_type")%></TD>
		<TD nowrap align=right>
		<select name="WAN_type" onChange="change_wan_type(document.forms[0])">			
<script>	
{
    document.write('<option value="0">Ethernet WAN</option>');
    document.write('<option value="1">ADSL2+</option>');     
}
</script>
		</select>		</TD>
	</TR>

	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

   <TABLE id="isADSL" width=100% cellPadding=0  border=0 cellspacing=3>
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","dsl_mode_str")%></TD>
		<TD nowrap align=right>
		<select name="dsl_mode" id="dsl_mode">
			<option value="Auto" SELECTED><%tcWebApi_multilingual("1","auto_str")%></option>
			<option value="ADSL" >ADSL(G.dmt)</option>
			<option value="ADSL2" >ADSL2</option>
			<option value="ADSL2+" >ADSL2+</option>
		</select>		</TD>
	</TR>			
	<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</TABLE>

   <TR>
	  <TD>
		<input class="apply_bt" type="button" name="Apply" id="apply" value="<%tcWebApi_multilingual("0","glbstr_apply");%>" onClick="submit_xdsl('1')">  
	  </TD>
   </TR>

   <TABLE id="isATM" width=100% cellPadding=0  border=0 cellspacing=3>
		<!--<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
		<TR>
			<TD nowrap >
				<select name="wan_pvc_port" onChange="change_pvc_port()">
				<option value="0" <%if tcWebApi_get("WebCurSet_Entry","wan_pvc","h") ="0" then asp_write("selected") end if%> >WAN 1</option>
				<option value="1" <%if tcWebApi_get("WebCurSet_Entry","wan_pvc","h") ="1" then asp_write("selected") end if%> >WAN 2</option>			
				<option value="2" <%if tcWebApi_get("WebCurSet_Entry","wan_pvc","h") ="2" then asp_write("selected") end if%> >WAN 3</option>			
				<option value="3" <%if tcWebApi_get("WebCurSet_Entry","wan_pvc","h") ="3" then asp_write("selected") end if%> >WAN 4</option>			
				<option value="4" <%if tcWebApi_get("WebCurSet_Entry","wan_pvc","h") ="4" then asp_write("selected") end if%> >WAN 5</option>			
				<option value="5" <%if tcWebApi_get("WebCurSet_Entry","wan_pvc","h") ="5" then asp_write("selected") end if%> >WAN 6</option>			
				<option value="6" <%if tcWebApi_get("WebCurSet_Entry","wan_pvc","h") ="6" then asp_write("selected") end if%> >WAN 7</option>			
				<option value="7" <%if tcWebApi_get("WebCurSet_Entry","wan_pvc","h") ="7" then asp_write("selected") end if%> >WAN 8</option>			
				</select>
			</TD>
		</TR>-->
		<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
        <TR>
	        <TD nowrap colspan=2><A tabindex=-1 href="javascript:loadhelp('_xdsl','PVC')"><B><%tcWebApi_multilingual("1","pvc_settings_str")%></B></A></TD>
		</TR>

	<TR>
	<TD nowrap colspan=2>
	<input type="checkbox" name="enable_pvc" value=""><%tcWebApi_multilingual("1","enable_pvc_str")%></TD>
	</TR>
	 
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","multiplexing_method_str")%></TD>
		<TD nowrap align=right>
			<select name="dsl_multiplex" id="dsl_multiplex">
			<option value="LLC" ><%tcWebApi_multilingual("1","llc_based_str")%></option>
			<option value="VC" ><%tcWebApi_multilingual("1","vc_based_str")%></option>			
		</select>		</TD>
	</TR>
		
	<TR>
				<TD nowrap><%tcWebApi_multilingual("1","vpi_str")%></A></TD>
				<TD nowrap align=right><input type="text" name="dsl_vpi" id="dsl_vpi" size="3" maxlength="3" value="0" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);"></TD>
	</TR>	
	<TR>
				<TD nowrap><%tcWebApi_multilingual("1","vci_str")%></A></TD>
				<TD nowrap align=right><input type="text" name="dsl_vci" id="dsl_vci" size="5" maxlength="5" value="33" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);"></TD>
	</TR>		

    <TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

	<TR>
		<TD nowrap><A tabindex=-1 href="javascript:loadhelp('_xdsl','atm_qos')"><B><%tcWebApi_multilingual("1","atm_traffic_str")%></B></A></TD>
		<TD nowrap align=right>
			<select size="1" name="AdslQoS" id="id_adslqos" onChange="SelQOS(this.form.AdslQoS.selectedIndex)">
				<option value="ubr" ><%tcWebApi_multilingual("1","ubr_str")%></option>
				<option value="cbr" ><%tcWebApi_multilingual("1","cbr_str")%></option>
				<option value="nrt-vbr" >NRT-VBR</option>
				<option value="rt-vbr" >RT-VBR</option>
			</select>		</TD>
	</TR>
	
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","pcr_cell_str")%></TD>
		<TD nowrap align=right><input type="text" name="AdslQoSPcrRate" id="id_qpcrrat" size="5" maxlength="5" onFocusOut="CheckValueStyle('id_qpcrrat')" value="" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);"></TD>
	</TR>	
	
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","scr_cell_str")%></TD>
		<TD nowrap align=right><input type="text" name="AdslQoSScrRate" id="id_qscrrat" size="5" maxlength="5" onFocusOut="CheckValueStyle('id_qscrrat')" value="" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);"></TD>
	</TR>
	
	<TR>
		<TD nowrap><%tcWebApi_multilingual("1","mbs_cell_str")%></TD>
		<TD nowrap align=right><input type="text" name="AdslQoSMbs" id="id_qmbs" size="5" maxlength="5" onFocusOut="CheckValueStyle('id_qmbs')" value="" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);"></TD>
	</TR>	
  <TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
    <TR>
		<TD>
			<input class="apply_bt" type="button" name="Apply" id="apply" value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick="submit_xdsl('0')"> 
	    </TD>
   </TR>
</TABLE>
</TABLE>
</div>
<div id="update_bar" class="page_title" style="display:none">
<table border="0"   width="100%">
<tr>
</tr>
<tr>
	<td align="left">
	 <h1><%tcWebApi_multilingual("0","glbstr_update_settings_str")%></h1>
 </td>
 <td nowrap align="left"> &nbsp; </td>
 <td nowrap><input type="text" name="progress" value="" class="reboot1bar" ></td>
 <td nowrap align="left"> &nbsp; </td>
</tr>
<tr>
 <td colspan="4" height="12"><hr color="#0099CC"></td>
</tr>
</table>	
</div>
<div id="waiting_bar" style="display:none">
<div  align="center"><BR><BR><TR><TD align="center"><B><%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%></B></TD></TR><BR><BR></div>
<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" alt="waiting" /></div>
</div>
<%tcWebApi_multilingual("2","_xdsl_help.asp")%>
</FORM>
</BODY>
</HTML>
