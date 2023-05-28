sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'capaicore.app.salesorder',
            componentId: 'SalesOrderFioriList',
            entitySet: 'SalesOrderFiori'
        },
        CustomPageDefinitions
    );
});