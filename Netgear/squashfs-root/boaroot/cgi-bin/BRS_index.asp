
<html>

<head>
<title><%tcWebApi_multilingual("0","glbstr_title")%></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<link rel="stylesheet" type="text/css" href="/style/hijack_style.css" />
<script language="javascript" type="text/javascript" src="/script/brs_hijack.js"></script>
<script language="javascript" type="text/javascript" src="/script/brs_hijack_index.js"></script>
<script language="javascript" type="text/javascript" src="/aye_utils.js"></script>
<script language="javascript" type="text/javascript">
var dns_hijack = "<%if tcWebApi_get("Dproxy_Entry","dnshijack_flag","h") = "N/A" then asp_write("1") else tcWebApi_get("Dproxy_Entry","dnshijack_flag","s") end if %>";
var lanip = ('<%If tcWebApi_get("Lan_Entry","IP","h") <> "N/A" then tcWebApi_get("Lan_Entry","IP","s") end if%>') ;
var from_restore = "0";
var from_nowan = "0";
var download_genie="0";
var download_vault="0";



</script>
</head>

<body>

<div id="page_container">

	<div id="header">
		<iframe id="header_frame" allowtransparency="true" height="97px" width="980px" scrolling="no" frameborder="0" class="header_frame" src="/cgi-bin/BRS_top.asp">
		</iframe>
	</div>
	
	<div class="wizard_body_container">
		<iframe name="formframe" id="content_frame" allowtransparency="true" height="100%" width="100%" scrolling="no" frameborder="0" class="body_frame">
		</iframe>
	</div>
	
	<div class="bottom_margin"></div>

</div>

</body>

</html>
