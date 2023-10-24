function click_backup()
{
	document.forms[0].action="/backup.cgi";
	document.forms[0].submit();
}
/*
function check_restore()
{
	cf=document.forms[0];
	if (cf.mtenRestoreCfg.value.length == 0)
	{
		alert(filename_cannot_blank_str);
		return false;
	}
	
	
	var filestr=cf.mtenRestoreCfg.value;
	
	var file_format=filestr.substr(filestr.lastIndexOf(".")+1);
	if (file_format!="cfg")
	{
		alert(please_assign_the_correct_file_str+"cfg");
		return false;
	} 

	var config_name=filestr.substr(filestr.lastIndexOf("_")+1);
	alert(config_name);
	var product_name = '<%if TCWebAPI_get("SkuId_Entry", "ProductName", "h") <> "N/A" then TCWebAPI_staticGet("SkuId_Entry", "ProductName", "s")  end if %>';
	
	if((product_name + '.cfg') == config_name)
		alert(product_name);
	
	if (confirm(warning_restoring_settings_str))
	{	
		cf.action="/cgi-bin/BAK_backup.asp";
		top_left_nolink();
		top.enable_action=0;
		cf.submit();
	}
	else 
		return false;
}
*/
function click_yesfactory()
{
	cf=document.forms[0];
	cf.action="/cgi-bin/pls_wait_factory_reboot.asp?id="+ts;
	top_left_nolink();
	top.enable_action=0;
	cf.submit();
}
