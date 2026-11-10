// Send command to MikroTik via API
console.log('Creating voucher: ${username} / ${password}')

res.json({
  username: username,
  password: password,
  price: '$1',
  valid: time,
  hotspot: 'Monrovia-1989SHACK',
  powered_by: 'GAIH-NET + Starlink'
});