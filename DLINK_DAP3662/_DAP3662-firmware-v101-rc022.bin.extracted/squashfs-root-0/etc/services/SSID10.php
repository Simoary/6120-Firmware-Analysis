#!/bin/sh
<? /* vi: set sw=4 ts=4: */
if ($SERVDSTART=="1")
{
	echo "ifconfig ath18 up\n";
}
else
{
	echo "ifconfig ath18 down\n";
}
?>
