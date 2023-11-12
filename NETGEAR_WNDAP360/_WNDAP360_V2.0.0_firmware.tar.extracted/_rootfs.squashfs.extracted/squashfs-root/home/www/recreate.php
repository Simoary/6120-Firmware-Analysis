<?php
	session_start();
	@unlink('/tmp/sessionid');
	session_destroy();
	
	session_start();
	$fp = fopen('/tmp/sessionid', 'w');
	fwrite($fp, session_id().','.$_SERVER['REMOTE_ADDR']);
	fclose($fp);
	echo 'recreateok';
?>
