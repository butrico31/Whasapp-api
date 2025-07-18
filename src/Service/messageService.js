

export const sendFile = async (req) => {
    const { phone, message, empresa } = req.body;
    

    try {
        console.log(req.clientVenom, req.clientVenom.isConnected());
        await req.clientVenom.sendFileFromBase64(phone, message, 'contrato.docx', 'contrato ' + empresa);


    } catch (error) {
        console.error('Error sending message:', error);
        throw Error('Failed to send message');
    }
}

export const sendMessage = async (req) => {
    const { phone, message, empresa } = req.body;

    try {
        console.log(req.clientVenom, req.clientVenom.isConnected());
        await req.clientVenom.sendText(phone, message);


    } catch (error) {
        console.error('Error sending message:', error);
        throw Error('Failed to send message');
    }
}