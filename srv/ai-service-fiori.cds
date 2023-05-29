using AIService from './ai-service';

//----------------------- Products  ---------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//List Page
annotate AIService.ProductsFiori with @(UI: {
        LineItem: [

			{   
                $Type: 'UI.DataField', 
                Value: productName,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : productDescription,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : productBrand,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : productCategory,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : productTechSpecs,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : productPrice,
                ![@UI.Importance] : #High
            },
                        {   
                $Type : 'UI.DataField', 
                Value : productStock,
                ![@UI.Importance] : #High
            }
		],
        PresentationVariant : {
            $Type     : 'UI.PresentationVariantType',
            SortOrder : [{Property : productName}]
        },
        SelectionFields: [ 
            productName,
            productDescription,
            productBrand,
            productCategory,
            EAN
        ],
	},
//Object Page
	UI: {
        HeaderInfo: {          
            Title : { 
                Value: productName
            },
            TypeName: '{i18n>Product}',
            TypeNamePlural: '{i18n>Products}',
            ///TypeImageUrl : 'image/png',
            Description: { 
                Value: EAN 
            }, 
        },
		HeaderFacets            : [
        /*    {
                $Type             : 'UI.ReferenceFacet',
                Target            : '@UI.FieldGroup#Image',
                ![@UI.Importance] : #Medium
            },
        */
        ],
        FieldGroup #GeneralData: {
            $Type : 'UI.FieldGroupType',
			Data: [
                {
                    $Type : 'UI.DataField',
                    Value: productName
                },  
                {
                    $Type : 'UI.DataField',
                    Value: EAN
                },             
                {
                    $Type : 'UI.DataField',
                    Value: productDescription
                },
                {
                    $Type : 'UI.DataField',
                    Value: productBrand
                },
                {
                    $Type : 'UI.DataField',
                    Value: productCategory
                },
                {
                    $Type : 'UI.DataField',
                    Value: productPrice,
                },
                {
                    $Type : 'UI.DataField',
                    Value: productStock,
                }                                        
			]                        
        },

        // Page Facets
		Facets: [

            {    
                $Type: 'UI.ReferenceFacet', 
                Label: '{i18n>GeneralData}', 
                Target: '@UI.FieldGroup#GeneralData'
            }
        ]    
    }
);


//-------------------- Sales Order  --------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//List Page
annotate AIService.SalesOrderFiori with @(
	UI: {
        LineItem: [
			{   
                $Type: 'UI.DataField', 
                Value: salesOrderNumber,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : customerName,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : grossAmount,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : salesOrderDate,
                ![@UI.Importance] : #High
            },
           
		],
        PresentationVariant : {
            $Type     : 'UI.PresentationVariantType',
            SortOrder : [{Property : salesOrderNumber}]
        },
        SelectionFields: [ 
            salesOrderNumber,
            salesOrderDate,
            customerName
        ],
	},
//Object Page
	UI: {
        HeaderInfo: {          
            Title : { 
                Value: salesOrderNumber
            },
            TypeName: '{i18n>Invoice}',
            TypeNamePlural: '{i18n>Invoices}',
            Description: { 
                Value: customerName 
            }, 
        },
		HeaderFacets            : [

            {
                $Type             : 'UI.ReferenceFacet',
                Target            : '@UI.FieldGroup#Admin',
                ![@UI.Importance] : #Medium
            }
        ],
        FieldGroup #GeneralData: {
            $Type : 'UI.FieldGroupType',
			Data: [
                {
                    $Type : 'UI.DataField',
                    Value: salesOrderNumber
                },
                {
                    $Type : 'UI.DataField',
                    Value: customerName
                },                

                {
                    $Type : 'UI.DataField',
                    Value: grossAmount
                },
                {
                    $Type : 'UI.DataField',
                    Value: salesOrderDate
                }, 
                {
                    $Type : 'UI.DataField',
                    Value: customerMail
                },
                {
                    $Type : 'UI.DataField',
                    Value: customerAddress
                }         
			]                        
        },

        FieldGroup #Admin: {
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : salesOrderStatus
                },
                {
                    $Type : 'UI.DataField',
                    Value : createdBy
                },
                {
                    $Type : 'UI.DataField',
                    Value : modifiedBy
                },
                {
                    $Type : 'UI.DataField',
                    Value : createdAt
                },
                {
                    $Type : 'UI.DataField',
                    Value : modifiedAt
                }
            ]
        },
        // Page Facets
		Facets: [
            {    
                $Type: 'UI.ReferenceFacet', 
                Label: '{i18n>GeneralData}', 
                Target: '@UI.FieldGroup#GeneralData'
            },
            {    
                $Type: 'UI.ReferenceFacet', 
                Label: '{i18n>salesOrderItems}', 
                Target: 'salesOrderItems/@UI.LineItem'
            },
        ]    
    }
);


//----------------- Sales Order Items  -----------------//
//------------------------------------------------------//
//------------------------------------------------------//
annotate AIService.SalesOrderItems with @( 
   	UI: {
    	TextArrangement     : #TextOnly,
        LineItem: [           
			{
                $Type             : 'UI.DataField',
                Value             : itemNumber,
                ![@UI.Importance] : #High
            },            
            {   
                $Type             : 'UI.DataField',
                Value             : product_ID,
                ![@UI.Importance] : #High
            },
            {   
                $Type             : 'UI.DataField',
                Value             : quantity,
                ![@UI.Importance] : #High
            },
		],
        PresentationVariant : {
            $Type     : 'UI.PresentationVariantType',
            SortOrder : [{Property : itemNumber}]
        }
    },
// Object Header
    UI: { 
        HeaderInfo: {         
            Title: {
                $Type : 'UI.DataField',
                Value : '{i18n>SalesOrderItems}'
            },    
            TypeName       : '{i18n>Item}',
            TypeNamePlural : '{i18n>Items}',
            Description    : {
                Value : '{i18n>SalesOrderItems}'
            }
        },    
        FieldGroup #Details : {
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : itemNumber,
                    ![@UI.Importance] : #High
                },
                {
                    $Type : 'UI.DataField',
                    Value : product.productName,
                    ![@UI.Importance] : #High
                },
                {
                    $Type : 'UI.DataField',
                    Value : quantity,
                    ![@UI.Importance] : #High
                }        
            ]
        },
    // Page Facets
        Facets : [
            {
                $Type  : 'UI.CollectionFacet',
                ID     : 'InvoiceDetails',
                Label  : '{i18n>Details}',
                Facets : [
                    {
                        $Type  : 'UI.ReferenceFacet',
                        Label  : '{i18n>Details}',
                        Target : '@UI.FieldGroup#Details'
                    }
                ]
            }
        ]
    }  
);
