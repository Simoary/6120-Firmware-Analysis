<div  id="WirelessBlock">
	<table class="BlockContent" style="margin-top: 10px; width: 100%;">
		<tr>
			<td style="margin: 0px; padding: 0px; border-spacing: 0px;">
				<ul class="inlineTabs">
					{if $config.TWOGHZ.status}
					<li {if $data.activeMode eq '0' OR $data.activeMode eq '1' OR $data.activeMode eq '2' OR $data.activeMode0 eq '0' OR $data.activeMode0 eq '1' OR $data.activeMode0 eq '2'}class="Active" activeRadio="true"{else} activeRadio="false"{/if} id="inlineTab1"><a href="#">802.11<span class="Active" onmouseover='showLayer(this);' onmouseout='hideLayer(this);'><b class="RadioText{if $data.activeMode eq '0' OR $data.activeMode0 eq '0'}Active{/if}">b{if $data.activeMode eq '0' OR $data.activeMode0 eq '0'}<img src="../images/activeRadio.gif"><span>Radio is set to 'ON'</span>{/if}</b></span>/<span class="Active" onmouseover='showLayer(this);' onmouseout='hideLayer(this);'><b class="RadioText{if $data.activeMode eq '1' OR $data.activeMode0 eq '1'}Active{/if}">bg{if $data.activeMode eq '1' OR $data.activeMode0 eq '1'}<img src="../images/activeRadio.gif"><span>Radio is set to 'ON'</span>{/if}</b></span>{if $config.MODE11N.status}/<span class="Active" onmouseover='showLayer(this);' onmouseout='hideLayer(this);'><b class="RadioText{if $data.activeMode eq '2' OR $data.activeMode0 eq '2'}Active{/if}">ng{if $data.activeMode eq '2' OR $data.activeMode0 eq '2'}<img src="../images/activeRadio.gif"><span>Radio is set to 'ON'</span>{/if}</b></span>{/if}</a></li>
					<input type="hidden" id="activeMode0" value="{$data.activeMode0}">
					{/if}
					{if $config.FIVEGHZ.status}
					<li {if $data.activeMode eq '3' OR $data.activeMode eq '4' OR $data.activeMode1 eq '3' OR $data.activeMode1 eq '4'}class="Active" activeRadio="true"{else} activeRadio="false"{/if} id="inlineTab2"><a href="#">802.11<span class="Active" onmouseover='showLayer(this);' onmouseout='hideLayer(this);'><b class="RadioText{if $data.activeMode eq '3' OR $data.activeMode1 eq '3'}Active{/if}">a{if $data.activeMode eq '3' OR $data.activeMode1 eq '3'}<img src="../images/activeRadio.gif"><span>Radio is set to 'ON'</span>{/if}</b></span>{if $config.MODE11N.status}/<span class="Active" onmouseover='showLayer(this);' onmouseout='hideLayer(this);'><b class="RadioText{if $data.activeMode eq '4' OR $data.activeMode1 eq '4'}Active{/if}">na{if $data.activeMode eq '4' OR $data.activeMode1 eq '4'}<img src="../images/activeRadio.gif"><span>Radio is set to 'ON'</span>{/if}</b></span>{/if}</a></li>
					<input type="hidden" id="activeMode1" value="{$data.activeMode1}">
					{/if}
					<span id="radioOn" style="display: none;">Radio is set to 'ON'</span>
					<input type="hidden" id="activeMode" value="{$data.activeMode}">
				</ul>
			</td>
		</tr>
	</table>
	<input type="hidden" name="currentInterface" id="currentInterface" value="{$interface}">
	<input type="hidden" name="currentInterfaceNum" id="currentInterfaceNum" value="{$interfaceNum}">
    <input type="hidden" name="previousInterfaceNum" id="previousInterfaceNum">
