<%
if request_Form("submit_flag") = "select_language" then
	tcWebApi_set("LanguageSwitch_Entry","Language_New_Selection","hidden_lang_avi")
	tcWebApi_set("LanguageSwitch_Entry","Browser_Language","Browser_Language")
	tcWebApi_set("LanguageSwitch_Entry","Language_Auto_Switch_Flag","lang_firstcheck")
	tcWebApi_commit("LanguageSwitch_Entry")
end if
%>
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<meta content="MSHTML 6.00.2800.1141" name="GENERATOR">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/welcomeok.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="change_language">

<input type=hidden name=hidden_lang_avi>
<input type=hidden name=browser_or_top>
<input type=hidden name=language_in_flash>
<script>
var GUI_Region="<%if tcWebApi_get("LanguageSwitch_Entry","GUI_Region","h") = "N/A" then asp_write("Auto") else tcWebApi_get("LanguageSwitch_Entry","GUI_Region","s") end if%>";
var language_list='1 2 3 4 5 6';
var dis_lang_crl="<%if tcWebApi_get("LanguageSwitch_Entry","Enable_GUIStringTable","h") = "N/A" then asp_write("1") else tcWebApi_get("LanguageSwitch_Entry","Enable_GUIStringTable","s") end if%>";
var new_language="<%if tcWebApi_get("LanguageSwitch_Entry","Language_New_Selection","h") = "N/A" then asp_write("1") else tcWebApi_get("LanguageSwitch_Entry","Language_New_Selection","s") end if%>";
var have_in_flash="<%if tcWebApi_get("LanguageSwitch_Entry","Has_In_Flash","h") = "N/A" then asp_write("0") else tcWebApi_get("LanguageSwitch_Entry","Has_In_Flash","s") end if%>";
var hwlink = "<% tcWebApi_get("AutoUpgrade_Entry","HW_link_status","s") %>";
var browser_lang="<%tcWebApi_get("LanguageSwitch_Entry","Browser_Language","s")%>";

if(new_language=="Auto")
new_language = browser_lang;

function changeBrowser_langage()
{
	if(hwlink=="0")
	{
		alert("<%tcWebApi_multilingual("1","no_internet_connection_str")%>");
		return;
	}
	else
	{
		form=document.forms[0];
		//location.href="pls_wait_updateLanguage.asp";
		form.action="/cgi-bin/pls_wait_updateLanguage.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
		form.submit();
	}	
}

function do_not_change()
{//not change language, Language_Selection regurn back to GUI_Region
	top.enable_action=1;
	form=document.forms[0];
	form.hidden_lang_avi.value=GUI_Region;
	form.submit_flag.value="select_language";
	form.submit();
	                                
}

function loadvalue()
{
	top.enable_action=0;
	if( (have_in_flash == "1" || have_in_flash == "2" ) && new_language != GUI_Region)
		parent.location.href="index.asp";
		
}

var browser_language_show;
var GUI_Region_show="English";
var language_nowArray="English German Chinese Korean Russian Spanish Polish French Italian Swedish Danish Dutch Greek Norwegian Czech Slovenian Portuguese Hungarian Romanian Finnish Slovak Turkish".split(" ");
var language_showArray="English Deutsch 中文 한국어 Русский Español Polski Français Italiano Svenska Dansk Nederlands Ελληνικά Norsk Čeština Slovenščina Português Magyar Română Suomi Slovenčina Türk".split(" ");

for (k=0; k<language_nowArray.length; k++)
{
	if (GUI_Region == language_nowArray[k])
		GUI_Region_show=language_showArray[k];
}

if (language_nowArray != "")
{
	for ( i=0; i<language_nowArray.length; i++)
	{
		if (have_in_flash == "1" || have_in_flash == "2")// defaul language not have warning.
			break;
		if (new_language == language_nowArray[i] && new_language != GUI_Region && dis_lang_crl == '1' )
		{
			browser_language_show=language_showArray[i];
			document.write("<BR><BR><TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR><BR><BR>");
			document.write("<%tcWebApi_multilingual("1","do_you_want_to_switch_from_str")%> <B>\""+GUI_Region_show+"\"</B> <%tcWebApi_multilingual("1","the_current_lang_str")%> <B>\""+browser_language_show+"\"</B>?");
			document.write("<BR><BR><TR><TD colspan=2><img src=/liteblue.gif width=100% height=12></TD></TR><BR><BR>");
			document.write('<BR><center><input type="button" name="yes" value="Yes" onclick="changeBrowser_langage();">&nbsp;<input type="button" name="no" value="No" onclick="do_not_change();"><BR></center>');
			break;
		}
	}
	if (i == language_nowArray.length || (new_language == GUI_Region))
		parent.location.href="index.asp";
}
</script>
</FORM>
</BODY>
</HTML>
