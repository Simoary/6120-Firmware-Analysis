<? /* vi: set sw=4 ts=4: */
require("/etc/templates/troot.php");
require($template_root."/upnpd/__NOTIFY.req.event.php");
?>
<e:propertyset xmlns:e="urn:schemas-upnp-org:event-1-0">
	<e:property>
		<TotalAssociations><?
			$count=0;
			for ("/runtime/stats/wireless/client") { $count++; }
			echo $count;
		?></TotalAssociation>
	</e:property>
</e:propertyset>
