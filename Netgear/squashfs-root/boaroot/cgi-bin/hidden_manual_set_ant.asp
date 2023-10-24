
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/hidden_manual_set_ant.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="manual_set_ant">

<div class="page_title">Antenna Configurations</div>
<div id="main" class="main">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<script>
function loadvalue()
{
	var form=document.forms[0];
	var ant_g_mode="1";
	var ant_a_mode="1";
	var ant_g_select="1";
	var ant_a_select="2";

	if( ant_g_mode == "0" )
		form.gn_mode.options[0].selected = true;
	else
		form.gn_mode.options[1].selected = true;

	if( ant_a_mode == "0" )
		form.an_mode.options[0].selected = true;
	else
		form.an_mode.options[1].selected = true;

	form.gn_group[parseInt(ant_g_select)-1].checked=true;
	form.s_g_group.value=ant_g_select;
	form.an_group[parseInt(ant_a_select)-1].checked=true;
	form.s_a_group.value=ant_a_select;

	chg_g_mode();
	chg_a_mode();		
}
function chg_g_mode()
{
	var form=document.forms[0];
	if( form.gn_mode.value == 0 )
		setDisabled(true,form.gn_group[0],form.gn_group[1],form.gn_group[2],form.gn_group[3]);
	else
		setDisabled(false,form.gn_group[0],form.gn_group[1],form.gn_group[2],form.gn_group[3]);

}
function chg_a_mode()
{
	var form=document.forms[0];
	if( form.an_mode.value == 0 )
		setDisabled(true,form.an_group[0],form.an_group[1],form.an_group[2],form.an_group[3]);
	else
		setDisabled(false,form.an_group[0],form.an_group[1],form.an_group[2],form.an_group[3]);
}
function click_apply()
{
	var form=document.forms[0];
	if( form.gn_mode.value == 1 )
		for( i=0; i<4; i++ )
			if(form.gn_group[i].checked == true)
				form.s_g_group.value= i + 1;
	if( form.an_mode.value == 1 )
		for( i=0; i<4; i++ )
			if(form.an_group[i].checked == true)
				form.s_a_group.value= i + 1;
	
	return true;
}
</script>
<input type="hidden" name="s_g_group">
<input type="hidden" name="s_a_group">

<TR>
	<TD nowrap>g/n antenna mode:</TD>
	<TD nowrap>a/n antenna mode:</TD>
</TR>
<TR>
	<TD nowrap>
	<select name="gn_mode" size="1" onchange="chg_g_mode();" >
		<option value=0>Auto</option>
		<option value=1>Manual</option>
	</TD>
	<TD nowrap>
	<select name="an_mode" size="1" onchange="chg_a_mode();">
		<option value=0>Auto</option>
		<option value=1>Manual</option>
	</TD>
</TR>
<TR>
	<TD nowrap>manual selection:</TD>
	<TD nowrap>manual selection:</TD>
</TR>
<TR>
        <TD nowrap><input type="radio" name="gn_group" value="1">Antenna group1</TD>
        <TD nowrap><input type="radio" name="an_group" value="1">Antenna group1</TD>
</TR>
<TR>
        <TD nowrap><input type="radio" name="gn_group" value="2">Antenna group2</TD>
        <TD nowrap><input type="radio" name="an_group" value="2">Antenna group2</TD>
</TR>
<TR>
        <TD nowrap><input type="radio" name="gn_group" value="3">Antenna group3</TD>
        <TD nowrap><input type="radio" name="an_group" value="3">Antenna group3</TD>
</TR>
<TR>
        <TD nowrap><input type="radio" name="gn_group" value="4">Antenna group4</TD>
        <TD nowrap><input type="radio" name="an_group" value="4">Antenna group4</TD>
</TR>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<TR>
	<TD nowrap colspan=2 align=center>
	<input class="cancel_bt" type='button' name="Cancel" value='Cancel' onClick='location.href="hidden_manual_set_ant.asp";'>&nbsp;&nbsp;
	<input class="apply_bt" type='submit' name="Apply" value='Apply' onClick='return click_apply();'>
	</TD>
</TR>

</TABLE>
</div>

</FORM>
</BODY>
</HTML>
