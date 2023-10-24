
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/bas_mulpppoe.js"></script>
<script language=javascript type=text/javascript src="/mp_lang.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/BAS_update.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="mulpppoe_edit">

<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1>Multiple PPPoE</h1></td></tr>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>

<script>
var array_num=0;

str1_div="";
str2_div="";
str3_div="";
str4_div="";
var select_edit='';
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
function loadvalue()
{
	loadMPhelp("_BAS_mulpppoe");
	var cf=document.forms[0];
	str1_div=getObj("hidden_protocol").innerHTML;
	getObj("hidden_protocol").innerHTML='';
	str2_div=getObj("hidden_port").innerHTML;
	getObj("hidden_port").innerHTML='';
	str3_div=getObj("hidden_doname").innerHTML;
	getObj("hidden_doname").innerHTML='';
	str4_div=getObj("hidden_ip").innerHTML;
	getObj("hidden_ip").innerHTML='';
	var str = eval ( 'mulpppoeArray' + select_edit );
	var each_info=str.split(' ');
	cf.pppoe2_policy.value=each_info[0];
	cf.hidden_pppoe2_policy.value=each_info[0];
	setPolicy();
	if(each_info[0] == '0')
		cf.userdefined.value=each_info[1];
	else if(each_info[0] == '1')
	{
		cf.protocol.value=each_info[6];
		var start_array=each_info[2].split('.');
		var end_array=each_info[3].split('.');
		cf.start_ip1.value=start_array[0];
                cf.start_ip2.value=start_array[1];
                cf.start_ip3.value=start_array[2];
                cf.start_ip4.value=start_array[3];
              //  cf.end_ip1.value=end_array[0];
              //  cf.end_ip2.value=end_array[1];
              //  cf.end_ip3.value=end_array[2];
                cf.end_ip4.value=end_array[3];
	}
	else if(each_info[0] == '2')
	{
		cf.protocol.value=each_info[6];
		cf.portstart.value=each_info[4];
		cf.portend.value=each_info[5];
	}
		
}
</script>

<input type="hidden" name="hidden_pppoe2_policy">
<input type="hidden" name="hidden_userdefined">
<input type="hidden" name="hidden_ip_start">
<input type="hidden" name="hidden_ip_end">
<input type="hidden" name="hidden_portstart">
<input type="hidden" name="hidden_portend">
<input type="hidden" name="hidden_protocol_value">
<input type="hidden" name="ip_start">
<input type="hidden" name="ip_end">
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
  <tr>
	<td nowrap><script>document.write(policy_setting)</script></td>
	<td nowrap align=right>
		<SELECT name="pppoe2_policy" disabled onChange="setPolicy();">
			<option value="0"><script>document.write(pppoe2_domain_name)</script></option>
			<option value="1"><script>document.write(pppoe2_ip_protocol)</script></option>
			<option value="2"><script>document.write(pppoe2_port_protocol)</script></option>
			<option value="3"><script>document.write(pppoe2_ip_protocol)</script></option>	
		</SELECT>
	</td>
  </tr>
  </table>
  <div id="mul_protocol"></div>
  <div id="hidden_protocol" style="VISIBILITY:hidden;POSITION:absolute;">
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<tr>
		<td nowrap><script>document.write(block_ser_setup_pro)</script></td>	
		<td nowrap align=right> 
		<select NAME="protocol" size="1" >
			<option value="TCP"><script>document.write(block_ser_setup_tcp)</script></option>
			<option value="UDP"><script>document.write(block_ser_setup_udp)</script></option>
			<option value="TCP/UDP"><script>document.write(block_ser_setup_tcp_udp)</script></option> 
		</select>
		</td>
	</tr>
	</table>
  </div>	
  <div id="mul_port"></div>
  <div id="hidden_port" style="VISIBILITY:hidden;POSITION:absolute;">
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<tr>
		<td nowrap><script>document.write(block_ser_port_range)</script></td>
		<td nowrap align=right><input type="text" name="portstart" size="7" maxlength="5" onKeyPress="return getkey('num', event)"> --- 
		<input type="text" name="portend" size="7" maxlength="5" onKeyPress="return getkey('num', event)"></td>
	</tr>
	</table>
  </div>
  <div id="mul_doname"></div>
  <div id="hidden_doname" style="VISIBILITY:hidden;POSITION:absolute;">
<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<tr>
		<td nowrap><script>document.write(pppoe2_domain_name)</script></td>
		<td nowrap align=right><input type="text" name="userdefined" size="20" maxlength="30" onKeyPress="return getkey('apname', event)"></td>
	</tr>
	</table>
  </div>
  <div id="mul_ip"></div>
  <div id="hidden_ip" style="VISIBILITY:hidden;POSITION:absolute;">
<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<tr>	
	<td nowrap><br><script>document.write(block_ser_setup_ip_jp)</script></td>
	<td nowrap align=right>
        <input type="text" name="start_ip1"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);">.
        <input type="text" name="start_ip2"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);">.
        <input type="text" name="start_ip3"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);">.
        <input type="text" name="start_ip4"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);"> ---
        <input type="text" name="end_ip4"  size="3" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event)" onkeyup="keyup(event,this);">
        </td>
	</tr>
	</table>
  </div>
<TR><td colspan=2><img src="/liteblue.gif" width=100% height=12></td></TR>
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
  <TR>
    <TD align=center colSpan=3 nowrap>
      <script>document.write('<input type="submit"  value="'+add_mark+'" onClick="return check_mulpppoe_add(document.forms[0],\'edit\')">&nbsp;&nbsp;')</script>
<script>document.write("<input type='button' value='"+cancel_mark+"' onClick='location.href=\"bas_inter.asp\";'></TD>")</script>
  </TR>
  </table>
</TABLE>
</FORM>
</body>
</html>
