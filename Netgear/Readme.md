#Web links Related to the Router
https://www.netgear.com/support/download/?model=D6000
https://nvd.nist.gov/vuln/detail/CVE-2015-8288
https://www.kb.cert.org/vuls/id/778696

#Steps taken to get the file system
1) Download the firmware
2) Unzip it
3) Run biwalk _firmware_.bin 
4) Got the lmza file offset
5) Use command dd if=_firmware_name.bin skip=160 bs=1 of=kernel.lzma to get kernel.lmza file
6) Use lmza -d < kernel.lzma  > kernel
7) binwalk kernel
