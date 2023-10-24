#!/bin/sh
FILE="/etc/igd/gatedesc.xml"

rm $FILE
PRODUCT=$1
echo $PRODUCT
echo "	<device>" >> $FILE
echo "		<pnpx:X_hardwareId>VEN_01f2&amp;DEV_1001&amp;REV_01 VEN_01f2&amp;DEV_8000&amp;SUBSYS_01&amp;REV_01 VEN_01f2&amp;DEV_8000&amp;REV_01 VEN_0033&amp;DEV_0008&amp;REV_01</pnpx:X_hardwareId>" >> $FILE
echo "		<pnpx:X_compatibleId>urn:schemas-upnp-org:device:InternetGatewayDevice:1</pnpx:X_compatibleId>" >> $FILE
echo "		<pnpx:X_deviceCategory>NetworkInfrastructure.Router</pnpx:X_deviceCategory>" >> $FILE
echo "		<df:X_deviceCategory>Network.Router.Wireless</df:X_deviceCategory>" >> $FILE
echo "		<deviceType>urn:schemas-upnp-org:device:InternetGatewayDevice:1</deviceType>" >> $FILE
echo "		<friendlyName>"$PRODUCT"</friendlyName>" >> $FILE
echo "		<manufacturer>NETGEAR, Inc.</manufacturer>" >> $FILE
echo "		<manufacturerURL>http://www.netgear.com</manufacturerURL>" >> $FILE
echo "		<modelDescription>"$PRODUCT"</modelDescription>" >> $FILE
echo "		<modelName>"$PRODUCT"</modelName>" >> $FILE
echo "		<modelNumber>"$PRODUCT"</modelNumber>" >> $FILE
echo "		<modelURL>http://www.netgear.com/home/products/wirelessrouters</modelURL>" >> $FILE
echo "		<UDN>uuid:11111111-0000-c0a8-0102-00aabb071106</UDN>" >> $FILE
echo "		<iconList>" >> $FILE
echo "			<icon>" >> $FILE
echo "				<mimetype>image/gif</mimetype>" >> $FILE
echo "				<width>118</width>" >> $FILE
echo "				<height>119</height>" >> $FILE
echo "				<depth>8</depth>" >> $FILE
echo "				<url>/hitsuji.GIF</url>" >> $FILE
echo "			</icon>" >> $FILE
echo "		</iconList>" >> $FILE
echo "		<serviceList>" >> $FILE
echo "			<service>" >> $FILE
echo "				<serviceType>urn:schemas-upnp-org:service:Layer3Forwarding:1</serviceType>" >> $FILE
echo "				<serviceId>urn:upnp-org:serviceId:L3Forwarding1</serviceId>" >> $FILE
echo "				<controlURL>/upnp/control/Layer3Forwarding</controlURL>" >> $FILE
echo "				<eventSubURL>/upnp/event/Layer3Forwarding</eventSubURL>" >> $FILE
echo "				<SCPDURL>/gateinfoSCPD.xml</SCPDURL>" >> $FILE
echo "			</service>" >> $FILE
echo "		</serviceList>" >> $FILE
echo "		<deviceList>" >> $FILE
echo "			<device>" >> $FILE
echo "				<deviceType>urn:schemas-upnp-org:device:WANDevice:1</deviceType>" >> $FILE
echo "				<friendlyName>WANDevice</friendlyName>" >> $FILE
echo "				<manufacturer>NETGEAR, Inc.</manufacturer>" >> $FILE
echo "				<manufacturerURL>http://www.netgear.com</manufacturerURL>" >> $FILE
echo "				<modelDescription>WANDevice</modelDescription>" >> $FILE
echo "				<modelName>WANDevice</modelName>" >> $FILE
echo "				<modelNumber>1</modelNumber>" >> $FILE
echo "				<modelURL>http://www.netgear.com/</modelURL>" >> $FILE
echo "				<serialNumber>00000000</serialNumber>" >> $FILE
echo "				<UDN>uuid:11111111-0000-c0a8-0102-00aabb071107</UDN>" >> $FILE
echo "				<UPC>000000000001</UPC>" >> $FILE
echo "				<serviceList>" >> $FILE
echo "					<service>" >> $FILE
echo "						<serviceType>urn:schemas-upnp-org:service:WANCommonInterfaceConfig:1</serviceType>" >> $FILE
echo "						<serviceId>urn:upnp-org:serviceId:WANCommonIFC1</serviceId>" >> $FILE
echo "						<controlURL>/upnp/control/WANCommonInterfaceConfig</controlURL>" >> $FILE
echo "						<eventSubURL>/upnp/event/WANCommonInterfaceConfig</eventSubURL>" >> $FILE
echo "						<SCPDURL>/gateicfgSCPD.xml</SCPDURL>" >> $FILE
echo "					</service>" >> $FILE
echo "				</serviceList>" >> $FILE
echo "				<deviceList>" >> $FILE
echo "					<device>" >> $FILE
echo "						<deviceType>urn:schemas-upnp-org:device:WANConnectionDevice:1</deviceType>" >> $FILE
echo "						<friendlyName>WANConnectionDevice</friendlyName>" >> $FILE
echo "						<manufacturer>NETGEAR, Inc.</manufacturer>" >> $FILE
echo "						<manufacturerURL>http://www.netgear.com/</manufacturerURL>" >> $FILE
echo "						<modelDescription>WAN Connection Device</modelDescription>" >> $FILE
echo "						<modelName>WAN Connection Device</modelName>" >> $FILE
echo "						<modelNumber>1</modelNumber>" >> $FILE
echo "						<modelURL>http://www.netgear.com/</modelURL>" >> $FILE
echo "						<serialNumber>00000000</serialNumber>" >> $FILE
echo "						<UDN>uuid:11111111-0000-c0a8-0102-00aabb071108</UDN>" >> $FILE
echo "						<UPC>000000000001</UPC>" >> $FILE
echo "						<serviceList>" >> $FILE
echo "							<service>" >> $FILE
echo "								<serviceType>urn:schemas-upnp-org:service:WANIPConnection:1</serviceType>" >> $FILE
echo "								<serviceId>urn:upnp-org:serviceId:WANIPConn1</serviceId>" >> $FILE
echo "								<controlURL>/upnp/control/WANIPConnection</controlURL>" >> $FILE
echo "								<eventSubURL>/upnp/event/WANIPConnection</eventSubURL>" >> $FILE
echo "								<SCPDURL>/gateconnSCPD.xml</SCPDURL>" >> $FILE
echo "							</service>" >> $FILE
echo "						</serviceList>" >> $FILE
echo "					</device>" >> $FILE
echo "				</deviceList>" >> $FILE
echo "			</device>" >> $FILE
echo "		</deviceList>" >> $FILE
