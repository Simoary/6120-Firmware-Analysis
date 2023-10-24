/*
 *	It maintains the common utils for implementing GUI.
 *	And please follow the coding rule with aye_utils_YOUR_DEFINE
 *	1.Using aye_utils as prefix.
 *	2.Capitalizing YOUR_DEINFE string.
 *	For example, aye_utils_TXT.
 *			
 */

var AYECOM_WIFI_CERTIFICATED = 0;

function aye_utils_INCLUDE_JS_FILE (jsFile){
    document.write('<script type="text/javascript" src="' + jsFile + '"></script>');
}

aye_utils_INCLUDE_JS_FILE("/aye_regex.js");

function aye_utils_TXT(framename,mode,str){
	if(mode==0)
	{
		if(framename!="")
			parent.frames[framename].document.write(str);
		else	
			document.write(str);
	}else if(mode==1)
		return str;
}

function aye_utils_GET_IPv4_Prefix(lan1Ip, lan1Mask) 
{
	var count = 0;
	var prefix="";
	
	lan1a = lan1Ip.split('.');
	lan1m = lan1Mask.split('.');

	for (i = 0; i < 4; i++) 
	{
		l1a_n = parseInt(lan1a[i],10);
		l1m_n = parseInt(lan1m[i],10);
		
		if(l1a_n & l1m_n)
			prefix += l1a_n+'.';
	
	}
	return prefix;
}

function aye_utils_Get_IPv6_Prefix(ipv6address,prefixlength)
{
	var ipv6 = ipv6address.split(":");
	var len = ipv6.length;
	var result="";
	
	if(prefixlength==128)
	{
		return ipv6address;
	}
	
	result = ipv6[0];
	switch(prefixlength)
	{
		case 32:
		if(len>1) result+= ":" + ipv6[1];
		break;
		case 48:
		if(len>1) result+= ":" + ipv6[1];
		if(len>2) result+= ":" + ipv6[2];
		break;
		case 64:
		if(len>1) result+= ":" + ipv6[1];
		if(len>2) result+= ":" + ipv6[2];
		if(len>3) result+= ":" + ipv6[3];
		break;
		case 80:
		if(len>1) result+= ":" + ipv6[1];
		if(len>2) result+= ":" + ipv6[2];
		if(len>3) result+= ":" + ipv6[3];
		if(len>4) result+= ":" + ipv6[4];
		break;
		case 96:
		if(len>1) result+= ":" + ipv6[1];
		if(len>2) result+= ":" + ipv6[2];
		if(len>3) result+= ":" + ipv6[3];
		if(len>4) result+= ":" + ipv6[4];
		if(len>5) result+= ":" + ipv6[5];
		break;
		case 112:
		if(len>1) result+= ":" + ipv6[1];
		if(len>2) result+= ":" + ipv6[2];
		if(len>3) result+= ":" + ipv6[3];
		if(len>4) result+= ":" + ipv6[4];
		if(len>5) result+= ":" + ipv6[5];
		if(len>6) result+= ":" + ipv6[6];
		break;
	}
	
	result+="::";
	return result;
}

function aye_utils_ie_version() 
{
        var Sys = {};
        var ua = navigator.userAgent.toLowerCase();
        var s;
        (s = ua.match(/rv:([\d.]+)\) like gecko/)) ? Sys.ie = s[1] :
        (s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] :
        (s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :
        (s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :
        (s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :
        (s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;
        
		return Sys.ie;
}

function aye_utils_check_browser(browserName)
{
	var Sys = {};
    var ua = navigator.userAgent.toLowerCase();
    var s;
    (s = ua.match(/rv:([\d.]+)\) like gecko/)) ? Sys.ie = s[1] :
    (s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] :
    (s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :
    (s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :
    (s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :
    (s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;
      
	if(browserName=="ie") 		if(Sys.ie) return true;
	if(browserName=="firefox") 	if(Sys.firefox) return true;
	if(browserName=="chrome") 	if(Sys.chrome) return true;
	if(browserName=="opera") 	if(Sys.opera) return true;
	if(browserName=="safari") 	if(Sys.safari) return true;
	
	return false;
}

function aye_utils_makeStr(strSize, fillChar)
{
	var temp = "";
	for (i=0; i < strSize ; i ++)
		temp = temp + fillChar;
	return temp;
}

function aye_utils_updateProgress(delay_time,charcount,backtopage,forms_index,maxchars)
{
	var cf = document.forms[forms_index];
	
	if(charcount == 0)
	{
		if(aye_utils_ie_version() != "11.0")
		{
			maxchars = 106; //width: 320px ;reference form.css
		}
		else
		{
			maxchars = 85;  //width: 320px ;reference form.css
		}
		if(aye_utils_check_browser("chrome"))
			maxchars = 79;
	}
	
	var time_step = (delay_time * 1000) / maxchars;
	
	if (charcount < maxchars)
	{
		charcount ++;
		cf.progress.value = aye_utils_makeStr(charcount,"|");
		setTimeout(function(){aye_utils_updateProgress(delay_time,charcount,backtopage,forms_index,maxchars);},time_step);
	}
	else
	{ 
		top.location.href=backtopage;
	}
}



















