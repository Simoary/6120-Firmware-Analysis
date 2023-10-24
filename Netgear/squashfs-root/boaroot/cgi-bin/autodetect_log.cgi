#!/bin/sh

echo -e "Content-Type: text/html\n"
echo -e "<html><head>\n<meta http-equiv=Content-Script-Type content=text/javascript>\n<meta http-equiv=Content-Style-Type content=text/css>\n<meta http-equiv=Content-Type content=\"text/html; charset=iso-8859-1\">\n<link rel=\"stylesheet\" href=\"/style.css\" type=\"text/css\" tppabs=\"http://192.168.1.1/css/style.css\"><style>body{margin-right: -15px !important;>margin-right: 0px !important;margin-right: 0px}</style></head>"
echo -e "<script language=\"JavaScript\">\nfunction back_syslog()\n{\nvar cfg = '/syslog.xlog';\nvar code = 'location.assign(\"' + cfg + '\")';\neval(code);\n}\n"
echo -e "</script><body>\n<FORM METHOD=\"POST\" ACTION=\"/cgi-bin/status_log2.cgi\" name=\"StatusLogForm\">\n<table width=\"760\" border=\"0\"
align=center cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#FFFFFF\">\n<tr>\n<td width=\"150\" height=\"0\" class=\"title-main\"></td></tr><tr>"
echo -e "<td class=\"light-orange\">&nbsp;</td><td colspan=\"3\" class=\"tabdata\">\n<TEXTAREA NAME=\"AlphaLogDisplay\" ROWS=\"26\" COLS=\"160\" WRAP=\"ON\" EDIT=\"OFF\" READONLY>"
FILE_PATH=/tmp/auto_detect_pvc_log
if [-f $FILE_PATH] ; then
	cat /tmp/auto_detect_pvc_log
else
	echo " " >> $FILE_PATH
	cat /tmp/auto_detect_pvc_log
fi
