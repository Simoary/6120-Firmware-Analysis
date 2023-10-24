
sleep 2
Ayesystem_Type=`/userfs/bin/tcapi get AyeSystem_Entry Type`
if [ $Ayesystem_Type = "1" ] ; then
	/userfs/bin/tcapi set System_Entry reboot_type 1
	/userfs/bin/tcapi commit System_Entry
fi

if [ $Ayesystem_Type = "2" ] ; then
	/userfs/bin/tcapi set System_Entry reboot_type 2
	/userfs/bin/tcapi commit System_Entry
fi

if [ $Ayesystem_Type = "3" ] ; then
	/userfs/bin/tcapi set System_Entry upgrade_fw 2
	/userfs/bin/tcapi commit System_Entry
fi

