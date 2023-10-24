#!/bin/sh

email_cnt=0;
email_cnt=`ps |grep -c email`;
if [ $email_cnt -gt 1  ] ; then 
   /usr/bin/killall -9 email   
fi

MAILSEND_EXE=/userfs/bin/mailsend
MAILSEND_CFG=/var/mailsend.conf

if [ -f $MAILSEND_EXE ] ; then
	MAILSEND_EXIST=Yes
else
	MAILSEND_EXIST=No
fi

exec < $MAILSEND_CFG
read line
MAILSEND_CMD=${line#*=}

EMAIL_CFG=/var/email_script.conf
if [ -f $EMAIL_CFG ] ; then
    chmod 777 $EMAIL_CFG
    . $EMAIL_CFG	
	timestamp1=`date +%s`;	
	
	if [ $# = 1 ] ; then	
		grep "site blocked" $LogPath > /var/log/log_message.xx.${timestamp1}
		line1=`grep -c  "site blocked"  $LogPath`;	
		line2=`grep -c  "site blocked"  /var/log/log_message.xx.${timestamp1}`;

		echo -e "already get lines and line1=$line1 line2=$line2 \n"  >>/var/log/echo.log.${timestamp1};

		j=0;
		while [ $line1 -eq $line2 ]
		do
		  echo "no increase" >>  /var/log/echo.log.${timestamp1}
		  grep -c  "no increase" /var/log/echo.log.${timestamp1}	
		  sleep 1;
		  line1=`grep -c  "site blocked"  $LogPath`;
		  echo -e "line1:$line1   line2:$line2" 
		  echo -e "line1:$line1   line2:$line2"  >> /var/log/echo.log.${timestamp1}
		  j=`expr $j + 1`;	
		  if [ $j -ge 7 ] ; then
		     echo "sleep seconds >=7, jump out from loop" >> /var/log/echo.log.${timestamp1}
		     break;
		  fi	  
		done
		grep "site blocked" $LogPath |head -1 > /var/log/log_message.first.${timestamp1}
	fi	
	
    if [ "$Active" = "Yes" ] ; then
          if [ $# = 1 ] ; then
               #Handler Send Alert Immediately
               if [ $1 = "FromBlockSite" ] ; then
                   if [ $AlertBlocksite = 1 ] ; then
                       echo "before send" >> /var/log/echo.log.${timestamp1}
					   if [ $MAILSEND_EXIST = "Yes" ] ; then
							/userfs/bin/mailsend -sub "$Alert_Subject" -attach /var/log/log_message.first.${timestamp1},$MAILSEND_CMD
					   else
							/userfs/bin/email -s "$Alert_Subject" -V -c /var/email.conf $SendTo  < /var/log/log_message.first.${timestamp1}
					   fi
                       echo "after send" >> /var/log/echo.log.${timestamp1}
                   fi
               fi
               rm -rf /var/log/echo.log.${timestamp1}  
               rm -rf /var/log/log_message.xx.${timestamp1} /var/log/log_message.first.${timestamp1}			   
          else
               echo "begain to email all logs......"
			   if [ $MAILSEND_EXIST = "Yes" ] ; then
					/userfs/bin/mailsend -sub "$LOG_Subject" -attach $LogPath,$MAILSEND_CMD
			   else
					/userfs/bin/email -s "$LOG_Subject" -V -c /var/email.conf $SendTo  < $LogPath
			   fi
               echo "email all logs succeed!"
          fi
    fi
fi
