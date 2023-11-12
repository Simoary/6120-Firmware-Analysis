#!/bin/sh
<? /* vi: set sw=4 ts=4: */
if ($SERVDSTART=="1")
{
	echo "ifconfig ath21 up\n";
}
else
{
	echo "ifconfig ath21 down\n";
}
?>
