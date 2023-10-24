
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/passwd.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/check_password.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="">

<div class="page_title">Set Password</div>
<div id="main" class="main">
<!--TR>
	<TD nowrap colspan=2><H1>Set Password</H1></TD>
</TR-->
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<div id="msg"></div>
<script>
function getObj(name)
{
	if (document.getElementById)
	{
		return document.getElementById(name);
	}
	else if (document.all)
	{
		return document.all[name];
	}
	else if (document.layers)
	{
		return document.layers[name];
	}
}

function show_userpasswd_error()
{
	getObj("msg").innerHTML="";
	getObj("msg").innerHTML="<TR><TD nowrap colspan=2 align=center><BR>The old password is wrong!<BR><BR></TD></TR>"+
				"<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>";
}

function goback()
{
	location.href="PWD_password.asp";
}

show_userpasswd_error();
setTimeout("goback();",3000);
</script>
</div>
</FORM>
</BODY>
</HTML>
