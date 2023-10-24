#if [ $# != 3 ] ; then
#        echo "usage: $0 [Server] [ProductName] [Filename]"
#        exit 0
#fi

SERVER=60.248.155.55
PRODUCTNAME=`/userfs/bin/tcapi get SkuId_Entry ProductName`
MAC=`/userfs/bin/tcapi get Info_Ether mac | sed 's/://g' | sed y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/`
TIME=`/bin/date '+%Y%m%d%H%M'`
FILENAME=$MAC"_"$TIME

VPI=`/userfs/bin/tcapi get Wan_PVC0 VPI`
VCI=`/userfs/bin/tcapi get Wan_PVC0 VCI`
ENCAP=`/userfs/bin/tcapi get Wan_PVC0 ENCAP`
MACCLONE_TYPE=`/userfs/bin/tcapi get Wan_PVC0 Mac_Assign`
MAC=`/userfs/bin/tcapi get Wan_PVC0 Mac_Spoofing`
InternetMode=`/userfs/bin/tcapi get Wan_Common TransMode`
WANINFO="[Upload to server]Time:"$TIME" VPI:"$VPI" VCI:"$VCI" ENCAP:"$ENCAP" Mode:"$InternetMode" MAC ASSIGN:"$MACCLONE_TYPE" MAC:"$MAC
AUTODETECT_LOG="/tmp/auto_detect_pvc_log"

/bin/ping -c 4 $SERVER | grep packets >> $AUTODETECT_LOG
echo "" >> $AUTODETECT_LOG
/bin/echo $WANINFO >> $AUTODETECT_LOG
echo "" >> $AUTODETECT_LOG
/usr/bin/w ad l n >> $AUTODETECT_LOG
/usr/bin/w ad p >> $AUTODETECT_LOG

if [ -e $AUTODETECT_LOG ]; then
	/bin/cp $AUTODETECT_LOG /tmp/$FILENAME
	cd /tmp
	/usr/bin/ftpput -v -u ftp -p ftp $SERVER $PRODUCTNAME $FILENAME
	cd /
fi

if [ -e /tmp/ayedebug.log ]; then
	/bin/cp /tmp/ayedebug.log /tmp/$FILENAME"_debuglog"
	cd /tmp
	/usr/bin/ftpput -v -u ftp -p ftp $SERVER $PRODUCTNAME $FILENAME"_debuglog"
	cd /
fi
