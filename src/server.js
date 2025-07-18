import venom from 'venom-bot';
import express from 'express';
import venomRouter from './Routes/venomRouter.js';

const app = express();


app.use(express.json());


let clientVenom;

async function initializeClient() {
  clientVenom = await venom.create({
  headless: 'new',
  session: 'session-name', 
  browserArgs: [
    '--no-sandbox',
    '--disable-setuid-sandbox',
    '--disable-gpu',
    '--disable-dev-shm-usage',
    '--disable-features=TranslateUI',
    '--disable-background-networking',
    '--disable-sync',
    '--disable-default-apps',
    '--mute-audio',
    '--no-first-run',
    '--no-default-browser-check',
    '--disable-extensions',
    '--disable-component-extensions-with-background-pages',
    '--disable-breakpad',
    '--disable-infobars',
    '--disable-popup-blocking',
    '--disable-renderer-backgrounding',
    '--disable-backgrounding-occluded-windows',
    '--disable-ipc-flooding-protection',
    '--disable-device-discovery-notifications',
    '--disable-software-rasterizer',
    '--remote-debugging-port=9222',
  ],
});
}

await initializeClient();


app.use((req, res, next) => {
  req.clientVenom = clientVenom;
  next();
});

app.use('/message', venomRouter);


app.listen(3000, '0.0.0.0', () => {
  console.log('Server is running on port 3000');
});


