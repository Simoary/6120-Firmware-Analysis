
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/USB_NETStorage.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/USB_Browse_bottom.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="browser_apply">

<script>
<!--
var sda_U0="/mnt/sda1*U";
var sda_num=1;

var dirve ="<%tcWebApi_get("FolderTree_Common","CurrMountName","s")%>";
function click_ok()
{
	var str=document.forms[0].folder_path.value;
	var info = str.split("/");
	var selectpath='';
	for(i=4;i<info.length;i++)
	{
		if(i>4)
			selectpath+='\\';
		selectpath += info[i];
	}
	
	//var path=selectpath.replace(/\//g,"\\");
	var rootpath = dirve.split(" ")[0];
	var path = rootpath+":\\"+selectpath;
	top.window.opener.document.forms[0].folder.value=path;
	
	closeBrowserwindow();/* to fix bug 24964 */
}
-->

</script>
<input type=hidden name=folder_path value="">
<table width=100%% boder=0 cellpadding=0 sellspacing=3>
<!--16168  <TR><TD colspan=2><img src="/liteblue.gif" width=100%% height=12></TD></TR> -->
<TR><TD colspan=2  align=center>
<!--	<input type="text" name=folder_path size="20"> -->
	<input class="apply_bt" type="button" name="Ok" id="ok" value="<%tcWebApi_multilingual("0","glbstr_ok")%>" onclick='click_ok();'>&nbsp;
	<!--input type="button" name="cancel" value="Cancel" onclick='closeBrowserwindow();' bug 22028:there no need "cancel" button-->
</TD></TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100%% height=12></TD></TR>
<TR><TD colspan=2 align=center>
<input class="cancel_bt" type="button" name="Close" id="close" value="  <%tcWebApi_multilingual("1","close_window_str")%>" onClick='closeBrowserwindow();'>
</TD></TR>  
</table>
</form>
</body>
</html>
