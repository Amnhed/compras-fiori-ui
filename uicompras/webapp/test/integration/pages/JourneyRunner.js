sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/compras/uicompras/test/integration/pages/OrdenesCompraList.gen",
	"com/compras/uicompras/test/integration/pages/OrdenesCompraObjectPage.gen"
], function (JourneyRunner, OrdenesCompraListGenerated, OrdenesCompraObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/compras/uicompras') + '/test/flp.html#app-preview',
        pages: {
			onTheOrdenesCompraListGenerated: OrdenesCompraListGenerated,
			onTheOrdenesCompraObjectPageGenerated: OrdenesCompraObjectPageGenerated
        },
        async: true
    });

    return runner;
});

