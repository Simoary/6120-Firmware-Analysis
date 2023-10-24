<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body bgcolor="#ffffff" >
<form method="post" action="/cgi-bin/BRS_03A_detcInetType.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type="hidden" name="submit_flag" value="wizard_detwan">

<div id="formframe_div" style="POSITION: absolute; MIN-WIDTH: 625px; MIN-HEIGHT: 410px; BOTTOM: 45px; FLOAT: left; TOP: 0px; RIGHT: 0px; LEFT: 200px; " width="100%" height="570px">
		<iframe name="formframe" id="formframe" allowtransparency="true" height="100%" width="100%" scrolling="no" frameborder="0" >
		</iframe>
</div>

<div class="page_title"><%tcWebApi_multilingual("1","title_str")%></div>

<div id="main" class="main">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
<input type="hidden" name="selected_country" />
<input type="hidden" name="selected_country_number" value="-1"/>
<input type="hidden" name="selected_isp" />
<input type="hidden" name="selected_isp_number" value="-1"/>
<input type="hidden" name="auto_detc_flag" value="1"/>
<input type="hidden" name="physic_line_status" />
<input type="hidden" name="detect_mode" value="1"/>

<script>
wan_phy_mode="adsl";
var hw_link_type = "<%tcWebApi_get("AutoUpgrade_Entry","HW_link_status","s")%>";
var adsl_country = [
["1","Australia"],
["2","India"],
["3","New Zealand"],
["4","Singapore"],
["5","Philippine"],
["6","Hongkong"],
["7","Malaysia"],
["8","Indonesia"],
["9","Vietnam"],
["10","Thailand"],
["11","China"],
["12","Austria"],
["13","Belgium"],
["14","Czech Republic"],
["15","Denmark"],
["16","France"],
["17","Finland"],
["18","Germany"],
["19","Hungary"],
["20","Italy"],
["21","Portugal"],
["22","Netherlands "],
["23","Poland"],
["24","Russia"],
["25","Saudi Arabia"],
["26","Spain"],
["27","Sweden"],
["28","Switzerland"],
["29","Turkey"],
["30","Brazil"],
["31","United Kingdom"],
["32","Canada"],
["33","United States"],
["34","Other"]
];

function click_next()
{
	if (document.forms[0].WANDetc[0].checked == true)
	{
		
		
			if(wan_phy_mode == "adsl")
			{
				var j = document.forms[0].wizard_select_country.value - 1;
				document.forms[0].selected_country.value = adsl_country[j][1];
				document.forms[0].selected_country_number.value = eval(adsl_country[j][0])-1;
			}
			if(hw_link_type==0)
			{
				document.forms[0].physic_line_status.value = 0;
			}
			document.forms[0].submit();
		
		
	}
	else{
		if(parent.menu_internet=="pppoe")
			location.href="/cgi-bin/BAS_pppoe.asp";
		else if(parent.menu_internet=="pppoa")
			location.href="BAS_pppoa.asp";	
		else if(parent.menu_internet=="pptp")
			location.href="/cgi-bin/BAS_pptp.asp";
		else if(parent.menu_internet=="l2tp")
			location.href="/cgi-bin/BAS_l2tp.asp";
		else
		{
			var cf = document.forms[0];
			var ts= "<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
			cf.action = "/cgi-bin/BAS_ether.asp?id="+ts;
			cf.default_flag.value="1";
			cf.submit();
			//location.href="/cgi-bin/BAS_ether.asp";
		}
	}	
}
</script>
<script>

var netgear_region="<%tcWebApi_get("SkuId_Entry","Region","s")%>";



if (wan_phy_mode == "adsl")
{
	
	document.write('<TR><TD nowrap><B>Select Country</B></TD></TR>')
	document.write('<TR><TD nowrap>Country:</TD><TD nowrap align=right>')
	document.write('<select name="wizard_select_country" onchange="create_ISP();">')
	
	document.write('<option value="1" >Australia</option>')
	document.write('<option value="2" >India</option>')
	document.write('<option value="3" >New Zealand</option>')
	document.write('<option value="4" >Singapore</option>')
	document.write('<option value="5" >Philippine</option>')
	document.write('<option value="6" >Hongkong</option>')
	document.write('<option value="7" >Malaysia</option>')
	document.write('<option value="8" >Indonesia</option>')
	document.write('<option value="9" >Vietnam</option>')
	document.write('<option value="10" >Thailand</option>')
	document.write('<option value="11" >China</option>')
	document.write('<option value="12" >Austria</option>')
	document.write('<option value="13" >Belgium</option>')
	document.write('<option value="14" >Czech Republic</option>')
	document.write('<option value="15" >Denmark</option>')
	document.write('<option value="16" >France</option>')
	document.write('<option value="17" >Finland</option>')
	document.write('<option value="18" >Germany</option>')
	document.write('<option value="19" >Hungary</option>')
	document.write('<option value="20" >Italy</option>')
	document.write('<option value="21" >Portugal</option>')
	document.write('<option value="22" >Netherlands </option>')
	document.write('<option value="23" >Poland</option>')
	document.write('<option value="24" >Russia</option>')
	document.write('<option value="25" >Saudi Arabia</option>')
	document.write('<option value="26" >Spain</option>')
	document.write('<option value="27" >Sweden</option>')
	document.write('<option value="28" >Switzerland</option>')
	document.write('<option value="29" >Turkey</option>')
	document.write('<option value="30" >Brazil</option>')
	document.write('<option value="31" >United Kingdom</option>')
	document.write('<option value="32" >Canada</option>')
	document.write('<option value="33" >United States</option>')
	document.write('<option value="34" >Other</option>')
	
	
	document.write('</select></TD></TR>');    
	document.write('<TR><TD></TD></TR>');
	
	<%if tcWebApi_get("DslDefault_Common","CountryNumber","h") <> "-1" then%>
	document.forms[0].wizard_select_country.selectedIndex = eval("<%tcWebApi_get("DslDefault_Common","CountryNumber","s")%>");
	<%else%>
		<%if tcWebApi_get("SkuId_Entry","Region","h") = "NA" then%>
		document.forms[0].wizard_select_country.selectedIndex = 32;
		<%elseif tcWebApi_get("SkuId_Entry","Region","h") = "WW" then%>
		document.forms[0].wizard_select_country.selectedIndex = 27;
		<%elseif tcWebApi_get("SkuId_Entry","Region","h") = "GR" then%>
		document.forms[0].wizard_select_country.selectedIndex = 17;
		<%elseif tcWebApi_get("SkuId_Entry","Region","h") = "PR" then%>
		document.forms[0].wizard_select_country.selectedIndex = 10;
		<%elseif tcWebApi_get("SkuId_Entry","Region","h") = "RU" then%>
		document.forms[0].wizard_select_country.selectedIndex = 23;
		<%elseif tcWebApi_get("SkuId_Entry","Region","h") = "BZ" then%>
		document.forms[0].wizard_select_country.selectedIndex = 29;
		<%elseif tcWebApi_get("SkuId_Entry","Region","h") = "IN" then%>
		document.forms[0].wizard_select_country.selectedIndex = 1;
		<%elseif tcWebApi_get("SkuId_Entry","Region","h") = "KO" then%>
		document.forms[0].wizard_select_country.selectedIndex = 0;
		<%elseif tcWebApi_get("SkuId_Entry","Region","h") = "JP" then%>
		document.forms[0].wizard_select_country.selectedIndex = 0;
		<%elseif tcWebApi_get("SkuId_Entry","Region","h") = "AU" then%>
		document.forms[0].wizard_select_country.selectedIndex = 0;
		<%elseif tcWebApi_get("SkuId_Entry","Region","h") = "PE" then%>
		document.forms[0].wizard_select_country.selectedIndex = 27;
		<%elseif tcWebApi_get("SkuId_Entry","Region","h") = "UK" then%>
		document.forms[0].wizard_select_country.selectedIndex = 30;
		<%elseif tcWebApi_get("SkuId_Entry","Region","h") = "EE" then%>
		document.forms[0].wizard_select_country.selectedIndex = 22;
		<%elseif tcWebApi_get("SkuId_Entry","Region","h") = "GE" then%>
		document.forms[0].wizard_select_country.selectedIndex = 27;
		<%end if%>
	<%end if%>	
	var cf = document.forms[0];
	var index = cf.wizard_select_country.selectedIndex;
	document.write('<TR id="isp_title"><TD nowrap><B>Select ISP</B></TD></TR>')
	document.write('<TR id="isp_body"><TD nowrap>ISP:</TD><TD nowrap align=right>')
	document.write('<select name="wizard_select_isp" onchange="setISP();">')
	document.write('</select></TD></TR>'); 
	
	document.write('<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>');
}
//document.forms[0].wizard_select_country.selectedIndex=7;
create_ISP();

if(cf.wizard_select_isp.options.length != 0)
	{
		<%if tcWebApi_get("DslDefault_Common","ISPnumber","h") <> "-1" then%>
		document.forms[0].wizard_select_isp.selectedIndex = eval("<%tcWebApi_get("DslDefault_Common","ISPnumber","s")%>");
		document.forms[0].selected_isp_number.value = eval("<%tcWebApi_get("DslDefault_Common","ISPnumber","s")%>");
		document.forms[0].selected_isp.value="<%tcWebApi_get("DslDefault_Common","ISP","s")%>";
		<%end if%>
	}


function create_ISP()
{
	var cf = document.forms[0];
	var index = cf.wizard_select_country.selectedIndex;
	document.getElementById("isp_title").style.display="";
	document.getElementById("isp_body").style.display="";
	
	
	switch(index)
	{
			
		case 0: /*Australia*/
				cf.wizard_select_isp.options.length = 15;
				cf.wizard_select_isp.options[0].text = "Soul";
				cf.wizard_select_isp.options[1].text = "Exetel";
				cf.wizard_select_isp.options[2].text = "People Telcom";
				cf.wizard_select_isp.options[3].text = "Adam";
				cf.wizard_select_isp.options[4].text = "Telstra";
				cf.wizard_select_isp.options[5].text = "Internode";
				cf.wizard_select_isp.options[6].text = "Optus";
				cf.wizard_select_isp.options[7].text = "Primus";
				cf.wizard_select_isp.options[8].text = "TPG";
				cf.wizard_select_isp.options[9].text = "iiNet";
				cf.wizard_select_isp.options[10].text = "Dodo";
				cf.wizard_select_isp.options[11].text = "Telstra Bigpond";
				cf.wizard_select_isp.options[12].text = "TransACT";
				cf.wizard_select_isp.options[13].text = "Clubtelco";
				cf.wizard_select_isp.options[14].text = "Other";
								
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}
				break;
		case 1: /*India*/
				cf.wizard_select_isp.options.length = 5;
				cf.wizard_select_isp.options[0].text = "MTNL";
				cf.wizard_select_isp.options[1].text = "TataIndicom (BroadBand)";
				cf.wizard_select_isp.options[2].text = "BSNL,";
				cf.wizard_select_isp.options[3].text = "Inedit";
				cf.wizard_select_isp.options[4].text = "AIRTEL";
				
		
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}
				break;
				
		case 2: /*New Zealan*/
				cf.wizard_select_isp.options.length = 12;
				cf.wizard_select_isp.options[0].text = "IHug";
				cf.wizard_select_isp.options[1].text = "Infogen";
				cf.wizard_select_isp.options[2].text = "Kiwi Online (KOL)";
				cf.wizard_select_isp.options[3].text = "Orcon ADSL";
				cf.wizard_select_isp.options[4].text = "Paradise";
				cf.wizard_select_isp.options[5].text = "Slingshot";
				cf.wizard_select_isp.options[6].text = "Telecom NZ";
				cf.wizard_select_isp.options[7].text = "Telstra Clear";
				cf.wizard_select_isp.options[8].text = "Xnet (World Exchange)";
				cf.wizard_select_isp.options[9].text = "Xtra";
				cf.wizard_select_isp.options[10].text = "Clearnet";
				cf.wizard_select_isp.options[11].text = "Other";

				
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}
				break;
		
		case 3: /*Singapore*/
				cf.wizard_select_isp.options.length = 3;
				cf.wizard_select_isp.options[0].text = "Other";
				cf.wizard_select_isp.options[1].text = "PacificNet";
				cf.wizard_select_isp.options[2].text = "Singnet";

				
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}
				break;

		case 4: /*Philippine*/
				cf.wizard_select_isp.options.length = 2;
				cf.wizard_select_isp.options[0].text = "TelPlus";
				cf.wizard_select_isp.options[1].text = "PLDT";
				//cf.wizard_select_isp.options[0].text = "TelPlus";
				//cf.selected_isp.value="TelPlus";
				//document.getElementById("isp_title").style.display="none";
				//document.getElementById("isp_body").style.display="none";
				
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}
				break;
				
		case 5: /*Hongkong*/
				cf.wizard_select_isp.options.length = 0;
				/*
				cf.wizard_select_isp.options[0].text = "PCCW";
				
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}*/
				cf.selected_isp.value="PCCW";
				document.getElementById("isp_title").style.display="none";
				document.getElementById("isp_body").style.display="none";
				break;
				
		case 6: /*Malaysia*/
				cf.wizard_select_isp.options.length = 0;
				/*
				cf.wizard_select_isp.options[0].text = "Streamyx";
				
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}*/
				cf.selected_isp.value="Streamyx";
				document.getElementById("isp_title").style.display="none";
				document.getElementById("isp_body").style.display="none";
				break;
				
		case 7: /*Indonesia*/
				cf.wizard_select_isp.options.length = 3;
				cf.wizard_select_isp.options[0].text = "Telkom Speedy";
				cf.wizard_select_isp.options[1].text = "Speedy";
				cf.wizard_select_isp.options[2].text = "Other";
				
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}
				break;	

		case 8: /*Vietnam*/
				cf.wizard_select_isp.options.length = 6;
				cf.wizard_select_isp.options[0].text = "FPT";
				cf.wizard_select_isp.options[1].text = "NATNAM";
				cf.wizard_select_isp.options[2].text = "SPT";
				cf.wizard_select_isp.options[3].text = "VNN(in Hanoi)";
				cf.wizard_select_isp.options[4].text = "Viettel";
				cf.wizard_select_isp.options[5].text = "VNN(in HAM)";
				
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}
				break;
				
		case 9: /*Thailand*/
				cf.wizard_select_isp.options.length = 7;
				cf.wizard_select_isp.options[0].text = "TT&T";
				cf.wizard_select_isp.options[1].text = "3BB";
				cf.wizard_select_isp.options[2].text = "CAT-Telecom";
				cf.wizard_select_isp.options[3].text = "CS-Loxinfo";
				cf.wizard_select_isp.options[4].text = "Samart";
				cf.wizard_select_isp.options[5].text = "TRUE Internet";
				cf.wizard_select_isp.options[6].text = "TOT";
	
				
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}
				break;
				
		case 10: /*China*/
				cf.wizard_select_isp.options.length = 2;
				cf.wizard_select_isp.options[0].text = "China Telecom";
				cf.wizard_select_isp.options[1].text = "Other";
				
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}
				break;
				
		case 11: /*Austria*/
				cf.wizard_select_isp.options.length = 3;
				cf.wizard_select_isp.options[0].text = "UPC Austria";
				cf.wizard_select_isp.options[1].text = "UTA2";
				cf.wizard_select_isp.options[2].text = "Other";
				
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}
				break;
		
		case 12: /*Belgium*/
				
				cf.wizard_select_isp.options.length = 0;
				
				cf.selected_isp.value="Belgacom";
				document.getElementById("isp_title").style.display="none";
				document.getElementById("isp_body").style.display="none";
				break;
				
		case 13: /*Czech Republic*/
				cf.wizard_select_isp.options.length = 3;
				cf.wizard_select_isp.options[0].text = "O2";
				cf.wizard_select_isp.options[1].text = "Tiscali";
				cf.wizard_select_isp.options[2].text = "T-Mobile";
							
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}
				break;
				
		case 14: /*Denmark*/
				cf.wizard_select_isp.options.length = 2;
				cf.wizard_select_isp.options[0].text = "Cybercity";
				cf.wizard_select_isp.options[1].text = "Tiscali";
							
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}
				break;
				
		case 15: /*France*/
				cf.wizard_select_isp.options.length = 5;
				cf.wizard_select_isp.options[0].text = "SFR";
				cf.wizard_select_isp.options[1].text = "Orange";
				cf.wizard_select_isp.options[2].text = "OVH";
				cf.wizard_select_isp.options[3].text = "Free";
				cf.wizard_select_isp.options[4].text = "Other";
								
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}
				break;
		
		case 16: /*Finland*/
				cf.wizard_select_isp.options.length = 3;
				cf.wizard_select_isp.options[0].text = "Teliasonera";
				cf.wizard_select_isp.options[1].text = "Elisa Oyj";
				cf.wizard_select_isp.options[2].text = "Other";
							
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}
				break;
				
		case 17: /*Germany*/
				cf.wizard_select_isp.options.length = 6;
				cf.wizard_select_isp.options[0].text = "1 & 1";
				cf.wizard_select_isp.options[1].text = "Deutsche Telekom";
				cf.wizard_select_isp.options[2].text = "Telefonica O2";
				cf.wizard_select_isp.options[3].text = "m-net";
				cf.wizard_select_isp.options[4].text = "Vodafone";
				cf.wizard_select_isp.options[5].text = "Netcologne";
												
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}
				break;

		case 18: /*Hungary*/
				cf.wizard_select_isp.options.length = 4;
				cf.wizard_select_isp.options[0].text = "Actel";
				cf.wizard_select_isp.options[1].text = "GTS Datanet";
				cf.wizard_select_isp.options[2].text = "Invitel";
				cf.wizard_select_isp.options[3].text = "T-Home";
							
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}
				break;
		
		case 19: /*Italy*/
				cf.wizard_select_isp.options.length = 11;
				cf.wizard_select_isp.options[0].text = "Alice(Telecom Italia)";
				cf.wizard_select_isp.options[1].text = "Infostrada";
				cf.wizard_select_isp.options[2].text = "Aruba";
				cf.wizard_select_isp.options[3].text = "Tiscali";
				cf.wizard_select_isp.options[4].text = "Twt";
				cf.wizard_select_isp.options[5].text = "Acantho";
				cf.wizard_select_isp.options[6].text = "Fastweb";
				cf.wizard_select_isp.options[7].text = "Wind (Infostrada)";
				cf.wizard_select_isp.options[8].text = "TELE2";
				cf.wizard_select_isp.options[9].text = "KPN Qwest Italia";
				cf.wizard_select_isp.options[10].text = "Other";

												
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}
				break;
		
		case 20: /*Portugal*/
				cf.wizard_select_isp.options.length = 3;
				cf.wizard_select_isp.options[0].text = "PT";
				cf.wizard_select_isp.options[1].text = "Vodafone";
				cf.wizard_select_isp.options[2].text = "Zon";
							
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}
				break;
				
		case 21: /*Netherlands */
				cf.wizard_select_isp.options.length = 3;
				cf.wizard_select_isp.options[0].text = "Vodafonevast";
				cf.wizard_select_isp.options[1].text = "Telfort";
				cf.wizard_select_isp.options[2].text = "Other";
											
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}
				break;
				
		case 22: /*Poland */
				cf.wizard_select_isp.options.length = 5;
				cf.wizard_select_isp.options[0].text = "Multimo";
				cf.wizard_select_isp.options[1].text = "Tele2";
				cf.wizard_select_isp.options[2].text = "Orange";
				cf.wizard_select_isp.options[3].text = "Other";
				cf.wizard_select_isp.options[4].text = "Netia";
											
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}
				break;
				
		case 23: /*Russia */
				cf.wizard_select_isp.options.length = 9;
				cf.wizard_select_isp.options[0].text = "Beltelecom";
				cf.wizard_select_isp.options[1].text = "Domolink CentrTelekom";
				cf.wizard_select_isp.options[2].text = "Avangard-DSL";
				cf.wizard_select_isp.options[3].text = "MTS Stream";
				cf.wizard_select_isp.options[4].text = "MGTS";
				cf.wizard_select_isp.options[5].text = "Jdsl Volgatelekom";
				cf.wizard_select_isp.options[6].text = "Combellga";
				cf.wizard_select_isp.options[7].text = "Rostelecom";
				cf.wizard_select_isp.options[8].text = "Other";
															
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}
				break;
				
		case 24: /*Saudi Arabia*/
				cf.wizard_select_isp.options.length = 0;
				/*
				cf.wizard_select_isp.options[0].text = "STC";
				
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}*/
				cf.selected_isp.value="STC";
				document.getElementById("isp_title").style.display="none";
				document.getElementById("isp_body").style.display="none";
				break;		
		

		case 25: /*Spain */
				cf.wizard_select_isp.options.length = 7;
				cf.wizard_select_isp.options[0].text = "Orange";
				cf.wizard_select_isp.options[1].text = "Telefonica Movistar (dynamic IP)";
				cf.wizard_select_isp.options[2].text = "Jazztel";
				cf.wizard_select_isp.options[3].text = "Other";
				cf.wizard_select_isp.options[4].text = "Vodafone";
				cf.wizard_select_isp.options[5].text = "Pepephone";
				cf.wizard_select_isp.options[6].text = "Telefonica Movistar (fixed  IP)";
				
															
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}
				break;
				
		
		case 26: /*Sweden */
				cf.wizard_select_isp.options.length = 5;
				cf.wizard_select_isp.options[0].text = "Telia";
				cf.wizard_select_isp.options[1].text = "Ljusnet";
				cf.wizard_select_isp.options[2].text = "Bahnhof AB";
				cf.wizard_select_isp.options[3].text = "Bredbandsbolaget";
				cf.wizard_select_isp.options[4].text = "Other";
															
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}
				break;
		
		case 27: /*Switzerland */
				cf.wizard_select_isp.options.length = 3;
				cf.wizard_select_isp.options[0].text = "Sunrise";
				cf.wizard_select_isp.options[1].text = "Monzoon Networks";
				cf.wizard_select_isp.options[2].text = "Other";							
															
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}
				break;
		
		case 28: /*Turkey*/
				cf.wizard_select_isp.options.length = 0;
				/*
				cf.wizard_select_isp.options[0].text = "Other";
				
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}*/
				cf.selected_isp.value="Other";
				document.getElementById("isp_title").style.display="none";
				document.getElementById("isp_body").style.display="none";
				break;	
				
		case 29: /*Brazil*/
				cf.wizard_select_isp.options.length = 3;
				cf.wizard_select_isp.options[0].text = "Gvt-Global Village Telecom";
				cf.wizard_select_isp.options[1].text = "Telemar Oi Velox";
				cf.wizard_select_isp.options[2].text = "Oi";
				
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}
				break;

		case 30: 
				cf.wizard_select_isp.options.length = 10;
				cf.wizard_select_isp.options[0].text = "BT Broadband";
				cf.wizard_select_isp.options[1].text = "Sky";
				cf.wizard_select_isp.options[2].text = "TalkTalk";
				cf.wizard_select_isp.options[3].text = "PlusNet";
				cf.wizard_select_isp.options[4].text = "Virgin";
				cf.wizard_select_isp.options[5].text = "JT";
				cf.wizard_select_isp.options[6].text = "Other";
				cf.wizard_select_isp.options[7].text = "O2";
				cf.wizard_select_isp.options[8].text = "Organe";
				cf.wizard_select_isp.options[9].text = "Be";
																
								
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}
				break;
					
		case 31:
				/*Canada*/
				cf.wizard_select_isp.options.length = 0;
				/*
				cf.wizard_select_isp.options[0].text = "Bell Canada (Western)";
				
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}*/
				cf.selected_isp.value="Bell Canada (Western)";
				document.getElementById("isp_title").style.display="none";
				document.getElementById("isp_body").style.display="none";
				break;
		
		case 32:/*United States*/
				cf.wizard_select_isp.options.length = 10;
				cf.wizard_select_isp.options[0].text = "AT&T";
				cf.wizard_select_isp.options[1].text = "Earthlink";
				cf.wizard_select_isp.options[2].text = "Verizon";
				cf.wizard_select_isp.options[3].text = "Windstream";
				cf.wizard_select_isp.options[4].text = "Frontier Communications";
				cf.wizard_select_isp.options[5].text = "Rivercity Internet Group";
				cf.wizard_select_isp.options[6].text = "CenturyLink";
				cf.wizard_select_isp.options[7].text = "Bigriver.net DSL";
				cf.wizard_select_isp.options[8].text = "Qwest";
				cf.wizard_select_isp.options[9].text = "Other";
				
												
				for(var i=0;i<cf.wizard_select_isp.options.length;i++)
				{
					cf.wizard_select_isp.options[i].value = i;
				}
				break;
		case 33: /*Other*/
				cf.wizard_select_isp.options.length = 0;
				cf.selected_isp.value="N/A";
				document.getElementById("isp_title").style.display="none";
				document.getElementById("isp_body").style.display="none";
				break;

		default:
				break;
			
	}
	
	
	
	setISP();
}

function setISP()
{	
	var cf = document.forms[0];
	var isp_index = cf.wizard_select_isp.selectedIndex;
	if(cf.wizard_select_isp.options.length != 0)
	{
		if(cf.wizard_select_isp[isp_index].text=="")
			cf.selected_isp.value="N/A";
		else if(cf.wizard_select_isp[isp_index].text==" ")
			cf.selected_isp.value="N/A";
		else{
			cf.selected_isp.value = cf.wizard_select_isp[isp_index].text;
			cf.selected_isp_number.value = cf.wizard_select_isp.selectedIndex;
		}
	}
	
	
}

</script>
<input type="hidden" name="default_flag" value="0" />
<input type="hidden" name="FastWeb" value="0">

<TR><TD nowrap><B><%tcWebApi_multilingual("1","setup_part1_str")%></B></TD></TR>
<TR><TD nowrap><B><%tcWebApi_multilingual("1","setup_part2_str")%></B></TD></TR>
<TR><TD nowrap><INPUT type="radio"  checked name="WANDetc" id="wan_detect_type" value="AutoDetc"><%tcWebApi_multilingual("0","glbstr_yes")%></TD></TR>
<TR><TD nowrap><INPUT type="radio" name="WANDetc" id="wan_detect_type" value="MyDetc"><%tcWebApi_multilingual("1","mydetc_str")%></TD></TR>
<TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR>
<TR><TD nowrap align=center>

<input class="short_common_bt" type="button" name="Next" id="next" value="<%tcWebApi_multilingual("0","glbstr_next")%>" onClick="click_next()">
</TD></TR>

</TABLE>



 <script>
if ( isSafari_iPad() )
{ document.write('<div id=help_ipad style="display: none">'); }
else
{ document.write('<div id=help style="display: none">');}
</script>
<iframe name="help_iframe" id="helpframe" src="/cgi-bin/help/_Wizard_setup_help.asp" allowtransparency="true" frameborder="0" >		</iframe>
</div>



<div id=help_switch class="close_help" >
	<img class="help_switch_img" src="/image/help/help-bar.gif">
<script>

function show_hidden_help_top_button_1(help_flag)
{
	if(!isIE_or_Opera())
		Not_IE_show_hidden_help(help_flag);
	else
	{
		//var frame_height= document.getElementById("formframe_div").style.height.replace(/px/,"");
		var frame_height= document.getElementById("formframe_div").height.replace(/px/,"");
		
		if( help_flag % 2 == 0 )
		{
			document.getElementById("main").style.height=frame_height-80;//50+30+120
			document.getElementById("help").style.display="";
			document.getElementById("help_switch").className="open_help";
		}
		else
		{
			document.getElementById("help").style.display="none";
			document.getElementById("help_switch").className="close_help";
			document.getElementById("main").style.height=frame_height-80;//50+30
			
		}
	}
}
var help_flag=0;
if(isIE()){
	show_hidden_help_top_button_1(1);
	var frame_div = document.getElementById("formframe_div");
	frame_div.onresize =  function(){
		if( help_flag == 0 )  show_hidden_help_top_button_1(1);
		else{show_hidden_help_top_button_1(--help_flag);help_flag++;}
};}
if(get_browser() == "Opera"){
	window.onresize =  function(){
		if( help_flag == 0 )  show_hidden_help_top_button_1(1);
		else{show_hidden_help_top_button_1(--help_flag);help_flag++;}
};}
</script>
<div id="help_space" onclick="show_hidden_help_top_button_1(help_flag); help_flag++;"></div>
<div id="help_center">Help Center</div>
<div id="help_button" onclick="show_hidden_help_top_button_1(help_flag); help_flag++;"></div>
<div id="help_show_hidden"><a href="javascript:void(0)" onclick="show_hidden_help_top_button_1(help_flag); help_flag++;">Show/Hide Help Center</a></div>
</div>


</FORM>
</BODY>
</HTML>
