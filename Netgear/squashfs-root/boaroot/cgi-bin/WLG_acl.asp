<%	
    if request_Form("submit_flag") = "wlacl_apply" then
        tcWebApi_set("WebCurSet_Entry","wlan_id","hidden_wlan_id")
		tcWebApi_set("WebCurSet_Entry","wlan_ac_id","hidden_wlan_ac_id")
	    tcWebApi_set("WLan_Entry","AccessPolicy","wlacl_policy")
		tcWebApi_set("WLan11ac_Entry","AccessPolicy","wlacl_policy")
		tcWebApi_commit("WebCurSet_Entry")
        tcWebApi_commit("WLan_Entry")
        tcWebApi_commit("WLan11ac_Entry")	


        tcWebApi_set("WebCurSet_Entry","wlan_id","hidden_wlan_id_1")
		tcWebApi_set("WebCurSet_Entry","wlan_ac_id","hidden_wlan_ac_id_1")
	    tcWebApi_set("WLan_Entry","AccessPolicy","wlacl_policy")
		tcWebApi_set("WLan11ac_Entry","AccessPolicy","wlacl_policy")
		tcWebApi_commit("WebCurSet_Entry")
        tcWebApi_commit("WLan_Entry")
        tcWebApi_commit("WLan11ac_Entry")
		
		
        tcWebApi_set("WebCurSet_Entry","wlan_id","hidden_wlan_id_2")
		tcWebApi_set("WebCurSet_Entry","wlan_ac_id","hidden_wlan_ac_id_2")
	    tcWebApi_set("WLan_Entry","AccessPolicy","wlacl_policy")
		tcWebApi_set("WLan11ac_Entry","AccessPolicy","wlacl_policy")
		tcWebApi_commit("WebCurSet_Entry")
        tcWebApi_commit("WLan_Entry")
        tcWebApi_commit("WLan11ac_Entry")


        tcWebApi_set("WebCurSet_Entry","wlan_id","hidden_wlan_id_3")
		tcWebApi_set("WebCurSet_Entry","wlan_ac_id","hidden_wlan_ac_id_3")
	    tcWebApi_set("WLan_Entry","AccessPolicy","wlacl_policy")
		tcWebApi_set("WLan11ac_Entry","AccessPolicy","wlacl_policy")
		tcWebApi_commit("WebCurSet_Entry")
        tcWebApi_commit("WLan_Entry")
        tcWebApi_commit("WLan11ac_Entry")		
		
		
    elseif request_Form("submit_flag") = "wlacl_add" then
	    tcWebApi_set("WebCurSet_Entry","wlan_id","hidden_wlan_id")
		tcWebApi_set("WebCurSet_Entry","wlan_ac_id","hidden_wlan_ac_id")
	    if request_Form("wlacl_num") = "0" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME0","device")	
           tcWebApi_set("WLan_Entry","WLan_MAC0","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME0","device")	
           tcWebApi_set("WLan11ac_Entry","WLan_MAC0","adr")
        elseif request_Form("wlacl_num") = "1" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME1","device")
           tcWebApi_set("WLan_Entry","WLan_MAC1","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME1","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC1","adr")
        elseif request_Form("wlacl_num") = "2" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME2","device")
           tcWebApi_set("WLan_Entry","WLan_MAC2","adr")	
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME2","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC2","adr")
        elseif request_Form("wlacl_num") = "3" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME3","device")
           tcWebApi_set("WLan_Entry","WLan_MAC3","adr")
           tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME3","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC3","adr")			   
        elseif request_Form("wlacl_num") = "4" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME4","device")
           tcWebApi_set("WLan_Entry","WLan_MAC4","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME4","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC4","adr")
        elseif request_Form("wlacl_num") = "5" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME5","device")
           tcWebApi_set("WLan_Entry","WLan_MAC5","adr")	
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME5","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC5","adr")	
        elseif request_Form("wlacl_num") = "6" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME6","device")
           tcWebApi_set("WLan_Entry","WLan_MAC6","adr")	
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME6","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC6","adr")	
        elseif request_Form("wlacl_num") = "7" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME7","device")
           tcWebApi_set("WLan_Entry","WLan_MAC7","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME7","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC7","adr")
        elseif request_Form("wlacl_num") = "8" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME8","device")
           tcWebApi_set("WLan_Entry","WLan_MAC8","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME8","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC8","adr")
        elseif request_Form("wlacl_num") = "9" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME9","device")
           tcWebApi_set("WLan_Entry","WLan_MAC9","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME9","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC9","adr")
        elseif request_Form("wlacl_num") = "9" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME9","device")
           tcWebApi_set("WLan_Entry","WLan_MAC9","adr")
           tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME9","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC9","adr")			   
        elseif request_Form("wlacl_num") = "10" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME10","device")
           tcWebApi_set("WLan_Entry","WLan_MAC10","adr")
           tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME10","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC10","adr")			   
        elseif request_Form("wlacl_num") = "11" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME11","device")
           tcWebApi_set("WLan_Entry","WLan_MAC11","adr")	
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME11","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC11","adr")
        elseif request_Form("wlacl_num") = "12" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME12","device")
           tcWebApi_set("WLan_Entry","WLan_MAC12","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME12","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC12","adr")
        elseif request_Form("wlacl_num") = "13" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME13","device")
           tcWebApi_set("WLan_Entry","WLan_MAC13","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME13","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC13","adr")
        elseif request_Form("wlacl_num") = "14" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME14","device")
           tcWebApi_set("WLan_Entry","WLan_MAC14","adr")
           tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME14","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC14","adr")			   
        elseif request_Form("wlacl_num") = "15" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME15","device")
           tcWebApi_set("WLan_Entry","WLan_MAC15","adr")
           tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME15","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC15","adr")		   
        elseif request_Form("wlacl_num") = "16" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME16","device")
           tcWebApi_set("WLan_Entry","WLan_MAC16","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME16","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC16","adr")
        elseif request_Form("wlacl_num") = "17" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME17","device")
           tcWebApi_set("WLan_Entry","WLan_MAC17","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME17","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC17","adr")
        elseif request_Form("wlacl_num") = "18" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME18","device")
           tcWebApi_set("WLan_Entry","WLan_MAC18","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME18","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC18","adr")
        elseif request_Form("wlacl_num") = "19" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME19","device")
           tcWebApi_set("WLan_Entry","WLan_MAC19","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME19","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC19","adr")
        elseif request_Form("wlacl_num") = "20" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME20","device")
           tcWebApi_set("WLan_Entry","WLan_MAC20","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME20","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC20","adr")
        elseif request_Form("wlacl_num") = "21" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME21","device")
           tcWebApi_set("WLan_Entry","WLan_MAC21","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME21","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC21","adr")
        elseif request_Form("wlacl_num") = "22" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME22","device")
           tcWebApi_set("WLan_Entry","WLan_MAC22","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME22","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC22","adr")
        elseif request_Form("wlacl_num") = "23" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME23","device")
           tcWebApi_set("WLan_Entry","WLan_MAC23","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME23","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC23","adr")
        elseif request_Form("wlacl_num") = "24" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME24","device")
           tcWebApi_set("WLan_Entry","WLan_MAC24","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME24","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC24","adr")
        elseif request_Form("wlacl_num") = "25" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME25","device")
           tcWebApi_set("WLan_Entry","WLan_MAC25","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME25","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC25","adr")
        elseif request_Form("wlacl_num") = "26" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME26","device")
           tcWebApi_set("WLan_Entry","WLan_MAC26","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME26","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC26","adr")
        elseif request_Form("wlacl_num") = "27" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME27","device")
           tcWebApi_set("WLan_Entry","WLan_MAC27","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME27","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC27","adr")
        elseif request_Form("wlacl_num") = "28" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME28","device")
           tcWebApi_set("WLan_Entry","WLan_MAC28","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME28","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC28","adr")
        elseif request_Form("wlacl_num") = "29" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME29","device")
           tcWebApi_set("WLan_Entry","WLan_MAC29","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME29","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC29","adr")
        elseif request_Form("wlacl_num") = "30" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME30","device")
           tcWebApi_set("WLan_Entry","WLan_MAC30","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME30","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC30","adr")
        elseif request_Form("wlacl_num") = "31" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME31","device")
           tcWebApi_set("WLan_Entry","WLan_MAC31","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME31","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC31","adr")
        elseif request_Form("wlacl_num") = "32" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME32","device")
           tcWebApi_set("WLan_Entry","WLan_MAC32","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME32","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC32","adr")
        elseif request_Form("wlacl_num") = "33" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME33","device")
           tcWebApi_set("WLan_Entry","WLan_MAC33","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME33","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC33","adr")
        elseif request_Form("wlacl_num") = "34" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME34","device")
           tcWebApi_set("WLan_Entry","WLan_MAC34","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME34","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC34","adr")
        elseif request_Form("wlacl_num") = "35" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME35","device")
           tcWebApi_set("WLan_Entry","WLan_MAC35","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME35","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC35","adr")
        elseif request_Form("wlacl_num") = "36" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME36","device")
           tcWebApi_set("WLan_Entry","WLan_MAC36","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME36","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC36","adr")
        elseif request_Form("wlacl_num") = "37" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME37","device")
           tcWebApi_set("WLan_Entry","WLan_MAC37","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME37","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC37","adr")
        elseif request_Form("wlacl_num") = "38" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME38","device")
           tcWebApi_set("WLan_Entry","WLan_MAC38","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME38","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC38","adr")
        elseif request_Form("wlacl_num") = "39" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME39","device")
           tcWebApi_set("WLan_Entry","WLan_MAC39","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME39","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC39","adr")
        elseif request_Form("wlacl_num") = "40" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME40","device")
           tcWebApi_set("WLan_Entry","WLan_MAC40","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME40","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC40","adr")
        elseif request_Form("wlacl_num") = "41" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME41","device")
           tcWebApi_set("WLan_Entry","WLan_MAC41","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME41","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC41","adr")
        elseif request_Form("wlacl_num") = "42" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME42","device")
           tcWebApi_set("WLan_Entry","WLan_MAC42","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME42","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC42","adr")
        elseif request_Form("wlacl_num") = "43" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME43","device")
           tcWebApi_set("WLan_Entry","WLan_MAC43","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME43","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC43","adr")
        elseif request_Form("wlacl_num") = "44" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME44","device")
           tcWebApi_set("WLan_Entry","WLan_MAC44","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME44","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC44","adr")
        elseif request_Form("wlacl_num") = "45" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME45","device")
           tcWebApi_set("WLan_Entry","WLan_MAC45","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME45","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC45","adr")
        elseif request_Form("wlacl_num") = "46" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME46","device")
           tcWebApi_set("WLan_Entry","WLan_MAC46","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME46","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC46","adr")
        elseif request_Form("wlacl_num") = "47" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME47","device")
           tcWebApi_set("WLan_Entry","WLan_MAC47","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME47","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC47","adr")
        elseif request_Form("wlacl_num") = "48" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME48","device")
           tcWebApi_set("WLan_Entry","WLan_MAC48","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME48","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC48","adr")
        elseif request_Form("wlacl_num") = "49" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME49","device")
           tcWebApi_set("WLan_Entry","WLan_MAC49","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME49","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC49","adr")
        elseif request_Form("wlacl_num") = "50" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME50","device")
           tcWebApi_set("WLan_Entry","WLan_MAC50","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME50","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC50","adr")
        elseif request_Form("wlacl_num") = "51" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME51","device")
           tcWebApi_set("WLan_Entry","WLan_MAC51","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME51","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC51","adr")
        elseif request_Form("wlacl_num") = "52" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME52","device")
           tcWebApi_set("WLan_Entry","WLan_MAC52","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME52","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC52","adr")
        elseif request_Form("wlacl_num") = "53" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME53","device")
           tcWebApi_set("WLan_Entry","WLan_MAC53","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME53","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC53","adr")
        elseif request_Form("wlacl_num") = "54" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME54","device")
           tcWebApi_set("WLan_Entry","WLan_MAC54","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME54","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC54","adr")
        elseif request_Form("wlacl_num") = "55" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME55","device")
           tcWebApi_set("WLan_Entry","WLan_MAC55","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME55","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC55","adr")
        elseif request_Form("wlacl_num") = "56" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME56","device")
           tcWebApi_set("WLan_Entry","WLan_MAC56","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME56","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC56","adr")
        elseif request_Form("wlacl_num") = "57" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME57","device")
           tcWebApi_set("WLan_Entry","WLan_MAC57","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME57","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC57","adr")
        elseif request_Form("wlacl_num") = "58" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME58","device")
           tcWebApi_set("WLan_Entry","WLan_MAC58","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME58","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC58","adr")
        elseif request_Form("wlacl_num") = "59" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME59","device")
           tcWebApi_set("WLan_Entry","WLan_MAC59","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME59","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC59","adr")
        elseif request_Form("wlacl_num") = "60" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME60","device")
           tcWebApi_set("WLan_Entry","WLan_MAC60","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME60","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC60","adr")
        elseif request_Form("wlacl_num") = "61" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME61","device")
           tcWebApi_set("WLan_Entry","WLan_MAC61","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME61","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC61","adr")
        elseif request_Form("wlacl_num") = "62" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME62","device")
           tcWebApi_set("WLan_Entry","WLan_MAC62","adr")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME62","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC62","adr")
        elseif request_Form("wlacl_num") = "63" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME63","device")
           tcWebApi_set("WLan_Entry","WLan_MAC63","adr")
           tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME63","device")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC63","adr")			   
        end if
	tcWebApi_commit("WebCurSet_Entry")
    tcWebApi_commit("WLan_Entry")
    tcWebApi_commit("WLan11ac_Entry")
	
	tcWebApi_set("WLan_Entry1","guest_ssid_filter_add","guest_ssid_filter_add")
	tcWebApi_set("WLan_Entry2","guest_ssid_filter_add","guest_ssid_filter_add")
	tcWebApi_set("WLan_Entry3","guest_ssid_filter_add","guest_ssid_filter_add")
	tcWebApi_set("WLan11ac_Entry1","guest_ssid_filter_add","guest_ssid_filter_add")
	tcWebApi_set("WLan11ac_Entry2","guest_ssid_filter_add","guest_ssid_filter_add")
	tcWebApi_set("WLan11ac_Entry3","guest_ssid_filter_add","guest_ssid_filter_add")
	
	tcWebApi_set("WLan_Entry1","wlacl_num","wlacl_num")
	tcWebApi_set("WLan_Entry2","wlacl_num","wlacl_num")
	tcWebApi_set("WLan_Entry3","wlacl_num","wlacl_num")
	tcWebApi_set("WLan11ac_Entry1","wlacl_num","wlacl_num")
	tcWebApi_set("WLan11ac_Entry2","wlacl_num","wlacl_num")
	tcWebApi_set("WLan11ac_Entry3","wlacl_num","wlacl_num")
	
	tcWebApi_set("WebCurSet_Entry","wlan_id","hidden_wlan_id_1")
	tcWebApi_set("WebCurSet_Entry","wlan_ac_id","hidden_wlan_ac_id_1")
	tcWebApi_commit("WebCurSet_Entry")
    tcWebApi_commit("WLan_Entry")
    tcWebApi_commit("WLan11ac_Entry")
	
	tcWebApi_set("WebCurSet_Entry","wlan_id","hidden_wlan_id_2")
	tcWebApi_set("WebCurSet_Entry","wlan_ac_id","hidden_wlan_ac_id_2")
	tcWebApi_commit("WebCurSet_Entry")
    tcWebApi_commit("WLan_Entry")
    tcWebApi_commit("WLan11ac_Entry")
	
	tcWebApi_set("WebCurSet_Entry","wlan_id","hidden_wlan_id_3")
	tcWebApi_set("WebCurSet_Entry","wlan_ac_id","hidden_wlan_ac_id_3")
	tcWebApi_commit("WebCurSet_Entry")
    tcWebApi_commit("WLan_Entry")
    tcWebApi_commit("WLan11ac_Entry")
		
    elseif request_Form("submit_flag") = "wlacl_del" then
	    tcWebApi_set("WebCurSet_Entry","wlan_id","hidden_wlan_id")
		tcWebApi_set("WebCurSet_Entry","wlan_ac_id","hidden_wlan_ac_id")
		if request_Form("select_del") = "0" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME0","devname_del")	
           tcWebApi_set("WLan_Entry","WLan_MAC0","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME0","devname_del")	
           tcWebApi_set("WLan11ac_Entry","WLan_MAC0","mac_del")
        elseif request_Form("select_del") = "1" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME1","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC1","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME1","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC1","mac_del")
        elseif request_Form("select_del") = "2" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME2","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC2","mac_del")	
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME2","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC2","mac_del")	
        elseif request_Form("select_del") = "3" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME3","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC3","mac_del")	
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME3","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC3","mac_del")	
        elseif request_Form("select_del") = "4" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME4","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC4","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME4","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC4","mac_del")
        elseif request_Form("select_del") = "5" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME5","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC5","mac_del")	
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME5","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC5","mac_del")	
        elseif request_Form("select_del") = "6" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME6","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC6","mac_del")	
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME6","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC6","mac_del")	
        elseif request_Form("select_del") = "7" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME7","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC7","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME7","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC7","mac_del")
        elseif request_Form("select_del") = "8" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME8","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC8","mac_del")
           tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME8","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC8","mac_del")			   
        elseif request_Form("select_del") = "9" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME9","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC9","mac_del")	
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME9","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC9","mac_del")	
        elseif request_Form("select_del") = "10" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME10","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC10","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME10","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC10","mac_del")
        elseif request_Form("select_del") = "11" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME11","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC11","mac_del")	
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME11","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC11","mac_del")	
        elseif request_Form("select_del") = "12" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME12","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC12","mac_del")
           tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME12","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC12","mac_del")			   
        elseif request_Form("select_del") = "13" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME13","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC13","mac_del")
           tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME13","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC13","mac_del")		   
        elseif request_Form("select_del") = "14" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME14","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC14","mac_del")
           tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME14","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC14","mac_del")		   
        elseif request_Form("select_del") = "15" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME15","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC15","mac_del")
           tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME15","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC15","mac_del")		   
        elseif request_Form("select_del") = "16" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME16","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC16","mac_del")
           tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME16","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC16","mac_del")		   
        elseif request_Form("select_del") = "17" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME17","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC17","mac_del")
           tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME17","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC17","mac_del")		   
        elseif request_Form("select_del") = "18" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME18","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC18","mac_del")
           tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME18","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC18","mac_del")		   
        elseif request_Form("select_del") = "19" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME19","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC19","mac_del")
           tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME19","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC19","mac_del")		   
        elseif request_Form("select_del") = "20" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME20","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC20","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME20","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC20","mac_del")
        elseif request_Form("select_del") = "21" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME21","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC21","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME21","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC21","mac_del")
        elseif request_Form("select_del") = "22" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME22","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC22","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME22","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC22","mac_del")
        elseif request_Form("select_del") = "23" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME23","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC23","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME23","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC23","mac_del")
        elseif request_Form("select_del") = "24" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME24","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC24","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME24","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC24","mac_del")
        elseif request_Form("select_del") = "25" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME25","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC25","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME25","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC25","mac_del")
        elseif request_Form("select_del") = "26" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME26","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC26","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME26","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC26","mac_del")
        elseif request_Form("select_del") = "27" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME27","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC27","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME27","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC27","mac_del")
        elseif request_Form("select_del") = "28" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME28","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC28","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME28","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC28","mac_del")
        elseif request_Form("select_del") = "29" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME29","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC29","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME29","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC29","mac_del")
        elseif request_Form("select_del") = "30" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME30","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC30","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME30","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC30","mac_del")
        elseif request_Form("select_del") = "31" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME31","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC31","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME31","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC31","mac_del")
        elseif request_Form("select_del") = "32" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME32","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC32","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME32","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC32","mac_del")
        elseif request_Form("select_del") = "33" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME33","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC33","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME33","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC33","mac_del")
        elseif request_Form("select_del") = "34" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME34","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC34","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME34","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC34","mac_del")
        elseif request_Form("select_del") = "35" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME35","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC35","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME35","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC35","mac_del")
        elseif request_Form("select_del") = "36" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME36","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC36","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME36","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC36","mac_del")
        elseif request_Form("select_del") = "37" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME37","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC37","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME37","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC37","mac_del")
        elseif request_Form("select_del") = "38" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME38","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC38","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME38","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC38","mac_del")
        elseif request_Form("select_del") = "39" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME39","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC39","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME39","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC39","mac_del")
        elseif request_Form("select_del") = "40" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME40","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC40","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME40","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC40","mac_del")
        elseif request_Form("select_del") = "41" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME41","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC41","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME41","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC41","mac_del")
        elseif request_Form("select_del") = "42" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME42","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC42","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME42","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC42","mac_del")
        elseif request_Form("select_del") = "43" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME43","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC43","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME43","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC43","mac_del")
        elseif request_Form("select_del") = "44" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME44","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC44","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME44","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC44","mac_del")
        elseif request_Form("select_del") = "45" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME45","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC45","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME45","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC45","mac_del")
        elseif request_Form("select_del") = "46" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME46","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC46","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME46","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC46","mac_del")
        elseif request_Form("select_del") = "47" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME47","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC47","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME47","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC47","mac_del")
        elseif request_Form("select_del") = "48" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME48","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC48","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME48","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC48","mac_del")
        elseif request_Form("select_del") = "49" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME49","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC49","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME49","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC49","mac_del")
        elseif request_Form("select_del") = "50" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME50","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC50","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME50","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC50","mac_del")
        elseif request_Form("select_del") = "51" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME51","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC51","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME51","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC51","mac_del")
        elseif request_Form("select_del") = "52" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME52","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC52","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME52","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC52","mac_del")
        elseif request_Form("select_del") = "53" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME53","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC53","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME53","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC53","mac_del")
        elseif request_Form("select_del") = "54" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME54","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC54","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME54","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC54","mac_del")
        elseif request_Form("select_del") = "55" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME55","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC55","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME55","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC55","mac_del")
        elseif request_Form("select_del") = "56" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME56","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC56","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME56","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC56","mac_del")
        elseif request_Form("select_del") = "57" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME57","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC57","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME57","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC57","mac_del")
        elseif request_Form("select_del") = "58" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME58","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC58","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME58","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC58","mac_del")
        elseif request_Form("select_del") = "59" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME59","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC59","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME59","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC59","mac_del")
        elseif request_Form("select_del") = "60" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME60","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC60","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME60","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC60","mac_del")
        elseif request_Form("select_del") = "61" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME61","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC61","mac_del")
		   tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME61","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC61","mac_del")
        elseif request_Form("select_del") = "62" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME62","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC62","mac_del")
           tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME62","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC62","mac_del")		   
        elseif request_Form("select_del") = "63" then
           tcWebApi_set("WLan_Entry","WLan_DEVNAME63","devname_del")
           tcWebApi_set("WLan_Entry","WLan_MAC63","mac_del")
           tcWebApi_set("WLan11ac_Entry","WLan_DEVNAME63","devname_del")
           tcWebApi_set("WLan11ac_Entry","WLan_MAC63","mac_del")			   
        end if
	tcWebApi_commit("WebCurSet_Entry")
    tcWebApi_commit("WLan_Entry")
    tcWebApi_commit("WLan11ac_Entry")

	tcWebApi_set("WLan_Entry1","guest_ssid_filter_del","guest_ssid_filter_del")
	tcWebApi_set("WLan_Entry2","guest_ssid_filter_del","guest_ssid_filter_del")
	tcWebApi_set("WLan_Entry3","guest_ssid_filter_del","guest_ssid_filter_del")
	tcWebApi_set("WLan11ac_Entry1","guest_ssid_filter_del","guest_ssid_filter_del")
	tcWebApi_set("WLan11ac_Entry2","guest_ssid_filter_del","guest_ssid_filter_del")
	tcWebApi_set("WLan11ac_Entry3","guest_ssid_filter_del","guest_ssid_filter_del")
	
	tcWebApi_set("WLan_Entry1","select_del","select_del")
	tcWebApi_set("WLan_Entry2","select_del","select_del")
	tcWebApi_set("WLan_Entry3","select_del","select_del")
	tcWebApi_set("WLan11ac_Entry1","select_del","select_del")
	tcWebApi_set("WLan11ac_Entry2","select_del","select_del")
	tcWebApi_set("WLan11ac_Entry3","select_del","select_del")
	
	tcWebApi_set("WebCurSet_Entry","wlan_id","hidden_wlan_id_1")
	tcWebApi_set("WebCurSet_Entry","wlan_ac_id","hidden_wlan_ac_id_1")
	tcWebApi_commit("WebCurSet_Entry")
    tcWebApi_commit("WLan_Entry")
    tcWebApi_commit("WLan11ac_Entry")
	
	tcWebApi_set("WebCurSet_Entry","wlan_id","hidden_wlan_id_2")
	tcWebApi_set("WebCurSet_Entry","wlan_ac_id","hidden_wlan_ac_id_2")
	tcWebApi_commit("WebCurSet_Entry")
    tcWebApi_commit("WLan_Entry")
    tcWebApi_commit("WLan11ac_Entry")
	
	tcWebApi_set("WebCurSet_Entry","wlan_id","hidden_wlan_id_3")
	tcWebApi_set("WebCurSet_Entry","wlan_ac_id","hidden_wlan_ac_id_3")
	tcWebApi_commit("WebCurSet_Entry")
    tcWebApi_commit("WLan_Entry")
    tcWebApi_commit("WLan11ac_Entry")	
    end if	
 %>
<html><he
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/wlacl.js"></script>
<title><%tcWebApi_multilingual("1","glbstr_title")%></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/WLG_acl.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="wlacl_apply">

<div class="page_title" id="title"><%tcWebApi_multilingual("1","wireless_card_str")%></div>
<div class="fix_button" id="check_button">
<TABLE width=100% border=0 cellpadding=0 cellspacing=2>
<TR>
        <TD nowrap colspan=2 align=center>
	<input class="cancel_bt" type='button' name='Cancel' id="cancel" value="<%tcWebApi_multilingual("0","glbstr_cancel")%>" onClick='location.href="WLG_adv.asp";'>&nbsp;&nbsp;
        <input class="apply_bt" type="submit" name="Apply" id="apply" value="<%tcWebApi_multilingual("0","glbstr_apply")%>" onClick="return check_wlacl_apply(document.forms[0])">
        </TD>
</TR>
</TABLE>

</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>


<script>
var select_item_edit_str="<%tcWebApi_multilingual("1","select_item_edit_str")%>";
var select_item_del_str="<%tcWebApi_multilingual("1","select_item_del_str")%>";
var wlan_devname_table_Data = 
[
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME0","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME1","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME2","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME3","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME4","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME5","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME6","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME7","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME8","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME9","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME10","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME11","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME12","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME13","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME14","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME15","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME16","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME17","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME18","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME19","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME20","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME21","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME22","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME23","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME24","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME25","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME26","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME27","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME28","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME29","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME30","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME31","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME32","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME33","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME34","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME35","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME36","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME37","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME38","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME39","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME40","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME41","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME42","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME43","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME44","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME45","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME46","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME47","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME48","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME49","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME50","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME51","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME52","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME53","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME54","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME55","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME56","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME57","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME58","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME59","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME60","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME61","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME62","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_DEVNAME63","s")%>"
]
var wlan_mac_table_Data = 
[
"<%tcWebApi_get("WLan_Entry0","WLan_MAC0","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC1","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC2","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC3","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC4","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC5","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC6","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC7","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC8","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC9","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC10","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC11","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC12","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC13","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC14","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC15","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC16","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC17","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC18","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC19","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC20","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC21","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC22","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC23","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC24","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC25","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC26","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC27","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC28","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC29","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC30","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC31","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC32","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC33","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC34","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC35","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC36","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC37","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC38","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC39","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC40","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC41","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC42","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC43","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC44","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC45","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC46","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC47","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC48","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC49","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC50","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC51","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC52","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC53","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC54","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC55","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC56","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC57","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC58","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC59","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC60","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC61","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC62","s")%>",
"<%tcWebApi_get("WLan_Entry0","WLan_MAC63","s")%>"
]

var array_max_num=0;
for(i=0;i<wlan_mac_table_Data.length;i++)
{
	if(wlan_mac_table_Data[i]!="N/A" && wlan_mac_table_Data[i]!="00:00:00:00:00:00")
	{
	   array_max_num++;
	}
}
var array_num = wlan_mac_table_Data.length;
var mac_list_num=0;


//var ts='15889507';
function loadvalue()
{
	var form=document.forms[0];
	var access_policy="<%If tcWebApi_get("WLan_Entry0","AccessPolicy","h") <> "N/A" then tcWebApi_get("WLan_Entry0","AccessPolicy","s") end if%>";
	if(access_policy == '1')
	{
		form.accessLimit.checked = true;
	}
	else
	{
		form.accessLimit.checked = false;
	}
}

function isfull(array_max_num)
{
	if (array_max_num == 64)
	{
		alert("<%tcWebApi_multilingual("1","max_num_rule_str")%>");
		return false;
	}
	else
	{
		location.href="WLG_acl_wait.asp";
	}
}
</script>

<input type="hidden" name="select_edit">
<input type="hidden" name="select_del">
<input type="hidden" name="devname_del">
<input type="hidden" name="mac_del">
<input type="hidden" name="wl_access_ctrl_on">
<input type="hidden" name="hidden_wlan_id" value="0">
<input type="hidden" name="hidden_wlan_id_1" value="1">
<input type="hidden" name="hidden_wlan_id_2" value="2">
<input type="hidden" name="hidden_wlan_id_3" value="3">
<input type="hidden" name="hidden_wlan_ac_id" value="0">
<input type="hidden" name="hidden_wlan_ac_id_1" value="1">
<input type="hidden" name="hidden_wlan_ac_id_2" value="2">
<input type="hidden" name="hidden_wlan_ac_id_3" value="3">
<input type="hidden" name="wlacl_policy" value="0">
<input type="hidden" name="guest_ssid_filter_del">
<TR>
	<TD nowrap>
	<input type="checkbox" name="accessLimit" id="access_limit">
	<A tabindex=-1 href="javascript:loadhelp('_WLG_acl','control')"><B><%tcWebApi_multilingual("1","turn_access_ctrl_str")%></B></A>
	</TD>
</TR>
<TR>
	<TD nowrap>
	<TABLE name="WirelessACL" id="wireless_access_list" class=tables border=0 cellpadding=2 cellspacing=0 width=100%>
	<TR class=table_header>
		<TD nowrap>&nbsp; </TD>
		<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","device_name_str")%></span></TD>
		<TD nowrap align=center><span class="subhead"><%tcWebApi_multilingual("1","mac_addr_str")%></span></TD>
	</TR>
<script>
if (array_num > 0)
{
	for(i=0;i<array_num;i++)
	{
		if(wlan_devname_table_Data[i]!="<unknown>" && wlan_mac_table_Data[i]!="N/A" && wlan_mac_table_Data[i]!="00:00:00:00:00:00")
		{
		    if( i%2== 0 )
                    document.write("<TR class=\"even_line\">");
               else
                    document.write("<TR class=\"odd_line\">");
			document.write('<TD nowrap align=center><input type="radio" name="MacSelect" id="mac_select" value="'+i+'"></TD><TD nowrap align=center> '+wlan_devname_table_Data[i].replace(/</g, "&#60;").replace(/>/g, "&#62;")+'</TD><TD nowrap align=center> '+wlan_mac_table_Data[i]+'</TD></TR>');
			mac_list_num++;
		}
	}
}		
</script>
	</TABLE>
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2 align=center>
	<input class="add_bt" type="button" value="<%tcWebApi_multilingual("0","glbstr_add")%>" name="Add" id="add" onClick="isfull(array_max_num)">&nbsp;&nbsp;
	<input class="edit_bt" type="submit" value="<%tcWebApi_multilingual("0","glbstr_edit")%>" name="Edit" id="edit" onClick="return check_wlacl_editnum(document.forms[0]);">&nbsp;&nbsp;
	<input class="delete_bt" type="submit" value="<%tcWebApi_multilingual("0","glbstr_delete")%>" name="Delete" id="delete" onClick="return check_wlacl_del(document.forms[0]);">
	</TD>
</TR>

<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</TABLE>
</div>
<div id="waiting_bar" style="display:none">
<div  align="center"><BR><BR><TR><TD align="center"><B><%tcWebApi_multilingual("0","glbstr_please_wait_a_moment_str")%></B></TD></TR><BR><BR></div>
<div class="waiting_img_div" align="center"><img src="/image/wait30.gif" alt="waiting" /></div>
</div>
<%tcWebApi_multilingual("2","_WLG_acl_help.asp")%>
</FORM>
</BODY>
</HTML>
