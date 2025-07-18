import { sendFile, sendMessage } from "../Service/messageService.js"


export const file = async (req, res) => {

    try {
        await sendFile(req);  
        res.status(200).send('File sent successfully');  
    } catch (error) {
        res.status(500).send(error.message);
    }
    
}

export const message = async (req, res) => {
    try{
        await sendMessage(req);
        res.status(200).send('Message sent successfully');
    }
    catch (error) {
        res.status(500).send(error.message);
    }
}