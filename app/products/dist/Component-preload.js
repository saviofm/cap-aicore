//@ui5-bundle capaicoreproducts/app/products/Component-preload.js
jQuery.sap.registerPreloadedModules({
"version":"2.0",
"modules":{
	"capaicoreproducts/app/products/Component.js":function(){sap.ui.define(["sap/fe/core/AppComponent"],function(e){"use strict";return e.extend("capaicoreproducts.app.products.Component",{metadata:{manifest:"json"}})});
},
	"capaicoreproducts/app/products/i18n/i18n.properties":'# This is the resource bundle for capaicoreproducts.app.products\n\n#Texts for manifest.json\n\n#XTIT: Application name\nappTitle=Products - AI CORE\n\n#YDES: Application description\nappDescription=Product List\n\nflpTitle=Products\n\nflpSubtitle=Display - AI CORE\n',
	"capaicoreproducts/app/products/i18n/i18n_en.properties":'# This is the resource bundle for capaicoreproducts.app.products\n\n#Texts for manifest.json\n\n#XTIT: Application name\nappTitle=Products - AI CORE\n\n#YDES: Application description\nappDescription=Product List\n\nflpTitle=Products\n\nflpSubtitle=Display - AI CORE\n',
	"capaicoreproducts/app/products/i18n/i18n_pt.properties":'# This is the resource bundle for capaicoreproducts.app.products\n\n#Texts for manifest.json\n\n#XTIT: Application name\nappTitle=Produtos - AI CORE\n\n#YDES: Application description\nappDescription=Lista de produtos\n\nflpTitle=Produtos\n\nflpSubtitle=Exibir - AI CORE\n',
	"capaicoreproducts/app/products/i18n/i18n_pt_BR.properties":'# This is the resource bundle for capaicoreproducts.app.products\n\n#Texts for manifest.json\n\n#XTIT: Application name\nappTitle=Produtos - AI CORE\n\n#YDES: Application description\nappDescription=Lista de produtos\n\nflpTitle=Produtos \n\nflpSubtitle=Exibir - AI CORE\n',
	"capaicoreproducts/app/products/manifest.json":'{"_version":"1.49.0","sap.app":{"id":"capaicoreproducts.app.products","type":"application","i18n":"i18n/i18n.properties","applicationVersion":{"version":"0.0.1"},"title":"{{appTitle}}","description":"{{appDescription}}","resources":"resources.json","sourceTemplate":{"id":"@sap/generator-fiori:lrop","version":"1.9.2","toolsId":"0811428f-beb9-4382-bf2e-f40e797b2024"},"dataSources":{"mainService":{"uri":"catalog/","type":"OData","settings":{"annotations":[],"localUri":"localService/metadata.xml","odataVersion":"4.0"}}},"crossNavigation":{"inbounds":{"capaicoreproducts-app-products-inbound":{"signature":{"parameters":{},"additionalParameters":"allowed"},"semanticObject":"AICOREPRODUCTS","action":"DISPLAY","title":"{{flpTitle}}","subTitle":"{{flpSubtitle}}","icon":"sap-icon://BusinessSuiteInAppSymbols/icon-material"}}}},"sap.cloud":{"service":"capaicoreproducts","public":true},"sap.ui":{"technology":"UI5","icons":{"icon":"","favIcon":"","phone":"","phone@2":"","tablet":"","tablet@2":""},"deviceTypes":{"desktop":true,"tablet":true,"phone":true}},"sap.ui5":{"flexEnabled":true,"dependencies":{"minUI5Version":"1.112.1","libs":{"sap.m":{},"sap.ui.core":{},"sap.ushell":{},"sap.fe.templates":{}}},"contentDensities":{"compact":true,"cozy":true},"models":{"i18n":{"type":"sap.ui.model.resource.ResourceModel","settings":{"bundleName":"capaicoreproducts.app.products.i18n.i18n"}},"":{"dataSource":"mainService","preload":true,"settings":{"synchronizationMode":"None","operationMode":"Server","autoExpandSelect":true,"earlyRequests":true}},"@i18n":{"type":"sap.ui.model.resource.ResourceModel","uri":"i18n/i18n.properties"}},"resources":{"css":[]},"routing":{"config":{},"routes":[{"pattern":":?query:","name":"ProductsFioriList","target":"ProductsFioriList"},{"pattern":"ProductsFiori({key}):?query:","name":"ProductsFioriObjectPage","target":"ProductsFioriObjectPage"}],"targets":{"ProductsFioriList":{"type":"Component","id":"ProductsFioriList","name":"sap.fe.templates.ListReport","options":{"settings":{"entitySet":"ProductsFiori","variantManagement":"Page","navigation":{"ProductsFiori":{"detail":{"route":"ProductsFioriObjectPage"}}}}}},"ProductsFioriObjectPage":{"type":"Component","id":"ProductsFioriObjectPage","name":"sap.fe.templates.ObjectPage","options":{"settings":{"editableHeaderContent":false,"entitySet":"ProductsFiori"}}}}}},"sap.fiori":{"registrationIds":[],"archeType":"transactional"}}'
}});
