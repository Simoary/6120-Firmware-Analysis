<html><head><link rel="stylesheet" href="/style/basic_home.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/basic.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>
<body onLoad="loadhelp('_Wizard_setup');" bgcolor="#ffffff">
<form method="post" action="/cgi-bin/BRS_03A_detcInetType.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type="hidden" name="submit_flag" value="wizard_detwan">

<script language="javascript" type="text/javascript">
var portstatus = "1";
var enable_action=1;
var enabled_wds=0;
var enabled_wps=1;
var gui_region="English";

var select_basic="1";
var select_type="0";
<%if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "0" then%>
var wan_status = "<%tcWebApi_staticGet("WanInfo_Entry","Active","s")%>";
<%elseif tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "10" then%>
var wan_status = "<%tcWebApi_staticGet("WanInfo_Entry","Active","s")%>";
<%else%>
var wan_status = "0"
<%end if%>
var ping_result = "success";
var endis_wl_radio="<%If tcWebApi_get("WLan_Common","APOn","h") <> "N/A" then tcWebApi_get("WLan_Common","APOn","s") end if%>";
var endis_wla_radio="<%If tcWebApi_get("WLan11ac_Common","APOn","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","APOn","s") end if%>";
var parental_ctrl_flag = parent.parental_ctrl_flag;
//var guest_wireless_flag = "0"; //201310290950, Tony, disable guest wireless flag
var ParentalControl="<%if tcWebApi_get("LiveParentalCtl_Common","Active","h") <> "N/A" then tcWebApi_get("LiveParentalCtl_Common","Active","s") end if%>";

var get_endis_guestNet_1="<%If tcWebApi_get("WLan_Entry1","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan_Entry1","EnableSSID","s") end if%>";
var get_endis_guestNet_2="<%If tcWebApi_get("WLan_Entry2","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan_Entry2","EnableSSID","s") end if%>";
var get_endis_guestNet_3="<%If tcWebApi_get("WLan_Entry3","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan_Entry3","EnableSSID","s") end if%>";

var get_endis_guestNet_1_an="<%If tcWebApi_get("WLan11ac_Entry1","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","EnableSSID","s") end if%>";
var get_endis_guestNet_2_an="<%If tcWebApi_get("WLan11ac_Entry2","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","EnableSSID","s") end if%>";
var get_endis_guestNet_3_an="<%If tcWebApi_get("WLan11ac_Entry3","EnableSSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","EnableSSID","s") end if%>";


<!--add this-->
var s_gssid="<%If tcWebApi_get("WLan_Entry1","SSID","h") <> "N/A" then tcWebApi_get("WLan_Entry1","SSID","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\\\\\/g,"\\").replace(/\\\\\\`/g,"`");
var wlg_key1 = "<%If tcWebApi_get("WLan_Entry1","Key1Str","h") <> "N/A" then tcWebApi_get("WLan_Entry1","Key1Str","s") end if%>";
var getg_wpa1 = "<%If tcWebApi_get("WLan_Entry1","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry1","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
var getg_wpa2 = "<%If tcWebApi_get("WLan_Entry1","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry1","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
var getg_wpas = "<%If tcWebApi_get("WLan_Entry1","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry1","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
var getg_radiusSecret="<%if tcWebApi_get("WLan_Entry1","BAK_RADIUS_Key","h") <> "N/A" then tcWebApi_get("WLan_Entry1","BAK_RADIUS_Key","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\\\\\/g,"\\").replace(/\\\\\\`/g,"`");

//bug 23999:combine b/g/n and a/n page,set status to Enabled if any of these two or both is/are enabled, and Not enabled when both are disabled
var s_gssid_an="<%If tcWebApi_get("WLan11ac_Entry1","SSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","SSID","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\\\\\/g,"\\").replace(/\\\\\\`/g,"`");
var wla_key1_an = "<%If tcWebApi_get("WLan11ac_Entry1","Key1Str","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","Key1Str","s") end if%>";
var getg_wpa1_an = "<%If tcWebApi_get("WLan11ac_Entry1","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
var getg_wpa2_an = "<%If tcWebApi_get("WLan11ac_Entry1","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
var getg_wpas_an = "<%If tcWebApi_get("WLan11ac_Entry1","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
var getg_radiusSecret_an="<%if tcWebApi_get("WLan11ac_Entry1","BAK_RADIUS_Key","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","BAK_RADIUS_Key","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\\\\\/g,"\\").replace(/\\\\\\`/g,"`");

if(endis_wl_radio==1)
{
   var wl_ssid="<%If tcWebApi_get("WLan_Entry0","SSID","h") <> "N/A" then tcWebApi_get("WLan_Entry0","SSID","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\\\\\/g,"\\").replace(/\\\\\\`/g,"`");
   var wl_key1 = "<%If tcWebApi_get("WLan_Entry0","Key1Str","h") <> "N/A" then tcWebApi_get("WLan_Entry0","Key1Str","s") end if%>";
   var get_wpa1 = "<%If tcWebApi_get("WLan_Entry0","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry0","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
   var get_wpa2 = "<%If tcWebApi_get("WLan_Entry0","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry0","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
   var get_wpas = "<%If tcWebApi_get("WLan_Entry0","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry0","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
   var get_radiusSecret="<%if tcWebApi_get("WLan_Entry0","BAK_RADIUS_Key","h") <> "N/A" then tcWebApi_get("WLan_Entry0","BAK_RADIUS_Key","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\\\\\/g,"\\").replace(/\\\\\\`/g,"`");

   <% if tcWebApi_get("WLan_Entry0","AuthMode","h") = "OPEN" then%>
      var wl_sectype="1";
   <%elseif tcWebApi_get("WLan_Entry0","AuthMode","h") = "WEP-64Bits" then%>
      var wl_sectype="2";
   <%elseif tcWebApi_get("WLan_Entry0","AuthMode","h") = "WEP-128Bits" then%>
      var wl_sectype="2";
   <%elseif tcWebApi_get("WLan_Entry0","AuthMode","h") = "WPAPSK" then%>
      var wl_sectype="3";
   <%elseif tcWebApi_get("WLan_Entry0","AuthMode","h") = "WPA2PSK" then%>
      var wl_sectype="4";
   <%elseif tcWebApi_get("WLan_Entry0","AuthMode","h") = "WPAPSKWPA2PSK" then%>
      var wl_sectype="5";
   <%end if%>
}
if(endis_wla_radio == 1)
{
   var wla_ssid="<%If tcWebApi_get("WLan11ac_Entry0","SSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry0","SSID","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\\\\\/g,"\\").replace(/\\\\\\`/g,"`");
   var wla_key1 = "<%If tcWebApi_get("WLan11ac_Entry0","Key1Str","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry0","Key1Str","s") end if%>";
   var get_wpa1_a = "<%If tcWebApi_get("WLan11ac_Entry0","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry0","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
   var get_wpa2_a = "<%If tcWebApi_get("WLan11ac_Entry0","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry0","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
   var get_wpas_a = "<%If tcWebApi_get("WLan11ac_Entry0","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry0","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
   var get_radiusSecret_a="<%if tcWebApi_get("WLan11ac_Entry0","BAK_RADIUS_Key","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry0","BAK_RADIUS_Key","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\\\\\/g,"\\").replace(/\\\\\\`/g,"`");

   <% if tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "OPEN" then%>
      var wla_sectype="1";
   <%elseif tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "WEP-64Bits" then%>
      var wla_sectype="2";
   <%elseif tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "WEP-128Bits" then%>
      var wla_sectype="2";
   <%elseif tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "WPAPSK" then%>
      var wla_sectype="3";
   <%elseif tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "WPA2PSK" then%>
      var wla_sectype="4";
   <%elseif tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "WPAPSKWPA2PSK" then%>
      var wla_sectype="5";
   <%end if%>
}

if(get_endis_guestNet_1 == 1)
{
   s_gssid="<%If tcWebApi_get("WLan_Entry1","SSID","h") <> "N/A" then tcWebApi_get("WLan_Entry1","SSID","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\\\\\/g,"\\").replace(/\\\\\\`/g,"`");
   wlg_key1 = "<%If tcWebApi_get("WLan_Entry1","Key1Str","h") <> "N/A" then tcWebApi_get("WLan_Entry1","Key1Str","s") end if%>";
   getg_wpa1 = "<%If tcWebApi_get("WLan_Entry1","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry1","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
   getg_wpa2 = "<%If tcWebApi_get("WLan_Entry1","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry1","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
   getg_wpas = "<%If tcWebApi_get("WLan_Entry1","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry1","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
   getg_radiusSecret="<%if tcWebApi_get("WLan_Entry1","BAK_RADIUS_Key","h") <> "N/A" then tcWebApi_get("WLan_Entry1","BAK_RADIUS_Key","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\\\\\/g,"\\").replace(/\\\\\\`/g,"`");

   <% if tcWebApi_get("WLan_Entry1","AuthMode","h") = "OPEN" then%>
      var wlg_sectype="1";
   <%elseif tcWebApi_get("WLan_Entry1","AuthMode","h") = "WEP-64Bits" then%>
      var wlg_sectype="2";
   <%elseif tcWebApi_get("WLan_Entry1","AuthMode","h") = "WEP-128Bits" then%>
      var wlg_sectype="2";
   <%elseif tcWebApi_get("WLan_Entry1","AuthMode","h") = "WPAPSK" then%>
      var wlg_sectype="3";
   <%elseif tcWebApi_get("WLan_Entry1","AuthMode","h") = "WPA2PSK" then%>
      var wlg_sectype="4";
   <%elseif tcWebApi_get("WLan_Entry1","AuthMode","h") = "WPAPSKWPA2PSK" then%>
      var wlg_sectype="5";
   <%end if%>
}
else if(get_endis_guestNet_2 == 1)
{
   s_gssid="<%If tcWebApi_get("WLan_Entry2","SSID","h") <> "N/A" then tcWebApi_get("WLan_Entry2","SSID","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\\\\\/g,"\\").replace(/\\\\\\`/g,"`");
   wlg_key1 = "<%If tcWebApi_get("WLan_Entry2","Key1Str","h") <> "N/A" then tcWebApi_get("WLan_Entry2","Key1Str","s") end if%>";
   getg_wpa1 = "<%If tcWebApi_get("WLan_Entry2","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry2","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
   getg_wpa2 = "<%If tcWebApi_get("WLan_Entry2","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry2","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
   getg_wpas = "<%If tcWebApi_get("WLan_Entry2","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry2","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
   getg_radiusSecret="<%if tcWebApi_get("WLan_Entry2","BAK_RADIUS_Key","h") <> "N/A" then tcWebApi_get("WLan_Entry2","BAK_RADIUS_Key","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\\\\\/g,"\\").replace(/\\\\\\`/g,"`");
   
   <% if tcWebApi_get("WLan_Entry2","AuthMode","h") = "OPEN" then%>
      var wlg_sectype="1";
   <%elseif tcWebApi_get("WLan_Entry2","AuthMode","h") = "WEP-64Bits" then%>
      var wlg_sectype="2";
   <%elseif tcWebApi_get("WLan_Entry2","AuthMode","h") = "WEP-128Bits" then%>
      var wlg_sectype="2";
   <%elseif tcWebApi_get("WLan_Entry2","AuthMode","h") = "WPAPSK" then%>
      var wlg_sectype="3";
   <%elseif tcWebApi_get("WLan_Entry2","AuthMode","h") = "WPA2PSK" then%>
      var wlg_sectype="4";
   <%elseif tcWebApi_get("WLan_Entry2","AuthMode","h") = "WPAPSKWPA2PSK" then%>
      var wlg_sectype="5";
   <%end if%>
}
else if(get_endis_guestNet_3 == 1)
{
   s_gssid="<%If tcWebApi_get("WLan_Entry3","SSID","h") <> "N/A" then tcWebApi_get("WLan_Entry3","SSID","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\\\\\/g,"\\").replace(/\\\\\\`/g,"`");
   wlg_key1 = "<%If tcWebApi_get("WLan_Entry3","Key1Str","h") <> "N/A" then tcWebApi_get("WLan_Entry3","Key1Str","s") end if%>";
   getg_wpa1 = "<%If tcWebApi_get("WLan_Entry3","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry3","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
   getg_wpa2 = "<%If tcWebApi_get("WLan_Entry3","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry3","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
   getg_wpas = "<%If tcWebApi_get("WLan_Entry3","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry3","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
   getg_radiusSecret="<%if tcWebApi_get("WLan_Entry3","BAK_RADIUS_Key","h") <> "N/A" then tcWebApi_get("WLan_Entry3","BAK_RADIUS_Key","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\\\\\/g,"\\").replace(/\\\\\\`/g,"`");
   
   <% if tcWebApi_get("WLan_Entry3","AuthMode","h") = "OPEN" then%>
      var wlg_sectype="1";
   <%elseif tcWebApi_get("WLan_Entry3","AuthMode","h") = "WEP-64Bits" then%>
      var wlg_sectype="2";
   <%elseif tcWebApi_get("WLan_Entry3","AuthMode","h") = "WEP-128Bits" then%>
      var wlg_sectype="2";
   <%elseif tcWebApi_get("WLan_Entry3","AuthMode","h") = "WPAPSK" then%>
      var wlg_sectype="3";
   <%elseif tcWebApi_get("WLan_Entry3","AuthMode","h") = "WPA2PSK" then%>
      var wlg_sectype="4";
   <%elseif tcWebApi_get("WLan_Entry3","AuthMode","h") = "WPAPSKWPA2PSK" then%>
      var wlg_sectype="5";
   <%end if%>
}
else if(get_endis_guestNet_1_an == 1)
{
   s_gssid_an="<%If tcWebApi_get("WLan11ac_Entry1","SSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","SSID","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\\\\\/g,"\\").replace(/\\\\\\`/g,"`");
   wla_key1_an = "<%If tcWebApi_get("WLan11ac_Entry1","Key1Str","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","Key1Str","s") end if%>";
   getg_wpa1_an = "<%If tcWebApi_get("WLan11ac_Entry1","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
   getg_wpa2_an = "<%If tcWebApi_get("WLan11ac_Entry1","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
   getg_wpas_an = "<%If tcWebApi_get("WLan11ac_Entry1","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
   getg_radiusSecret_an="<%if tcWebApi_get("WLan11ac_Entry1","BAK_RADIUS_Key","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry1","BAK_RADIUS_Key","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\\\\\/g,"\\").replace(/\\\\\\`/g,"`");

   <% if tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "OPEN" then%>
      var wla_sectype_an="1";
   <%elseif tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WEP-64Bits" then%>
      var wla_sectype_an="2";
   <%elseif tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WEP-128Bits" then%>
      var wla_sectype_an="2";
   <%elseif tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WPAPSK" then%>
      var wla_sectype_an="3";
   <%elseif tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WPA2PSK" then%>
      var wla_sectype_an="4";
   <%elseif tcWebApi_get("WLan11ac_Entry1","AuthMode","h") = "WPAPSKWPA2PSK" then%>
      var wla_sectype_an="5";
   <%end if%>
}
else if(get_endis_guestNet_2_an == 1)
{
   s_gssid_an="<%If tcWebApi_get("WLan11ac_Entry2","SSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","SSID","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\\\\\/g,"\\").replace(/\\\\\\`/g,"`");
   wla_key1_an = "<%If tcWebApi_get("WLan11ac_Entry2","Key1Str","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","Key1Str","s") end if%>";
   getg_wpa1_an = "<%If tcWebApi_get("WLan11ac_Entry2","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
   getg_wpa2_an = "<%If tcWebApi_get("WLan11ac_Entry2","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
   getg_wpas_an = "<%If tcWebApi_get("WLan11ac_Entry2","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
   getg_radiusSecret_an="<%if tcWebApi_get("WLan11ac_Entry2","BAK_RADIUS_Key","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry2","BAK_RADIUS_Key","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\\\\\/g,"\\").replace(/\\\\\\`/g,"`");

   <% if tcWebApi_get("WLan11ac_Entry2","AuthMode","h") = "OPEN" then%>
      var wla_sectype_an="1";
   <%elseif tcWebApi_get("WLan11ac_Entry2","AuthMode","h") = "WEP-64Bits" then%>
      var wla_sectype_an="2";
   <%elseif tcWebApi_get("WLan11ac_Entry2","AuthMode","h") = "WEP-128Bits" then%>
      var wla_sectype_an="2";
   <%elseif tcWebApi_get("WLan11ac_Entry2","AuthMode","h") = "WPAPSK" then%>
      var wla_sectype_an="3";
   <%elseif tcWebApi_get("WLan11ac_Entry2","AuthMode","h") = "WPA2PSK" then%>
      var wla_sectype_an="4";
   <%elseif tcWebApi_get("WLan11ac_Entry2","AuthMode","h") = "WPAPSKWPA2PSK" then%>
      var wla_sectype_an="5";
   <%end if%>
}
else if(get_endis_guestNet_3_an == 1)
{
   s_gssid_an="<%If tcWebApi_get("WLan11ac_Entry3","SSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","SSID","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\\\\\/g,"\\").replace(/\\\\\\`/g,"`");
   wla_key1_an = "<%If tcWebApi_get("WLan11ac_Entry3","Key1Str","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","Key1Str","s") end if%>";
   getg_wpa1_an = "<%If tcWebApi_get("WLan11ac_Entry3","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
   getg_wpa2_an = "<%If tcWebApi_get("WLan11ac_Entry3","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
   getg_wpas_an = "<%If tcWebApi_get("WLan11ac_Entry3","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","WPAPSK","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\/g,"\\").replace(/\\`/g,"`");
   getg_radiusSecret_an="<%if tcWebApi_get("WLan11ac_Entry3","BAK_RADIUS_Key","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry3","BAK_RADIUS_Key","s") end if%>".replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&#40;/g,"(").replace(/&#41;/g,")").replace(/\\&#34;/g,'\"').replace(/&#39;/g,"'").replace(/&#35;/g,"#").replace(/&#38;/g,"&").replace(/\\\\\\\\/g,"\\").replace(/\\\\\\`/g,"`");

   <% if tcWebApi_get("WLan11ac_Entry3","AuthMode","h") = "OPEN" then%>
      var wla_sectype_an="1";
   <%elseif tcWebApi_get("WLan11ac_Entry3","AuthMode","h") = "WEP-64Bits" then%>
      var wla_sectype_an="2";
   <%elseif tcWebApi_get("WLan11ac_Entry3","AuthMode","h") = "WEP-128Bits" then%>
      var wla_sectype_an="2";
   <%elseif tcWebApi_get("WLan11ac_Entry3","AuthMode","h") = "WPAPSK" then%>
      var wla_sectype_an="3";
   <%elseif tcWebApi_get("WLan11ac_Entry3","AuthMode","h") = "WPA2PSK" then%>
      var wla_sectype_an="4";
   <%elseif tcWebApi_get("WLan11ac_Entry3","AuthMode","h") = "WPAPSKWPA2PSK" then%>
      var wla_sectype_an="5";
   <%end if%>
}

var leng=s_gssid.length;
var leng1=wlg_key1.length;
var leng2=getg_wpa1.length;
var leng3=getg_wpa2.length;
var leng4=getg_wpas.length;
var leng5=getg_radiusSecret.length;

var leng_an=s_gssid_an.length;
var leng1_an=wla_key1_an.length;
var leng2_an=getg_wpa1_an.length;
var leng3_an=getg_wpa2_an.length;
var leng4_an=getg_wpas_an.length;
var leng5_an=getg_radiusSecret_an.length;
<!--end this-->

var disk_num=0;
var device_num=0;
<%if tcWebApi_get("USBStorage_Entry0","Active","h") = "1" then%>
   device_num=1;
<%elseif tcWebApi_get("USBStorage_Entry1","Active","h") = "1" then%>
   device_num=1;
<%elseif tcWebApi_get("USBStorage_Entry2","Active","h") = "1" then%>
   device_num=1;
<%elseif tcWebApi_get("USBStorage_Entry3","Active","h") = "1" then%>
   device_num=1;
<%elseif tcWebApi_get("USBStorage_Entry4","Active","h") = "1" then%>
   device_num=1;
<%elseif tcWebApi_get("USBStorage_Entry5","Active","h") = "1" then%>
   device_num=1;
<%elseif tcWebApi_get("USBStorage_Entry6","Active","h") = "1" then%>
   device_num=1;
<%elseif tcWebApi_get("USBStorage_Entry7","Active","h") = "1" then%>
   device_num=1;
<%elseif tcWebApi_get("USBStorage_Entry8","Active","h") = "1" then%>
   device_num=1;
<%elseif tcWebApi_get("USBStorage_Entry9","Active","h") = "1" then%>
   device_num=1;
<%elseif tcWebApi_get("USBStorage_Entry10","Active","h") = "1" then%>
   device_num=1;
<%elseif tcWebApi_get("USBStorage_Entry11","Active","h") = "1" then%>
   device_num=1;
<%elseif tcWebApi_get("USBStorage_Entry12","Active","h") = "1" then%>
   device_num=1;
<%elseif tcWebApi_get("USBStorage_Entry13","Active","h") = "1" then%>
   device_num=1;
<%elseif tcWebApi_get("USBStorage_Entry14","Active","h") = "1" then%>
   device_num=1;
<%elseif tcWebApi_get("USBStorage_Entry15","Active","h") = "1" then%>
   device_num=1;
<%elseif tcWebApi_get("USBStorage_Entry16","Active","h") = "1" then%>
   device_num=1;
<%elseif tcWebApi_get("USBStorage_Entry17","Active","h") = "1" then%>
   device_num=1;
<%elseif tcWebApi_get("USBStorage_Entry18","Active","h") = "1" then%>
   device_num=1;
<%elseif tcWebApi_get("USBStorage_Entry19","Active","h") = "1" then%>
   device_num=1;
<%elseif tcWebApi_get("USBStorage_Entry20","Active","h") = "1" then%>
   device_num=1;
<%elseif tcWebApi_get("USBStorage_Entry21","Active","h") = "1" then%>
   device_num=1;
<%elseif tcWebApi_get("USBStorage_Entry22","Active","h") = "1" then%>
   device_num=1;
<%elseif tcWebApi_get("USBStorage_Entry23","Active","h") = "1" then%>
   device_num=1;
<%elseif tcWebApi_get("USBStorage_Entry24","Active","h") = "1" then%>
   device_num=1;
<%else%>
   device_num=0;
<%end if%>


//attach devices
var attach_device_list="<%tcWebApi_showFile("/var/netscan_lists")%>";
var attach_array=attach_device_list.split(' @#$&*! ');
var attach_ip_array = new Array();
var attach_mac_array = new Array();
var attach_name_array = new Array();

var attach_dev_num=0

var deviceIP_name_num=0

var repeater_wireless_attach_device_num=0;

var lan_ip="<%tcWebApi_get("Lan_Entry","IP","s")%>";
var lan_subnet="<%tcWebApi_get("Lan_Entry","netmask","s")%>";
var lan_prefix = parent.aye_utils_GET_IPv4_Prefix(lan_ip,lan_subnet);

var p=0;
if(attach_device_list != "")
{
        for(i=0;i<attach_array.length;i++)
        {
                var each_info=attach_array[i].split(' ');
                if(each_info.length>2)
                {
                        attach_ip_array[p]=each_info[0];
                        attach_mac_array[p]=each_info[1];
                        if (each_info[2].length>0)
                        {
                                attach_name_array[p]=each_info[2];
                        }
                        else
                        {
                                attach_name_array[p]="----";
                        }
                }
                else
                {
                        attach_ip_array[p]=each_info[0];
                        attach_mac_array[p]=each_info[1];
                        attach_name_array[p]="----";
                }
                if(attach_ip_array[p] == "<unknown>")
                {
                        attach_ip_array[p]="&lt;Unknown&gt;"
                }
                if(attach_mac_array[p] == "<unknown>")
                {
                        attach_mac_array[p]="&lt;Unknown&gt;"
                }

                if(attach_name_array[p] == "<unknown>" || attach_name_array[p] == "&lt;unknown&gt;" || attach_name_array[p] == "----" )
                {
                        for( t=0; t<deviceIP_name_num; t++)
                        {
                                var dev_name = eval ( 'deviceIP_name' + t );
                                var dev_name_array = dev_name.split(' ');
                                if( attach_ip_array[p] == dev_name_array[0] && dev_name_array[1] != "")
                                {
                                        attach_name_array[p] = dev_name_array[1];
                                }
                        }
                }

                if(attach_name_array[p] == "<unknown>")
                {
                        attach_name_array[p]="&lt;Unknown&gt;"
                }
                p++;
        }
}

var attach_device_num = 0;
var same_flag=0;

for(i=0; i<attach_array.length; i++)
{
	same_flag = 0;
	for(j=0;j<attach_dev_num;j++)
	{
		var mac = eval ( 'attach_dev_mac' + j );
		if( attach_mac_array[i].toLowerCase() == mac.toLowerCase() )	
		{
			same_flag = 1;	
		}
	}
	if( repeater_wireless_attach_device_num > 0 )
		if( attach_mac_array[i].toLowerCase() == repeater_wireless_attach_device_mac.toLowerCase() )
			same_flag = 1;

	if(attach_ip_array[i].search(lan_prefix)!=-1){
			
		if( same_flag == 0 )	
		{
			attach_device_num++;
		}
	}	
}

</script>

<div id="form">
<div id="form_content">
<script>
/*-- internet --*/
    var InternetDemandLED = "<% if tcWebApi_staticGet("Wan_Common","InternetDemandLED","h") <> "N/A" then tcWebApi_staticGet("Wan_Common","InternetDemandLED","s") end if%>";
    var info_get_wanproto="<% if tcWebApi_get("WanInfo_Entry","Connetion","h") <> "N/A" then tcWebApi_staticGet("WanInfo_Entry","Connetion","s")  end if %>";

	if(wan_status=='1' && ping_result=="success" && ( ((info_get_wanproto == "PPPoE" || info_get_wanproto == "PPPoA") && InternetDemandLED == "1") || (!(info_get_wanproto == "PPPoE" || info_get_wanproto == "PPPoA") )))
		document.write('<div id="internet" class="basic_icon" onclick="click_action(\'basic_internet\');">');
	else//bug 24002:Basic--home--internet status should be update
		document.write('<div id="internet" class="basic_icon_error" onclick="click_action(\'basic_no_internet\');">');

	document.write('<div class="icon_name"><br /><br /><br /><br /><br />' + '<%tcWebApi_multilingual("0","glbstr_internet")%>' + '</div>');

	if(wan_status=='1' && ping_result=="success" && ( ((info_get_wanproto == "PPPoE" || info_get_wanproto == "PPPoA") && InternetDemandLED == "1") || (!(info_get_wanproto == "PPPoE" || info_get_wanproto == "PPPoA") )))
	{
		document.write('<div id="internet_stat" class="icon_status">' + '<%tcWebApi_multilingual("1","home_status_str")%>' + ' <b> ' + ' <%tcWebApi_multilingual("1","home_good_str")%> ' + ' </b></div>');
		setIconClass("internet_stat", "STATUS: GOOD");
	}
	else{
		document.write('<div id="internet_stat" class="icon_status"><b>' + '<%tcWebApi_multilingual("1","home_error_str")%>' + '</b> <a>' + '<%tcWebApi_multilingual("1","home_not_connected_str")%>' + ' </a></div>');
		setIconClass("internet_stat", "Error Not Connected");
	}
	document.write('</div>');
	
	if( endis_wl_radio == '0' && endis_wla_radio == '0' )
		document.write('<div id="wireless" class="basic_icon_warning" onclick="click_action(\'basic_wireless\');">');
	else if((endis_wl_radio == '1' && wl_sectype == "1") )
		document.write('<div id="wireless" class="basic_icon_warning" onclick="click_action(\'basic_wireless\');">');
	else
		document.write('<div id="wireless" class="basic_icon" onclick="click_action(\'basic_wireless\');">');
	
	document.write('<div class="icon_name"><br/><br/><br/><br/><br/>' + '<%tcWebApi_multilingual("0","glbstr_wireless")%>' + '</div>');

	if( endis_wl_radio == '0' && endis_wla_radio == '0' )
	{
		document.write('<div id="wlan_stat" class="icon_status"><b>' + '<%tcWebApi_multilingual("1","home_warning_str")%>' + '</b> <a>' + '<%tcWebApi_multilingual("1","home_off_str")%>' + '</a></div>');
		setIconClass("wlan_stat","Warning OFF");
	}
	else if((endis_wl_radio == '1' && wl_sectype == "1") )
	{
		document.write('<div id="wlan_stat" class="icon_status"><b>' + '<%tcWebApi_multilingual("1","home_warning_str")%>' + '</b> <a>' + '<%tcWebApi_multilingual("1","home_no_security_str")%>' + '</a></div>');
		setIconClass("wlan_stat", "Warning No Security");
	}
	else
	{

		var wlan_ssid;
		var wlan_passphrase;

		if( endis_wl_radio == '1')
		{
			wlan_ssid = wl_ssid;
			if( wl_sectype == "2" )
				wlan_passphrase = wl_key1;
			else if( wl_sectype == "3" )
				wlan_passphrase = get_wpa1;
			else if( wl_sectype == "4" )
				wlan_passphrase = get_wpa2;
			else if( wl_sectype == "5" )
				wlan_passphrase = get_wpas;
			else
				wlan_passphrase = get_radiusSecret;
		}	
		else /* endis_wla_radio == '1' */
		{
			wlan_ssid = wla_ssid;
                        if( wla_sectype == "2" )
                                wlan_passphrase = wla_key1;
                        else if( wla_sectype == "3" )
                                wlan_passphrase = get_wpa1_a;
                        else if( wla_sectype == "4" )
                                wlan_passphrase = get_wpa2_a;
                        else if( wla_sectype == "5" )
                                wlan_passphrase = get_wpas_a;
                        else
                                wlan_passphrase = get_radiusSecret_a;
		}

		document.write('<div id="wlan_stat" class="icon_long_status"><marquee behavior="scroll" onmouseover=stop() onmouseout=start()>SSID: <b>'+wlan_ssid+'</b><br/>Password: <b>'+wlan_passphrase+'</b></marquee></div>');
		setIconClass_noDouble("wlan_stat", "Password "+wlan_passphrase);

	}
	document.write('</div>');
</script>
<!-- attach device -->
	<div id="attached" class="basic_icon" onClick="click_action('basic_attached');"> 
		<div class="icon_name"><br/><br/><br/><br/><br/><%tcWebApi_multilingual("0","glbstr_attach_device")%></div>
		<!--div class="icon_status">STATUS: <b>GOOD</b> <br/>Number of devices :-->
		<div class="icon_status"><%tcWebApi_multilingual("1","home_number_device_str")%><b>
		<script language="javascript" type="text/javascript">
			document.write(attach_device_num);
		</script></b> 
		</div>
	</div>
<!-- parental controls -->
	<div id="parental" class="basic_icon" style="display:none" onClick="click_action('basic_parental');">  <!-- 201310281905, Tony, Hide Parental Control option -->
		<div class="icon_name"><br/><br/><br/><br/><br/><%tcWebApi_multilingual("0","glbstr_parent_control")%></div>
		<div id="parant_control_stat" class="icon_status"><%tcWebApi_multilingual("1","home_status_str")%> <b>
		<script>
		if(parental_ctrl_flag == 0)
		{
			document.write("<%tcWebApi_multilingual("1","home_not_support_str")%>");
			setIconClass("parant_control_stat", "STATUS: NOT SUPPORTED");
		}
		else
		{
		  	if (ParentalControl == "Yes")
		  	{	
		  		document.write("<%tcWebApi_multilingual("1","home_enabled_str")%>");
				setIconClass("parant_control_stat", "STATUS: ENABLED");
			}
		  	else
			{
		  		document.write("<%tcWebApi_multilingual("1","home_not_enabled_str")%>");
				setIconClass("parant_control_stat", "STATUS: NOT ENABLED");
			}
		}
      	if(parental_ctrl_flag == 1)
      		document.getElementById("parental").style.display="";

		</script></b></div>
	</div>
<!-- readyshare -->
	<div id="readyshare" class="basic_icon" onClick="click_action('basic_ready');">  <!-- 201310281905, Tony, Hide Ready Share option -->
		<div class="icon_name"><br/><br/><br/><br/><br/>ReadySHARE</div>
		<div id="readyshare_stat" class="icon_status"><%tcWebApi_multilingual("1","home_status_str")%> <b>
		<script>
			if(device_num == 0 )
			{
				document.write("<%tcWebApi_multilingual("1","home_no_usb_drive_str")%>");
				setIconClass("readyshare_stat", "STATUS: No USB drive");
			}
			else
			{
				document.write("<%tcWebApi_multilingual("1","home_ready_str")%>");
				setIconClass("readyshare_stat", "STATUS: READY");
			}
			if(parent.usb_router_flag == 0)
				document.getElementById("readyshare").style.display = "none";

		</script>	
		</b></div>
	</div>
<!-- guest network -->
	<div id="guest" class="basic_icon" onClick="click_action('basic_guest');"> 
		<div class="icon_name"><br/><br/><br/><br/><br/><%tcWebApi_multilingual("0","glbstr_guest_network")%></div>
		<!--div class="icon_status">STATUS:<b>-->
		
		
		<script language="javascript" type="text/javascript">
		/*---------------------------------------------201310290950, Tony, disable guest wireless flag--------------------------------------------------*/
		/*if(guest_wireless_flag == "0")
		{
		    document.write('<div id="guestNetwork_stat" class="icon_status">' + '<%tcWebApi_multilingual("1","home_status_str")%>' + ' <b>' + '<%tcWebApi_multilingual("1","home_not_support_str")%>' + '</b></div>');
		}
		else
		{*/
		/*---------------------------------------------------------------------------------------------------------------------------------------------*/
		if(get_endis_guestNet_1 == '0' && get_endis_guestNet_2 == '0' && get_endis_guestNet_3 == '0' && get_endis_guestNet_1_an == '0' && get_endis_guestNet_2_an == '0' && get_endis_guestNet_3_an == '0')
		{
			document.write('<div id="guestNetwork_stat" class="icon_status">' + '<%tcWebApi_multilingual("1","home_status_str")%>' + ' <b>' + '<%tcWebApi_multilingual("1","home_not_enabled_str")%>' + '</b></div>');
			setIconClass("guestNetwork_stat", "STATUS:  NOT ENABLED");
		}
		else
		{
			var guest_ssid;
			var guest_passph;

			if(get_endis_guestNet_1 == '1' || get_endis_guestNet_2 == '1' || get_endis_guestNet_3 == '1')
			{
				guest_ssid = s_gssid;
				if(wlg_sectype == "1")
					guest_passph = "NONE";
				else if(wlg_sectype == "2")
					guest_passph = wlg_key1;
				else if(wlg_sectype == "3")
					guest_passph = getg_wpa1;
				else if(wlg_sectype == "4")
					guest_passph = getg_wpa2;
				else if(wlg_sectype == "5")
					guest_passph = getg_wpas;
				else
					guest_passph = getg_radiusSecret;
				
			}
			else
			{
				guest_ssid = s_gssid_an;
				if(wla_sectype_an == "1")
					guest_passph = "NONE";
				else if(wla_sectype_an == "2")
					guest_passph = wla_key1_an;
				else if(wla_sectype_an == "3")
					guest_passph = getg_wpa1_an;
				else if(wla_sectype_an == "4")
					guest_passph = getg_wpa2_an;
				else if(wla_sectype_an == "5")
					guest_passph = getg_wpas_an;
				else
					guest_passph = getg_radiusSecret_an;
			}

			if(guest_passph.length>=10)
			{
				guest_passph = guest_passph.substr(0,10) + "..." ;
			}
			document.write('<div id="guestNetwork_stat" class="icon_long_status"><marquee behavior="scroll" onmouseover=stop() onmouseout=start()>SSID: <b>'+guest_ssid+'</b><br/>Password: <b>'+guest_passph+'</b></marquee></div>');
			setIconClass_noDouble( "guestNetwork_stat", "Password: "+guest_passph)

		}
		//}

		</script>
		</div><!-- guest -->		
</div><!-- form_content -->
</div><!-- form -->
</form>
</body>
</html>
<!--div class="icon_status"><b>Warning</b> <a></a></div-->
<!--<div class="icon_status"><b>Error</b> <a> </a></div> -->
