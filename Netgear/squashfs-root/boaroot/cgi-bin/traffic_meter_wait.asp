<%
                tcWebApi_set("TrafficMeter_Entry","restart_counter_time", "restart_counter_time")
                tcWebApi_commit("TrafficMeter_Entry")
%>
<HTML>
<HEAD>
<META http-equiv="Refresh" content="10; url=/cgi-bin/traffic.asp">
<META http-equiv="content-type" content='text/html; charset=UTF-8'>
<LINK rel="stylesheet" type="text/css" href="/style/hijack_style.css">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</HEAD>
<BODY bgcolor=#ffffff>
<div  align="center"><BR><BR><TR><TD align="center"><B><%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%></B></TD></TR><BR><BR></div>
<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" alt="waiting" /></div>
</BODY>
</HTML>
