
<html><head><link rel="stylesheet" href="/style/form.css">
<title><%tcWebApi_multilingual("0","glbstr_netgear_router")%> <%tcWebApi_get("SkuId_Entry","ProductName","s")%> </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>

<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<BODY>
<BR>WAN connection type: <% if tcWebApi_get("WanInfo_Entry","Connetion","h") <> "" then tcWebApi_staticGet("WanInfo_Entry","Connetion","s")  end if %> 
<BR>Product model name: <%tcWebApi_get("SkuId_Entry","ProductName","s")%>
</BODY>
