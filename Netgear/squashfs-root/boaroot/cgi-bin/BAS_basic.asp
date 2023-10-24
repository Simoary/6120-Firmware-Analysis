
<html><head><link rel="stylesheet" href="/style/form.css">
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>
<script>
var select_basic="1";
var select_type="0";
var gui_region="English";
var jp_multiPPPoE="";
var netgear_region=top.netgear_region;
//var have_l2tp=( (gui_region == "Russian" && top.l2tp_flag == 1 && (netgear_region == "" || netgear_region.toUpperCase() == "WW")) || netgear_region.toUpperCase() == "RU") ? 1 : 0 ;
var have_l2tp = (top.l2tp_flag == 1) ? 1 : 0;

function loadvalue()
{
        if( select_basic == 1 )
                this.location.href="BAS_ether.asp";
        else
        {
                if(((jp_multiPPPoE == 1 && gui_region != "Japanese" ) || ( select_type == 3 && gui_region == "Japanese") ) && (netgear_region == "" || netgear_region.toUpperCase() == "WW" || netgear_region.toUpperCase() == "JP" ))
                        this.location.href = "BAS_mulpppoe.asp";
                else if( select_type == 0 )
                        this.location.href="BAS_pppoe.asp";
                else if(select_type == 1 )
                        this.location.href="BAS_pptp.asp";
                else if( select_type == 4 && have_l2tp == 1 )
                        this.location.href="BAS_l2tp.asp";
                else
                        this.location.href="BAS_pppoe.asp";

        }

}

</script>
<BODY onLoad="loadvalue();">
</BODY>

</HTML>


