import { Router } from "express";
import { file } from "../Controller/messageController.js";


const venomRouter = Router();

venomRouter.post('/send-file', file);

export default venomRouter;