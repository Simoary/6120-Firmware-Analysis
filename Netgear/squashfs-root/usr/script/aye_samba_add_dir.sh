#!/bin/sh

SAMBA_FILE=/etc/samba/smb.conf

if [ ! -n "$4" ]; then
	echo "insufficient arguments!"
	echo "Usage: $0 <dir name> <browseable> <writable> <security>"
	echo "Example: $0 temp /temp admin"
	exit 0
fi

if [ "$4" = "0" ]; then

echo "
[$1]
valid users = admin
path = /tmp/shares/$1
public = No
browseable = $2
writable = $3
" >> $SAMBA_FILE

else

echo "
[$1]
path = /tmp/shares/$1
public = Yes
browseable = $2
writable = $3
" >> $SAMBA_FILE

fi
