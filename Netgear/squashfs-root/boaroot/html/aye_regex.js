/*
 *	It maintains the GUI regular expression for centralizing the field limitaions.
 *  And please follow the coding rule with aye_regex_YOUR_DEFINE.
 *  1.Using aye_regex as prefix.
 *  2.Capitalizing YOUR_DEINFE string.
 *  For example,if you want to add a regular expression for ipv4. 
 *	You should define the varable as aye_regex_IPV4.
 *	Other examples: 
 *		aye_regex_NUMBER64 - Good
 *		aye_regex_String - Bad
 *		aye_regex_man - Bad
 *
 */

var aye_regex_IPV4 = /^((([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))$/;
var aye_regex_MASK = /(^(128|192|224|24[08]|25[245]).0.0.0$)|(^255.(0|128|192|224|24[08]|25[245]).0.0$)|(^255.255.(0|128|192|224|24[08]|25[245]).0$)|(^255.255.255.(0|128|192|224|24[08]|252)$)/;
var aye_regex_MAC = /^([0-9a-fA-F]{2}[:]){5}([0-9a-fA-F]{2})$/;
var aye_regex_ATMPCR = /^([0-9]|[1-9][0-9]|[1-9][0-9][0-9]|[1-9][0-9][0-9][0-9]|[1][0-9][0-9][0-9][0-9]|[2][0-5][0-5][0][0])$/;
var aye_regex_ATMSCR = /^([0-9]|[1-9][0-9]|[1-9][0-9][0-9]|[1-9][0-9][0-9][0-9]|[1][0-9][0-9][0-9][0-9]|[2][0-5][0-5][0][0])$/;
var aye_regex_ATMMBS = /^(^([0-9]|[1-9][0-9]|[1-9][0-9][0-9]|[1-9][0-9][0-9][0-9]|[1-9][0-9][0-9][0-9][0-9]|[1-9][0-9][0-9][0-9][0-9][0-9]|[1][0][0][0][0][0][0])$)/;
var aye_regex_PPPUSERNAME = /^([0-9]|\w|_|@|\.| |\"|<|>|\\|`|\+|\,|&|\[|\]|\#|-|\~|\/|\%|\(|\)|\*|\?|'|\=|\^|\||\$|!){1,64}$/;
var aye_regex_PPPPASSWORD = /^([0-9]|\w|_|@|\.| |\"|<|>|\\|`|\+|\,|&|\[|\]|\#|-|\~|\/|\%|\(|\)|\*|\?|'|\=|\^|\||\$|!|){1,32}$/;
var aye_regex_PPPIDLETIME = /^([0-9]|[1-9][0-9]|[1-9][0-9][0-9]|[0-3][1-9][1-9][1-9]|[4][0-2][0-9][0-9]|43[0-1][0-9]|4320)$/;
var aye_regex_COMMONSTRING = /^([0-9a-zA-Z]|_|@|\.| |\"|<|>|\\|`|\+|\,|&|\[|\]|\#|-|!|\$|%|\^|\*|\(|\)|:){1,32}$/;
/*
 *	Regular Expression Customization.
 */

var netgear_regex_example = /[0-9]/;
