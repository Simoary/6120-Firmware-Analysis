<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html><head><link rel="stylesheet" href="/style/top.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/top.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();">
<form method="POST" action="/cgi-bin/lang_check.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="select_language">


<script>
var language_oriArray = "English German Chinese Korean Russian Spanish Polish French Italian Swedish Danish Dutch Greek Norwegian Czech Slovenian Portuguese Hungarian Romanian Finnish Slovak".split(" ");
var language_showArray="English Deutsch 中文 한국어 Русский Español Polski Français Italiano Svenska Dansk Nederlands Ελληνικά Norsk Čeština Slovenščina Português Magyar Română Suomi Slovenčina".split(" ");
var gui_region = "English";
var lang_select = "Auto";
var type = parent.type;

function loadvalue()
{
	if(lang_select != "Auto")
		document.forms[0].lang_avi.value = gui_region;
	else
		document.forms[0].lang_avi.value = lang_select;

	document.forms[0].lang_avi.disabled = true;

	if(top.formframe.location.href.indexOf("lang_check.asp") != -1)
		top.formframe.location.href = "pls_wait_updateLanguage.asp";

	//load_top_value();
        var upgrade_div = document.getElementById("update_info");
        var basic_label = document.getElementById("basic_label");
        var advanced_label = document.getElementById("advanced_label");

	upgrade_div.style.display = "none";
        if(type == "basic")
        {
                setLabelClass(basic_label, "label_click");
                setLabelClass(advanced_label, "label_unclick");
        }
        else if(type == "advanced")
        {
                setLabelClass(basic_label, "label_unclick");
                setLabelClass(advanced_label, "label_click");
        }

}
</script>

<input type=hidden name=hidden_lang_avi>
<div id="logo"></div>
<div id="router-name">WNDR3800</div>
<div id="labels">
	<div id="basic_label" class="label_unclick"><b><span>BASIC</span></b></div>
	<div id="space_label"></div>
	<div id="advanced_label" class="label_unclick"><b><span>ADVANCED</span></b></div>
</div>
<div id="firm_version">Router Firmware Version<br />V1.0.0.13</div>
<div id="update_info" class="update_info_down">
	<i class="i_normal">A new firmware upgrade is available. Click here to get it.</i></div>
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

