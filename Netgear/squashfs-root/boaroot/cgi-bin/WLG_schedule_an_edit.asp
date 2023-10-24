<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/wadv_sechdule.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>


<BODY bgcolor=#ffffff onload="loadvalue();">
<FORM method="POST" action="/cgi-bin/WLG_adv.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<INPUT type=hidden name=submit_flag value="wadv_schedule_edit_an">

<script>


var ts="43562984";
var p=0;
var gui_region="English";
var netgear_region=(this.opener.top.netgear_region == "") ? "WW" : this.opener.top.netgear_region;
var each_info = new Array();
var wireless_schedule_num_a=0;

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
		++p;
    	if(obj.name == "d_start_time")
	{/* to fix bug 25288 */
		if(d_end_time.style.display=="none")
			d_end_time.style.display="block";
		else
			d_end_time.style.display="none";
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
					if(p == 0)
                	{
                    	if(obj.name == "d_start_time")
                    	{
    						d_end_time.style.display="block";
    						sSpan.innerHTML=document.forms[0].d_start_time.options[eval(each_info[0])].innerHTML;
    					}
    					else if(obj.name == "end_time")
    						sSpan.innerHTML=document.forms[0].d_start_time.options[eval(each_info[1])].innerHTML;
                    }
					else
					{
						sSpan.innerHTML=this.innerHTML;
						if(obj.name == "d_start_time")
    						d_end_time.style.display="block";
					}
                    obj.value=this.id;
                    sUl.style.display="none";                    
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
			d_end_time.style.display="block"; 
        } 
    } 
}

function loadvalue()
{
	var cf = document.forms[0];
	
	var schedule_item = eval("wireless_schedule_array_a" + edit_num);
	each_info = schedule_item.split("-");

	cf.d_start_time.value = each_info[0];
	cf.end_time.value = each_info[1];
	var start_time_index = cf.d_start_time.value;
	var end_time_index = cf.end_time.value;
	initSelect();
	if(each_info[2] == "Daily")
		cf.r_scheType[0].checked = true;
	else
	{
		cf.r_scheType[1].checked = true;

		var select_days = each_info[2].split(",");
		var i = 0;
	
		for(i=0; i<select_days.length; i++)
		{
			//var week_day = eval("cf.select_weekday" + select_days[i]);
			//week_day.checked = true;
			if(select_days[i] == 0)
				cf.sun.checked = true;
			else if(select_days[i] == 1)
				cf.mon.checked = true;
			else if(select_days[i] == 2)
				cf.tue.checked = true;
			else if(select_days[i] == 3)
				cf.wed.checked = true;
			else if(select_days[i] == 4)
				cf.thu.checked = true;
			else if(select_days[i] == 5)
				cf.fri.checked = true;
			else if(select_days[i] == 6)
				cf.sat.checked = true;
		}
	}
	schedule_check_pattern();
}
</script>

<input type="hidden" name="schedule_info" value="">

<TABLE width="100%" border="0" cellpadding="2" cellspacing="3">
<TR><TD colspan="2"><b>When to turn off wireless signal</b></TD></TR>
<TR>
	<TD width="10%" align="left">Start :</td>
	<TD align="left">
		<select class="divselect" name="d_start_time">
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
		<select class="divselect" name="end_time">
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
<TR><TD colspan="2"><input type="radio" name="r_scheType" id="schedule_type" value="0" onClick="schedule_check_pattern();"><b>Daily</b></TD></TR>
<TR><TD colspan="2"><input type="radio" name="r_scheType" id="schedule_type" value="1" onClick="schedule_check_pattern();"><b>Select Days</b></TD></TR>
<TR><TD colspan="2">
	<TABLE width="90%" align="center" cellpadding="2" cellspacing="3" border="0">
	<TR>
		<TD nowrap width="25%" align="left"><input type="checkbox" name="cbox_sunday" id="cbox_sunday" value="0">Sunday</TD>
		<TD nowrap width="25%" align="left"><input type="checkbox" name="cbox_monday" id="cbox_monday" value="1">Monday</TD>
		<TD nowrap width="25%" align="left"><input type="checkbox" name="cbox_tuesday" id="cbox_tuesday" value="2">Tuesday</TD>
		<TD nowrap width="25%" align="left"><input type="checkbox" name="cbox_wednesday" id="cbox_wednesday" value="3">Wednesday</TD>
	</TR>
	<TR>
		<TD nowrap width="25%" align="left"><input type="checkbox" name="cbox_thursday" id="cbox_thursday" value="4">Thursday</TD>
		<TD nowrap width="25%" align="left"><input type="checkbox" name="cbox_friday" id="cbox_friday" value="5">Friday</TD>
		<TD nowrap width="25%" align="left"><input type="checkbox" name="cbox_saturday" id="cbox_saturday" value="6">Saturday</TD>
	</TR>
	</TABLE>
<TR>
	<TD colspan="2" align="center">
	<input type="submit" name="add_schedule" value="Apply" id="apply" onClick="return wireless_schedule_add('an','edit');">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" name="edit_schedule" value="Cancel" id="cancel" onClick="self.close();"></TD>
</TR>
</TABLE>
</FORM>
</BODY>
</HTML>
