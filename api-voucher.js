app.get('/api/voucher', (req, res) => {
  const username = '1989-' + Math.random().toString(36).substring(7);
  const password = Math.random().toString(36).substring(2, 8);
  res.json({ username: username, password: password, time: '1d' });
});