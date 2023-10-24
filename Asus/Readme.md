#Weblinks to the firmware
https://www.asus.com/networking-iot-servers/wifi-routers/all-series/rt-ax55/helpdesk_bios/?model2Name=RT-AX55
https://nvd.nist.gov/vuln/detail/CVE-2023-39240
https://www.twcert.org.tw/tw/cp-132-7356-021bf-1.html

#Steps taken 
1) Download firmware
2) Unzip it
3) binwalk _firmware_.bin
4) end of the result you'll see squashfs filesystem
5) use command dd "if=RT-AX55_combo_3.0.0.4_386_50460-g5174ed0_puresqubi.w skip=44974904 bs=1 of=unsquashme" using squashfs offset as skip
6) use command "unsquashfs unsquashme" to get the file system 

