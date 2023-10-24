if [ $# != 3 ] ; then
        echo "usage: $0 [ProductName] [Region] [Firmwarename]"
        exit 0
fi

ProductName=$1
REGION=$2
FIRMWARENAME=$3
SERVER=`/userfs/bin/tcapi get AutoUpgrade_Entry NETGEAR_FW_SERVER_IP`
WGETFWRESULT=/tmp/wget_fw_netgear_status

/usr/bin/wget ftp://$SERVER/$ProductName/$REGION/$FIRMWARENAME --output-document /var/tmp/tclinux.bin


if [ $? -eq 0 ] ; then
	echo 1 > $WGETFWRESULT
	/userfs/bin/tcapi set System_Entry upgrade_fw 1
	/userfs/bin/tcapi commit System_Entry
else
	echo 0 > $WGETFWRESULT
fi
