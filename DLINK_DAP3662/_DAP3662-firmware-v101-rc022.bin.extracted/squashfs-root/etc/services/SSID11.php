#!/bin/sh
<? /* vi: set sw=4 ts=4: */
if ($SERVDSTART=="1")
{
	echo "ifconfig ath19 up\n";
}
else
{
	echo "ifconfig ath19 down\n";
}
?>
