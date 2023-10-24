<html><head>
<title>NETGEAR Router <%tcWebApi_get("SkuId_Entry","ProductName","s")%></title>
<meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>
<BODY bgcolor=#FFFFFF>
<form>
<table>
<TR>
	<TD nowrap><B>FW Version : </B></TD>
	<TD nowrap>&nbsp;<%If tcWebApi_get("DeviceInfo","BasicInfo_FwVer","h") <> "N/A" Then tcWebApi_staticGet("DeviceInfo","BasicInfo_FwVer","s") end if%>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>Series number : </B></TD>
	<TD nowrap>&nbsp; <%tcWebApi_get("SkuId_Entry","TE_serialnum","s")%>&nbsp;</TD>
</TR>																																																						 
<TR>
	<TD nowrap><B>2.4G SSID : </B></TD>
	<TD nowrap>&nbsp;<%If tcWebApi_get("WLan_Entry0","SSID","h") <> "N/A" then tcWebApi_get("WLan_Entry0","SSID","s") end if%>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>2.4G Passphrase : </B></TD>
	<TD nowrap>&nbsp;<%If tcWebApi_get("WLan_Entry","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry","WPAPSK","s") end if%>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>2.4G Date rate : </B></TD>
	<TD nowrap>&nbsp;<script>
	<%if tcWebApi_get("WLan_Common","WirelessModeIndex","h") = "1" then%>
	    document.write('Up to 54Mbps');
    <%elseif tcWebApi_get("WLan_Common","WirelessModeIndex","h") = "2" then%>
	    document.write('Up to 145Mbps');
	<%elseif tcWebApi_get("WLan_Common","WirelessModeIndex","h") = "3" then%>
	    document.write('Up to 300Mbps');
	<%end if%>
	</script>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>2.4G Channel : </B></TD>
	<TD nowrap>&nbsp;    <script>
    <%if tcWebApi_get("WLan_Common","Channel","h") = "0" then%>
	    <%if tcWebApi_get("WLan_Common","APOn","h") = "1" then%>
		   document.write('Auto' + " ( " +<%If tcWebApi_get("Info_WLan","CurrentChannel","h") <> "N/A" then tcWebApi_get("Info_WLan","CurrentChannel","s") end if%> + ")");
		<%else%>
           document.write('Auto');
	    <%end if%>
	<%else%>
	  var primary_channel="<%If tcWebApi_get("WLan_Common","Channel","h") <> "N/A" then tcWebApi_get("WLan_Common","Channel","s") end if%>";
	  if(primary_channel <= 6)
	      var secondary_channel = parseInt(primary_channel) + 4;
	   else
	      var secondary_channel = parseInt(primary_channel) - 4;
		document.write(primary_channel+"(P)" + " + " + secondary_channel+"(S)");  
    <%end if%>
    </script>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>2.4G Coexist : </B></TD>
	<TD nowrap>&nbsp;<%If tcWebApi_get("WLan_Common","HT_BW","h") <> "N/A" then tcWebApi_get("WLan_Common","HT_BW","s") end if%>&nbsp;</TD>
</TR>
<TR>
	
<TR>
	<TD nowrap><B>5G SSID : </B></TD>
	<TD nowrap> &nbsp;<%If tcWebApi_get("WLan11ac_Entry0","SSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry0","SSID","s") end if%>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>5G Passphrase : </B></TD>
	<TD nowrap>&nbsp;<%If tcWebApi_get("WLan11ac_Entry","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry","WPAPSK","s") end if%>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>5G Date rate : </B></TD>
	<TD nowrap>&nbsp; <script>
	<%if tcWebApi_get("WLan11ac_Common","WirelessModeIndex","h") = "1" then%>
	    document.write('Up to 54Mbps');
	<%elseif tcWebApi_get("WLan11ac_Common","WirelessModeIndex","h") = "2" then%>
		document.write('Up to 150Mbps');
	<%elseif tcWebApi_get("WLan11ac_Common","WirelessModeIndex","h") = "3" then%>
	   <%if tcWebApi_get("SkuId_Entry","WiFi5GMode","h") = "0" then%>
		   document.write('Up to 300Mbps');
		<%else%>
		   document.write('Up to 433Mbps');
		<%end if%>
	<%end if%>
    </script>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>5G Channel : </B></TD>
	<TD nowrap>&nbsp;<script>
	var country = "<%tcWebApi_get("WLan11ac_Common","Country","s")%>";
	var primary_channel_5g = "<%tcWebApi_get("WLan11ac_Common","Channel","s")%>";
	var wireless_mode_5g = "<%tcWebApi_get("WLan11ac_Common","WirelessModeIndex","s")%>";
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
	</script>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>5G Coexist : </B></TD>
	<TD nowrap>&nbsp;<%If tcWebApi_get("WLan11ac_Common","HT_BW","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","HT_BW","s") end if%>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>2.4G WLAN MAC : </B></TD>
	<TD nowrap>&nbsp;<%tcWebApi_get("SkuId_Entry","TE_wlan_mac","s")%>&nbsp;
		</TD>
</TR>
<TR>
	<TD nowrap><B>5G WLAN MAC : </B></TD>
	<TD nowrap>&nbsp;<%tcWebApi_get("SkuId_Entry","TE_wlan11ac_mac","s")%>&nbsp;
		</TD>
</TR>

<TR>
	<TD nowrap><B>LAN MAC : </B></TD>
	<TD nowrap>&nbsp;
		<script>
			var lanmac="<%If tcWebApi_get("Info_Ether","mac","h") <> "N/A" Then tcWebApi_get("Info_Ether","mac","s") end if%>";
			document.write(lanmac.toUpperCase());
		</script></>
		&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>WAN MAC 1: </B></TD>
	<TD nowrap>&nbsp;N/A&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>WAN MAC 2: </B></TD>
	<TD nowrap>&nbsp;N/A&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>WAN MAC 3: </B></TD>
	<TD nowrap>&nbsp;N/A&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>PIN Code : </B></TD>
	<TD nowrap>&nbsp;<%if tcWebApi_get("Info_WLan","wlanSelfPinCode","h") <> "N/A" then tcWebApi_get("Info_WLan","wlanSelfPinCode","s") end if%>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>Region : </B></TD>
	<TD nowrap>&nbsp;<%If tcWebApi_get("SkuId_Entry","Region","h") <> "N/A" Then tcWebApi_get("SkuId_Entry","Region","s") end if%>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>Language : </B></TD>
	<TD nowrap>&nbsp;
				<script>
				var region="<%If tcWebApi_get("SkuId_Entry","Region","h") <> "N/A" Then tcWebApi_get("SkuId_Entry","Region","s") end if%>";
				
			if(region=="PE")
				document.write("English, German, French, Dutch, Swedish, Russian");
			else if(region=="UK")
				document.write("English, Chinese, French, German, Dutch, Korea");	
			else if(region=="EE")
				document.write("Polish, Russian, Czech, Greek, Romanian, Hungarian");
			else if(region=="AU")		
				document.write("English, Chinese, Italian, Germany, Dutch, Korea");
			else if(region=="RU")
				document.write("Russian, English, Polish, Dutch, Swedish, Danish");
			else if(region=="PA")
				document.write("English, French, Spanish, Chinese, German, Portuguese");
			else if(region=="KO")
				document.write("English, Chines, Russian, Dutch, Japanese, Korean");
			else if(region=="JP")
				document.write("English, Chines, Japanese, Korean, Dutch, Russia");
			else
				document.write("English, Chines, Italian, Germany, Dutch, Korea");//NA or other sku language table
		  </script>
		&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>Board HW ID : </B></TD>
	<TD nowrap>&nbsp;<%If tcWebApi_get("SkuId_Entry","TE_hwid","h") <> "N/A" Then tcWebApi_staticGet("SkuId_Entry","TE_hwid","s") end if%>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>Board Model ID : </B></TD>
	<TD nowrap>&nbsp;<%tcWebApi_get("SkuId_Entry","ProductName","s")%>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>2.4G WLAN Status : </B></TD>
	<TD nowrap>&nbsp;<%tcWebApi_get("WLan_Common","APOn","s")%>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>5G WLAN Status : </B></TD>
	<TD nowrap>&nbsp;<%tcWebApi_get("WLan11ac_Common","APOn","s")%>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>CFE Version: </B></TD>
	<TD nowrap> &nbsp;N/A&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>ADSL Modem Code Version : </B></TD>
	<TD nowrap> &nbsp;N/A&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>WLAN Version : </B></TD>
	<TD nowrap> &nbsp;N/A&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>ADSL Downstream Line Rate : </B></TD>
	<TD nowrap>&nbsp;<%tcWebApi_get("Info_Adsl","DataRateDown","s")%>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>ADSL Upstream Line Rate : </B></TD>
	<TD nowrap>&nbsp;<%tcWebApi_get("Info_Adsl","DataRateUp","s")%>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>Build Time : </B></TD>
	<TD nowrap>&nbsp;<%tcWebApi_get("SkuId_Entry","BuildTime","s")%>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>Factory Mode : </B></TD>
	<TD nowrap> &nbsp;N/A&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>HWID : </B></TD>
	<TD nowrap>&nbsp;<%tcWebApi_get("SkuId_Entry","HWID","s")%>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>WiFi5gmode : </B></TD>
	<TD nowrap>&nbsp;<%tcWebApi_get("SkuId_Entry","WiFi5GMode","s")%>&nbsp;</TD>
</TR>
<TR>
	<TD nowrap><B>Annex : </B></TD>
	<TD nowrap>&nbsp;<%tcWebApi_get("SkuId_Entry","Annex","s")%>&nbsp;</TD>
</TR>
</table>
</form>
</BODY>
</HTML>
