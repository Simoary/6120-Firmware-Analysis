<%
if request_Form("submit_flag") = "SN_check" then
	tcWebApi_set("Pwdrecovery_Entry","SN","serial_num")
	tcWebApi_commit("Pwdrecovery_Entry")
end if
%>

<HTML><HEAD><LINK rel="stylesheet" href="/style/form.css">
<TITLE>401 Authorization</TITLE> 
<META http-equiv=content-type content='text/html; charset=UTF-8'>
<script>


function loadvalue()
{
	var enable_recovery="<%if tcWebApi_get("Pwdrecovery_Entry","Active","h") <> "N/A" then tcWebApi_get("Pwdrecovery_Entry","Active","s") else asp_write("No") end if %>";
	var if_match="0";

	<%if request_Form("submit_flag") = "SN_check" then%>
	var last_enter_sn="<%tcWebApi_get("Pwdrecovery_Entry","SN","s")%>";
	var match_1="<%tcWebApi_get("SkuId_Entry","TE_serialnum","s")%>";
	var match_2="<%tcWebApi_get("Pwdrecovery_Entry","SN","s")%>";
	if_match="<%if tcWebApi_get("SkuId_Entry","TE_serialnum","h") = tcWebApi_get("Pwdrecovery_Entry","SN","h") then asp_write("1") else asp_write("0") end if %>";
	<%end if%>

    if( enable_recovery == "Yes" )
    {
		document.getElementById("recovery").style.display="";
	<%if request_Form("submit_flag") = "SN_check" then%>		
		document.forms[0].serial_num.value=last_enter_sn;	
        if( if_match == "0" )
		{
            alert("<%tcWebApi_multilingual("1","alert_the_information_not_match_str")%>");
		}
		else
		{
			location.href="/cgi-bin/securityquestions.asp";
		}
	<%end if%>			
    }
    else
    {
		document.getElementById("recovery").style.display="none";
    }
}

function checkSN(cf)
{
	cf.submit_flag.value = "SN_check";
	return true;
}

</script>
</HEAD>
<BODY onLoad="loadvalue()"><H1> <%tcWebApi_multilingual("1","authorized_str")%></H1>
<%tcWebApi_multilingual("1","access_to_this_resource_str")%>

<div id="recovery" style="display: none">
<form method="post" action="/cgi-bin/unauth.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<INPUT type=hidden name=submit_flag value="">
<p><%tcWebApi_multilingual("1","we_can_help_you_str")%></p>
<p><%tcWebApi_multilingual("1","enter_router_serial_number_str")%> 
<input type="text" size="13" maxlength="13" name="serial_num" value=""><br/>
<%tcWebApi_multilingual("1","you_can_find_it_str")%>
</p>
<p><input class="cancel_bt" type='reset' name="Cancel" value=' <%tcWebApi_multilingual("0","glbstr_cancel")%> ' onClick='location.href="unauth.asp";'>&nbsp;&nbsp;
<input class="apply_bt" type="submit" name="continue" value=" <%tcWebApi_multilingual("1","continue_str")%> " onClick="return checkSN(document.forms[0])"></p></form>
</div>
</BODY></HTML>