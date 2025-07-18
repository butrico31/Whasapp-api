import { Router } from "express";
import { file, message } from "../Controller/messageController.js";


const venomRouter = Router();

venomRouter.post('/send-file', file);

venomRouter.post('/send-message', message);

export default venomRouter;