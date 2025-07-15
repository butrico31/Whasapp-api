import { clientVenom } from '../server.js';



export const sendFile = async (req) => {
    const { phone, message, empresa } = req.body;
    

    try {

        await clientVenom.sendFileFromBase64(phone, message, 'contrato.docx', 'contrato ' + empresa);


    } catch (error) {
        console.error('Error sending message:', error);
        throw Error('Failed to send message');
    }
}
