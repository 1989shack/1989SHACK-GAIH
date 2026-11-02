// GAIH-STORE - Offline Appstore
const express = require('express');
const app = express();

const apps = [
  { id: 1, name: 'LNP Traffic View', file: 'lnp.apk', size: '12MB' },
  { id: 2, name: 'Mama AI', file: 'mama.apk', size: '8MB' },
  { id: 3, name: '1989SHACK Market', file: 'market.apk', size: '15MB' }
];

app.get('/api/apps', (req, res) => {
  res.json(apps); // Works even without internet on your network!
});

app.listen(8000);