<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>
<script>
var new_version = "<%tcWebApi_get("AutoUpgrade_Entry","NewVersionFound","s")%>";
var new_lang_version = "<%if tcWebApi_get("AutoUpgrade_Entry","NewLangVersionFound","h") <> "N/A" then tcWebApi_get("AutoUpgrade_Entry","NewLangVersionFound","s") else asp_write("0") end if%>";

if(new_version=="1"||new_lang_version=="1")
	location.href="/cgi-bin/UPG_check_version_hidden.asp";
else
	location.href="/cgi-bin/AUTO_upgrade_noversion.asp";
</script>

<BODY onLoad="loadhelp('_upgrade');" bgcolor=#ffffff>
</BODY>
</HTML>
