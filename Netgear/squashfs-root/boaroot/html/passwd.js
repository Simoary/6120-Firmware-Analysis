function checkpasswd_x(cf)
{
	for(i=0;i<cf.sysNewPasswd.value.length;i++)
	{       
		if(isValidChar_space(cf.sysNewPasswd.value.charCodeAt(i))==false)
		{
			alert(invalid_passwd_str);
			return false;
		}
	}
	if (cf.sysNewPasswd.value.length == 33 || cf.sysConfirmPasswd.value.length == 33)
	{
		//alert("Maximum password length is 32 characters!");
		alert(invalid_passwd_len_str);
		return false;
	}
	if(cf.sysNewPasswd.value != cf.sysConfirmPasswd.value)
	{ 
		//alert("The password you typed does not match. Please enter it again.");
		alert(invalid_passwd_confirmed_str);		
		return false;	
	}
	if(cf.sysOldPasswd.value != "" && cf.sysNewPasswd.value == "")
	{
		//alert("Password cannot be blank.");
		alert(empty_passwd_str);		
		return false;
	}
	if( cf.enable_recovery.checked == true )
	{
		cf.hidden_enable_recovery.value="Yes";
		if( cf.question1.value == "0" || cf.question2.value == "0")
		{
			alert(select_quest_str);
			return false;
		}
	
		if( cf.answer1.value == "" || cf.answer2.value == "" )
		{
			alert(enter_answer_str);
			return false;
		}

	}
	else
	{
		if(cf.sysOldPasswd.value != "")
		{
			if(confirm(pwd_recovery_to_default_str + "\n"+ are_you_sure_not_enable_recovery_str) == false)
				return false;
		}

		cf.hidden_enable_recovery.value="No";
	}

	return true;

}
