<%
If request_Form("Now_cookie")<> "" then
	tcWebApi_set("Logout_Entry","NowCookieID","Now_cookie")	
	tcWebApi_commit("Logout_Entry")
End if	
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
#logo_img{ width: 300px; height: 52px; background-image: url(../image/top/top_logo_img.gif); position: absolute; left : 320px; top: 5px;}
#router-name{position:absolute; left: 0px; top: 40px; font-family: Arial; font-size: 18px; font-weight: Bold; color: #000000; text-align: left; }
#firm_version{ position:absolute; right: 0px; top: 30px; font-family: Arial; font-size: 14px; font-weight: Bold; color: #000000; text-align: right; }
#middle{ margin-top:20px; width: 820px; height:350px; }
p{ margin:50 100 50 100; font: 18px arial; color: #323232;}
.button{ float: left; width: 760px; height: 42px;}
.common_button_short{ float: left; width:99px; height: 22px; background-image: url(image/button/test.gif); background-repeat: no-repeat; position:relative;  top: 10px; color: #f2f2f2; font-family: Arial; font-weight: Bold; font-size: 14px; text-align: center; cursor:pointer;}
#yes{position:relative;  left: 300px;}
#no{ position:relative;  left: 320px; }

.footer{ width: 100%; height: 43px; float: left; color: #ffffff; position:absolute; bottom:0; }
.footer_double{ width: 100%; height: 86px; color: #ffffff; position:absolute; bottom:0; }
.footer_img { width: 100%; height: 100%; }
.footer b, .footer_double b{font: bold 16px arial;}
.footer a, .footer_double a{ color: #ffffff; font: normal 11px arial; text-decoration: none;}

.footer #support{ float:left; line-height: 42px; position: absolute; left: 10px; top: 0; }
.footer_double #support{ line-height: 42px; position: absolute; left: 10px; top: 0;}
.footer #search{ float: right; position: absolute; top: 10px; right: 10px;}
.footer_double #search{ float: right; position: absolute; bottom: 10px; right: 10px;}

#footer #search .search_button{background: Transparent url(../image/footer/search_button.gif ) no-repeat; border: none; width:39px; height:22px; font: bold 14px arial ; color: #ffffff; cursor: pointer; }
#footer #search .search_button_middle{background: Transparent url(../image/footer/search_button_middle.gif ) no-repeat; border: none; width:65px; height:22px; font: bold 14px arial ; color: #ffffff; cursor: pointer; }
#footer #search .search_button_long{background: Transparent url(../image/footer/search_button_long.gif ) no-repeat; border: none; width:95px; height:22px; font: bold 14px arial ; color: #ffffff; cursor: pointer; }

</style>

<script>

function change_height()
{	
	setFooterClass();
	var footer_div = document.getElementById("footer");
	var is_double = ( footer_div.className == "footer_double") ;

	if(isIE_or_Opera())
	{
		var height = document.body.clientHeight - 163;
		//alert(height);
		if( (height > 460 && !is_double) || (height > 503 && is_double) )
		{
			document.getElementById("middle").style.height = height;
		}
		else
		{
			document.getElementById("middle").style.height = is_double ? "498px" : "455px";
		}
		/* calculate the width */
		var width = document.body.clientWidth - 40;
		//alert(width);
		document.getElementById("top").style.width = width > 820 ? width : "820px" ;
		document.getElementById("middle").style.width = width > 820 ? width : "820px" ;
		document.getElementById("footer").style.width = width > 820 ? width : "820px" ;
	}
}

function do_search()
{
        var key = document.forms[0].search.value.replace(/ /g,"%20");
        var winoptions = "width=960,height=800,menubar=yes,scrollbars=yes,toolbar=yes,status=yes,location=yes,resizable=yes";
        var url="http://kb.netgear.com/app/answers/list/kw/"+key;

        window.open(url,null,winoptions);
}

/*
function setFooterClass()
{
        var footer_div = top.document.getElementById("footer");
        var content = footer_div.innerHTML.replace(/<\/?.+?>/g,"").replace(/[\r\n]/g, "").replace(/\s+/g, "");
        var content_len = content.length;

        if(content_len > 75)
                footer_div.className = "footer_double";
        else
                footer_div.className = "footer";

        var go_btn = top.document.getElementById("search_button");
        content_len = go_btn.value.length;

        if(content_len >= 7)
                go_btn.className = go_btn.className + "_long";
        else if(content_len >= 4)
                go_btn.className = go_btn.className + "_middle";
        else
                go_btn.className = go_btn.className;
}
*/

/*function doLoad()
{
	setTimeout("window.close()",1200);
}*/
</script>

</HEAD>
<BODY onLoad="loadvalue();" onResize="change_height();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/LGO_logout.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<script>
function loadvalue()
{
	
	var cf=document.forms[0];
	var tmp_cookie = new Array();
	tmp_cookie=document.cookie.split('=');
	clear_auth();
	setTimeout("window.close()",1200);
	/*
	<%if Request_form("logout_flag") = "1" then%>
		setTimeout("window.close()",1200);
		//clear_auth();
	<%else%>
		clear_auth();
		cf.Now_cookie.value = tmp_cookie[1];
		document.forms[0].logout_flag.value = 1 ;
		//cf.action = "/cgi-bin/LGO_logout.asp";
		cf.submit();
		return true;
	<%end if%>
	*/
	change_height();
}
function clear_auth()
{
    try
    {
      if(navigator.userAgent.indexOf("MSIE")>0)         //IE??器??注?功能
      {
        document.execCommand("ClearAuthenticationCache");
      }
      else       //Google Chrome等??器??注?功能
      {
         var xmlHttp = false;
         if(window.XMLHttpRequest)
         {
            xmlHttp = new XMLHttpRequest();
         }
         xmlHttp.open("GET", "./", false, "logout", "logout");
         xmlHttp.send(null);
         xmlHttp.abort();
      }
    }
    catch(e)
    {
        alert("there was an error");
        return false;
    }
    //parent.window.location = parent.window.location;
}

</script>
<div id="container" class="container_center">
<div id="top">
<div id="logo"> </div>
<div id="logo_img"> </div>
<div id="router-name"><%tcWebApi_get("SkuId_Entry","ProductName","s")%></div>
<div id="firm_version"><%tcWebApi_multilingual("1","str_fireware_name")%><br /><%tcWebApi_get("DeviceInfo","BasicInfo_FwVer","s")%></div>
</div>
<input type="hidden" name="logout_flag">
<input type="hidden" name="Now_cookie">
<div id="middle" align="center">
<br>
<table  border=0 cellPadding=0 cellSpacing=2 height="70%" width="90%">
<tbody>
<tr>
        <td>
        <div align=center>
        <b><font face="Arial, Helvetica, sans-serif" size=4><%tcWebApi_multilingual("1","str_thank_use")%></font></b>
        <p><font face="Arial, Helvetica, sans-serif" size=4><B><%tcWebApi_multilingual("1","str_goobye")%></B></font></p>
        </div>
        </td>
</tr>
</tbody>
</table>

</div>

<div id="footer" class="footer"> <img class="footer_img" src="/image/footer/footer.gif">
<div id="support">
	<b> <%tcWebApi_multilingual("0","glbstr_help_and_support")%></b> &nbsp;
		<a target="_blank" href="http://documentation.netgear.com/wndr3800/enu/202-10806-01/index.asp"><%tcWebApi_multilingual("0","glbstr_documentation_str")%></a> | 
		<a target="_blank" href="http://support.netgear.com"><%tcWebApi_multilingual("0","glbstr_support_netgear_str")%></a> | 
		<a target="_blank" href="http://kb.netgear.com/app/answers/detail/a_id/12923"><%tcWebApi_multilingual("0","glbstr_router_faq_str")%></a>
</div>
<div id="search" align=right>
	<b> <%tcWebApi_multilingual("0","glbstr_search_help")%> </b>
	<input type="text" name="search" value="Enter Search Item" onKeyPress="detectEnter('num',event);" onFocus="this.select();" >
	<input id="search_button" class="search_button" type="button" name="dosearch" value="GO" onClick="do_search();">
</div>
</div>


</div>
</form>
</body>
</HTML>
