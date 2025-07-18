import venom from 'venom-bot';
import express from 'express';
import venomRouter from './Routes/venomRouter.js';

const app = express();


app.use(express.json());


const clientVenom = await venom.create({
  headless: 'new',
  session: 'session-name',
  statusFind: true,
  logQR: true, 
});


app.use((req, res, next) => {
  req.clientVenom = clientVenom;
  next();
});

app.use('/message', venomRouter);


app.listen(3000, '0.0.0.0', () => {
  console.log('Server is running on port 3000');
});


