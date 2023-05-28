sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'capaicore/app/salesorder/test/integration/FirstJourney',
		'capaicore/app/salesorder/test/integration/pages/SalesOrderFioriList',
		'capaicore/app/salesorder/test/integration/pages/SalesOrderFioriObjectPage'
    ],
    function(JourneyRunner, opaJourney, SalesOrderFioriList, SalesOrderFioriObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('capaicore/app/salesorder') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheSalesOrderFioriList: SalesOrderFioriList,
					onTheSalesOrderFioriObjectPage: SalesOrderFioriObjectPage
                }
            },
            opaJourney.run
        );
    }
);