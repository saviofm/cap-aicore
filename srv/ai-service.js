const cds = require('@sap/cds');
const xsenv = require("@sap/xsenv");

// PARAMETERS FOR AZURE OPENAI SERVICES
const ENGINE = "democode"
const MAX_TOKENS = 1024;
const TEMPERATURE = 0.1;
const FREQUENCY_PENALTY = 0.1;
const PRESENCE_PENALTY = 0.51;
const TOP_P = 1;
//const BEST_OF = 1;
const STOP_SEQUENCE = null;

const GPT_PARAMS = {
    engine: ENGINE,
    max_tokens: MAX_TOKENS,
    temperature: TEMPERATURE,
    frequency_penalty: FREQUENCY_PENALTY,
    presence_penalty: PRESENCE_PENALTY,
    top_p: TOP_P,
    //best_of: BEST_OF,
    stop: STOP_SEQUENCE
}



// handler for ai-service.cds
class AIService extends cds.ApplicationService {
     /**
         * Forwards prompt of the payload via a destination (mapped as AICoreAzureOpenAIDestination) through an AI Core deployed service to Azure OpenAI services
         */
    callAIProxy = async (prompt) => {
        const openai = await cds.connect.to("AICoreAzureOpenAIDestination");
        const payload = {
            ...GPT_PARAMS,
            prompt: prompt,
        };
        const response = await openai.send({
            query: "POST /v2/completion",
            data: payload
        });
    return response;
    };

    callAIProxyPARAMS = async (prompt, GPT_PARAMS_LOCAL) => {
        const openai = await cds.connect.to("AICoreAzureOpenAIDestination");
        const payload = {
            ...GPT_PARAMS_LOCAL,
            prompt: prompt,
        };
        const response = await openai.send({
            query: "POST /v2/completion",
            data: payload
        });
    return response;
    };
    
    init() {
        xsenv.loadEnv();
        
        this.on("aiProxy",  async (req) => {
            const { prompt } = req.data;
            const response = await this.callAIProxy(prompt);
            return { text: response["choices"][0].text };
        });
        this.on("gptCall",  async (req) => {
            const { prompt } = req.data;
            const response = await this.callAIProxy(prompt);
            return { text: response["choices"][0].text };
        });
        this.on("aiProxyGPTClassificarSolicitacao",  async (req) => {
            const { mailSubject, mailText } = req.data;

            //Prompt para classifcar o email
            const prompt = `Classifique o seguinte assunto do email e texto email em 1 das seguintes catetorias: \n\ 
            categorias: [Produto, Pedido, Outros] 
            \n\ assunto email: ${mailSubject} 
            \n\ texto email:  ${mailText}`;

            const response = await this.callAIProxy(prompt);
            return { classificacao: response["choices"][0].text.replaceAll("\n", "").replaceAll("\r", "") };
        });
        
        this.on("aiProxyGPTRespostaProduto",  async (req) => {

            const { Products } = cds.entities;

            
            const tx    = cds.transaction(req);
            const { mailText } = req.data;

            let products = await SELECT (Products, pr => { 
                pr.productName`as Nome`, 
                pr.productBrand`as Marca`, 
                pr.productTechSpecs`as Especificacoes` , 
                pr.productPrice`as Preco`
            })


            //Prompt para classifcar o email
            const prompt = `Você é O Silvestre Orgulho, um atendente de vendas da "Loja Historia de Brinquedos", 
            você deve responder ao email em formato de texto de forma empolgante com informações do produto contido na lista de produtos. 
            O email deve mantero mesmo estilo de linguagem do cliente.
            \nlista: '${products}' . 
            \nEMAIL: '${mailText}'`;

            const response = await this.callAIProxy(prompt);
            return { text: response["choices"][0].text.replaceAll("\r", "") };
        });
        this.on("aiProxyGPTRespostaPedido",  async (req) => {
            const { SalesOrder } = cds.entities;
            const { mailText } = req.data;
            
            let salesOrder = await SELECT (SalesOrder, so => { 
                so.salesOrderNumber`as NumeroDoPedido`, 
                so.customerName`as NomeCliente`, 
                so.grossAmount`as MontanteBruto` , 
                so.salesOrderDate`as DataPedido`,
                so.salesOrderStatus`as EstadoDoPedido`,
                so.salesOrderItems ( soItem => {
                    soItem.itemNumber`as ItemDoPedido`,
                    soItem.product( product => {
                        product.productName`as NomeDoProduto`
                    }),
                    soItem.quantity`as Quantidade`
                })
            })

    

            //Prompt para classifcar o email
            const prompt = `Você é Aldrino Ano Luz, um atendente de vendas da "Loja Historia de Brinquedos", 
            você deve responder ao email em formato de texto sobre o pedido de forma empolgante, 
            mantendo o mesmo estilo de linguagem do cliente. Responder em formato de texto
            com base nos requerimentos do cliente a partir da lista de pedidos abaixo. 
            \nPedidos: '${salesOrder}' . 
            \nEMAIL: '${mailText}'`;

            const response = await this.callAIProxy(prompt);
            return { text: response["choices"][0].text.replaceAll("\r", "") };
        });
        return super.init();
    }
}
module.exports = { AIService };
