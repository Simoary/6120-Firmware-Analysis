#!/bin/sh

#Stop PPTP & L2TP
/usr/bin/killall -9 pppd_brcm
/usr/bin/killall -9 pptp
/usr/bin/killall -9 openl2tpd
rm -f /var/run/openl2tpd.pid
sleep 1

PPTP_CFG=/var/pptp.cfg
L2TP_CFG=/var/l2tp.cfg
PPTPFUNCNAME=/userfs/bin/pptp
L2TPFUNCNAME=/userfs/bin/openl2tpd

#PPTP
if [ -f $PPTP_CFG ] ; then
	chmod 777 $PPTP_CFG
    . $PPTP_CFG
	if [ "$Active" = "Yes" ] ; then
		echo Launch PPTP
		if [ $Timeout != "0" ] ; then
			if [ $CallID != "_NULL_" ] ; then
				$PPTPFUNCNAME -r $ServerIp -U $Username -P $Password -c ppp0 -i $CallID -o $Timeout &
			else
				$PPTPFUNCNAME -r $ServerIp -U $Username -P $Password -c ppp0 -o $Timeout &
			fi
		else
			if [ $CallID != "_NULL_" ] ; then
				$PPTPFUNCNAME -r $ServerIp -U $Username -P $Password -c ppp0 -i $CallID &
			else
				$PPTPFUNCNAME -r $ServerIp -U $Username -P $Password -c ppp0 &
			fi
		fi
	fi
fi

#L2TP
if [ -f $L2TP_CFG ] ; then
	chmod 777 $L2TP_CFG
    . $L2TP_CFG
	if [ "$Active" = "Yes" ] ; then
		echo Launch openl2tpd
		if [ $Timeout != "0" ] ; then
			$L2TPFUNCNAME -r $ServerIp -U $Username -P $Password -c ppp0 -o $Timeout &
		else
			$L2TPFUNCNAME -r $ServerIp -U $Username -P $Password -c ppp0 &
		fi
	fi
fi
