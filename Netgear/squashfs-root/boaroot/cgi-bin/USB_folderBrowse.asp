<%
if request_Form("submit_flag") <> "" then
	tcWebApi_set("FolderTree_Common","Action","submit_flag")
	tcWebApi_set("FolderTree_Common","NodeNumber","nodenumber")
	tcWebApi_set("FolderTree_Common","NodeValue","nodevalue")
	
	if request_Form("submit_flag") = "browser_open" then
		tcWebApi_set("FolderTree_Common","CurrentPath","currentpath")
		tcWebApi_set("FolderTree_Common","Clear","Clear")
	end if
	
	tcWebApi_commit("FolderTree_Entry")
end if 
%>


<html><head><link rel="stylesheet" href="/dtree.css">
<script language=javascript type=text/javascript src="/dtree.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/USB_folderBrowse.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type=hidden name=submit_flag value="browser_open">


<input type=hidden name=nodenumber >
<input type=hidden name=currentpath >
<input type=hidden name=nodevalue>
<input type=hidden name=Clear value=0>
<script>
var dirve ="<%tcWebApi_get("FolderTree_Common","CurrMountName","s")%>";
var num ="<%tcWebApi_get("FolderTree_Common","MountIdx","s")%>";
var ts = "<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>";

var node0 = "-1*My Router*1*/tmp/mnt*1";
var node1 = "0*"+dirve+"*1*/tmp/mnt*1";
<%tcWebApi_showUsbTree("0","showtree")%>

top.window.opener.document.forms[0].tshidden.value=ts;

var n=0; 
//new tree
d = new dTree('d',selectednode);
//add node
for( n=0; n<nodeNumber; n++){
	var str = eval( 'node' + n);
	str = str.replace( / /g,"&nbsp;");		
	echo_info = str.split('*');
	if(echo_info[0]=='0')
		d.add(n,echo_info[0],echo_info[1],echo_info[2],echo_info[4],'/sda.gif','/sda.gif');
	else
		d.add(n,echo_info[0],echo_info[1],echo_info[2],echo_info[4]);
}
//show all tree
document.write(d);
</script>

</form>
</body>
</html>
