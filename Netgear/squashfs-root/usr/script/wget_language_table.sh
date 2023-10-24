if [ $# != 1 ] ; then
        echo "usage: $0 [Full Path]"
        exit 0
fi

FULLPATH=$1
SERVER=`/userfs/bin/tcapi get AutoUpgrade_Entry NETGEAR_FW_SERVER_IP`
WGETLANGRESULT=/tmp/wget_lang_netgear_status

/usr/bin/wget ftp://$SERVER$FULLPATH --output-document /tmp/tmp_language_string


if [ $? -eq 0 ] ; then
	MD5=`/usr/bin/md5sum /tmp/tmp_language_string | sed y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/ | cut -d ' ' -f 1`
	FILEINFO_MD5=`/userfs/bin/tcapi get LanguageSwitch_Entry Language_md5`
	if [ "$MD5" = "$FILEINFO_MD5" ]; then
		SIZE=`ls /tmp/tmp_language_string -l | sed 's/ \+/ /g' | cut -d ' ' -f5`
		/bin/umount /tmp/aye_language/
		/userfs/bin/mtd writeflash /tmp/tmp_language_string $SIZE 0 language_1
		#Mount the newest string table
		/userfs/bin/tcapi commit LanguageSwitch_Entry
		echo 1 > $WGETLANGRESULT
	else
		echo 0 > $WGETLANGRESULT
	fi
else
	echo 0 > $WGETLANGRESULT
fi
