<html>
<head>
<meta http-equiv="Refresh" content="3; url=wps_get_status.asp" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>
<body bgcolor="#ffffff">
<script>
var wps_status="<%If tcWebApi_get("Info_WLan","wlanWPSStatus","h") <> "N/A" then tcWebApi_get("Info_WLan","wlanWPSStatus","s") end if%>";
var wps_status_5g="<%If tcWebApi_get("Info_WLan11ac","wlanWPSStatus","h") <> "N/A" then tcWebApi_get("Info_WLan11ac","wlanWPSStatus","s") end if%>";
var client_name="";
parent.timestamp = "<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
</script>
</body>
</html>
