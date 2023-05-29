const cds = require('@sap/cds');
const xsenv = require("@sap/xsenv");

// PARAMETERS FOR AZURE OPENAI SERVICES
const ENGINE = "democode"
const MAX_TOKENS = 256;
const TEMPERATURE = 0.1;
const FREQUENCY_PENALTY = 0.1;
const PRESENCE_PENALTY = 0.51;
const TOP_P = 1;
const BEST_OF = 1;
const STOP_SEQUENCE = null;

const GPT_PARAMS = {
    engine: ENGINE,
    max_tokens: MAX_TOKENS,
    temperature: TEMPERATURE,
    frequency_penalty: FREQUENCY_PENALTY,
    presence_penalty: PRESENCE_PENALTY,
    top_p: TOP_P,
    best_of: BEST_OF,
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
            const prompt = 'Classifique o seguinte assunto do email e texto email em 1 das seguintes catetorias: \n\ categorias: [Produto, Pedido, Outros] \n\ assunto email:' + mailsubject + 'texto email =  ' + mailText;

            const response = await this.callAIProxy(prompt);
            return { text: response["choices"][0].text };
        });
        
       
        return super.init();
    }
}
module.exports = { AIService };