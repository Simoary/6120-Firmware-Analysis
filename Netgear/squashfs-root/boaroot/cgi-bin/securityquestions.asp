<%
if request_Form("submit_flag") = "sec_ques" then
	tcWebApi_set("Pwdrecovery_Entry","ans_1","answer1")
	tcWebApi_set("Pwdrecovery_Entry","ans_2","answer2")	
	tcWebApi_commit("Pwdrecovery_Entry")
end if
%>

<HTML><HEAD><title>Router Password Recovery</title>
<META http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<LINK rel="stylesheet" href="/style/form.css">
<script>


function loadvalue()
{
	var if_ans_1="0";
	var if_ans_2="0";
	var cf=document.forms[0];

	<%if request_Form("submit_flag") = "sec_ques" then%>
	if_ans_1="<%if tcWebApi_get("Pwdrecovery_Entry","ans_1","h") = tcWebApi_get("Pwdrecovery_Entry","answer_1","h") then asp_write("1") else asp_write("0") end if %>";
	if_ans_2="<%if tcWebApi_get("Pwdrecovery_Entry","ans_2","h") = tcWebApi_get("Pwdrecovery_Entry","answer_2","h") then asp_write("1") else asp_write("0") end if %>";	
   
    if( (if_ans_1 == "1") && (if_ans_2 == "1") )
	{
		cf.submit_flag.value = "result";	
		cf.action="/cgi-bin/passrec.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";
	    cf.submit();
	}
	else
	{
	    alert("<%tcWebApi_multilingual("1","alert_the_information_not_match_str")%>");
	}
	<%end if%> 	
}

</script>
<STYLE type="text/css">
TR{ FONT-FAMILY: Arial;}
}
</STYLE>
</HEAD>
<BODY onLoad="loadvalue()">
<form method="post" action="/cgi-bin/securityquestions.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">

<INPUT type=hidden name=submit_flag value="security_question">

<script>
var complete_security_answers="<%tcWebApi_multilingual("1","quest1_1")%>";
var answer_str="<%tcWebApi_multilingual("1","answer_str")%>";
var sec_que_str_1="<%tcWebApi_multilingual("1","sec_que_str_1")%>";
var sec_que_str_2="<%tcWebApi_multilingual("1","sec_que_str_2")%>";
var required_info_str="<%tcWebApi_multilingual("1","required_info_str")%>";


var quest1_1="<%tcWebApi_multilingual("1","quest1_1")%>";
var quest1_2="<%tcWebApi_multilingual("1","quest1_2")%>";
var quest1_3="<%tcWebApi_multilingual("1","quest1_3")%>";
var quest1_4="<%tcWebApi_multilingual("1","quest1_4")%>";
var quest1_5="<%tcWebApi_multilingual("1","quest1_5")%>";
var quest1_6="<%tcWebApi_multilingual("1","quest1_6")%>";
var quest1_7="<%tcWebApi_multilingual("1","quest1_7")%>";
var quest1_8="<%tcWebApi_multilingual("1","quest1_8")%>";
var quest1_9="<%tcWebApi_multilingual("1","quest1_9")%>";
var quest2_1="<%tcWebApi_multilingual("1","quest2_1")%>";
var quest2_2="<%tcWebApi_multilingual("1","quest2_2")%>";
var quest2_3="<%tcWebApi_multilingual("1","quest2_3")%>";
var quest2_4="<%tcWebApi_multilingual("1","quest2_4")%>";
var quest2_5="<%tcWebApi_multilingual("1","quest2_5")%>";
var quest2_6="<%tcWebApi_multilingual("1","quest2_6")%>";
var quest2_7="<%tcWebApi_multilingual("1","quest2_7")%>";
var quest2_8="<%tcWebApi_multilingual("1","quest2_8")%>";

function checkAnswer()
{
	document.forms[0].submit_flag.value = "sec_ques";
	return true;
}

</script>

<TABLE width="100%" border=0 cellpadding=0 cellspacing=3>
<TR><TD colSpan=2><H1>Router Password Recovery</H1></TD></TR>
<TR><TD colSpan=2></TD></TR>

<TR><TD colSpan=2><script>document.write(complete_security_answers)</script></TD></TR>
<TR><TD colSpan=2>&nbsp;</TD></TR>
<TR>
	<TD nowrap align="right" style="width: 250px;"><script>document.write(sec_que_str_1)</script>*:</TD>
	<TD nowrap align="left">
	<script>
		var ques1="<%tcWebApi_get("Pwdrecovery_Entry","question_1","s")%>";
		if(ques1 != "N/A")
		{
			var ques1_str = eval('quest1_' + ques1);
			document.write(ques1_str);
		}
		else
		{
			document.write("");
		}
	</script>
	</TD>
</TR>
<TR>
        <TD nowrap align="right"><script>document.write(answer_str)</script>*:</TD>
        <TD nowrap align="left">
		<input type="text" maxLength="64" size="30" name="answer1" onFocus="this.select();" >
        </TD>
</TR>
<TR>
	<TD nowrap align="right"><script>document.write(sec_que_str_2)</script>*:</TD>
	<TD nowrap align="left">
	<script>
		var ques2="<%tcWebApi_get("Pwdrecovery_Entry","question_2","s")%>";
		if(ques2 != "N/A")
		{
			var ques2_str = eval('quest2_' + ques2);
			document.write(ques2_str);
		}
		else
		{
			document.write("");
		}
	</script>
	</TD>
</TR>
<TR>
        <TD nowrap align="right"><script>document.write(answer_str)</script>*:</TD>
        <TD nowrap align="left">
                <input type="text" maxLength="64" size="30" name="answer2" onFocus="this.select();" >
        </TD>
</TR>
<TR><TD align="right"><script>document.write(required_info_str)</script></TD> <TD></TR></TR>
<TR><TD colSpan=2>&nbsp;</TD></TR>
<TR> <TD colSpan=2>
<p><input class="cancel_bt" type='reset' name="Cancel" value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick='location.href="securityquestions.asp";'>&nbsp;&nbsp;
<input class="apply_bt" type="submit" name="continue" value="<%tcWebApi_multilingual("0","glbstr_continue")%>" onClick="return checkAnswer()"></p>
</TD></TR>
</TABLE>
</form>
</BODY>
</HTML>

