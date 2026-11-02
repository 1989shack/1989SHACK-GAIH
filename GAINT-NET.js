// 1989SHACK GAIH-NET - ISP Voucher API
const express = require('express');
const app = express();

// Create voucher - POST /api/voucher
app.post('/api/voucher', (req, res) => {
  const username = '1989-' + Math.random().toString(36).substring(7);
  const password = Math.random().toString(36).substring(2, 8);
  const time = '1d'; // 1 day
  
  // Send command to MikroTik via API
  console.log(`Creating voucher: ${username} / ${password} valid ${time}`);
  
  res.json({
    username: username,
    password: password,
    price: '$1',
    valid: time,
    hotspot: 'Monrovia-1989SHACK',
    powered_by: 'GAIH-NET + Starlink'
  });
});

app.listen(3000, () => console.log('GAIH-NET running on port 3000'));