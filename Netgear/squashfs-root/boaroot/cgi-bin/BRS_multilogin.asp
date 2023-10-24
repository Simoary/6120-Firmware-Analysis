
<html>

<head>
<title><%tcWebApi_multilingual("0","glbstr_netgear_router")%> <%tcWebApi_get("SkuId_Entry","ProductName","s")%> </title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<style type="text/css">
body{ background-image: url(/image/top-oneline.gif); background-repeat: repeat-x; background-color: #e5e5e5;}
.container_center{width: 820px; height: 100%; position: absolute; top: 0px; left: 50%; margin-left: -410px; }
.container_left{width: 820px; height: 100%; position: absolute; top: 0px; left: 0px; }
#top{width: 820px; height: 97px;}
#logo{ width: 300px; height: 38px; background-image: url(/image/top/logo.gif); position: absolute; left : 0px; top: 5px;}
#logo_img{ width: 300px; height: 52px; background-image: url(../image/top/top_logo_img.gif); position: absolute; left : 320px; top: 5px;}
#router-name{position:absolute; left: 0px; top: 40px; font-family: Arial; font-size: 18px; font-weight: Bold; color: #000000; text-align: left; }
#firm_version{ position:absolute; right: 0px; top: 30px; font-family: Arial; font-size: 14px; font-weight: Bold; color: #000000; text-align: right; }
#middle{ margin-top:20px; width: 820px; height:350px; }
p{ margin:50 100 50 100; font: 18px arial; color: #323232;}
.button{ float: left; width: 760px; height: 42px;}
.common_button_short{ float: left; width:99px; height: 22px; background-image: url(/image/button/test.gif); background-repeat: no-repeat; position:relative;  top: 10px; color: #f2f2f2; font-family: Arial; font-weight: Bold; font-size: 14px; text-align: center; cursor:pointer;}
#yes{position:relative;  left: 300px;}
#no{ position:relative;  left: 320px; }

.footer{ height: 43px; float: left; width: 820px; color: #ffffff; background-image: url(../image/footer/footer.gif); background-repeat: no-repeat; overflow:hidden;}
.footer_double{ height: 86px; float: left; width: 820px; color: #ffffff; background-image: url(../image/footer/footer_doub.gif); background-repeat: no-repeat;}
.footer b, .footer_double b{font: bold 16px arial;}
.footer a, .footer_double a{ color: #ffffff; font: normal 11px arial; text-decoration: none;}

.footer #support, .footer_double #support{ float:left; margin:auto auto auto 10px;line-height: 42px;}
.footer #search, .footer_double #search{float: right; margin:10px 10px auto auto;}

#footer #search .search_button{background: Transparent url(../image/footer/search_button.gif ) no-repeat; border: none; width:39px; height:22px; font: bold 14px arial ; color: #ffffff; cursor: pointer; }
#footer #search .search_button_middle{background: Transparent url(../image/footer/search_button_middle.gif ) no-repeat; border: none; width:65px; height:22px; font: bold 14px arial ; color: #ffffff; cursor: pointer; }
#footer #search .search_button_long{background: Transparent url(../image/footer/search_button_long.gif ) no-repeat; border: none; width:95px; height:22px; font: bold 14px arial ; color: #ffffff; cursor: pointer; }

</style>
<script language="javascript" type="text/javascript">
var multi_user_warning="<%tcWebApi_multilingual("1","multi_user_warning")%>";
var yes_mark="<%tcWebApi_multilingual("0","glbstr_yes")%>";
var no_mark="<%tcWebApi_multilingual("0","glbstr_no")%>";
var router_firmware_version="<%tcWebApi_multilingual("1","router_firmware_version")%>";
var exit_mark="<%tcWebApi_multilingual("1","exit_mark")%>";

function loadvalue()
{
	if( document.body.clientWidth < document.body.scrollWidth )
		document.getElementById("container").className="container_left";
	else
		document.getElementById("container").className="container_center";

	setFooterClass();
}
function login()
{
 /*   try
    {
      if(navigator.userAgent.indexOf("MSIE")>0)         //IE¯à
      {
        document.execCommand("ClearAuthenticationCache");
      }
      else if(isFirefox=navigator.userAgent.indexOf("Firefox")>0)       //Firefox
      {
        var xmlhttp = createXMLObject();
        xmlhttp.open("POST",".force_logout_offer_login_mozilla",true,"kickout","kickout");
        xmlhttp.send("");
        xmlhttp.abort();
      }
      else       //Google Chrome
      {
         var xmlHttp = false;
         if(window.XMLHttpRequest)
         {
            xmlHttp = new XMLHttpRequest();
         }
         xmlHttp.open("POST", "./", false, "kickout", "kickout");
         xmlHttp.send(null);
         xmlHttp.abort();
      }
    }
    catch(e)
    {
        alert("there was an error");
        return false;
    }
*/
	location.href="/cgi-bin/index.asp";
}
function no_login()
{
	window.open('', '_self', '');
	window.close();

	// bug24950
	//location.href="/cgi-bin/LGO_logout.asp";
}
function do_search()
{
        var key = document.forms[0].search.value.replace(/ /g,"%20");
        var winoptions = "width=960,height=800,menubar=yes,scrollbars=yes,toolbar=yes,status=yes,location=yes,resizable=yes";
        var url="http://kb.netgear.com/app/answers/list/kw/"+key;

        window.open(url,null,winoptions);
}

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
</script>
</head>


<BODY onLoad="loadvalue();" bgcolor=#ffffff>
<form>
<div id="container" class="container_center">
<div id="top">
<div id="logo"> </div>
<div id="logo_img"> </div>
<div id="router-name"><%tcWebApi_get("SkuId_Entry","ProductName","s")%></div>
<div id="firm_version"><script>document.write(router_firmware_version)</script><br /><%tcWebApi_get("DeviceInfo","BasicInfo_FwVer","s")%></div>
</div>
<div id="middle">
	<p><script>document.write(multi_user_warning)</script></p>

	<div class="button">
		<div id="yes" class="common_button_short" onClick="login();"> <script>document.write(yes_mark)</script> </div>
		<div id="no" class="common_button_short" onClick="no_login();"> <script>document.write(exit_mark)</script> </div>
	</div>
</div>

<div id="footer" class="footer">
<div id="support">
	<b> <%tcWebApi_multilingual("0","glbstr_help_support_str")%></b> &nbsp;
		<a target="_blank" href="http://downloadcenter.netgear.com"><%tcWebApi_multilingual("0","glbstr_documentation_str")%></a> | 
		<a target="_blank" href="http://support.netgear.com"><%tcWebApi_multilingual("0","glbstr_support_netgear_str")%></a> | 
		<a target="_blank" href="http://kb.netgear.com/app/answers/detail/a_id/12923"><%tcWebApi_multilingual("0","glbstr_router_faq_str")%></a>
</div>
<div id="search" align=right>
	<b> <%tcWebApi_multilingual("0","glbstr_search_help_str")%> </b>
	<input type="text" name="search" value="Enter Search Item" onKeyPress="detectEnter('num',event);" onFocus="this.select();" >
	<input id="search_button" class="search_button" type="button" name="dosearch" value="GO" onClick="do_search();">
</div>
</div>


</div>
</form>
</body>
</html>