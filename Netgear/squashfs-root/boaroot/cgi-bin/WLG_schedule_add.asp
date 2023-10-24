<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/wadv_sechdule.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>


<BODY bgcolor=#ffffff onload="loadvalue();">
<FORM method="POST" action="/cgi-bin/WLG_adv.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<INPUT type=hidden name=submit_flag value="wadv_schedule_add">

<script>


var ts="97527952";

var gui_region="English";
var netgear_region=(this.opener.top.netgear_region == "") ? "WW" : this.opener.top.netgear_region;

var wireless_schedule_num=0;

var edit_num = "";
  
	var zQuery=function(ele,tagName,className){ //core object 
    if ( window == this ) return new zQuery(ele,tagName,className); 
    if(!arr){var arr=new Array;} 
    if(ele){ 
        if(ele.constructor!=zQuery){ 
            var elem=typeof(ele)=="object"?ele:document.getElementById(ele); 
            if(!tagName){ 
                arr.push(elem); 
            }else{ 
                var tags=elem.all&&!window.opera?tagName=="*"?elem.all:elem.all.tags(tagName):elem.getElementsByTagName(tagName); 
                if(!className){ 
                    for(var i=0, l=tags.length; i<l; i++){ 
                        arr.push(tags[i]); 
                    } 
                }else{ 
                    var reClassName=RegExp("(^|\\s+)"+className+"(|\\s+)"); 
                    for(var i=0, l=tags.length; i<l; i++){ 
                        if(reClassName.test(tags[i].className)){ 
                            arr.push(tags[i]); 
                        } 
                    } 
                } 
            } 
        }else{ 
            for(var i=0, l=ele.length; i<l; i++){ 
                arr=arr.concat(Array.prototype.slice.call(zQuery(ele[i],tagName,className))); 
            } 
        } 
    } 
    return this.setArray(arr);  
} 
zQuery.prototype.setArray = function( arr ) { 
    this.length = 0; 
    Array.prototype.push.apply( this, arr );  
    return this; 
} 
zQuery.fn=zQuery.prototype; 
//var =zQuery; 

//obtain the absolute position of select 
function Offset(obj){ 
    var t = obj.offsetTop; 
    var l = obj.offsetLeft; 
    var w = obj.offsetWidth; 
    var h = obj.offsetHeight-2; 
    //var h=obj.style.height; 
    while(obj=obj.offsetParent) 
    { 
        t+=obj.offsetTop; 
        l+=obj.offsetLeft; 
    } 
    return { 
        top : t, 
        left : l, 
        width : w, 
        height : h 
    } 
}

//simulation select 
function instSelect(obj){
    var offSet=Offset(obj);
    obj.style.display="none";
    var sDiv=document.createElement("div");
    sDiv.id="div"+obj.name;
    sDiv.className="divSlt";
    sDiv.style.width=offSet.width+"px";
    //sDiv.style.height=offSet.height+"px";
    sDiv.style.left=offSet.left+"px";
    sDiv.style.top=offSet.top+"px";
    document.body.appendChild(sDiv);
    var sSpan=document.createElement("span");
    var spanId=obj.options[obj.selectedIndex].value;
    var spanText=obj.options[obj.selectedIndex].text;
    sSpan.id=spanId;
    sSpan.style.lineHeight=offSet.height+"px";
    sTxt=document.createTextNode(spanText);
    sSpan.appendChild(sTxt);
    sDiv.appendChild(sSpan);
    sSpan.onclick=function(){
    	if(obj.name == "start_time")
	{/* to fix bug 25288 */
		if(end_time.style.display=="none")
			end_time.style.display="block";
		else
			end_time.style.display="none";
	}

        if(zQuery("div"+obj.name,"ul").length==0){
            var sUl=document.createElement("ul");
            sDiv.appendChild(sUl);
            var optLen=obj.options.length;
            var tmp=document.createDocumentFragment();
            for(var j=0;j<optLen;j++){
                var sltVal=obj.options[j].value;
                var sltTxt=obj.options[j].text;
                var sLi=document.createElement("li");
                sLi.id=sltVal;
                sLi.appendChild(document.createTextNode(sltTxt));
                sLi.onmouseover=function(){
                    this.style.background="#cccccc";
                    this.style.color="white";
                }
                sLi.onmouseout=function(){
                    this.style.background="white";
                    this.style.color="black";
                }
                sLi.onclick=function(){
                    sSpan.innerHTML=this.innerHTML;
                    obj.value=this.id;
                    sUl.style.display="none";
                    if(obj.name == "start_time")
    										end_time.style.display="block";
                }
                tmp.appendChild(sLi);
            }
            sUl.appendChild(tmp);
            if(optLen>3){
                sUl.style.overflowY="scroll";
                sUl.style.height="200px";
            }
        }
        else{
            if(zQuery("div"+obj.name,"ul")[0].style.display=="none") zQuery("div"+obj.name,"ul")[0].style.display="block";
            else zQuery("div"+obj.name,"ul")[0].style.display="none";
        }
    }
}
function getEvent(){ 
     //compatible with ie and ff 
     if(document.all)    return window.event; 
     func=getEvent.caller; 
     while(func!=null){ 
         var arg0=func.arguments[0]; 
         if(arg0){ 
             if((arg0.constructor==Event || arg0.constructor ==MouseEvent) 
                || (typeof(arg0)=="object" && arg0.preventDefault && arg0.stopPropagation)){     
                return arg0; 
              } 
         } 
          func=func.caller; 
        } 
        return null; 
}
//obtion the number of select, and execut the function
function initSelect(){ 
    var slt=zQuery(document,"select"); 
    var sltLen=slt.length; 
    for(var i=0;i<sltLen;i++){  
        instSelect(slt[i]); 
    } 
} 

document.onclick=function(){ 
    var evt=getEvent(); 
    var element=evt.srcElement || evt.target; 
    var s=zQuery(document,"select"); 
    if((element.parentNode.parentNode==null||element.parentNode.parentNode.className!="divSlt")&&element.nodeName!="SPAN"){ 
        for (var i=0; i<s.length; i++) { 
            if(!zQuery("div" + s[i].name,"ul")[0]) continue; 
            zQuery("div" + s[i].name,"ul")[0].style.display="none"; 
			end_time.style.display="block"; 
        } 
    } 
}

function loadvalue()
{
	var cf = document.forms[0];
	initSelect();
	cf.selday[0].checked = true;
	schedule_check_pattern();
}
</script>

<input type="hidden" name="schedule_info" value="">

<TABLE width="100%" border="0" cellpadding="2" cellspacing="3">
<TR><TD colspan="2"><b>When to turn off wireless signal</b></TD></TR>
<TR>
	<TD width="10%" align="left">Start :</td>
	<TD align="left">
		<select class="divselect" name="start_time" id="start_time">
		<script>
		var i=0;
		for(i=0; i<48; i++)
		{
			if((gui_region=="German" && netgear_region=="WW") || netgear_region=="GR")
				document.write('<option value="'+i+'">'+hour_schedule_24[i]+'</option>');
			else
				document.write('<option value="'+i+'">'+hour_schedule_12[i]+'</option>');
		}
		</script>
		</select>
	</TD>
</TR>
<TR>
	<TD nowrap width="10%" align="left">End :</td>
	<TD align="left">
		<select class="divselect" name="end_time" id="end_time">
		<script>
                var i=0;
                for(i=0; i<48; i++)
                {
                        if((gui_region=="German" && netgear_region=="WW") || netgear_region=="GR")
                                document.write('<option value="'+i+'">'+hour_schedule_24[i]+'</option>');
                        else
                                document.write('<option value="'+i+'">'+hour_schedule_12[i]+'</option>');
                }
                </script>
		</select>
	</TD>
</TR>
<TR><TD colspan="2"><b>Recurrence pattern</b></TD></TR>
<TR><TD colspan="2"><input type="radio" name="selday" id="schedule_type" value="Daily" onClick="schedule_check_pattern();"><b>Daily</b></TD></TR>
<TR><TD colspan="2"><input type="radio" name="selday" id="schedule_type" value="Select Days" onClick="schedule_check_pattern();"><b>Select Days</b></TD></TR>
<TR><TD colspan="2">
	<TABLE width="90%" align="center" cellpadding="2" cellspacing="3" border="0">
	<TR><!-- bug 23395:all select by default -->
		<TD nowrap width="25%" align="left"><input type="checkbox" name="sun" id="cbox_sunday" value="0" checked>Sunday</TD>
		<TD nowrap width="25%" align="left"><input type="checkbox" name="mon" id="cbox_monday" value="1" checked>Monday</TD>
		<TD nowrap width="25%" align="left"><input type="checkbox" name="tue" id="cbox_tuesday" value="2" checked>Tuesday</TD>
		<TD nowrap width="25%" align="left"><input type="checkbox" name="wed" id="cbox_wednesday" value="3" checked>Wednesday</TD>
	</TR>
	<TR>
		<TD nowrap width="25%" align="left"><input type="checkbox" name="thu" id="cbox_thursday" value="4" checked>Thursday</TD>
		<TD nowrap width="25%" align="left"><input type="checkbox" name="fri" id="cbox_friday" value="5" checked>Friday</TD>
		<TD nowrap width="25%" align="left"><input type="checkbox" name="sat" id="cbox_saturday" value="6" checked>Saturday</TD>
	</TR>
	</TABLE>
<TR>
	<TD colspan="2" align="center">
	<input type="submit" name="add_schedule" value="Apply" id="apply" onClick="return wireless_schedule_add('bgn', 'add');">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" name="edit_schedule" value="Cancel" id="cancel" onClick="self.close();"></TD>
</TR>
</TABLE>
</FORM>
</BODY>
</HTML>
