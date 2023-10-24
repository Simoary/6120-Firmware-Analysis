<html>
<head>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<link rel="stylesheet" type="text/css" href="/style/hijack_style.css" />
<link rel="stylesheet" type="text/css" href="/style/hijack_success.css" />
<script language="javascript" type="text/javascript" src="/script/brs_hijack.js"></script>
<script language="javascript" type="text/javascript" src="/script/brs_hijack_success.js"></script>
</head>

<body>
<form action="NETGEAR_WNDR3700.cfg" method="post" enctype="multipart/form-data">
<script language="javascript" type="text/javascript">
/*init download_genie and download_vault*/
parent.download_genie="0";
parent.download_vault="0";

function toInternet()
{
	this.parent.location.href = "BRS_top.asp";

	return true;
}
function func_exit()
{
	var next_page = "http://www.netgear.com/success/generic.aspx";
	var winoptions = "width=960,height=800,menubar=yes,scrollbars=yes,toolbar=yes,status=yes,location=yes,resizable=yes";
	window.open(next_page,null,winoptions);
}
function func_previous()
{
	location.href = "/cgi-bin/BRS_success.asp";
}
function func_next()
{
	//location.href = "/cgi-bin/BRS_more_2.asp";
	var cf = document.forms[0];
	if(cf.genie.checked==true)
		parent.download_genie="1";
	if(cf.vault.checked==true)
		parent.download_vault="1";
		
	if(parent.download_genie=="1")	
		location.href = "/cgi-bin/BRS_download_genie.asp";
	else if(parent.download_vault=="1")	
		location.href = "/cgi-bin/BRS_download_vault.asp";
	else
		location.href = "/cgi-bin/BRS_check_new_fw_language_pre.asp";
}

var download_the_following_str= "<%tcWebApi_multilingual("1","download_the_following_str")%>";
if(download_the_following_str=="")
	download_the_following_str="Download the following router apps:";	

	
var genie_app_str= "<%tcWebApi_multilingual("1","genie_app_str")%>";
if(genie_app_str=="")
	genie_app_str="genie app. A personal dashboard that lets you monitor, control, and repair your home network.";
	
var readyshare_valut_str= "<%tcWebApi_multilingual("1","readyshare_valut_str")%>";
if(readyshare_valut_str=="")
	readyshare_valut_str="ReadySHARE Vault app (Only for Windows computers). Enables automatic continuous backup of a Windows computer to a USB drive that’s connected to your router.";	
	
	var previous_str= "<%tcWebApi_multilingual("1","previous_str")%>";
if(previous_str=="")
	previous_str="Previous";	
</script>

<div class="wizard_content_div">
	</br></br>
	<div id="words_div_success" class="wizard_words_div">
		<h1><script>document.write(download_the_following_str);</script></h1></br></br>
		<input name='genie' type="checkbox" checked>  <script>document.write(genie_app_str);</script></input><br/><br/><br/>
		<input name='vault' type="checkbox" checked>  <script>document.write(readyshare_valut_str);</script></input>
	</div>
	</br></br></br></br></br></br>
	<div id="allBtns_div" class="wizard_buttons_div">
		<div id="btnsContainer_div1" class="buttons_img_div" align="center" onclick='return func_exit();'>
				<img src="/image/ca-little-purple-button.gif" />
				<div class="buttons_words_div" id="print"><%tcWebApi_multilingual("0","glbstr_exit")%></div>
		</div>
		<div id="btnsContainer_div2" class="buttons_img_div" align="center" onclick='return func_previous();'>
				<img src="/image/ca-little-purple-button.gif" />
				<div class="buttons_words_div" id="print"><script>document.write(previous_str);</script></div>
		</div>
		<div id="btnsContainer_div3" class="buttons_img_div" align="center" onclick='return func_next();'>
				<img src="/image/ca-little-purple-button.gif" />
				<div class="buttons_words_div" id="print"><%tcWebApi_multilingual("0","glbstr_next")%></div>
		</div>
	</div>
</div>

</form>
</body>

</html>
