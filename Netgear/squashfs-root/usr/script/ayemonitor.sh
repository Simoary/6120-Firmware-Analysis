#!/bin/sh
FILE_USB_IN="/tmp/driver_event_usbin"
FILE_USB_OUT="/tmp/driver_event_usbout"
MOUNTINFO="/tmp/mount_usb_info"
FILE_PINCODE_FAIL="/tmp/WscAPPinFailLed"
USBSTORAGEACTION_UPDATE=2

#Start Web server and get Pid
/userfs/bin/boa -c /boaroot -d &
BOA_PID=`/bin/pidof boa`
PROC_BOA_STAT="/proc/"$BOA_PID"/stat"

mkdir /tmp/shares
while [ 1 ]; do
	if [ -f $FILE_USB_IN ]; then
		sleep 30
		RES=`ls /proc/scsi/usb-storage/ | sed -n '1p'`
		/userfs/bin/tcapi set USBStorage_Common ScsiIndex $RES
		df | sed 's/ \+/:/g;' |sed '1d'| sed '/\/dev\/mtdblock[0-9]/d' > $MOUNTINFO
		/userfs/bin/tcapi set USBStorage_Common Action  $USBSTORAGEACTION_UPDATE
		/userfs/bin/tcapi commit USBStorage_Entry
		/userfs/bin/tcapi commit Samba_Entry
		/userfs/bin/tcapi commit Ftp_Entry
		rm -rf $FILE_USB_IN
	fi
	
	if [ -f $FILE_USB_OUT ]; then
		sleep 3
		/userfs/bin/tcapi set USBStorage_Common ScsiIndex -1
		echo 0 > $MOUNTINFO
		/userfs/bin/tcapi set USBStorage_Common Action  $USBSTORAGEACTION_UPDATE
		/userfs/bin/tcapi commit USBStorage_Entry
		/userfs/bin/tcapi commit Samba_Entry
		/userfs/bin/tcapi commit Ftp_Entry
		rm -rf $FILE_USB_OUT
	fi	

    if [ -f $FILE_PINCODE_FAIL ]; then
        sleep 3
        /userfs/bin/tcapi set WLan_Entry0 appin_fail_led 1
        /userfs/bin/tcapi set WLan11ac_Entry0 appin_fail_led 1
        rm -rf $FILE_PINCODE_FAIL
    fi
    
	if [ ! -f $PROC_BOA_STAT ]; then
		/userfs/bin/boa -c /boaroot -d &
		BOA_PID=`/bin/pidof boa`
		PROC_BOA_STAT="/proc/"$BOA_PID"/stat"
	fi
	sleep 3
done
