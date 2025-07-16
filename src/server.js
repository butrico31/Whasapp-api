import venom from 'venom-bot';
import express from 'express';
import venomRouter from './Routes/venomRouter.js';
import Chromium from 'chrome-aws-lambda';

const app = express();


app.use(express.json());



const clientVenom = await venom.create({
  headless: 'new',
  session: 'session-name',
  multidevice: true,
  puppeteerOptions: {
    timeout: 60000,
  },

});

app.use((req, res, next) => {
  req.clientVenom = clientVenom;
  next();
});

app.use('/message', venomRouter);


app.listen(3000, '0.0.0.0', () => {
  console.log('Server is running on port 3000');
});


