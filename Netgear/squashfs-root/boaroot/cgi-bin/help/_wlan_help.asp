<html><head><link rel="stylesheet" href="../../../style/help.css">
<title><%tcWebApi_multilingual("3","title_str")%></title><meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta content="MSHTML 6.00.2800.1141" name="GENERATOR">

</head>
<script language="javascript" type="text/javascript">
var host_name = top.host_name;
var video_router_flag = top.video_router_flag;
var guest_router_flag=top.guest_router_flag;
var an_router_flag = top.an_router_flag;
var is_vc_release = top.is_vc_release;
var mode_is_300 = top.mode_is_300;
var wire_iso_flag=top.wire_iso_flag;
</script>
<%tcWebApi_multilingual("3","content_str")%> 
<script>

                if( is_vc_release == 1 )
                        document.write("<P>Mode<P>Select the wireless mode you want to use. The options are:<UL><LI>Up to 54 Mbps. Legacy Mode, with a maximum speed of 54 Mbps for b/g networks.<LI>Up to 65 Mbps. Neighbor-Friendly Mode, with a maximum speed of 65 Mbps in the presence of neighboring wireless networks.<LI>Up to 150 Mbps Mixed Mode. Performance Mode, with a maximum Wireless-N speed of 150 Mbps. Supports 11b, 11g, and 11n wireless stations.<LI> Up to 150 Mbps g/n Mode. Performance Mode, supports 11g and 11n wireless stations only.<LI>Up to 150 Mbps n Mode. Performance Mode, supports 11n wireless stations only.</LI></UL><P>The default is <b>Up to 150 Mbps g/n mode</b>, which allows 11g and 11n wireless stations only.</P>");
		else if( mode_is_300 == 1 )
			document.write("<%tcWebApi_multilingual("3","content_6_str")%>");
		else
			document.write("<P>Mode<P>Select the wireless mode you want to use. The options are:<UL><LI>Up to 54 Mbps. Legacy Mode, with a maximum speed of up to 54 Mbps for b/g networks.<LI>Up to 65 Mbps. Neighbor-Friendly Mode, with a speed of up to 65 Mbps in the presence of neighboring wireless networks.<LI>Up to 150 Mbps. Performance Mode, with a maximum Wireless-N speed of up to 150 Mbps.</LI></UL><P>The default is <b>Up to 65 Mbps</b>, which allows all 11b and 11g and 11n wireless stations. </P>");
</script>
<%tcWebApi_multilingual("3","security_option_str")%> 
</HTML>
