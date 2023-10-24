<%
If Request_Form("lanFlag") <> "" Then

	
		TCWebApi_set("Lan_Dhcp","type","dhcpTypeRadio")

		If Request_Form("currIPAddr") <> Request_Form("uiViewIPAddr") then
        	TCWebApi_set("Lan_Entry","IP","uiViewIPAddr")
		End If

		If Request_Form("currNetMask") <> Request_Form("uiViewNetMask")then
			TCWebApi_set("Lan_Entry","netmask","uiViewNetMask")
		End If
        
                tcWebApi_set("Lan_Entry","change_ip_flag","change_ip_flag")
                tcWebApi_set("Lan_Entry","change_network_flag","change_network_flag")
                tcWebApi_set("Lan_Entry","change_network2_flag","change_network2_flag")
                tcWebApi_set("Lan_Entry","currNetMask","currNetMask")
	
        	If Request_form("uiRipDirection") <> "" Then
			If Request_form("uiRipVersion") <> "" Then
				TCWebApi_set("LanRipd_Entry","RIPVERSION","uiRipVersion")
				TCWebApi_set("LanRipd_Entry","DIRECTION","uiRipDirection")
				tcWebApi_save()
				tcWebApi_commit("LanRipd_Entry")
			End If
		End If
        
        If Request_Form("dhcpFlag") ="0" Then
	    	If Request_Form("currIPAddr") = Request_Form("uiViewIPAddr")then
	    		If Request_Form("currNetMask") = Request_Form("uiViewNetMask")then
	    			TCWebApi_unset("Lan")	
	            End If
	        End If

	        If Request_Form("currIPAddr") <> Request_Form("uiViewIPAddr")then
	        	tcWebApi_save()
				TCWebApi_set("Prelan_Entry","Active","Prelan_Active")
	            tcWebApi_commit("Prelan")
			elseif Request_Form("currNetMask") <> Request_Form("uiViewNetMask")then
	        	tcWebApi_save()
				TCWebApi_set("Prelan_Entry","Active","Prelan_Active")
	            tcWebApi_commit("Prelan")            
	        End If
        End If

        If Request_Form("dhcpTypeRadio")="0" Then
                If Request_Form("dhcpFlag") ="0" Then  
                    tcWebApi_commit("Dhcpd_Common")
                End If
        End If
        
        If Request_Form("dhcpTypeRadio")="1" Then
				If Request_Form("dhcpFlag") ="0" Then
				IF request_Form("DHCPFilterFlag")="Yes" then
					TCWebApi_unset("Dhcpd_Common")
				end if
				end if
			
                TCWebApi_set("Dhcpd_Common","start","sysPoolStartingAddr")
                TCWebApi_set("Dhcpd_Common","pool_count","PoolSize")
                TCWebApi_set("Dhcpd_Common","lease","dhcp_LeaseTime")
				
				' set dhcp port filter value to cfg node 
				if request_Form("DHCPFilterFlag") = "Yes" then
					TCWebApi_set("Dhcpd_Common","eth0.1","DHCPPhyPortEth0")
					TCWebApi_set("Dhcpd_Common","eth0.2","DHCPPhyPortEth1")
					TCWebApi_set("Dhcpd_Common","eth0.3","DHCPPhyPortEth2")
					TCWebApi_set("Dhcpd_Common","eth0.4","DHCPPhyPortEth3")
				end if
				
				if request_Form("wlanISExist") = "On" then
					if TCWebAPI_get("WLan_Common","BssidNum","h") = "1" then
							TCWebAPI_set("Dhcpd_Common","ra0","DHCPPhyPortRa0")
					end if
				end if
				

				
                If Request_form("delnum") <> "" Then
                        tcWebApi_set("WebCurSet_Entry","dhcpd_id","delnum")
                        tcWebApi_unset("Dhcpd_Entry")	
                elseif Request_Form("addFlag")="1" Then
                        if Request_form("emptyEntry") <> "" then
                        tcWebApi_set("WebCurSet_Entry","dhcpd_id","emptyEntry")				
                        tcWebApi_set("Dhcpd_Entry","IP","IpAddr")
                        tcWebApi_set("Dhcpd_Entry","MAC","MACAddr")
                        end if
                end if	

                
                If Request_Form("dhcpFlag") ="0" Then
                    
                        tcWebApi_commit("Dhcpd_Common")
                End If
        End If
        
		
		if Request_form("editflag")="1" then
			if Request_form("emptyEntry") <> "" then
				tcWebApi_set("WebCurSet_Entry","dhcpd_id","emptyEntry")				
				tcWebApi_set("Dhcpd_Entry","IP","IpAddr")
				tcWebApi_set("Dhcpd_Entry","Name","dv_name")
				
				tcWebApi_commit("Dhcpd_Common")

			end if
		elseif Request_form("addflag")="1" then
			if Request_form("emptyEntry") <> "" then
				tcWebApi_set("WebCurSet_Entry","dhcpd_id","emptyEntry")				
				tcWebApi_set("Dhcpd_Entry","IP","IpAddr")
				tcWebApi_set("Dhcpd_Entry","Name","dv_name")
				tcWebApi_set("Dhcpd_Entry","MAC","rsv_mac")
		
				
				tcWebApi_commit("Dhcpd_Common")
			end if
		End If
        

	
End If
%>
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title>
<script language=javascript type=text/javascript src="/reservation.js"></script>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>


<form METHOD="POST" action="/cgi-bin/LAN_lan.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" name="uiViewLanForm">
<input type=hidden name=submit_flag value="lan">
<div class="page_title" id="title"><%tcWebApi_multilingual("1","str_lan_title")%></div>
<div class="fix_button" id="check_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD align=center colSpan=2>
	<input class="cancel_bt" type="button" name="Cancel" id="cancel" value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick=location.href="LAN_lan.asp";>
	<input class="apply_bt" type="submit" name="Apply" id="apply" value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick="return uiSave()">
        </TD>
</TR>
</TABLE>
</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>
 

<script>
var ts = "<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";

var table_Data = [
["1","<%tcwebApi_staticGet("Dhcpd_Entry0","IP","s")%>","<%tcwebApi_staticGet("Dhcpd_Entry0","Name","s")%>","<%tcwebApi_staticGet("Dhcpd_Entry0","MAC","s")%>"],
["2","<%tcwebApi_staticGet("Dhcpd_Entry1","IP","s")%>","<%tcwebApi_staticGet("Dhcpd_Entry1","Name","s")%>","<%tcwebApi_staticGet("Dhcpd_Entry1","MAC","s")%>"],
["3","<%tcwebApi_staticGet("Dhcpd_Entry2","IP","s")%>","<%tcwebApi_staticGet("Dhcpd_Entry2","Name","s")%>","<%tcwebApi_staticGet("Dhcpd_Entry2","MAC","s")%>"],
["4","<%tcwebApi_staticGet("Dhcpd_Entry3","IP","s")%>","<%tcwebApi_staticGet("Dhcpd_Entry3","Name","s")%>","<%tcwebApi_staticGet("Dhcpd_Entry3","MAC","s")%>"],
["5","<%tcwebApi_staticGet("Dhcpd_Entry4","IP","s")%>","<%tcwebApi_staticGet("Dhcpd_Entry4","Name","s")%>","<%tcwebApi_staticGet("Dhcpd_Entry4","MAC","s")%>"],
["6","<%tcwebApi_staticGet("Dhcpd_Entry5","IP","s")%>","<%tcwebApi_staticGet("Dhcpd_Entry5","Name","s")%>","<%tcwebApi_staticGet("Dhcpd_Entry5","MAC","s")%>"],
["7","<%tcwebApi_staticGet("Dhcpd_Entry6","IP","s")%>","<%tcwebApi_staticGet("Dhcpd_Entry6","Name","s")%>","<%tcwebApi_staticGet("Dhcpd_Entry6","MAC","s")%>"],
["8","<%tcwebApi_staticGet("Dhcpd_Entry7","IP","s")%>","<%tcwebApi_staticGet("Dhcpd_Entry7","Name","s")%>","<%tcwebApi_staticGet("Dhcpd_Entry7","MAC","s")%>"]
];

function uiSave() {
	
	document.forms[0].sysPoolStartingAddr.value = document.forms[0].sysPoolStartingAddr1.value+'.'+document.forms[0].sysPoolStartingAddr2.value+'.'+document.forms[0].sysPoolStartingAddr3.value+'.'+document.forms[0].sysPoolStartingAddr4.value;
	document.forms[0].uiRipVersion.value=document.forms[0].rip_version.value;
	document.forms[0].uiRipDirection.value=document.forms[0].rip_direction.value;

	//added by Leon@bug20982
	if(checkipaddr(document.forms[0].uiViewIPAddr.value)==false)
	{
		alert(parent.aye_utils_TXT("formframe",1,invalid_ip_str));  
		return false;		
	}
	//over

	//added by Leon
	if(checksubnet(document.forms[0].uiViewNetMask.value)==false)
	{
		alert(parent.aye_utils_TXT("formframe",1,invalid_mask_str));  
		return false;		
	}
	
	//added by Jim for TD Bug 218, check invalid ip and mask pair
	if ( is_sub_or_broad(document.forms[0].uiViewIPAddr.value,document.forms[0].uiViewIPAddr.value, document.forms[0].uiViewNetMask.value) == false)
    {
        alert(invalid_ip_str);
        return false;
    }

	
	
	var wanaddr_array = new Array();
	var lanaddr_array = new Array();
	<% if tcWebApi_get("Wan_PVC","ISP","h") = "2" then %>
		<% if tcWebApi_get("Wan_PVC","PPPGETIP","h") = "N/A" then %>
			wanaddr_array = document.forms[0].WANIP.value.split('.');
		<% elseif tcWebApi_get("Wan_PVC","PPPGETIP","h") = "Dynamic" then %>
			wanaddr_array = document.forms[0].WANIP.value.split('.');
		<%elseif tcWebApi_get("Wan_PVC","PPPGETIP","h") = "Static" then %>
			wanaddr_array = document.forms[0].WANIP_S.value.split('.');
		<%end if%>
	<% elseif tcWebApi_get("Wan_PVC","ISP","h") = "1" then %>
	wanaddr_array = document.forms[0].WANIP_S.value.split('.');
	<%else%>
	wanaddr_array = document.forms[0].WANIP.value.split('.');
	<%end if%>
	lanaddr_array = document.forms[0].uiViewIPAddr.value.split('.');
	
	if((wanaddr_array[0]==lanaddr_array[0])&&(wanaddr_array[1]==lanaddr_array[1]) && (wanaddr_array[2]==lanaddr_array[2]))
	{
		alert(wan_lan_conflict);
		return false;
	}
	if(document.forms[0].dhcp_server.checked == true)
	{
		if(!dhcpcount("start"))
			return false;
		if(!dhcpcount("end"))
			return false;
	}
	alert(Please_do_ipconfig_str);
	document.forms[0].dhcpFlag.value = 0;
	if(document.forms[0].currIPAddr.value != document.forms[0].uiViewIPAddr.value){
		//setTimeout("redirect()", 3000);
		//redirect();
	}
        document.forms[0].change_network_flag.value=0;
        document.forms[0].change_network2_flag.value=0;
        document.forms[0].change_ip_flag.value=0;
        if(isSameIp(document.forms[0].currIPAddr.value,document.forms[0].uiViewIPAddr.value)== false)
        {
        	if(isSameSubNet(document.forms[0].uiViewIPAddr.value,document.forms[0].uiViewNetMask.value,document.forms[0].currIPAddr.value, document.forms[0].currNetMask.value)==false)
                {
                	document.forms[0].change_network_flag.value=1;
                }
        	document.forms[0].change_ip_flag.value=1;
        }
        //when lan ip is not changed and subnet is changed
        if(isSameIp(document.forms[0].currNetMask.value, document.forms[0].uiViewNetMask.value)==false)
        {
        	var oldNetwork = document.forms[0].currNetMask.value.split(".");
                var nowNetwork = document.forms[0].uiViewNetMask.value.split(".");
                oldNumofNetwork = getNumOfNetwork(oldNetwork);
                newNumofNetwork = getNumOfNetwork(nowNetwork);
                if ( oldNumofNetwork < newNumofNetwork ) //If subnet is changed and the subnet range is from big to small, router SHOULD flush all the corresponding configuration.
                {
            	    document.forms[0].change_network2_flag.value=1;
                }
        }

	document.getElementById("title").style.display="none";
	document.getElementById("main").style.display="none";
	document.getElementById("check_button").style.display="none";
	document.getElementById("waiting_bar").style.display="";
	setTimeout(function(){document.getElementById("loading_img").src=document.getElementById("loading_img").src},2);
	document.forms[0].submit();
	return true;
}

function getNumOfNetwork(netArray)
{
        var getNum=0;
        getNum=netArray[0]*255*255*255;
        getNum+=netArray[1]*255*255;
        getNum+=netArray[2]*255;
        getNum+=netArray[3];
        return getNum;
}

function redirect(){
     var loc = '';
	 loc = 'http://' + document.forms[0].uiViewIPAddr.value + '/cgi-bin/adv_index.asp';
	 top.location.href= loc;
}

function onloadCheck()
{
	<%
	if tcWebApi_get("Prelan_Entry","Active","h") = "Yes" then
		asp_Write("if(1){")
	else
		asp_Write("if(0){")
	end if
	%>
		document.getElementById("title").style.display="none";
		document.getElementById("main").style.display="none";
		document.getElementById("check_button").style.display="none";
		document.getElementById("waiting_bar").style.display="";
		setTimeout("redirect()", 50000);
		setTimeout(function(){document.getElementById("loading_img").src=document.getElementById("loading_img").src},2);	
	}
	
	// lanIP
	var lanip = ('<%If tcWebApi_get("Lan_Entry","IP","h") <> "N/A" then tcWebApi_get("Lan_Entry","IP","s") end if%>') ;
	
	var addr_array = new Array();
	addr_array = lanip.split('.');
	document.forms[0].sysLANIPAddr1.value = addr_array[0];
	document.forms[0].sysLANIPAddr2.value = addr_array[1];
	document.forms[0].sysLANIPAddr3.value = addr_array[2];
	document.forms[0].sysLANIPAddr4.value = addr_array[3];
	//DHCP IP
	sysPoolStartingAddr = ('<%If tcWebApi_get("Dhcpd_Common","start","h") <>"N/A" then tcWebApi_get("Dhcpd_Common","start","s") end if%>');
	document.forms[0].PoolSize.value = ('<%If tcWebApi_get("Dhcpd_Common","pool_count","h") <>"N/A" then tcWebApi_get("Dhcpd_Common","pool_count","s") end if%>');
	
	document.forms[0].sysPoolStartingAddr1.value = document.forms[0].sysLANIPAddr1.value;
	document.forms[0].sysPoolStartingAddr2.value = document.forms[0].sysLANIPAddr2.value;
	document.forms[0].sysPoolStartingAddr3.value = document.forms[0].sysLANIPAddr3.value;
	
	document.forms[0].sysPoolFinishAddr1.value = document.forms[0].sysLANIPAddr1.value;
	document.forms[0].sysPoolFinishAddr2.value = document.forms[0].sysLANIPAddr2.value;
	document.forms[0].sysPoolFinishAddr3.value = document.forms[0].sysLANIPAddr3.value;
	
	document.forms[0].sysPoolStartingAddr.value = sysPoolStartingAddr;
	if(parent.aye_regex_IPV4.exec(sysPoolStartingAddr))
	{
		addr_array = sysPoolStartingAddr.split('.');
		
		
		
		/*
		document.forms[0].sysPoolStartingAddr1.value = addr_array[0];
		document.forms[0].sysPoolStartingAddr2.value = addr_array[1];
		document.forms[0].sysPoolStartingAddr3.value = addr_array[2];
		
		document.forms[0].sysPoolFinishAddr1.value = addr_array[0];
		document.forms[0].sysPoolFinishAddr2.value = addr_array[1];
		document.forms[0].sysPoolFinishAddr3.value = addr_array[2];
		*/
		document.forms[0].sysPoolStartingAddr4.value = addr_array[3];
		document.forms[0].sysPoolFinishAddr4.value = eval(addr_array[3])+ eval(document.forms[0].PoolSize.value) -1;
	}
	//Lan Mask
	
	var MaskIp = ('<%If tcWebApi_get("Lan_Entry","netmask","h") <> "N/A" then tcWebApi_get("Lan_Entry","netmask","s") end if%>') ;
	
	addr_array = MaskIp.split('.');
	document.forms[0].sysLANSubnetMask1.value = addr_array[0];
	document.forms[0].sysLANSubnetMask2.value = addr_array[1];
	document.forms[0].sysLANSubnetMask3.value = addr_array[2];
	document.forms[0].sysLANSubnetMask4.value = addr_array[3];
	document.forms[0].uiViewNetMask.value = document.forms[0].sysLANSubnetMask1.value+'.'+document.forms[0].sysLANSubnetMask2.value+'.'+document.forms[0].sysLANSubnetMask3.value+'.'+document.forms[0].sysLANSubnetMask4.value;

	var rip_direction_tmp = ('<%If tcWebApi_get("LanRipd_Entry","DIRECTION","h") <>"N/A" then tcWebApi_get("LanRipd_Entry","DIRECTION","s") end if%>') ;
	var rip_version_tmp = ('<%If tcWebApi_get("LanRipd_Entry","RIPVERSION","h") <>"N/A" then tcWebApi_get("LanRipd_Entry","RIPVERSION","s") end if%>') ;	

	<%if tcWebApi_get("LanRipd_Entry","RIPVERSION","h")<>"N/A" then%>
		document.forms[0].rip_version.value=rip_version_tmp;
	<%end if%>

	<%if tcWebApi_get("LanRipd_Entry","DIRECTION","h")<>"N/A" then%>
		document.forms[0].rip_direction.value=rip_direction_tmp;
	<%end if%>
	
	<%if tcWebApi_get("LanRipd_Entry","DIRECTION","h")="N/A" Then%>
		<%if tcWebApi_get("LanRipd_Entry","RIPVERSION","h")="N/A" then%>
        document.getElementById("tr_rip_direction").style.display="none";
        document.getElementById("tr_rip_version").style.display="none";
        <%end if%>
	<%end if%>	
	
	SumEntry();
	
	
	return;

}

function StringCheck(val)
{
    re = /^[^\s]+$/;
    if( re.test(val) )
        return true;
    else
        return false;
}


function parseLanIp(cf,order)
{
	var LanIp = cf.sysLANIPAddr1.value+'.'+cf.sysLANIPAddr2.value+'.'+cf.sysLANIPAddr3.value+'.'+cf.sysLANIPAddr4.value;
	
	var addr_array = new Array();
	cf.uiViewIPAddr.value = cf.sysLANIPAddr1.value+'.'+cf.sysLANIPAddr2.value+'.'+cf.sysLANIPAddr3.value+'.'+cf.sysLANIPAddr4.value;
	cf.sysPoolStartingAddr1.value = cf.sysLANIPAddr1.value;
	cf.sysPoolStartingAddr2.value = cf.sysLANIPAddr2.value;
	cf.sysPoolStartingAddr3.value = cf.sysLANIPAddr3.value;
	cf.sysPoolFinishAddr1.value= cf.sysLANIPAddr1.value;
	cf.sysPoolFinishAddr2.value= cf.sysLANIPAddr2.value;
	cf.sysPoolFinishAddr3.value= cf.sysLANIPAddr3.value;
	
}

function parseMaskIp(cf,order)
{
	var MaskIp = cf.sysLANSubnetMask1.value+'.'+cf.sysLANSubnetMask2.value+'.'+cf.sysLANSubnetMask3.value+'.'+cf.sysLANSubnetMask4.value;
	var addr_array = new Array();
	cf.uiViewNetMask.value = cf.sysLANSubnetMask1.value+'.'+cf.sysLANSubnetMask2.value+'.'+cf.sysLANSubnetMask3.value+'.'+cf.sysLANSubnetMask4.value;
	
	
}

function dhcpcount(mode)
{

	var temp_start = document.uiViewLanForm.sysPoolStartingAddr1.value+'.'+document.uiViewLanForm.sysPoolStartingAddr2.value+'.'+document.uiViewLanForm.sysPoolStartingAddr3.value+'.'+document.uiViewLanForm.sysPoolStartingAddr4.value;
	var temp_finish = document.uiViewLanForm.sysPoolFinishAddr1.value+'.'+document.uiViewLanForm.sysPoolFinishAddr2.value+'.'+document.uiViewLanForm.sysPoolFinishAddr3.value+'.'+document.uiViewLanForm.sysPoolFinishAddr4.value;
	if(mode == "start")
	{
		if(!parent.aye_regex_IPV4.exec(temp_start))
		{
			alert(parent.aye_utils_TXT("formframe",1,invalid_dhcp_start_ip_str));
			return false;
		}
		
	}
	else if(mode == "end")
	{
		if(!parent.aye_regex_IPV4.exec(temp_finish))
		{
			alert(parent.aye_utils_TXT("formframe",1,invalid_dhcp_end_ip_str));
			return false;
		}
	}

	//added by Leon@bug21066
    if((eval(document.uiViewLanForm.sysPoolStartingAddr4.value) == 0)
    	||(eval(document.uiViewLanForm.sysPoolStartingAddr4.value) == 255))
	{
		alert(parent.aye_utils_TXT("formframe",1,invalid_dhcp_start_ip_str));
		return false;
	}

	if((eval(document.uiViewLanForm.sysPoolFinishAddr4.value) == 0)
    	||(eval(document.uiViewLanForm.sysPoolFinishAddr4.value) == 255))
	{
		alert(parent.aye_utils_TXT("formframe",1,invalid_dhcp_end_ip_str));
		return false;
	}
	//over

	//added by Leon@bug20983
	var tmpip=0;
	tmpip=254-eval(document.forms[0].sysLANSubnetMask4.value);
	
	if((eval(document.uiViewLanForm.sysLANIPAddr4.value)==0)
		||(eval(document.uiViewLanForm.sysLANIPAddr4.value)==255))
	{
		alert(parent.aye_utils_TXT("formframe",1,invalid_ip_str));  
		return false;		
	}

	if((eval(document.forms[0].sysLANSubnetMask4.value)==0)
		||(eval(document.forms[0].sysLANSubnetMask4.value)==128)
		||(eval(document.forms[0].sysLANSubnetMask4.value)==192)
		||(eval(document.forms[0].sysLANSubnetMask4.value)==224)
		||(eval(document.forms[0].sysLANSubnetMask4.value)==240)
		||(eval(document.forms[0].sysLANSubnetMask4.value)==248)
		||(eval(document.forms[0].sysLANSubnetMask4.value)==252))
	{
		if(eval(document.uiViewLanForm.sysLANIPAddr4.value)< tmpip)
		{
			if(document.uiViewLanForm.sysPoolStartingAddr4.value < eval(document.uiViewLanForm.sysLANIPAddr4.value)+1)
			{
				document.uiViewLanForm.sysPoolStartingAddr4.value = eval(document.uiViewLanForm.sysLANIPAddr4.value)+1;
				document.forms[0].sysPoolStartingAddr4.value = eval(document.uiViewLanForm.sysLANIPAddr4.value)+1;
			}

			if(document.uiViewLanForm.sysPoolFinishAddr4.value > tmpip)
			{
				document.uiViewLanForm.sysPoolFinishAddr4.value = tmpip;
				document.forms[0].sysPoolFinishAddr4.value = tmpip;
			}
		}
		else if(eval(document.uiViewLanForm.sysLANIPAddr4.value)==tmpip)
		{
			if(document.uiViewLanForm.sysPoolStartingAddr4.value < 1)
			{	
				document.uiViewLanForm.sysPoolStartingAddr4.value = 1;
				document.forms[0].sysPoolStartingAddr4.value = 1;
			}
			if(document.uiViewLanForm.sysPoolFinishAddr4.value > tmpip-1)
			{
				document.uiViewLanForm.sysPoolFinishAddr4.value = tmpip-1;
				document.forms[0].sysPoolFinishAddr4.value = tmpip-1;
			}
		}
		else if((eval(document.uiViewLanForm.sysLANIPAddr4.value)==tmpip+1)
				||(eval(document.uiViewLanForm.sysLANIPAddr4.value)==254-tmpip))
		{
			alert(parent.aye_utils_TXT("formframe",1,invalid_ip_str));  
			return false;	
		}
		else if((eval(document.uiViewLanForm.sysLANIPAddr4.value) >= tmpip+2)
				||(eval(document.uiViewLanForm.sysLANIPAddr4.value)< 254))
		{
			if(document.uiViewLanForm.sysPoolStartingAddr4.value < eval(document.uiViewLanForm.sysLANIPAddr4.value)+1)
			{
				document.uiViewLanForm.sysPoolStartingAddr4.value = eval(document.uiViewLanForm.sysLANIPAddr4.value)+1;
				document.forms[0].sysPoolStartingAddr4.value = eval(document.uiViewLanForm.sysLANIPAddr4.value)+1;
			}
			if(document.uiViewLanForm.sysPoolFinishAddr4.value > 254)
			{
				document.uiViewLanForm.sysPoolFinishAddr4.value = 254;
				document.forms[0].sysPoolFinishAddr4.value = 254;					
			}
		}
		else if((eval(document.uiViewLanForm.sysLANIPAddr4.value) == 254))
		{
			if(document.uiViewLanForm.sysPoolStartingAddr4.value < tmpip+2)
			{
				document.uiViewLanForm.sysPoolStartingAddr4.value = tmpip+2;
				document.forms[0].sysPoolStartingAddr4.value = tmpip+2;
			}
			if(document.uiViewLanForm.sysPoolFinishAddr4.value > 253)
			{
				document.uiViewLanForm.sysPoolFinishAddr4.value = 253;
				document.forms[0].sysPoolFinishAddr4.value = 253;					
			}
		}

		document.forms[0].sysPoolStartingAddr.value = document.forms[0].sysPoolStartingAddr1.value+'.'+document.forms[0].sysPoolStartingAddr2.value+'.'+document.forms[0].sysPoolStartingAddr3.value+'.'+document.forms[0].sysPoolStartingAddr4.value;
		
	}
	//over
	
	if((eval(document.uiViewLanForm.sysPoolStartingAddr4.value) > eval(document.uiViewLanForm.sysPoolFinishAddr4.value)))
	{
		alert(parent.aye_utils_TXT("formframe",1,invalid_dhcp_ip_str));
		return false;
	}
	else
	{
		document.uiViewLanForm.PoolSize.value = (eval(document.uiViewLanForm.sysPoolFinishAddr4.value)-eval(document.uiViewLanForm.sysPoolStartingAddr4.value) +1);
	} 
	return true;
}
function dhcponoff()
{
	var cf=document.forms[0];
	if(cf.dhcp_server.checked ==true)
	{	
		cf.dhcpTypeRadio.value = 1;
		cf.sysPoolStartingAddr4.disabled =false;
		cf.sysPoolFinishAddr4.disabled =false;
		
		document.forms[0].sysPoolStartingAddr1.value = document.forms[0].sysLANIPAddr1.value;
		document.forms[0].sysPoolStartingAddr2.value = document.forms[0].sysLANIPAddr2.value;
		document.forms[0].sysPoolStartingAddr3.value = document.forms[0].sysLANIPAddr3.value;
		
		document.forms[0].sysPoolFinishAddr1.value = document.forms[0].sysLANIPAddr1.value;
		document.forms[0].sysPoolFinishAddr2.value = document.forms[0].sysLANIPAddr2.value;
		document.forms[0].sysPoolFinishAddr3.value = document.forms[0].sysLANIPAddr3.value;
		
	}
	else
	{
		cf.dhcpTypeRadio.value = 0;
		cf.sysPoolStartingAddr4.disabled =true;
		cf.sysPoolFinishAddr4.disabled =true;
	}
}
function doDelete(i)
{
	document.uiViewLanForm.delnum.value=i;
	document.uiViewLanForm.submit();
}
function SumEntry()
{
	var temp_value = 0 ;
	<%if tcwebApi_get("Dhcpd_Entry0","IP","h")<>"N/A" then%>
		temp_value = temp_value + 1;
	<%end if%>
	<%if tcwebApi_get("Dhcpd_Entry1","IP","h")<>"N/A" then%>
		temp_value = temp_value + 1;
	<%end if%>
	<%if tcwebApi_get("Dhcpd_Entry2","IP","h")<>"N/A" then%>
		temp_value = temp_value + 1;
	<%end if%>
	<%if tcwebApi_get("Dhcpd_Entry3","IP","h")<>"N/A" then%>
		temp_value = temp_value + 1;
	<%end if%>
	<%if tcwebApi_get("Dhcpd_Entry4","IP","h")<>"N/A" then%>
		temp_value = temp_value + 1;
	<%end if%>
	<%if tcwebApi_get("Dhcpd_Entry5","IP","h")<>"N/A" then%>
		temp_value = temp_value + 1;
	<%end if%>
	<%if tcwebApi_get("Dhcpd_Entry6","IP","h")<>"N/A" then%>
		temp_value = temp_value + 1;
	<%end if%>
	<%if tcwebApi_get("Dhcpd_Entry7","IP","h")<>"N/A" then%>
		temp_value = temp_value + 1;
	<%end if%>
	
	
	document.uiViewLanForm.sumEntry.value = temp_value;
}
function valid_add()
{   
	
	if(document.uiViewLanForm.sumEntry.value==8)  
	{
		alert(invalid_resevation_add_str);
		return false;
	}
	location.href="/cgi-bin/reservation_add_wait.asp";
	//location.href="/cgi-bin/reservation_add.asp";
}

function is_sub_or_broad(be_checkip, ip, mask)
{
        addr_arr = be_checkip.split('.');
        var ip_addr=0;
        for (i = 0; i < 4; i++)
        {
                addr_str = parseInt(addr_arr[i],10);
                ip_addr=ip_addr*256+parseInt(addr_str);
        }
        var ip_sub=isSub(ip, mask);
        var ip_broadcast=isBroadcast(ip, mask)
    if(ip_addr == ip_sub || ip_addr == ip_broadcast){
        return false;
    }
    return true;
}
function isSub(lanIp, lanMask)
{
        ip_arr = lanIp.split('.');
        mask_arr = lanMask.split('.');
        var ip_sub=0
        for (i = 0; i < 4; i++)
        {
                ip_str = parseInt(ip_arr[i],10);
                mask_str = parseInt(mask_arr[i],10);
                ip_sub=ip_sub*256+parseInt(ip_str & mask_str)
        }
        return(ip_sub);
}

function isBroadcast(lanIp, lanMask)
{
        ip_arr = lanIp.split('.');
        mask_arr = lanMask.split('.');
        var ip_broadcast=0
        for (i = 0; i < 4; i++)
        {
                ip_str = parseInt(ip_arr[i],10);
                mask_str = parseInt(mask_arr[i],10);
                n_str = ~mask_str+256;
                ip_broadcast=ip_broadcast*256+parseInt(ip_str | n_str)
        }
        return(ip_broadcast);
}


var invalid_ip_str="<%tcWebApi_multilingual("1","invalid_ip_str")%>";
var invalid_mask_str="<%tcWebApi_multilingual("1","invalid_mask_str")%>";
var invalid_dhcp_start_ip_str="<%tcWebApi_multilingual("1","invalid_dhcp_start_ip_str")%>";
var invalid_dhcp_end_ip_str="<%tcWebApi_multilingual("1","invalid_dhcp_end_ip_str")%>";
var invalid_dhcp_ip_str="<%tcWebApi_multilingual("1","invalid_dhcp_ip_str")%>";
var invalid_reservation_del="<%tcWebApi_multilingual("1","invalid_reservation_del")%>";
var invalid_reservation_ip_duplicate="<%tcWebApi_multilingual("1","invalid_reservation_ip_duplicate")%>";
var invalid_reservation_MAC_duplicate="<%tcWebApi_multilingual("1","invalid_reservation_MAC_duplicate")%>";
var invali_resevation_edit="<%tcWebApi_multilingual("1","invali_resevation_edit")%>";
var invalid_ip_dhcp_start_ip_str="<%tcWebApi_multilingual("1","invalid_ip_dhcp_start_ip_str")%>";
var invalid_ip_dhcp_end_ip_str="<%tcWebApi_multilingual("1","invalid_ip_dhcp_end_ip_str")%>";
var ip_conflicts_wan_ip_subnet_str="<%tcWebApi_multilingual("1","ip_conflicts_wan_ip_subnet_str")%>";
var change_ip_manually_str="<%tcWebApi_multilingual("1","change_ip_manually_str")%>";
var alert_invalid_mac_str="<%tcWebApi_multilingual("0","invalid_mac_str")%>";
var invalid_resevation_add_str="<%tcWebApi_multilingual("1","invalid_resevation_add_str")%>";
var Device_name_null_str="<%tcWebApi_multilingual("1","Device_name_null_str")%>";
var wan_lan_conflict="<%tcWebApi_multilingual("1","wan_lan_conflict")%>";
var invalid_device_name_str="<%tcWebApi_multilingual("1","invalid_device_name_str")%>";
var Please_do_ipconfig_str="<%tcWebApi_multilingual("1","Please_do_ipconfig_str")%>";
var glbstr_disable="<%tcWebApi_multilingual("0","glbstr_disable")%>";
var str_both="<%tcWebApi_multilingual("1","str_both")%>";
var str_in_only="<%tcWebApi_multilingual("1","str_in_only")%>";
var str_out_only="<%tcWebApi_multilingual("1","str_out_only")%>";
var str_rip1="<%tcWebApi_multilingual("1","str_rip1")%>";
var str_rip2b="<%tcWebApi_multilingual("1","str_rip2b")%>";
var str_rip2m="<%tcWebApi_multilingual("1","str_rip2m")%>";

</script>
</head><body onLoad="onloadCheck()">
<input type="hidden" name="select_edit" value="1">
<INPUT TYPE="HIDDEN" NAME="delnum">
<INPUT type="HIDDEN" name="emptyEntry" value="<%TcWebApi_get("Dhcpd","Empty_Entry","s")%>">
<INPUT type="hidden" name="userMode" value="<%if tcwebApi_get("WebCurSet_Entry","UserMode","h")<>"1" then asp_write("0") else asp_write("1") end if%>">
<INPUT TYPE="HIDDEN" NAME="addFlag" VALUE="0">
<input type="hidden" name="sysPoolStartingAddr" value="<%If tcWebApi_get("Dhcpd_Common","start","h") <>"N/A" then tcWebApi_get("Dhcpd_Common","start","s") end if%>">
<input type="hidden" name="PoolSize" value="<%If tcWebApi_get("Dhcpd_Common","pool_count","h") <>"N/A" then tcWebApi_get("Dhcpd_Common","pool_count","s") end if%>">
<input type="hidden" name="currIPAddr" value="<%If tcWebApi_get("Lan_Entry","IP","h") <> "N/A" then tcWebApi_get("Lan_Entry","IP","s") end if%>">
<input type="hidden" name="uiViewIPAddr" value="<%If tcWebApi_get("Lan_Entry","IP","h") <> "N/A" then tcWebApi_get("Lan_Entry","IP","s") end if%>">
<input type="hidden" name="currNetMask" value="<%If tcWebApi_get("Lan_Entry","netmask","h") <> "N/A" then tcWebApi_get("Lan_Entry","netmask","s") end if%>">
<input type="hidden" name="uiViewNetMask" value="<%If tcWebApi_get("Lan_Entry","netmask","h") <> "N/A" then tcWebApi_get("Lan_Entry","netmask","s") end if%>">
<input type="hidden" name="reservation_num" value="0">
<INPUT type="HIDDEN" name="editflag" value="0">
<INPUT type="HIDDEN" name="addflag" value="0">
<INPUT type="HIDDEN" name="editEntry" value="0">
<INPUT type="HIDDEN" name="dhcp_LeaseTime" value="86400">
<INPUT TYPE="HIDDEN" NAME="DHCPFilterFlag" VALUE="<%tcWebApi_get("WebCustom_Entry","isPortFltSupported","s")%>">
<INPUT TYPE="HIDDEN" NAME="wlanISExist" VALUE="1">
<INPUT TYPE="HIDDEN" NAME="lanFlag" VALUE="0">
<INPUT TYPE="HIDDEN" NAME="dhcpFlag" value="1">
<INPUT TYPE="HIDDEN" NAME="dhcpTypeRadio" value="<%If tcWebApi_get("Lan_Dhcp","type","h") <>"N/A" then tcWebApi_get("Lan_Dhcp","type","s") end if%>">
<INPUT TYPE="HIDDEN" NAME="DHCPPhyPortEth0" value="Yes">
<INPUT TYPE="HIDDEN" NAME="DHCPPhyPortEth1" value="Yes">
<INPUT TYPE="HIDDEN" NAME="DHCPPhyPortEth2" value="Yes">
<INPUT TYPE="HIDDEN" NAME="DHCPPhyPortEth3" value="Yes">
<INPUT TYPE="HIDDEN" NAME="DHCPPhyPortRa0" value="Yes">
<INPUT type="HIDDEN" name="sumEntry">
<INPUT TYPE="HIDDEN" NAME="DNSproxy" VALUE='Yes'>
<INPUT TYPE="HIDDEN" NAME="dnsTypeRadio" VALUE="<%If tcWebApi_get("Dproxy_Entry","type","h") = "1" then tcWebApi_get("Dproxy_Entry","type","s") else  asp_Write("0")  end if%>">
<INPUT type="HIDDEN" name="PrimaryDns" value="<% If tcWebApi_get("Dproxy_Entry","type","h") = "1" then tcWebApi_get("Dproxy_Entry","Primary_DNS","s") else asp_Write("N/A") end if %>">
<INPUT type="HIDDEN" name="SecondDns" value="<%If tcWebApi_get("Dproxy_Entry","type","h") = "1" then tcWebApi_get("Dproxy_Entry","Secondary_DNS","s") else asp_Write("N/A") end if %>">
<INPUT TYPE="HIDDEN" NAME="WANIP" VALUE="<%If tcWebApi_staticGet("WanInfo_Entry","IP","h") <> "N/A" then tcWebApi_staticGet("WanInfo_Entry","IP","s") end if%>">
<INPUT TYPE="HIDDEN" NAME="WANIP_S" VALUE="<%If tcWebApi_staticGet("Wan_PVC","IPADDR","h") <> "N/A" then tcWebApi_staticGet("Wan_PVC","IPADDR","s") end if%>">
<INPUT TYPE="HIDDEN" NAME="uiRipDirection" VALUE="<%If tcWebApi_get("LanRipd_Entry","DIRECTION","h") <>"N/A" then tcWebApi_get("LanRipd_Entry","DIRECTION","s") end if%>">
<INPUT TYPE="HIDDEN" NAME="uiRipVersion" VALUE="<%If tcWebApi_get("LanRipd_Entry","RIPVERSION","h") <>"N/A" then tcWebApi_get("LanRipd_Entry","RIPVERSION","s") end if%>">
<INPUT type="HIDDEN" name="Prelan_Active" value="Yes">
<input type="hidden" name="change_network_flag">
<input type="hidden" name="change_network2_flag">
<input type="hidden" name="change_ip_flag">
<TR >
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_lan','device_name')"><B><%tcWebApi_multilingual("1","str_device_name")%></B></A>
	</TD>
	<TD nowrap align=right>
	<input type="text" name="device_name" id="device_name" size="20" maxlength="12" disabled value="<%If tcWebApi_get("SkuId_Entry","ProductName","h") <> "N/A" then tcWebApi_get("SkuId_Entry","ProductName","s") end if%>">
	</TD>
</TR>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>

<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_lan','tcp')"><B><%tcWebApi_multilingual("1","str_lanip_set")%></B></A>
	</TD>
</TR>

<TR>
	<TD nowrap><span id="iptext"><%tcWebApi_multilingual("1","str_lanip")%></span></TD>
	<TD nowrap align=right>
	<input type="text" size="3" autocomplete="off" maxlength="3" name="sysLANIPAddr1" id="sys_lan_ipaddress1" onblur="parseLanIp(document.forms[0],1)">.
	<input type="text" size="3" autocomplete="off" maxlength="3" name="sysLANIPAddr2" id="sys_lan_ipaddress2" onblur="parseLanIp(document.forms[0],2)">.
	<input type="text" size="3" autocomplete="off" maxlength="3" name="sysLANIPAddr3" id="sys_lan_ipaddress3" onblur="parseLanIp(document.forms[0],3)">.
	<input type="text" size="3" autocomplete="off" maxlength="3" name="sysLANIPAddr4" id="sys_lan_ipaddress4" onblur="parseLanIp(document.forms[0],4)">
	
	</TD>
</TR>
<TR>
	<TD nowrap><span id="subtext"><%tcWebApi_multilingual("1","str_lanmask")%></span></TD>
	<TD nowrap align=right>
	<input type="text" size="3" autocomplete="off" maxlength="3" name="sysLANSubnetMask1" id="sys_lan_netmask1" onblur="parseMaskIp(document.forms[0],1)">.
	<input type="text" size="3" autocomplete="off" maxlength="3" name="sysLANSubnetMask2" id="sys_lan_netmask2" onblur="parseMaskIp(document.forms[0],2)">.
	<input type="text" size="3" autocomplete="off" maxlength="3" name="sysLANSubnetMask3" id="sys_lan_netmask3" onblur="parseMaskIp(document.forms[0],3)">.
	<input type="text" size="3" autocomplete="off" maxlength="3" name="sysLANSubnetMask4" id="sys_lan_netmask4" onblur="parseMaskIp(document.forms[0],4)">
	</TD>
</TR>

<TR id="tr_rip_direction">
	<TD nowrap><span id="rip_direction"><%tcWebApi_multilingual("1","str_rip_direc")%></span></TD>
	<TD nowrap align=right>
	<select name="rip_direction">
<script>
		document.write('<option value="Both">'+str_both+'</option>');
		document.write('<option value="In only">'+str_in_only+'</option>');
		document.write('<option value="Out only">'+str_out_only+'</option>');
</script>
	</select>
	</TD>
</TR>
<TR id="tr_rip_version">
	<TD nowrap><span id="rip_version"><%tcWebApi_multilingual("1","str_rip_version")%></span></TD>
	<TD nowrap align=right>
	<select name="rip_version">
<script>
		document.write('<option value="Disabled">'+glbstr_disable+'</option>');
		document.write('<option value="RIP_1">'+str_rip1+'</option>');
		document.write('<option value="RIP_2B">'+str_rip2b+'</option>');
		document.write('<option value="RIP_2M">'+str_rip2m+'</option>');
</script>
	</select>
	</TD>
</TR>

<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
<TR>
	<TD nowrap>
	<input type="checkbox" name="dhcp_server" id="dhcp_server_enable" <%If tcWebApi_get("Lan_Dhcp","type","h") = "1" then asp_Write("checked") end if%> onClick="dhcponoff()">
	<A tabindex=-1 href="javascript:loadhelp('_lan','dhcp')">
	<B><%tcWebApi_multilingual("1","str_dhcp_set")%></B>
	</A></TD>
</TR>
<TR>
	<TD nowrap><span id="iptext"><%tcWebApi_multilingual("1","str_dhcp_start")%></span></TD>
	<TD nowrap align=right>
	<input type="text" name="sysPoolStartingAddr1" id="sys_pool_starting_address1" size="3" autocomplete="off" maxlength="3" disabled>.
	<input type="text" name="sysPoolStartingAddr2" id="sys_pool_starting_address2" size="3" autocomplete="off" maxlength="3" disabled>.
	<input type="text" name="sysPoolStartingAddr3" id="sys_pool_starting_address3" size="3" autocomplete="off" maxlength="3" disabled>.
	<input type="text" name="sysPoolStartingAddr4" id="sys_pool_starting_address4" size="3" autocomplete="off" maxlength="3" <%If tcWebApi_get("Lan_Dhcp","type","h") = "0" then asp_Write("disabled") end if%> >
	</TD>
</TR>
<TR>
	<TD nowrap><span id="subtext"><%tcWebApi_multilingual("1","str_dhcp_end")%></span></TD>
	<TD nowrap align=right>
	<input type="text" name="sysPoolFinishAddr1" id="sys_pool_finish_address1" size="3" autocomplete="off" maxlength="3" disabled>.
	<input type="text" name="sysPoolFinishAddr2" id="sys_pool_finish_address2" size="3" autocomplete="off" maxlength="3" disabled>.
	<input type="text" name="sysPoolFinishAddr3" id="sys_pool_finish_address3" size="3" autocomplete="off" maxlength="3" disabled>.
	<input type="text" name="sysPoolFinishAddr4" id="sys_pool_finish_address4" size="3" autocomplete="off" maxlength="3" <%If tcWebApi_get("Lan_Dhcp","type","h") = "0" then asp_Write("disabled") end if%> >
	</TD>
</TR>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_lan','reserved')">
	<B><%tcWebApi_multilingual("1","str_addr_reservation")%></B>
	</A></TD>
</TR>
<TR>
	<TD nowrap colspan=2><div align=center>
	<TABLE class=tables id="address_reser_table" border=0 cellpadding=2 cellspacing=0 width=100%>
	<TR class=table_header>
		<TD nowrap align=center>&nbsp;</TD>
		<TD nowrap align=center><span class="subhead">#</span></TD>
		<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","str_lanip")%></span></TD>
		<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","str_device_name")%></span></TD>
		<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","str_mac")%></span></TD>
	</TR>
	<script>
	var array_num=1;
	
	for(var i=0;i<table_Data.length;i++)
	{
		check_tmp = "";
		if(table_Data[i][1]=="N/A")
			continue;
			
		if( array_num %2 == 0 )
			document.write("<TR class=\"even_line\">");
		else
			document.write("<TR class=\"odd_line\">");		
		
		
		document.write('<TD nowrap align=center><input type="radio" name="ruleSelect" id="address_select" value="'+i+'"></TD><TD nowrap align=center><span class="subhead">'+array_num+'</span></TD><TD nowrap align=center>'+table_Data[i][1]+'</TD><TD nowrap align=center>'+table_Data[i][2]+'</TD><TD nowrap align=center>'+table_Data[i][3]+'</TD></TR>');
		
		array_num++;
	}
	</script>
<!--
	<%if tcwebApi_get("Dhcpd_Entry0","IP","h")<>"N/A" then%>
	<tr class="odd_line">
	<td TD nowrap align=center><input type="radio" name="ruleSelect" id="address_select" value="0"></td>
	<TD nowrap align=center><span class="subhead">1</span></TD>
	<TD nowrap align=center><% tcwebApi_staticGet("Dhcpd_Entry0","IP","s") %></TD>
	<TD nowrap align=center><% tcwebApi_staticGet("Dhcpd_Entry0","Name","s") %></TD>
	<TD nowrap align=center><% tcwebApi_staticGet("Dhcpd_Entry0","MAC","s") %></TD></TR>
	
	<%end if%>
	
	<%if tcwebApi_get("Dhcpd_Entry1","IP","h")<>"N/A" then%>
	<tr class="odd_line">
	<td TD nowrap align=center><input type="radio" name="ruleSelect" id="address_select" value="1"></td>
	<TD nowrap align=center><span class="subhead">2</span></TD>
	<TD nowrap align=center><% tcwebApi_staticGet("Dhcpd_Entry1","IP","s") %></TD>
	<TD nowrap align=center><% tcwebApi_staticGet("Dhcpd_Entry1","Name","s") %></TD>
	<TD nowrap align=center><% tcwebApi_staticGet("Dhcpd_Entry1","MAC","s") %></TD></TR>
	
	<%end if%>
	
	<%if tcwebApi_get("Dhcpd_Entry2","IP","h")<>"N/A" then%>
	<tr class="odd_line">
	<td TD nowrap align=center><input type="radio" name="ruleSelect" id="address_select" value="2"></td>
	<TD nowrap align=center><span class="subhead">3</span></TD>
	<TD nowrap align=center><% tcwebApi_staticGet("Dhcpd_Entry2","IP","s") %></TD>
	<TD nowrap align=center><% tcwebApi_staticGet("Dhcpd_Entry2","Name","s") %></TD>
	<TD nowrap align=center><% tcwebApi_staticGet("Dhcpd_Entry2","MAC","s") %></TD></TR>
	
	<%end if%>
	
	<%if tcwebApi_get("Dhcpd_Entry3","IP","h")<>"N/A" then%>
	<tr class="odd_line">
	<td TD nowrap align=center><input type="radio" name="ruleSelect" id="address_select" value="3"></td>
	<TD nowrap align=center><span class="subhead">4</span></TD>
	<TD nowrap align=center><% tcwebApi_staticGet("Dhcpd_Entry3","IP","s") %></TD>
	<TD nowrap align=center><% tcwebApi_staticGet("Dhcpd_Entry3","Name","s") %></TD>
	<TD nowrap align=center><% tcwebApi_staticGet("Dhcpd_Entry3","MAC","s") %></TD></TR>
	
	<%end if%>
	
	<%if tcwebApi_get("Dhcpd_Entry4","IP","h")<>"N/A" then%>
	<tr class="odd_line">
	<td TD nowrap align=center><input type="radio" name="ruleSelect" id="address_select" value="4"></td>
	<TD nowrap align=center><span class="subhead">5</span></TD>
	<TD nowrap align=center><% tcwebApi_staticGet("Dhcpd_Entry4","IP","s") %></TD>
	<TD nowrap align=center><% tcwebApi_staticGet("Dhcpd_Entry4","Name","s") %></TD>
	<TD nowrap align=center><% tcwebApi_staticGet("Dhcpd_Entry4","MAC","s") %></TD></TR>
	
	<%end if%>
	
	<%if tcwebApi_get("Dhcpd_Entry5","IP","h")<>"N/A" then%>
	<tr class="odd_line">
	<td TD nowrap align=center><input type="radio" name="ruleSelect" id="address_select" value="5"></td>
	<TD nowrap align=center><span class="subhead">6</span></TD>
	<TD nowrap align=center><% tcwebApi_staticGet("Dhcpd_Entry5","IP","s") %></TD>
	<TD nowrap align=center><% tcwebApi_staticGet("Dhcpd_Entry5","Name","s") %></TD>
	<TD nowrap align=center><% tcwebApi_staticGet("Dhcpd_Entry5","MAC","s") %></TD></TR>
	
	<%end if%>
	
	<%if tcwebApi_get("Dhcpd_Entry6","IP","h")<>"N/A" then%>
	<tr class="odd_line">
	<td TD nowrap align=center><input type="radio" name="ruleSelect" id="address_select" value="6"></td>
	<TD nowrap align=center><span class="subhead">7</span></TD>
	<TD nowrap align=center><% tcwebApi_staticGet("Dhcpd_Entry6","IP","s") %></TD>
	<TD nowrap align=center><% tcwebApi_staticGet("Dhcpd_Entry6","Name","s") %></TD>
	<TD nowrap align=center><% tcwebApi_staticGet("Dhcpd_Entry6","MAC","s") %></TD></TR>
	
	<%end if%>
	
	<%if tcwebApi_get("Dhcpd_Entry7","IP","h")<>"N/A" then%>
	<tr class="odd_line">
	<td TD nowrap align=center><input type="radio" name="ruleSelect" id="address_select" value="7"></td>
	<TD nowrap align=center><span class="subhead">8</span></TD>
	<TD nowrap align=center><% tcwebApi_staticGet("Dhcpd_Entry7","IP","s") %></TD>
	<TD nowrap align=center><% tcwebApi_staticGet("Dhcpd_Entry7","Name","s") %></TD>
	<TD nowrap align=center><% tcwebApi_staticGet("Dhcpd_Entry7","MAC","s") %></TD></TR>
	
	<%end if%>
-->
	</TABLE>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2 align=center>
	<input class="add_bt" type="submit" name="Add" id="add" value="<%tcWebApi_multilingual("0","glbstr_add")%>" onClick="valid_add();return false;">
	<input class="edit_bt" type="submit" name="Edit" id="edit" value="<%tcWebApi_multilingual("0","glbstr_edit")%>" onClick="return check_reservation_editnum(document.forms[0]);">  
	<input class="delete_bt" type="submit" name="Delete" id="delete" value="<%tcWebApi_multilingual("0","glbstr_delete")%>" onClick="return check_reservation_del( document.forms[0]);">
	</TD>
</TR>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
</TABLE>
</div>
<div id="waiting_bar" style="display:none">
<div  align="center"><BR><BR><TR><TD align="center"><B><%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%></B></TD></TR><BR><BR></div>
<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" id="loading_img" alt="waiting" /></div>
</div>
<%tcWebApi_multilingual("2","_lan_help.asp")%>
</FORM>
</BODY>
</HTML>
