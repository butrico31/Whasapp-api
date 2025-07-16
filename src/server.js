import { create } from 'venom-bot';
import express from 'express';
import venomRouter from './Routes/venomRouter.js';

const app = express();


app.use(express.json());



const clientVenom = await create({
  headless: 'new',
  session: 'session-name',
  multidevice: true,
  puppeteerOptions: {
    timeout: 60000,
  },
  addBrowserArgs:[
    '--no-sandbox',
    '--disable-setuid-sandbox',
    '--disable-dev-shm-usage',

  ]
}, ()=>{
  console.log('Client is ready!');
});


app.use((req, res, next) => {
  req.clientVenom = clientVenom;
  next();
});

app.use('/message', venomRouter);


app.listen(3000, '0.0.0.0', () => {
  console.log('Server is running on port 3000');
});


