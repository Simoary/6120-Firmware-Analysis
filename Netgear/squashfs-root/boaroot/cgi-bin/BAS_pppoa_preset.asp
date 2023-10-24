<%
if request_Form("submit_flag") <> "" then
	/* Use first PVC for IPv4 */
	if tcWebApi_get("Wan_Common","TransMode","h") = "ATM" then	
		tcWebApi_set("WebCurSet_Entry","wan_pvc","NUMBER_ZERO")
		tcWebApi_set("WebCurSet_Entry","nat_pvc","NUMBER_ZERO")
		tcWebApi_set("WebCurSet_Entry","wan_pvc_ext","NUMBER_ZERO")
		tcWebApi_set("WebCurSet_Entry","nat_pvc_ext","NUMBER_ZERO")
	else
		tcWebApi_set("WebCurSet_Entry","wan_pvc","NUMBER_TEN")
		tcWebApi_set("WebCurSet_Entry","nat_pvc","NUMBER_TEN")
		tcWebApi_set("WebCurSet_Entry","wan_pvc_ext","NUMBER_ZERO")
		tcWebApi_set("WebCurSet_Entry","nat_pvc_ext","NUMBER_ZERO")
	end if
end if
%>

<HTML>
<HEAD>
<META http-equiv="content-type" content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</HEAD>
<BODY onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/BAS_pppoa_preset.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="apply">
<input type=hidden name=NUMBER_ZERO value="0">
<input type=hidden name=NUMBER_ONE value="1">
<input type=hidden name=NUMBER_TEN value="10">

<script>
function loadvalue()
{
	<%if request_Form("submit_flag") <> "" then%>
	location.href="/cgi-bin/BAS_pppoa.asp";
	<%else%>
	var cf = document.forms[0];
	cf.submit();
	<%end if%>
}
</script>
</form>
</BODY>
</HTML>

