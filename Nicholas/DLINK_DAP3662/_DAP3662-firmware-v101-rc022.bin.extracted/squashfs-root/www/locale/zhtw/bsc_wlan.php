<?
$m_context_title = "無線設定";
$m_band = "無線頻帶";
$m_band_5G = "5GHz";
$m_band_2.4G = "2.4GHz";
$m_application           = "Application";
$m_indoor           = "Concurrent 11a/n on W52/W53/W56 for indoor";
$m_outdoor          = "Concurrent 11a/n on W56 for outdoor";
$m_in_out_door      = "Concurrent 11b/g/n on 2.4GHz for indoor/outdoor";
$m_mode           = "模式";
$m_ap_access      = "存取點";
$m_ap_repeater    = "AP重複器";
$m_ap_client      = "無線客戶機";
$m_ap_wds         = "無線分散系統";
$m_ap_wds_with_ap = "無線分散系統與AP";

$m_ap_hidden = "服務設定識別碼能見度";
$m_disable = "取消";
$m_enable  = "啟動";
$m_auto_ch_scan = "自動信道選擇";
$m_channel = "信道";
$m_channel_width ="信道寬度";
$m_cw_20	= "20 MHz";
$m_cw_auto	= "自動20/40 MHz";

$m_authentication = "認證";
$m_auth_open      = "開放系統";
$m_auth_shared    = "共享金鑰";
$m_auth_both      = "開放系統/共享金鑰";
$m_auth_wpaper    = "WPA-家用";
$m_auth_wpaent    = "WPA-企業";
$m_auth_1x    = "802.1X";
$m_wapi_cert	= "WAPI-Cert";
$m_wapi_psk		= "WAPI-Psk";

$m_key_field_title = "金鑰設定";
$m_encryption = "加密";
$m_key_type = "金鑰型態";
$m_ascii = "ASCII";
$m_hex = "HEX";
$m_key_size   = "金鑰大小";
$m_key_64bit  = "64 Bits";
$m_key_128bit = "128 Bits";
$m_key_152bit = "152 Bits";
$m_default_key = "金鑰索引 (1~4)";
$m_key = "網路金鑰";
$m_key1 = "1";
$m_key2 = "2";
$m_key3 = "3";
$m_key4 = "4";
$m_confirm_key = "確認金鑰";

$m_passphrase_field_title = "密碼串設定";
$m_cipher = "密文型態";
$m_cipher_auto = "自動";
$m_cipher_aes = "高級加密標準";
$m_cipher_tkip = "暫時密鑰完整性協定";
$m_wpa_mode = "WPA模式";
$m_wpa_mode_auto = "自動 (WPA或WPA2)";
$m_wpa_mode_wpa2 = "限WPA2";
$m_wpa_mode_wpa  = "限WPA";
$m_gkui = "組金鑰更新時距";
$m_sec  = "（秒）";
$m_passphrase  = "密碼串";
$m_confirm_passphrase = "確認密碼串";

$m_eap_field_title = "EAP Settings";
$m_eap_method = "EAP Method";
$m_peap = "PEAP";
$m_ttls = "TTLS";
$m_mschav2 = "MSCHAPv2";
$m_pap = "PAP";
$m_chap = "CHAP";
$m_inner_auth = "Inner Authentication";
$m_username = "Username";
$m_password = "Password";

$m_radius_field_title = "遠端認證撥接使用者服務伺服器設定";
$m_primary_radius_title = "主要遠端認證撥接使用者服務伺服器設定";
$m_secondary_radius_title = "備份遠端認證撥接使用者服務伺服器設定（選擇性）";
$m_primary_accounting_title = "主要會計伺服器設定";
$m_secondary_accounting_title = "備份會計伺服器設定（選擇性）";
$m_nap_title = "網路存取防護";
$m_nap ="網路存取防護";
$m_radius_server = "遠端認證撥接使用者服務伺服器";
$m_radius_port = "遠端認證撥接使用者服務連接埠";
$m_radius_secret = "遠端認證撥接使用者服務秘密";
$m_accounting_mode = "會計模式";
$m_accounting_server = "會計伺服器";
$m_accounting_port = "會計連接埠";
$m_accounting_secret = "會計秘密";

$m_radius_server_mode = "RADIUS Server Mode";
$m_kui = "Key Update Interval";
$m_external = "External";
$m_internal = "Internal";
$m_ssid = "網路名稱（服務設定識別碼）";
$m_auto_chennel = "自動信道掃瞄";

$m_wds_mac_title = "無線分散系統";
$m_wds_ap_mac_title = "無線分散系統與AP";
$m_remote_ap_mac = "遠端AP 網路實際位址";
$m_site_survey_title = "網站調查";
$m_b_scan = "掃瞄";
$m_scan_type = "型態";
$m_scan_ch = "CH";
$m_scan_signal = "信號";
$m_scan_mac = "基礎服務設定識別碼";
$m_scan_sec = "安全";
$m_scan_ssid = "服務設定識別碼";

$m_manual="Manual";
$m_periodrical_key_change="Periodical Key Change";
$m_time="Time Interval";
$m_hour="(1~168)hour(s)";
$m_activated_from = "Activated From";
$m_shour = "Hour";
$m_smin = "minute";
$m_sun = "Sun";
$m_mon = "Mon";
$m_tue = "Tue";
$m_wed = "Wed";
$m_thu = "Thu";
$m_fri = "Fri";
$m_sat = "Sat";

$m_as_ip = "AS IP Address";
$m_as_port = "Port";
$m_ukui = "Unicat Key Update Interval";
$a_enable_nap ="If Network Access Protection enable , Limit Administrator Status will be disable !";
$a_check_mail_for_rekey = "Please check the Log or E-mail for the new security key.";
$a_invalid_time_range	= "Invalid Time Interval range !";
if(query("/runtime/web/display/sys/hostname") == "DAP-1353")
{
	$a_invalid_mssid_status =   "Multi- SSID will be disabled when ".query("/sys/hostname")." is configured in 'WDS', 'Wireless Client' or 'AP Repeater'.";
}
else
{
$a_invalid_mssid_status	=	"當".query("/sys/hostname")."在'無線分散系統'或'Wireless Client'中被組態時，多重服務設定識別碼將變成取消、失能狀態。";
}
$a_empty_ssid	= "服務設定識別碼欄不可空白。";
$a_invalid_ssid	= "服務設定識別碼欄內有些字元無效。請檢查。";
$a_first_blank_ssid	= "第一個字元不可空白。";
$a_empty_username	= "The username field can not be blank.";
$a_invalid_username	= "There are some invalid characters in the username field. Please check it.";
$a_first_blank_username	= "The first character can't be blank.";
$a_invalid_pass_len	= "The length of password should be 8~63.";
$a_invalid_pass	= "The password should be ASCII characters.";
$a_blank_wds_mac	=	"請輸入網路實際位址。";
$a_invalid_wds_mac = "網路實際位址無效。\\n格式xx:xx:xx:xx:xx:xx (x:0-9;A-f)";
$a_same_wds_mac	= "已有相同的網路實際位址存在。\\n請更換網路實際位址。";
$a_empty_key = "金鑰不可空白。";
$a_first_end_blank  = "第一個字元與最後一個字元不可空白。";
$a_valid_hex_char	= "有效字元為0~9、A~F或a~f。";
$a_valid_asc_char	= "有效字元為ASCII。";
$a_invalid_len_hex_64 ="金鑰長度必須為10個十六進制數。";
$a_invalid_len_hex_128 ="金鑰長度必須為26個十六進制數。";
$a_invalid_len_asc_64 ="金鑰長度必須為5個ASCII數。";
$a_invalid_len_asc_128 ="金鑰長度必須為13個ASCII數。";
$a_invalid_psk_len	= "密碼串的長度應為8-63。";
$a_invalid_eap_pass_len  = "The length of password should be 8~64.";
$a_invalid_psk	= "密碼串應為ASCII字元。";
$a_invalid_key_interval	= "組金鑰更新時距的範圍為300到9999999。";
$a_invalid_1x_key_interval	= "The range of 802.1x Key Update Interval is 300 to 9999999.";
$a_invalid_radius_srv	= "遠端認證撥接使用者服務伺服器的IP位址無效。";
$a_invalid_radius_port	= "遠端認證撥接使用者服務伺服器的連接埠無效。";
$a_empty_radius_sec	= "遠端認證撥接使用者服務伺服器的共享秘密不可空白。";
$a_invalid_radius_sec	= "遠端認證撥接使用者服務伺服器的共享秘密應為ASCII字元。";
$a_invalid_acc_srv	= "會計伺服器的IP位址無效。";
$a_invalid_acc_port	= "會計伺服器的連接埠無效。";
$a_empty_acc_sec	= "會計伺服器的共享秘密不可空白。";
$a_invalid_acc_sec	= "會計伺服器的共享秘密應為ASCII字元。";
$a_unknown_auth = "不明的認證型態。";
$a_key_not_matched	="網路金鑰與確認金鑰不相符。";
$a_passphrase_not_matched	="密碼串與確認密碼串不相符。";
$a_invalid_vlan_status	=	"當認證未在'WPA-Enterprise'內被組態時，虛擬區域網路將被取消。";
$a_key_index_matched_mssid_index = "金鑰值被服務設定識別碼所使用！\\n改變金鑰值將影響其他服務設定識別碼設定。";
$a_otherband_to_apmode = "Can't set this mode to APC if the other mode is WDS, WDS with AP or APC.";
$a_disable_ap_array = "If mode is WDS, WDS with AP or APC, AP Array will be disabled.";
$a_disable_url = "If mode is WDS or APC, Web Redirection will be disabled.";
$a_disable_vlan = "If mode is APC, VLAN will be disabled.";
$a_two_band_same_time = "Two bands will share the same time range of Periodical Key Change.";
$a_invalid_password_len = "The length of password should be 8~64.";
$a_two_band_share_the_same_nap = "NAP of the other band will enable/disable like this band.";
$a_invalid_secret_len = "The length of password should be 1~64.";

$a_empty_as_ip = "Please input IP Address!";
$a_invalid_as_ip = "The IP Address is invalid!";
$a_empty_as_port = "Please input a port!";
$a_invalid_as_port = "The Port is invalid!";
$a_invalid_usk_key_interval = "The range of Unicate Key Update Interval is 300 to 9999999.";
$m_clone_mac = "Wireless MAC Clone";
$m_mac_source = "MAC Source";
$m_auto = "Auto";
$m_manual = "Manual";
$m_scan = "Scan";
$m_mac_addr = "MAC Address";
$a_invalid_mac = "Invalid MAC address !";
$a_invalid_secret_len = "The length of password should be 1~64.";
?>
