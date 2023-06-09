using capAICore as capAICore from '../db/data-model';
//@requires: 'authenticated-user'
service AIService {
    @odata.draft.enabled
    entity ProductsFiori as projection on capAICore.Products

    entity Products as projection on capAICore.Products ;

    @odata.draft.enabled
    entity SalesOrderFiori
        as projection on capAICore.SalesOrder   
 
    entity SalesOrder
        as projection on capAICore.SalesOrder 
    
    
    entity SalesOrderItems
        as projection on capAICore.SalesOrderItems {
        *,
        salesOrder: redirected to SalesOrder,
        product: redirected to Products
    }; 

    type GPTTextResponse {
        text : String;
    };

    action aiProxy(prompt : String) returns GPTTextResponse;

    function gptCall(prompt : String) returns GPTTextResponse;

    type Classificacao {
        classificacao : String;
    };

    action aiProxyGPTClassificarSolicitacao(mailSubject: String, mailText : String) returns Classificacao;


    type Resposta {
        text : LargeString;
    };


    action aiProxyGPTRespostaProduto( mailText : LargeString) returns Resposta;

    action aiProxyGPTRespostaPedido( mailText : LargeString) returns Resposta;
}