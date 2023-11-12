<?php
$filename='/var/config'; // my own function included here

header('Content-type: application/octet-stream');
header("Content-Disposition: attachment; filename=\"config\"");
readfile($filename);
?>
