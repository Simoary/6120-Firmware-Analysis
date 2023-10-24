<html><head><link rel="stylesheet" href="/style/top.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/top.js"></script>
<title><%tcWebApi_multilingual("0","glbstr_netgear_router")%> <%tcWebApi_get("SkuId_Entry","ProductName","s")%> </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();">
<form method="POST" action="/cgi-bin/lang_check.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="select_language">


<script>
var language_oriArray="English German Chinese Korean Russian Spanish Polish French Italian Swedish Danish Dutch Greek Norwegian Czech Slovenian Portuguese Hungarian Romanian Finnish Slovak Turkish".split(" ");
var language_showArray="English Deutsch 中文 한국어 Русский Español Polski Français Italiano Svenska Dansk Nederlands Ελληνικά Norsk Čeština Slovenščina Português Magyar Română Suomi Slovenčina Türk".split(" ");
var gui_region="<%if tcWebApi_get("LanguageSwitch_Entry","GUI_Region","h") <> "N/A" then tcWebApi_get("LanguageSwitch_Entry","GUI_Region","s") end if%>";
var browser_lang="<%tcWebApi_get("LanguageSwitch_Entry","Browser_Language","s")%>";
var lang_select="<%if tcWebApi_get("LanguageSwitch_Entry","Language_Selection","h") = "N/A" then asp_write("Auto") else tcWebApi_get("LanguageSwitch_Entry","Language_Selection","s") end if%>";
var type=parent.type;
var dis_lang_crl="<%if tcWebApi_get("LanguageSwitch_Entry","Enable_GUIStringTable","h") = "N/A" then asp_write("1") else tcWebApi_get("AutoUpgrade_Entry","Enable_GUIStringTable","s") end if%>";
var auto_str="<%tcWebApi_multilingual("1","auto_str")%>";

/* Handle Lanuage Auto */
var first_time_check_auto="<%if tcWebApi_get("LanguageSwitch_Entry","Language_Auto_Switch_Flag","h") <> "N/A" then tcWebApi_get("LanguageSwitch_Entry","Language_Auto_Switch_Flag","s") else asp_write("0") end if%>";

//for firmware version checking
var wan_status="1";
var config_status=10000;
var updateFirmware=0;
var updateLanguage=0;

var new_version = "<%if tcWebApi_get("AutoUpgrade_Entry","NewVersionFound","h") <> "N/A" then tcWebApi_get("AutoUpgrade_Entry","NewVersionFound","s") else asp_write("0") end if%>";
var new_lang_version = "<%if tcWebApi_get("AutoUpgrade_Entry","NewLangVersionFound","h") <> "N/A" then tcWebApi_get("AutoUpgrade_Entry","NewLangVersionFound","s") else asp_write("0") end if%>";

function loadvalue()
{
	load_top_value();

	if(lang_select != "Auto")
		lang_select=gui_region;
	document.forms[0].lang_avi.value=lang_select;

	if( dis_lang_crl == "0" )
		document.forms[0].lang_avi.disabled=true;
		
	if(new_version=="1" || new_lang_version=="1")
	{
		var upgrade_div = document.getElementById("update_info");
		upgrade_div.style.display = "inline";
	}	
	
	if(lang_select=="Auto")
	{
		/* If select Auto and browser and current language is the same won't auto change.*/
		if(gui_region!=browser_lang)
		{
			if(gui_region=="N/A")
				gui_region="English";
			form.lang_avi.value="Auto";
			change_select();
		}	
	}	
}
</script>

<input type=hidden name=hidden_lang_avi>
<input type=hidden name=Language_Selection>
<input type=hidden name=Browser_Language>
<input type=hidden name=lang_firstcheck value="1">

<div id="logo"></div>
<div id="logo_img"></div>
<div id="logout" class="logout_bt" onclick='top.location.href="LGO_logout.asp";'><b><%tcWebApi_multilingual("1","logout_str")%></b></div>
<div id="router-name" id="router_name"><%tcWebApi_get("SkuId_Entry","ProductName","s")%></div>
<div id="labels">
	<div id="basic_label" class="label_unclick" onclick="goto_top('index.asp');"><b><span><%tcWebApi_multilingual("1","basic_str")%></span></b></div>
	<div id="space_label"></div>
	<div id="advanced_label" class="label_unclick" onclick="goto_top('adv_index.asp');"><b><span><%tcWebApi_multilingual("1","advanced_str")%></span></b></div>
</div>
<div id="firm_version" id="firm_version"><%tcWebApi_multilingual("1","router_fw_version_str")%><br /><%tcWebApi_get("DeviceInfo","BasicInfo_FwVer","s")%></div>

<div id="update_info" class="update_info_down" onclick="firmwareUpgrade();">
	<div id="update_info_left"></div>
	<div id="update_info_middle"><i><%tcWebApi_multilingual("1","a_new_fw_upgrade_str")%></i></div>
	<div id="update_info_right"></div>
</div>

<div id="select_language" align=right>
	<select align=right name="lang_avi" id="language" size=1 onChange="change_select();">
	<script language="javascript" type="text/javascript">
		languageShowlist();
	</script>
	</select>
</div>

</form>
</body>
</html>

