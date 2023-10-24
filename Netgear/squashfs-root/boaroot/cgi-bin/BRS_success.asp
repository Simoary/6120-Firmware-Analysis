<%
if request_Form("default_flag") = "1" then
	tcWebApi_set("Account_Entry0", "firstuse","default_flag")
	tcWebApi_save()
end if
%>
<html>

<head>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<link rel="stylesheet" type="text/css" href="/style/hijack_style.css" />
<link rel="stylesheet" type="text/css" href="/style/hijack_success.css" />
<script language="javascript" type="text/javascript" src="/script/brs_hijack.js"></script>
<script language="javascript" type="text/javascript" src="/script/brs_hijack_success.js"></script>

</head>

<body>
<form action="NETGEAR_WNDR3700.cfg" method="post" enctype="multipart/form-data">
<input type="hidden" name="submit_flag" value="hijack_success" />
<script language="javascript" type="text/javascript">
var ts = "33909664";
var have_click_take_me_to_internet = "0";
var an_router_flag = "<%If tcWebApi_get("WLan11ac_Common","APOn","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","APOn","s") end if%>";
var endis_wl_radio="<%If tcWebApi_get("WLan_Common","APOn","h") <> "N/A" then tcWebApi_get("WLan_Common","APOn","s") end if%>";
var endis_wla_radio="<%If tcWebApi_get("WLan11ac_Common","APOn","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","APOn","s") end if%>";
var wl_sectype="<%If tcWebApi_get("WLan_Entry0","AuthMode","h") <> "N/A" then tcWebApi_get("WLan_Entry0","AuthMode","s") end if%>";
var wla_sectype="<%If tcWebApi_get("WLan11ac_Entry0","AuthMode","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry0","AuthMode","s") end if%>";
var pre_set_security = "<%If tcWebApi_get("WLan_Common","APOn","h") <> "N/A" then tcWebApi_get("WLan_Common","APOn","s") end if%>";
<%If tcWebApi_get("WLan_Entry0","AuthMode","h") = "WEP-64Bits" then%>
var key_num = "<%If tcWebApi_get("WLan_Entry0","DefaultKeyID","h")<> "N/A" then tcWebApi_get("WLan_Entry0","DefaultKeyID","s") else asp_write("1") end if%>";
if(key_num=="2")
	var wl_passphrase= "<%If tcWebApi_get("WLan_Entry","Key2Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key2Str","s") end if%>";
else if(key_num=="3")
	var wl_passphrase= "<%If tcWebApi_get("WLan_Entry","Key3Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key3Str","s") end if%>";
else if(key_num=="4")
	var wl_passphrase= "<%If tcWebApi_get("WLan_Entry","Key4Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key4Str","s") end if%>";
else
	var wl_passphrase= "<%If tcWebApi_get("WLan_Entry","Key1Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key1Str","s") end if%>";
<%elseif tcWebApi_get("WLan_Entry0","AuthMode","h") = "WEP-128Bits" then%>
var key_num = "<%If tcWebApi_get("WLan_Entry0","DefaultKeyID","h")<> "N/A" then tcWebApi_get("WLan_Entry0","DefaultKeyID","s") else asp_write("1") end if%>";
if(key_num=="2")
	var wl_passphrase= "<%If tcWebApi_get("WLan_Entry","Key2Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key2Str","s") end if%>";
else if(key_num=="3")
	var wl_passphrase= "<%If tcWebApi_get("WLan_Entry","Key3Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key3Str","s") end if%>";
else if(key_num=="4")
	var wl_passphrase= "<%If tcWebApi_get("WLan_Entry","Key4Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key4Str","s") end if%>";
else
	var wl_passphrase= "<%If tcWebApi_get("WLan_Entry","Key1Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key1Str","s") end if%>";
<%else%>
var wl_passphrase= "<%If tcWebApi_get("WLan_Entry","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry","WPAPSK","s") end if%>";
<%end if%>
var wla_passphrase= "<%If tcWebApi_get("WLan11ac_Entry","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry","WPAPSK","s") else asp_write("none") end if%>";
var wl_tooltip1 = 0;
var wla_tooltip1 = 0;
function toInternet()
{
	var forms = document.getElementsByTagName("form");
	var cf = forms[0];
	cf.action="/cgi-bin/BRS_success.asp " ;

	if(cf.encoding)
		cf.encoding = "application/x-www-form-urlencoded";
	else if(cf.enctype)
		cf.enctype = "application/x-www-form-urlencoded";
	
	cf.submit_flag.value = "hijack_success";

	location.href = "/cgi-bin/BRS_more_1.asp";

	return true;
}
function printSucessPage()
{
	if (window.print)
		window.print();
	else
	{
		alert(bh_not_support_print_str);
		return false;
	}

	return true;
}


var bh_congratulations_str="<%tcWebApi_multilingual("1","bh_congratulations_str")%>";
var bh_connect_success_1_str="<%tcWebApi_multilingual("1","bh_connect_success_1_str")%>";
var bh_connect_success_2_str="<%tcWebApi_multilingual("1","bh_connect_success_2_str")%>";
var bh_success_no_wireless_security_1_str="<%tcWebApi_multilingual("1","bh_success_no_wireless_security_1_str")%>";
var bh_success_no_wireless_security_2_str="<%tcWebApi_multilingual("1","bh_success_no_wireless_security_2_str")%>";
var bh_success_no_wireless_security_3_str="<%tcWebApi_multilingual("1","bh_success_no_wireless_security_3_str")%>";
var bh_wireless_str="<%tcWebApi_multilingual("1","bh_wireless_str")%>";
var bh_wpa_wpa2_passpharse_str="<%tcWebApi_multilingual("1","bh_wpa_wpa2_passpharse_str")%>";
var bh_print_this_str="<%tcWebApi_multilingual("1","bh_print_this_str")%>";
var bh_take_to_internet_str="<%tcWebApi_multilingual("0","glbstr_next")%>";
var bh_not_support_print_str="<%tcWebApi_multilingual("1","bh_not_support_print_str")%>";
var bh_network_key_str="<%tcWebApi_multilingual("1","bh_network_key_str")%>";
var bh_wirless_name_str="<%tcWebApi_multilingual("1","bh_wirless_name_str")%>";
var bh_rollover_help_text_str="<%tcWebApi_multilingual("1","bh_rollover_help_text_str")%>"; 
</script>

<div class="wizard_content_div">

	<div id="words_div_success" class="wizard_words_div">
		
		<h1></h1>
		<p></p>
		
		<p>
			<script language="javascript" type="text/javascript">
			if(an_router_flag == "0")
			{
				if(wl_sectype == "OPEN")
				{
					
					document.write(bh_success_no_wireless_security_1_str);				
					  document.write("<font id=\"a\" onclick=\"click_here();\">"+bh_success_no_wireless_security_2_str+"</font>");
					  document.write(bh_success_no_wireless_security_3_str);
				}
				else  //<a href=\"http://www.routerlogin.net\" target=\"_blank\">click here</a> to enable wireless security and protect your network.
					{
						document.write(bh_connect_success_2_str);
						if(wl_sectype=="WPA2PSK")
						{
							wl_tooltip = 1;
							document.write('<u id="key_tooltip_1">'+bh_network_key_str+'</u>');
						}
						else
							document.write(bh_network_key_str);
					  
					}
			}
			else
			{
				if(wl_sectype == "OPEN" && wla_sectype== "OPEN")
				{
					document.write(bh_success_no_wireless_security_1_str);				
					document.write("<font id=\"a\" onclick=\"click_here();\">"+bh_success_no_wireless_security_2_str+"</font>");
					document.write(bh_success_no_wireless_security_3_str);
				}	
				else  //<a href=\"http://www.routerlogin.net\" target=\"_blank\">click here</a> to enable wireless security and protect your network.
					{
						document.write(bh_connect_success_2_str);
						if(wl_sectype=="WPA2PSK" && wla_sectype=="WPA2PSK")
						{
							wla_tooltip = 1;
							document.write('<u id="key_tooltip_1">'+bh_network_key_str+'</u>');
						}
						else
							document.write(bh_network_key_str);
						
					  
					}
			}
			</script>
			
			
		</p>
		<script>
		if(an_router_flag == "0")
				document.write('<div id="info_div_24">');
		else
				document.write('<div id="info_div">');
		</script>
			<div id="network_name" class="left_div"><!--wirless_name--></div>
			<div class="right_div"><%If tcWebApi_get("WLan_Entry","SSID","h") <> "N/A" then tcWebApi_get("WLan_Entry","SSID","s") end if%></div>

			<div id="div_5G">
			<div id="network_name_5G" class="left_div"><!--wirless_name--></div>
			<div class="right_div"><%If tcWebApi_get("WLan11ac_Entry","SSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry","SSID","s") end if%></div>
			</div>
			
			
			<div id="passpharse" class="left_div">
			<script language="javascript" type="text/javascript">
				if(an_router_flag == "0" || (wl_sectype == wla_sectype && wl_passphrase == wla_passphrase))
					document.write(bh_wireless_str +" ");
				else
					document.write("2.4GHz "+bh_wireless_str + " ");
				if(wl_tooltip1 == 1 || wla_tooltip1 == 1)
					document.write('<u id="key_tooltip_2">'+bh_wpa_wpa2_passpharse_str+'</u>');
				else
					document.write(bh_wpa_wpa2_passpharse_str);
			</script>
			</div>
			<div class="right_div"><script>document.write(wl_passphrase);</script></div>
			
			
			<div id="passwd_5G" >
			<div id="passpharse_5G" class="left_div">
			<script language="javascript" type="text/javascript">
				document.write("5GHz "+ bh_wireless_str + " ");
				if(wla_tooltip1 == 1)
					document.write('<u id="key_tooltip_3">'+bh_wpa_wpa2_passpharse_str+'</u>');
				else
					document.write(bh_wpa_wpa2_passpharse_str);
			</script>
			</div>
			<div class="right_div"><script>document.write(wla_passphrase);</script></div>
						
			</div>
			<div style="clear:both"></div>
		</div>
		
	</div>

	<div id="allBtns_div" class="wizard_buttons_div">

		<!--div id="btnsContainer_div1" class="buttons_img_div" align="center">
			<img src="/image/ca-little-purple-button.gif" />
			<div class="buttons_words_div">save_settings</div>
		</div-->
		
		<!--div class="success_buttons_split"></div-->
		
		<div id="btnsContainer_div2" class="buttons_img_div" align="center" onclick='return printSucessPage();'>
			<img src="/image/ca-little-purple-button.gif" />
			
			<div class="buttons_words_div" name="Print this" id="print"></div>
			
		</div>
		
		
		<!--div class="success_buttons_split"></div-->
		
		<div  id="btnsContainer_div3" class="buttons_img_div" align="center" onclick='return toInternet();'>
			<img src="/image/ca-little-green-buitton.gif" />
			
			<div class="buttons_words_div" name="Take me to the Internet" id="go_internet"></div>
			
		</div>

	</div>

</div>

</form>
</body>

</html>
