<%
If request_Form("skeyword")<> "" then
	tcWebApi_set("UrlFilterd_Entry","BlockMode","skeyword")	
	tcWebApi_set("UrlFilterd_Entry","BlockURLList","Text")
	tcWebApi_set("UrlFilterd_Entry","TrustedIPEnable","Trusted_IP_Enable")
	if request_Form("Trusted_IP_Enable") = "1" then	
		tcWebApi_set("UrlFilterd_Entry","TrustedIPAddress","cfTrusted_IPAddress")
	end if	
	tcWebApi_commit("UrlFilterd_Entry")
	tcWebApi_save()
End if	
%>


<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/block_sites.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/BKS_keyword.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="block_sites">

<div class="page_title"><%tcWebApi_multilingual("1","block_sites_str")%></div>
<div class="fix_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
		<input class="cancel_bt" type="submit" name="Cancel" id="cancel" value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick=location.reload();return false;>&nbsp;&nbsp;
        <input class="apply_bt" type="submit" name="Apply" id="apply" value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick="return check_blocksites();">
        </TD>
</TR>
</TABLE>

</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>
 

<script>
var delete_str = "delete";
var clear_str = "clear";
var alert_invalid_ip_str="<%tcWebApi_multilingual("1","alert_invalid_ip_str")%>";
var alert_the_trusted_ip_be_same_subent_str="<%tcWebApi_multilingual("1","alert_the_trusted_ip_be_same_subent_str")%>";
var alert_support_only_255_keyword_str="<%tcWebApi_multilingual("1","alert_support_only_255_keyword_str")%>";
var alert_invalid_keyword_str="<%tcWebApi_multilingual("1","alert_invalid_keyword_str")%>";
var alert_existed_keyword_str="<%tcWebApi_multilingual("1","alert_existed_keyword_str")%>";

var lan_ip="<%if tcWebApi_get("Lan_Entry","IP","h") <> "N/A" then tcWebApi_get("Lan_Entry","IP","s") else asp_write("192.168.1.1") end if%>";
var lan_subnet="<%if tcWebApi_get("Lan_Entry","netmask","h") <> "N/A" then tcWebApi_get("Lan_Entry","netmask","s") else asp_write("255.255.255.0") end if%>";
		
function loadvalue()
{
	passForm=document.forms[0];
	var selectnum='<%if tcWebApi_get("UrlFilterd_Entry","BlockMode","h") <> "N/A" then tcWebApi_get("UrlFilterd_Entry","BlockMode","s") end if%>';
	var bs_trustedip='<%if tcWebApi_get("UrlFilterd_Entry","TrustedIPAddress","h") <> "N/A" then tcWebApi_get("UrlFilterd_Entry","TrustedIPAddress","s") end if%>';
	show_trustedip();	
	if( selectnum == "perschedule" )
		passForm.skeyword[1].checked = true;
	else if ( selectnum == "always" )
		passForm.skeyword[2].checked = true;
	else
		passForm.skeyword[0].checked = true;
		
		
		
	var endis_Trusted_IP = '<%if tcWebApi_get("UrlFilterd_Entry","TrustedIPEnable","h") <> "N/A" then tcWebApi_get("UrlFilterd_Entry","TrustedIPEnable","s") end if%>';
	if(endis_Trusted_IP!='1')
	{
		passForm.trustipenble.checked = false;
		passForm.cfTrusted_IPAddress4.disabled=true;
		passForm.cfTrusted_IPAddress4.value="";
	}
	else 
	{
		passForm.trustipenble.checked = true;
		passForm.cfTrusted_IPAddress4.disabled=false;
		var trusted_array=new Array();
		trusted_array=bs_trustedip.split('.');
		passForm.cfTrusted_IPAddress4.value=trusted_array[3];
	}
	tbox=passForm.cfKeyWord_DomainList;
	var list="<%if tcWebApi_get("UrlFilterd_Entry","BlockURLList","h") <> "N/A" then tcWebApi_get("UrlFilterd_Entry","BlockURLList","s") end if%>";
	webfilter = list.split(" ");
	for(i=0;i<webfilter.length;i++)
		tbox.options[i]=new Option(webfilter[i],webfilter[i]);
}
</script>

<input type="hidden" name="Trusted_IP_Enable">	
<input type="hidden" name="cfTrusted_IPAddress">
<input type="hidden" name="Text">
<TR>
	<TD colspan=2>
	<%tcWebApi_multilingual("1","to_learn_more_about_str")%>
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_BKS_keyword','blocking')"><B><%tcWebApi_multilingual("1","keyword_blocking_str")%></B></A>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="skeyword" id="skeyword" value="never" ><%tcWebApi_multilingual("1","never_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="skeyword" id="skeyword" value="perschedule"><%tcWebApi_multilingual("1","per_schedule_str")%>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="skeyword" id="skeyword" value="always" ><%tcWebApi_multilingual("1","always_str")%>
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_BKS_keyword','toaddword')"><B><%tcWebApi_multilingual("1","type_keyword_or_domain_name_str")%></B></A>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="text" name="cfKeyWord_Domain" id="keyword_domain" size="32" maxlength="60" onKeyPress="return getkey('ssid',event)">
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input class="common_bt" type="submit" name="cfKeyWord_AddKeyword" id="keyword_addkeyword" value="<%tcWebApi_multilingual("1","add_keyword_str")%>" onClick="if(!checkKeyWord()) return false;return false;">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_BKS_keyword','blocklist')"><B><%tcWebApi_multilingual("1","block_sites_containing_these_keywords_str")%></B></A>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<select name="cfKeyWord_DomainList" id="keyword_domainlist" size="6" multiple></select>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input class="common_bt" type="submit" name="cfKeyWord_DeleteKeyword" id="keyword_deletekeyword" onClick="if(!checkKeyWordDomainList(delete_str)) return false;return false;" value="<%tcWebApi_multilingual("1","delete_keyword_str")%>">
	<input class="common_bt" type="submit" name="cfKeyWord_ClearList" id="keyword_clearlist" onClick="if(!checkKeyWordDomainList(clear_str)) return false;return false;" value="<%tcWebApi_multilingual("1","clear_list_str")%>">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2>
	<input type="checkbox" name="trustipenble" id="trust_ip_enble" value="1" onclick= "checkTrustIP();">
	<A tabindex=-1 href="javascript:loadhelp('_BKS_keyword','trusted')"><B><%tcWebApi_multilingual("1","allow_trusted_ip_address_str")%></B></A>
	</TD>
</TR>
<TR>
	<TD nowrap><B><%tcWebApi_multilingual("1","trusted_ip_address_str")%></B></A></TD>
	<TD nowrap align=right>
	<input type="text" name="cfTrusted_IPAddress1" id="trusted_ipaddress1" size="4" maxlength="3" disabled onKeyPress="return getkey('num',event)">.
	<input type="text" name="cfTrusted_IPAddress2" id="trusted_ipaddress2" size="4" maxlength="3" disabled onKeyPress="return getkey('num',event)">.
	<input type="text" name="cfTrusted_IPAddress3" id="trusted_ipaddress3" size="4" maxlength="3" disabled onKeyPress="return getkey('num',event)">.
	<input type="text" name="cfTrusted_IPAddress4" id="trusted_ipaddress4" size="4" maxlength="3" onKeyPress="return getkey('num',event)">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</TABLE>
</div>
<%tcWebApi_multilingual("2","_BKS_keyword_help.asp")%>
</FORM>
</BODY>
</HTML>
