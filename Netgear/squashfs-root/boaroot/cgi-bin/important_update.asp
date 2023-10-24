<%
if request_Form("submit_flag") = "1" then
	tcWebApi_set("WanLanConflict_Entry","ImportUpdateFlag","clear")
end if
%>

<HTML>
<HEAD>
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title><%tcWebApi_get("SkuId_Entry","ProductName","s")%></title>
<META http-equiv=content-type content='text/html;charset=UTF-8'>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<style type="text/css">
body{ background-image: url(/image/top-oneline.gif); background-repeat: repeat-x; background-color: #e5e5e5;}
.container_center{width: 820px; height: 100%; position: absolute; top: 0px; RIGHT: 20px; LEFT: 20px; }
.container_left{width: 820px; height: 100%; position: absolute; top: 0px; }
#top{width: 820px; height: 97px;}
#logo{ width: 300px; height: 38px; background-image: url(/image/top/logo.gif); position: absolute; left : 0px; top: 5px;}
#logo_img{ width: 300px; height: 52px; background-image: url(/image/top/top_logo_img.gif); position: absolute; left : 320px; top: 5px;}
#router-name{position:absolute; left: 0px; top: 40px; font-family: Arial; font-size: 18px; font-weight: Bold; color: #000000; text-align: left; }
#firm_version{ position:absolute; right: 0px; top: 30px; font-family: Arial; font-size: 14px; font-weight: Bold; color: #000000; text-align: right; }
#middle{ margin-top:20px; width: 820px; height:350px; }
p{ margin:50 100 50 100; font: 18px arial; color: #323232;}
.button{ float: left; width: 760px; height: 42px;}
.common_button_short{ float: left; width:99px; height: 22px; background-image: url(/image/button/test.gif); background-repeat: no-repeat; position:relative;  top: 10px; color: #f2f2f2; font-family: Arial; font-weight: Bold; font-size: 14px; text-align: center; cursor:pointer;}
.reboot{ position: relative; margin: 9px 57px; width: 180px; height: 22px; background: transparent url(../image/button/advanced_home_button.gif) left bottom no-repeat; color: #f2f2f2; font-family: Arial; font-weight: Bold; font-size: 14px; text-align: center; line-height: 22px; background-color: transparent; border: none; cursor: pointer; padding-bottom: 2px;}
</style>
<script>
/* Language string */
var important_update_str="<%tcWebApi_multilingual("1","important_update_str")%>";
var to_avoid_conflict_str="<%tcWebApi_multilingual("1","to_avoid_conflict_str")%>";
var you_must_update_ip_addresses_str="<%tcWebApi_multilingual("1","you_must_update_ip_addresses_str")%>";
var str_fireware_name="<%tcWebApi_multilingual("1","str_fireware_name")%>";
if(important_update_str=="")
{
	important_update_str="Important Update";
	to_avoid_conflict_str="To avoid a conflict with your Internet Service Provider, your router's IP address has been updated to ";
	you_must_update_ip_addresses_str="You must now update the IP addresses in your router's configuration settings for each relevant service,such as port forwarding and IP address reservation.";
	str_fireware_name="Router Firmware Version";
}

function goto_prevURL()
{
	var cf = document.forms[0];
	cf.submit();
}
function loadvalue()
{
	<% if request_Form("submit_flag") = "1" then %>
	location.href="http://"+window.location.hostname;
	<% end if %>
}
</script>
</HEAD>
<BODY onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/important_update.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<div id="container" class="container_center">
<div id="top">
<div id="logo"> </div>
<div id="logo_img"> </div>
<div id="router-name"><%tcWebApi_get("SkuId_Entry","ProductName","s")%></div>
<div id="firm_version"><script>document.write(str_fireware_name);</script><br /><%tcWebApi_get("DeviceInfo","BasicInfo_FwVer","s")%></div>
</div>
<input type="hidden" name="submit_flag" value="1">
<input type="hidden" name="clear" value="0">
<div id="middle" align="left">
<br>
        <p><font color=red size=5 ><B><script>document.write(important_update_str);</script></B></font></p>
        <p><font size=3><script>document.write(to_avoid_conflict_str);</script><%tcWebApi_get("Lan_Entry0","IP","s")%>.</font></p>
		<p><font size=3><script>document.write(you_must_update_ip_addresses_str);</script></font></p>
		<p><div align="center"><input type=button class="reboot" value="<%tcWebApi_multilingual("0","glbstr_continue")%>" onclick="goto_prevURL();"></div></p>
</div>
</div>
</form>
</body>
</HTML>