import { sendFile } from "../Service/messageService.js"


export const file = async (req, res) => {

    try {
        sendFile(req);  
        res.status(200).send('File sent successfully');  
    } catch (error) {
        res.status(500).send(error.message);
    }
    
}