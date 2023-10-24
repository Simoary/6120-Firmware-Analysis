<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<link rel="stylesheet" href="/style/top_style.css">

</head>
<style type="text/css">
.title_div{ height:55px; width:304px; margin:0; overflow:hidden; }
.title_div img{ position: absolute; left : 0px; top: 7px;}
.title_img_div{ height:55px; width:500px; margin:0; overflow:hidden; }
.title_img_div img{ position: absolute; left : 320px; top: 7px;}
.router_name_div {height:25px; width:200px; margin:0; overflow:hidden; font-family: Arial; font-size: 18px;	font-weight: Bold; color: #000000;}
</style>
<body>

<div id="header_top">
		
		<div class="top_name">
			<div class="title_div"><img src="/image/top/logo.gif" /></div>
			<div class="router_name_div"><%tcWebApi_get("SkuId_Entry","ProductName","s")%></div>
			<div class="title_img_div"><img src="/image/top/top_logo_img.gif" /></div>
		</div>
		
		<div id="firmware_version" class="firmware_version_div" style="display:none">
			<div align="right"><%tcWebApi_multilingual("1","router_fw_version_str")%></div>
			<div align="right"><%tcWebApi_get("DeviceInfo","BasicInfo_FwVer","s")%></div>
		</div>
		
</div>

</body>

</html>
