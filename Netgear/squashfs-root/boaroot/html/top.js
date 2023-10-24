function languageShowlist()
{
	document.write('<option value=Auto>' + auto_str + '</option>');
	if (language_oriArray != "")
	{
		for (j=0; j<language_oriArray.length; j++)
		{
			document.write('<option value='+language_oriArray[j]+'>'+language_showArray[j]+'</option>');
		}
	}
	else
		document.write('<option value=English>'+language_oriArray[0]+'</option>');
}

function change_container_posision()
{
	if( document.body.clientWidth < document.body.scrollWidth )
		document.getElementById("container").className="container_left";
	else
		document.getElementById("container").className="container_center";
}

function goto_top( page)
{
	top.location.href=page;
}

function change_select()
{
	form=document.forms[0];

        /*if( form.lang_avi.value == lang_select && !(lang_select == "Auto" && browser_lang != gui_region))
        {
                if(jp_multiPPPoE == "1" && form.lang_avi.value != "Japanese")
                {
                        form.hidden_lang_avi.value=form.lang_avi.value;
                        form.action="/cgi-bin/index.asp timestamp="+ts;
                        form.submit_flag.value="change_multiPPPoE_status";
                        form.submit();
                }//else
                        //location.reload();
        }
        else
        {*/
            form.lang_avi.disabled=true;
            form.hidden_lang_avi.value=form.lang_avi.value;
			form.Language_Selection.value=gui_region;
			form.Browser_Language.value=browser_lang;
			form.target="formframe";
            form.submit();
        /*}*/
}

function firmwareUpgrade()
{
	goto_formframe('UPG_check_version_hidden.asp');
}

function do_search()
{
	var key = document.forms[0].search.value.replace(/ /g,"%20");
	var winoptions = "width=960,height=800,menubar=yes,scrollbars=yes,toolbar=yes,status=yes,location=yes,resizable=yes";
	var url="http://kb.netgear.com/app/answers/list/kw/"+key;

	window.open(url,null,winoptions);
}

function setLabelClass(label, className)
{
	var words_len = label.getElementsByTagName("span")[0].innerHTML.length;

	if(words_len >= 16)
		label.className = className + "_longest";
	else if(words_len >= 12)
		label.className = className + "_long";
	else if(words_len >= 10)
		label.className = className + "_middle";
	else
		label.className = className;
}

function setUpgradeMessClass(upgrade_mess)
{
	var message_len = upgrade_mess.innerHTML.length;
	if( message_len >= 75 )
		upgrade_mess.className = "i_long";
	else if( message_len >= 69 || gui_region == "Korean" || gui_region == "Czech")
		upgrade_mess.className = "i_middle";
	else
		upgrade_mess.className = "i_normal";
}

function load_top_value()
{
	form=document.forms[0];

	var upgrade_div = document.getElementById("update_info");
	if(upgrade_div != null)
	{
		if(wan_status==1 && config_status==9999 && updateFirmware==1)
			upgrade_div.style.display = "inline";
		else
			upgrade_div.style.display = "none";
	}
	
	var basic_label = document.getElementById("basic_label");
	var advanced_label = document.getElementById("advanced_label");

	if(type == "basic")
	{

		setLabelClass(basic_label, "label_click");
		setLabelClass(advanced_label, "label_unclick");
	}
	else if(type == "advanced")
	{
		setLabelClass(basic_label, "label_unclick");
		setLabelClass(advanced_label, "label_click");
	}

	/* to fix bug 25107 */
	if( upgrade_div.style.display != "none")
	{
		var upgrade_mess = upgrade_div.getElementsByTagName("i")[0];
		if(( basic_label.className == "label_click" && advanced_label.className == "label_unclick") 
			|| ( advanced_label.className == "label_click" && basic_label.className == "label_unclick"))
		{
			upgrade_div.className="update_info_down";
			setUpgradeMessClass(upgrade_mess);
		}
		else
		{
			upgrade_div.className="update_info_up";
			setUpgradeMessClass(upgrade_mess);
		}
	}
}


function detectEnter(type, e)
{
     var keycode, event;
	 if (window.event)
        {
                event = window.event;
                keycode = window.event.keyCode;
        }
        else if (e)
        {
                event = e;
                keycode = e.which;
        }
        else 
			return true;
			
		if(type == "num")
		{
	  if(keycode==13)
			do_search();
		}
		else
		return false;
}
