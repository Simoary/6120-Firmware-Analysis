#!/bin/sh
rm -rf /var/ProductionImage.bin
echo 1 > /proc/sys/vm/drop_caches
echo 2 > /proc/sys/vm/drop_caches
echo 3 > /proc/sys/vm/drop_caches

cat /proc/mtd | grep -v "' \t]*\..*" | grep "mtd"  > /var/list
sed -i '/kernel/d' /var/list
sed -i '/rootfs/d' /var/list
cat /var/list | awk -F":" '{print $1}' > /var/list2
exec < /var/list2
while read line
do
	echo "Export /dev/$line..."
	cat /dev/$line >> /var/ProductionImage.bin
done

IPADDRESS=`/userfs/bin/tcapi get Lan_Entry IP`
PRODUCTNAME=`/userfs/bin/tcapi get SkuId_Entry ProductName`
VERSION=`/userfs/bin/tcapi get DeviceInfo BasicInfo_FwVer`
FILENAME="Please download the production Image via http://"$IPADDRESS"/"$PRODUCTNAME"_"$VERSION
echo $FILENAME
echo "Please reboot your CPE after download"