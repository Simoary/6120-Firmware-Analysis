!function(f){f.su.moduleManager.define("accessControl",{models:["accessControl","addAccessControl","accessControlEnableM"],stores:["accessModeStore","blacklistGridStore","whitelistGridStore","addDeviceStore","blacklistOnlineStore","whitelistOnlineStore","portForwardingConnectedDevicesStore"],services:["ajax"],views:["accessControlView"],listeners:{ev_on_launch:function(e,t,a,s,n,o,c){s.accessControl.load(),s.accessControlEnableM.load()}},init:function(C,n,v,g,e,S){this.configViews({id:"accessControlView",items:[{id:"grid-blacklist",configs:{minLines:0,paging:{},columns:[{text:f.su.CHAR.ACCESS_CONTROL.DEVICE_NAME,dataIndex:"name",cls:"xl-hide l-hide"},{text:f.su.CHAR.ACCESS_CONTROL.DEVICE_TYPE,dataIndex:"deviceType",cls:"icon40 access-control-icon40",renderer:function(e,t){e!==undefined&&null!==e||(e="pc");var a="",s="";switch(e=e.toLowerCase()){case"pc":a="icon-pc";break;case"phone":a="icon-phone";break;case"pad":a="icon-pad";break;case"camera":a="icon-camera";break;case"printer":a="icon-printer";break;case"other":a="icon-other";break;default:a="icon-"+e}return s+='<div class="device-type-container widget-container">',s+='<span class="icon '+a+' "></span>',s+="</div>"}},{text:f.su.CHAR.ACCESS_CONTROL.DEVICE_NAME,dataIndex:"name",cls:"s-hide m-hide"},{text:f.su.CHAR.ACCESS_CONTROL.MAC_ADDRESS,dataIndex:"mac"},{xtype:"actioncolumn",text:f.su.CHAR.ACCESS_CONTROL.MODIFY,renderer:function(e,t){return'<span class="icon"></span>','<span class="text"></span>',"</a>",'<a href="javascript:void(0)" class="grid-content-btn grid-content-btn-delete btn-delete"><span class="icon"></span><span class="text"></span></a>'}}]}},{id:"grid-whitelist",configs:{minLines:0,paging:{},columns:[{text:f.su.CHAR.ACCESS_CONTROL.DEVICE_NAME,dataIndex:"name",cls:"xl-hide l-hide"},{text:f.su.CHAR.ACCESS_CONTROL.DEVICE_TYPE,dataIndex:"deviceType",cls:"icon40 access-control-icon40",renderer:function(e,t){e!==undefined&&null!==e||(e="pc");var a="",s="";switch(e=e.toLowerCase()){case"pc":a="icon-pc";break;case"phone":a="icon-phone";break;case"pad":a="icon-pad";break;case"camera":a="icon-camera";break;case"printer":a="icon-printer";break;case"other":a="icon-other";break;default:a="icon-"+e}return s+='<div class="device-type-container widget-container">',s+='<span class="icon '+a+' "></span>',s+="</div>"}},{text:f.su.CHAR.ACCESS_CONTROL.DEVICE_NAME,dataIndex:"name",cls:"s-hide m-hide"},{text:f.su.CHAR.ACCESS_CONTROL.MAC_ADDRESS,dataIndex:"mac"},{xtype:"actioncolumn",text:f.su.CHAR.ACCESS_CONTROL.MODIFY,renderer:function(e,t){var a='<a href="javascript:void(0)" class="grid-content-btn grid-content-btn-delete btn-delete '+("HOST"===t.host?"disabled":"")+'">';return a+='<span class="icon"></span>',a+='<span class="text"></span>',a+="</a>"}}]}},{id:"grid-blacklist-online",host:{name:"host",setted:!0},configs:[{type:"logo",dataIndex:"deviceType"},{type:"deviceName",dataIndex:"name"},{type:"mac",dataIndex:"mac"},{type:"ip",dataIndex:"ipaddr"}]},{id:"grid-whitelist-online",host:{name:"host",setted:!0},configs:[{type:"logo",dataIndex:"deviceType"},{type:"deviceName",dataIndex:"name"},{type:"mac",dataIndex:"mac"},{type:"ip",dataIndex:"ipaddr"}]},{id:"add-blacklist-msg"},{id:"add-whitelist-msg"}]});var o="black";this.control({"#access-control-enable":{"ev_view_change":function(e,t){v.accessControlEnableM.submit()}},"#grid-blacklist":{"ev_grid_tbar_add":function(e,t){g.blacklistOnlineStore.load({success:function(e){e=C.convertDeviceStore(g.blacklistOnlineStore.getData()),g.blacklistOnlineStore.loadData(e),0===e.length||1===e.length&&"HOST"===e[0].host?n.accessControlView.addBlacklistMsg.disableButton("ok"):n.accessControlView.addBlacklistMsg.enableButton("ok"),n.accessControlView.addBlacklistMsg.setPosition("center","center")}}),n.accessControlView.addBlacklistMsg.show()}},"#grid-whitelist":{"ev_grid_tbar_add":function(e,t){v.addAccessControl.addDeviceMethod.setValue(0),g.whitelistOnlineStore.load({success:function(e){e=C.convertDeviceStore(g.whitelistOnlineStore.getData()),g.whitelistOnlineStore.loadData(e),0===v.addAccessControl.addDeviceMethod.getValue()&&(0===e.length||1===e.length&&"HOST"===e[0].host)?n.accessControlView.addWhitelistMsg.disableButton("ok"):n.accessControlView.addWhitelistMsg.enableButton("ok"),n.accessControlView.addWhitelistMsg.setPosition("center","center")}}),n.accessControlView.addWhitelistMsg.show()}},"#add-blacklist-msg":{"ev_msg_ok":function(e,t){var a,s=g.blacklistGridStore.getData(),n=g.blacklistOnlineStore,o=v.addAccessControl.addDeviceMethod.getValue();if(0===o){if(0===(a=n.getSelected()).length)return void t.preventDefault();(u={})["data"]=JSON.stringify(a),u["operation"]="block";for(var c=0;c<a.length;c++)u["index"]=c,u["key"]=a[c].key;S.ajax.request({data:u,url:f.su.url("/admin/access_control?form=black_devices"),success:function(e){g.blacklistGridStore.load({success:function(){var e=C.convertDeviceStore(g.blacklistGridStore.getData());g.blacklistGridStore.loadData(e)}})}})}else if(1===o){var i=v.addAccessControl.newMac.getValue(),l=g.blacklistOnlineStore.getData(),r=!1,d=!1;if(v.accessControl.validate()){a={name:"",mac:i};for(c=0;c<s.length;c++)i==s[c].mac&&(r=!0);for(c=0;c<l.length;c++)i==l[c].mac&&"HOST"==l[c].host&&(d=!0);if(r)t.preventDefault(),v.addAccessControl.newMac.setError(f.su.CHAR.ERROR["00000051"]);else if(d)t.preventDefault(),v.addAccessControl.newMac.setError(f.su.CHAR.ERROR["00000064"]);else{var u;(u={operation:"insert",key:"add",old:"add",index:0})["new"]=JSON.stringify(a),S.ajax.request({data:u,url:f.su.url("/admin/access_control?form=black_list"),success:function(e){g.blacklistGridStore.load({success:function(){var e=C.convertDeviceStore(g.blacklistGridStore.getData());g.blacklistGridStore.loadData(e)}}),v.addAccessControl.newMac.setValue()}})}}else t.preventDefault()}}},"#add-whitelist-msg":{"ev_msg_ok":function(e,t){var a,s=g.whitelistGridStore.getData(),n=g.whitelistOnlineStore,o=v.addAccessControl.addDeviceMethod.getValue();if(0===o){if(0===(a=n.getSelected()).length)return void t.preventDefault();(h={})["new"]=JSON.stringify(a[0]),h["operation"]="insert",h["old"]="add",h["key"]="add",h["index"]=a.length-1,S.ajax.request({data:h,url:f.su.url("/admin/access_control?form=white_list"),success:function(e){g.whitelistGridStore.load({success:function(){var e=C.convertDeviceStore(g.whitelistGridStore.getData());g.whitelistGridStore.loadData(e)}})}})}else if(1===o){var c=v.addAccessControl.newMac.getValue(),i=v.addAccessControl.name.getValue(),l=g.whitelistOnlineStore.getData(),r=!1,d=!1;if(v.accessControl.validate()&&v.addAccessControl.validate()){a={name:i,mac:c};for(var u=0;u<s.length;u++)c==s[u].mac&&(r=!0);for(u=0;u<l.length;u++)c==l[u].mac&&"HOST"==l[u].host&&(d=!0);if(r)t.preventDefault(),v.addAccessControl.newMac.setError(f.su.CHAR.ERROR["00000051"]);else if(d)t.preventDefault(),v.addAccessControl.newMac.setError(f.su.CHAR.ERROR["00000064"]);else{var h;(h={operation:"insert",key:"add",index:0,old:"add"})["new"]=JSON.stringify(a),S.ajax.request({data:h,url:f.su.url("/admin/access_control?form=white_list"),success:function(e){g.whitelistGridStore.load({success:function(){var e=C.convertDeviceStore(g.whitelistGridStore.getData());g.whitelistGridStore.loadData(e)}}),v.addAccessControl.newMac.setValue(),v.addAccessControl.name.setValue()}})}}else t.preventDefault()}}},".index-common-save-btn":{"ev_will_auto_save":function(e,t){t.preventDefault();var a={operation:"write"};a["access_mode"]=v.accessControl.accessMode.getValue(),S.ajax.request({url:f.su.url("/admin/access_control?form=mode"),data:a,success:function(e){v.accessControl.load()}})}}}),this.listen({"models.accessControlEnableM.enable":{"ev_value_change":function(e,t){"off"===t?n.accessControlView.accessControlContent.hide():n.accessControlView.accessControlContent.show()}},"models.accessControl.accessMode":{"ev_value_change":function(e,t){var a=t===o?"blacklistGridStore":"whitelistGridStore",s=t===o?"whitelistGridStore":"blacklistGridStore";g[a].load({success:function(){var e=C.convertDeviceStore(g[a].getData());g[a].loadData(e),g[a].show(),g[s].hide()}})}},"models.addAccessControl.addDeviceMethod":{"ev_value_change":function(e,t,a){v.accessControl.accessMode.getValue();if(0===t){var s=g.whitelistOnlineStore.getData();g.whitelistOnlineStore.show(),v.addAccessControl.newMac.hide(),v.addAccessControl.name.hide(),0===s.length||1===s.length&&"HOST"===s[0].host?n.accessControlView.addWhitelistMsg.disableButton("ok"):n.accessControlView.addWhitelistMsg.enableButton("ok")}else 1===t&&(g.whitelistOnlineStore.hide(),v.addAccessControl.newMac.show(),v.addAccessControl.name.show(),n.accessControlView.addWhitelistMsg.enableButton("ok"))}},"stores.whitelistOnlineStore":{"ev_loaded":function(e,t){for(var a=g.whitelistOnlineStore.getData(),s=0;s<a.length;s++)"HOST"==a[s].host&&g.whitelistOnlineStore.disable(a[s].key)}},"stores.blacklistOnlineStore":{"ev_loaded":function(e,t){for(var a=g.blacklistOnlineStore.getData(),s=0;s<a.length;s++)"HOST"==a[s].host&&g.blacklistOnlineStore.disable(a[s].key)}}})}},function(e,t,a,n,s,o){return{convertDeviceStore:function(e){var s=e.slice();return n.portForwardingConnectedDevicesStore.load({ajax:{async:!1},success:function(e){for(var t=0;t<s.length;t++)for(var a=0;a<e.length;a++)s[t].mac===e[a].macAddress&&(s[t].deviceType=e[a].deviceType)}}),s}}})}(jQuery);