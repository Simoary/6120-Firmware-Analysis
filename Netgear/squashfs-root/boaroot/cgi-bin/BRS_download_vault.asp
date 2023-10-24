<html>
<head>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<link rel="stylesheet" type="text/css" href="/style/hijack_style.css" />
<link rel="stylesheet" type="text/css" href="/style/hijack_success.css" />
<script language="javascript" type="text/javascript" src="/script/brs_hijack.js"></script>
</head>

<body>
<form action="NETGEAR_WNDR3700.cfg" method="post" enctype="multipart/form-data">
<style type="text/css">
	#allBtns_div { width:600px;  margin:10px auto;}

	#allBtns_div .success_buttons_split { height:30px; width:10%; margin:0px 0px; float:left; }

	#btnsContainer_div1 { width:30%; float:right;}
	.gray_font{font-size: 12px;font-weight: Bold;color:gray;}
	.normal_font{font-size: 12px;}
</style>
<script language="javascript" type="text/javascript">
setTimeout('location.href="http://updates1.netgear.com/readysharevault/ReadySHAREVault-install.exe";',1000);
function func_next()
{		
	location.href = "/cgi-bin/BRS_check_new_fw_language_pre.asp";
}

var system_install_str= "<%tcWebApi_multilingual("1","system_install_str")%>";
if(system_install_str=="")
	system_install_str="System will install";
	
var genie_app_str= "<%tcWebApi_multilingual("1","genie_app_str")%>";
if(genie_app_str=="")
	genie_app_str="genie app. A personal dashboard that lets you monitor, control, and repair your home network.";
	
var readyshare_valut_str= "<%tcWebApi_multilingual("1","readyshare_valut_str")%>";
if(readyshare_valut_str=="")
	readyshare_valut_str="ReadySHARE Vault app (Only for Windows computers). Enables automatic continuous backup of a Windows computer to a USB drive that’s connected to your router.";	
	
var click_run_str= "<%tcWebApi_multilingual("1","click_run_str")%>";
if(click_run_str=="")
	click_run_str="Click Run to start installing";

var after_the_installation_str= "<%tcWebApi_multilingual("1","after_the_installation_str")%>";
if(after_the_installation_str=="")
	after_the_installation_str="After the installation, please click Next.";	
	
var desktop_str= "<%tcWebApi_multilingual("1","desktop_str")%>";
if(desktop_str=="")
	desktop_str="Desktop genie";
</script>

<div class="wizard_content_div">
	<div id="words_div_success" class="wizard_words_div">
		<h1><script>document.write(system_install_str);</script></h1>
		<P><span class="normal_font"><script>document.write(genie_app_str);</script></span></P>
		<P><span class="gray_font"><script>document.write(readyshare_valut_str);</script></span></P>
		<p><span><script>document.write(click_run_str);</script></span> <span id="genie" style="display:none"><script>document.write(desktop_str);</script></span><span id="readyshare" style="display:none">ReadySHARE Vault</span>.</p>
		<p><span><script>document.write(after_the_installation_str);</script></span></p>
	</div>
	<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" alt="waiting" /></div>
	<div id="allBtns_div" class="wizard_buttons_div">
		<div id="btnsContainer_div3" class="buttons_img_div" align="center" onclick='return func_next();'>
				<img src="/image/ca-little-purple-button.gif" />
				<div class="buttons_words_div" id="print"><%tcWebApi_multilingual("0","glbstr_next")%></div>
		</div>
	</div>
</div>

</form>
</body>

</html>
