import venom from 'venom-bot';
import express from 'express';
import venomRouter from './Routes/venomRouter.js';
import Chromium from 'chrome-aws-lambda';

const app = express();


app.use(express.json());

let clientVenom = null;

const initializeVenom = async () => {
  try {
    clientVenom = await venom.create({
        headless: 'new',
        session: 'session-name',
        multidevice: true,
        puppeteerOptions:{
          executablePath:await Chromium.executablePath,
          timeout: 60000,
        },
        
    });
    

    console.log('Venom WhatsApp bot pronto!');
  } catch (error) {
    console.error('Erro ao inicializar Venom:', error);
  }
};

app.use('/message', venomRouter);


app.listen(3000,'0.0.0.0', () => {
    console.log('Server is running on port 3000');
});

initializeVenom()

export { clientVenom };
