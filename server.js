const express = require('express');
const path = require('path');
const app = express();
app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});
app.get('/api/health', (req, res) => {
  res.json({ status: 'ok', app: '1989SHACK-GAIH' });
});
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log('GAIH running on ' + PORT));
module.exports = app;
