using {
  cuid,
  managed,
  sap,
  temporal,
  Currency,
  User
} from '@sap/cds/common';


namespace capAICore;

//----------------------- PRODUCTS  ---------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//Entity
entity Products : cuid , managed {
      EAN : String;
      productName : String;
      productDescription : String;
      productCategory: String;
      productBrand : String;
      productTechSpecs: LargeString;
      productPrice: Decimal(12, 2);
      productStock: Integer;
}


@cds.odata.valuelist
//Annotation
annotate Products with @(
  title              : '{i18n>Products}',
  description        : '{i18n>Products}',
  UI.TextArrangement : #TextOnly,
  Common.SemanticKey : [EAN],
  UI.Identification  : [{
    $Type : 'UI.DataField',
    Value : EAN
  }]
) {
  ID @(
        Core.Computed,
        Common.Text : {
            $value                 : EAN,
            ![@UI.TextArrangement] : #TextOnly
        }
  );
  EAN            @(
    title       : '{i18n>EAN}',
    description : '{i18n>EAN}',
    Common      : {
        FieldControl             : #Mandatory,
    }
  );
  productName @(
    title       : '{i18n>productName}',
    description : '{i18n>productName}',
    Common      : {
      FieldControl : #Mandatory,
      TextFor      : EAN
    }
  );
  productDescription @(
    title       : '{i18n>productDescription}',
    description : '{i18n>productDescription}',
    UI.MultiLineText: true
  );
  productCategory @(
    title       : '{i18n>productCategory}',
    description : '{i18n>productCategory}',
  );
  productBrand @(
    title       : '{i18n>productBrand}',
    description : '{i18n>productBrand}',
  );
  productTechSpecs @(
    title       : '{i18n>productTechSpecs}',
    description : '{i18n>productTechSpecs}',
    UI.MultiLineText: true
  );  
  productPrice @(
    title       : '{i18n>productPrice}',
    description : '{i18n>productPrice}',
  );
  productStock @(
    title       : '{i18n>productStock}',
    description : '{i18n>productStock}',
  );
};

//--------------------- Sales Order  -------------------//
//------------------------------------------------------//
//------------------------------------------------------//

//Entity
entity SalesOrder: cuid, managed {
  salesOrderNumber: String;
  customerName: String;
  grossAmount: Decimal(13,2);
  salesOrderDate: Date ;
  customerAddress: String;
  salesOrderItems: Composition of many SalesOrderItems on salesOrderItems.salesOrder = $self;
};


//Annotation
annotate SalesOrder with @(
    title              : '{i18n>SalesOrder}',
    description        : '{i18n>SalesOrder}',
    UI.TextArrangement : #TextOnly,
    cds.odata.valuelist,
    Common.SemanticKey : [salesOrderNumber],
    UI.Identification  : [
        {
            $Type : 'UI.DataField',
            Value : salesOrderNumber
        }
    ]
) {
    ID                @(
        Core.Computed,
        Common.Text : {
            $value                 : salesOrderNumber,
            ![@UI.TextArrangement] : #TextFirst
        }
    );

    salesOrderNumber @(
        title       : '{i18n>salesOrderNumber}',
        description : '{i18n>salesOrderNumber}',
        Common      : {
            FieldControl             : #Mandatory
        }
    );
    customerName       @(
        title            : '{i18n>customerName}',
        description      : '{i18n>customerName}',
        Common           : {FieldControl : #Mandatory}
    );

    grossAmount @(
        title            : '{i18n>grossAmount}',
        description      : '{i18n>grossAmount}'
    );

    salesOrderDate @(
        title            : '{i18n>salesOrderDate}',
        description      : '{i18n>salesOrderDate}'
    );
    customerAddress @(
        title            : '{i18n>customerAddress}',
        description      : '{i18n>customerAddress}'  
    );
    salesOrderItems @(
        title            : '{i18n>salesOrderItems}',
        description      : '{i18n>salesOrderItems}'
    );

};


//----------------------- SalesOrderItems  ---------------------//
//----------------------------------------------------------//
//---------------------------------------------------------//
//Entity
entity SalesOrderItems : cuid , managed {
  salesOrder : Association to SalesOrder;
  itemNumber : String;
  product: Association to Products not null;
  quantity: Integer not null
};

//Annotation
annotate SalesOrderItems with @(
    title              : '{i18n>SalesOrderItems}',
    description        : '{i18n>SalesOrderItems}',
    UI.TextArrangement : #TextOnly,
    cds.odata.valuelist,
    Common.SemanticKey : [salesOrder.salesOrderNumber, itemNumber],
    UI.Identification  : [{
          $Type : 'UI.DataField',
          Value : itemNumber
      }
    ]
) 
{
  ID             @(
      title       : 'ID',
      description : 'ID',
      Core.Computed,
      Common.Text : {
          $value                 : itemNumber,
          ![@UI.TextArrangement] : #TextOnly
      }
  );
  salesOrder           @(
      title       : '{i18n>salesOrder}',
      description : '{i18n>salesOrder}',
      Common      : {
          Text      : {
                $value                 : salesOrder.salesOrderNumber,
                ![@UI.TextArrangement] : #TextOnly
            },
          ValueList                : {
              CollectionPath : 'SalesOrder',
              SearchSupported: true,
              Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : 'salesOrder_ID',
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'salesOrderNumber',

                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'customerName'
                }
              ]
          }
      }
  );
  product    @(
      title       : '{i18n>product}',
      description : '{i18n>product}',
      Common      : {
          FieldControl             : #Mandatory,
      }
  );

  quantity            @(
      title       : '{i18n>quantity}',
      description : '{i18n>quantity}',
      Common      : {
          FieldControl             : #Mandatory,
      }
  );
};

