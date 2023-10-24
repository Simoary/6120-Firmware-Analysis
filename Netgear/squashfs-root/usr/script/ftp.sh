#!/bin/sh

BFTPCONF_FILE=/tmp/bftpd.conf

if [ ! -n "$4" ]; then
	echo "insufficient arguments!"
	echo "Usage: $0 <listen port> <root dir> <auth> <password file>"
	echo "Example: $0 21 /tmp/shares yes /tmp/ftpdpassword"
	exit 0
fi

LISTENPORT=$1
ROOTDIR=$2
AUTH=$3
PASSWORD_FILE=$4

echo "global {
  DENY_LOGIN=\"no\"
  PORT=\"$LISTENPORT\"
  PASSIVE_PORTS=\"30001-30050\"
  DATAPORT20=\"no\"
  ADMIN_PASS=\"x\"
  PATH_BFTPDUTMP=\"/var/run/bftpd/bftpdutmp\"
  XFER_BUFSIZE=\"131072\"
  CHANGE_BUFSIZE=\"no\"
  XFER_DELAY=\"0\"
  SHOW_HIDDEN_FILES=\"no\"
  SHOW_NONREADABLE_FILES=\"no\"
  ALLOW_FXP=\"no\"
  CONTROL_TIMEOUT=\"300\"
  DATA_TIMEOUT=\"30\"
  RATIO=\"none\"
  ROOTDIR=\"$ROOTDIR\"
  UMASK=\"022\"
  LOGFILE=\"\"
  HELLO_STRING=\"bftpd %v at %i ready.\"
  AUTO_CHDIR=\"/tmp/shares\"
  AUTH=\"PASSWD\"
  FILE_AUTH=\"$PASSWORD_FILE\"
  RESOLVE_CLIENT_IP=\"no\"
  MOTD_GLOBAL=\"/etc/ftpmotd\"
  MOTD_USER=\"/.ftpmotd\"
  RESOLVE_UIDS=\"yes\"
  DO_CHROOT=\"no\"
  LOG_WTMP=\"no\"
  BIND_TO_ADDR=\"any\"
  PATH_FTPUSERS=\"/etc/ftpusers\"
  AUTH_ETCSHELLS=\"no\"
  ALLOWCOMMAND_DELE=\"yes\"
  ALLOWCOMMAND_STOR=\"yes\"
  ALLOWCOMMAND_SITE=\"yes\"
  HIDE_GROUP=\"\"
  QUIT_MSG=\"Goodbye.\"
  USERLIMIT_GLOBAL=\"0\"
  USERLIMIT_SINGLEUSER=\"0\"
  USERLIMIT_HOST=\"0\"
  GZ_UPLOAD=\"no\"
  GZ_DOWNLOAD=\"no\"
  ANONYMOUS_USER=\"$AUTH\"
}

user ftp {
  #Any password fits.
  ANONYMOUS_USER=\"yes\"
}

user anonymous {
  #If the client wants anonymous, ftp is taken instead.
  ALIAS=\"ftp\"
}

user root {
  DENY_LOGIN=\"Root login not allowed.\"
}" > $BFTPCONF_FILE
