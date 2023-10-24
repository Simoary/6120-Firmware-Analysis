if [ $# != 1 ] ; then
        echo "usage: $0 [Firmwarename] [Server]"
        exit 0
fi

FIRMWARENAME=$1
SERVER=`/userfs/bin/tcapi get AutoUpgrade_Entry NETGEAR_FW_SERVER_IP`
WGETFWRESULT=/tmp/wget_fw_netgear_status

/usr/bin/wget ftp://$SERVER$FIRMWARENAME --output-document /tmp/boa-temp-aye


if [ $? -eq 0 ] ; then
	MD5=`/usr/bin/md5sum /tmp/boa-temp-aye | sed y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/ | cut -d ' ' -f 1`
	IMG_MD5=`/userfs/bin/tcapi get AutoUpgrade_Entry FW_md5`
	if [ "$MD5" = "$IMG_MD5" ]; then
		echo 1 > $WGETFWRESULT
	else
		echo 0 > $WGETFWRESULT
	fi
else
	echo 0 > $WGETFWRESULT
fi
