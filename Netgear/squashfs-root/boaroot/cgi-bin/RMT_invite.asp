<html>
<head>
    <link rel="stylesheet" href="/style/form.css">
    <script language=javascript type=text/javascript src="funcs.js"></script>
    <Meta http-equiv="Pragma" Content="no-cache">
    <META HTTP-equiv="Cache-Control" content="no-cache">
    <Meta http-equiv="Expires" Content="0">
    <META http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<script language=javascript type=text/javascript src='/language/English.js'></script>
    <title>ReadySHARE Remote</title>
</head>
<body>
    <form method="POST" action="/cgi-bin/RMT_invite.cgi?/cgi-bin/RMT_invite.asp">
    <input type="hidden" name="submit_flag" value="register_user">
	<div class="page_title"><script>document.write(remote_share_head)</script></div>
	<div id="main" class="main">
    	<table width="100%" border="0" cellpadding="0" cellspacing="3">
        <tr>
            <td colspan="2">
                
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <img src="liteblue.gif" width="100%" height="12">
            </td>
        </tr>
        <tr>
            <td colspan="2">
	    <p><script>document.write(ready_share_info1)</script></p>
		<p>
		<b><script>document.write(how_setup_ready_share)</script></b><br/>
		<script>
		document.write(ready_share_step1+'<br/>');
		document.write(ready_share_step2+'<br/>');
		document.write(ready_share_step3+'<br/>');
		document.write(ready_share_step4+'<br/>');
		document.write(ready_share_set_note);

		</script>
		</p>	
            </td>
        </tr>
	<tr>
	   <td colspan="2">
	   <img src="liteblue.gif" width="100%" height="12">
	   </td>
        </tr>
        <tr>
            <td colspan="2">
	    <b><script>document.write(ready_share_start)</script></b><br/>
	    <script>document.write(ready_share_get_account)</script></b><br/>
            </td>
        </tr>
        <tr>
            <td>
                <b><script>document.write(username)</script>:</b>
            </td>
            <td>
                <input type="text" value="" name="TXT_remote_login" maxlength="25" size="28">
            </td>
        </tr>
        <tr>
            <td>
                <b><script>document.write(key_passphrase)</script>:</b>
            </td>
            <td>
                <input type="password" value="" name="TXT_remote_password" maxlength="25" size="28">
            </td>
        </tr>
        <tr>
            <td colspan="2">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
	        <input class="common_bt" type="submit" name="BTN_reg" value="'+register+'"> ('+register_note+')');
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <img src="liteblue.gif" width="100%" height="12">
            </td>
        </tr>
        <tr>
            <td colspan="2">
            </td>
        </tr>
    </table>
    </div>
	
<div id=help style="display: none">
<%tcWebApi_multilingual("2","_remote_share_help.asp")%>	
</form>
</body>
</html>
