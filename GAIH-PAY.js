// GAIH-PAY - Auto activate internet when user pays MoMo
const express = require('express');
const app = express();

app.post('/api/momo/payment', (req, res) => {
  const { phone, amount, service } = req.body;
  
  if(amount >= 1) {
    // Auto-create voucher + activate
    console.log(`Payment received ${amount} from ${phone} for ${service}`);
    
    // Trigger GAIH-NET voucher creation
    // Trigger HestiaCP hosting creation
    // Trigger Drive storage
    
    res.json({ 
      status: 'SUCCESS', 
      message: 'Internet activated! Check SMS for voucher',
      voucher: '1989-' + Date.now()
    });
  }
});

app.listen(6000, () => console.log('GAIH-PAY listening for MoMo'));