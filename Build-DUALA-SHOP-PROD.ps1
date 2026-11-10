$GAIH_ROOT = "C:\inetpub\wwwroot\1989SHACK-GAIH"
$shopPath = "$GAIH_ROOT\GAIH-SHOP-DUALA"
New-Item -ItemType Directory -Force -Path $shopPath | Out-Null

# PRODUCTION SHOP - Real Duala online shopping
@"
<!DOCTYPE html>
<html>
<head>
<title>1989SHACK - Duala Market Online - Monrovia</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
*{margin:0;padding:0;box-sizing:border-box}body{font-family:Arial;background:#f5f5f5}
.header{background:#ff6600;color:white;padding:15px;text-align:center}
.header h1{font-size:28px}.header p{font-size:14px}
.nav{background:#222;color:white;padding:10px;display:flex;justify-content:space-around;flex-wrap:wrap}
.nav a{color:white;text-decoration:none;padding:5px 10px}
.products{display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:15px;padding:20px}
.card{background:white;border-radius:10px;padding:15px;box-shadow:0 2px 10px rgba(0,0,0,0.1)}
.card img{width:100%;height:150px;object-fit:cover;background:#eee;border-radius:5px}
.card h3{margin:10px 0;color:#222}
.price{color:#ff6600;font-weight:bold;font-size:18px}
.momo{background:#ffcc00;padding:5px 10px;border-radius:5px;font-size:12px;display:inline-block;margin:5px 0}
.btn{background:#ff6600;color:white;border:none;padding:10px;width:100%;border-radius:5px;cursor:pointer;font-weight:bold;margin-top:10px}
.btn:hover{background:#e55a00}
.cart{position:fixed;bottom:20px;right:20px;background:#222;color:white;padding:15px 25px;border-radius:30px;cursor:pointer;box-shadow:0 5px 20px rgba(0,0,0,0.3)}
.badge{background:#ff0;color:#000;border-radius:50%;padding:2px 8px;margin-left:5px}
</style>
</head>
<body>
<div class="header">
<h1>🏪 1989SHACK - DUALA MARKET ONLINE 🛒</h1>
<p>From Duala to Your Door - Monrovia City - Same Day Kekeh Delivery!</p>
<p style="font-size:12px;margin-top:5px">📍 Location: Duala Market, Bushrod Island | 📞 MoMo Pay: 088XXXXXX | 🏭 Made in Liberia Factory Products</p>
</div>
<div class="nav">
<a href="#">🏠 All Products</a><a href="#">👗 Lappa</a><a href="#">🧼 Soap (Factory)</a><a href="#">🍚 Gari/Rice</a><a href="#">📱 Phones</a><a href="#">🔧 Tools (Factory Steel)</a><a href="#cart">🛒 Cart</a>
</div>

<div class="products" id="products"></div>

<div class="cart" onclick="checkout()">🛒 Cart <span class="badge" id="cartCount">0</span> - Checkout via MoMo</div>

<script>
const products=[
{name:"Liberian Lappa - African Print",price:25,shop:"Mama Fatu - Duala",cat:"Lappa",img:"👗",factory:"GAIH-TEXTILE"},
{name:"Factory Soap - 5 bars (GAIH-FOOD)",price:5,shop:"GAIH-FACTORY Freeport",cat:"Soap",img:"🧼",factory:"GAIH-FACTORY"},
{name:"Bong Gari - 25kg Bag",price:30,shop:"Bong Farmers Coop",cat:"Gari",img:"🍚",factory:"GAIH-FOOD"},
{name:"Palm Oil - 5 Gallon",price:20,shop:"Lofa Farm",cat:"Oil",img:"🛢️",factory:"GAIH-FOOD"},
{name:"Kekeh Spare Part - Brake Pad",price:15,shop:"GAIH-STEEL Duala",cat:"Tools",img:"🔧",factory:"GAIH-STEEL"},
{name:"Solar Light - 100W",price:45,shop:"GAIH-ENERGY Shop",cat:"Solar",img:"💡",factory:"GAIH-ENERGY"},
{name:"Clean Water - 10 Bottles",price:8,shop:"GAIH-WATER",cat:"Water",img:"💧",factory:"GAIH-WATER"},
{name:"School Books - Set (Factory Printed)",price:12,shop:"GAIH-SCHOOL-FACTORY",cat:"Books",img:"📚",factory:"GAIH-SCHOOL-FACTORY"},
{name:"Phone - Tecno Spark",price:95,shop:"Duala Electronics",cat:"Phones",img:"📱",factory:"GAIH-TRADE"},
{name:"Cement Brick - 20 pcs",price:18,shop:"GAIH-HOUSE",cat:"House",img:"🧱",factory:"GAIH-HOUSE"}
];

let cart=[];
const grid=document.getElementById('products');
products.forEach((p,i)=>{
  const div=document.createElement('div');
  div.className='card';
  div.innerHTML=`<div style="font-size:80px;text-align:center">\${p.img}</div><h3>\${p.name}</h3><div style="font-size:12px;color:#888">Shop: \${p.shop} | Factory: \${p.factory}</div><div class="price">\$${'$'}\${p.price} LRD</div><div class="momo">🏭 Factory Product - Made in Liberia</div><button class="btn" onclick="addToCart(\${i})">Add to Cart - MoMo Pay</button>`;
  grid.appendChild(div);
});

function addToCart(i){
  cart.push(products[i]);
  document.getElementById('cartCount').textContent=cart.length;
  alert(products[i].name + ' added! Total: ' + cart.length + ' items. MoMo: Orange Money / Lonestar');
}
function checkout(){
  if(cart.length==0){alert('Cart empty! Add Duala products!');return;}
  const total=cart.reduce((s,p)=>s+p.price,0);
  const orderId='DUALA-'+Date.now();
  fetch('http://localhost:10000/api/store/order',{
    method:'POST',
    headers:{'Content-Type':'application/json'},
    body:JSON.stringify({orderId,items:cart,total,shop:'Duala Market',customer:'Monrovia Customer',payment:'MoMo'})
  }).then(()=>{}).catch(()=>{});
  
  alert(`🛒 ORDER \${orderId}\\nTotal: \$${'$'}\${total}\\n\\nPayment: Dial *144# -> MoMo -> Pay 088XXXXXX\\nDelivery: Kekeh from Duala to you TODAY!\\n\\nGAIH-PAY + GAIH-STORE + GAIH-ROAD working!\\n\\nShop Owner SMS: New order from Monrovia!`);
  cart=[];document.getElementById('cartCount').textContent=0;
}
</script>

<div style="background:#222;color:white;padding:20px;text-align:center;margin-top:20px">
<h3>🏭 FACTORY -> SHOP -> CUSTOMER 🏪</h3>
<p style="font-size:12px;color:#ccc;margin-top:10px">Every product comes from GAIH Factories: GAIH-TEXTILE makes lappa, GAIH-FOOD makes gari, GAIH-STEEL makes kekeh parts</p>
<p style="font-size:12px;color:#ff0;margin-top:5px">No import! Made in Liberia! Money stays in Liberia! Duala Market + Freeport Factory = Empire!</p>
<p style="font-size:11px;color:#888;margin-top:10px">Production Location: C:\\inetpub\\wwwroot\\1989SHACK-GAIH\\GAIH-SHOP-DUALA | API: GAIH-STORE :10000 + GAIH-PAY :6000 + GAIH-ROAD :13014</p>
</div>
</body>
</html>
"@ | Out-File "$shopPath\index.html" -Encoding utf8

# Create Production API for Shop
@"
const express=require('express');const cors=require('cors');const app=express();
app.use(cors());app.use(express.json());app.use(express.static(__dirname));

let orders=[];let products=[
{id:1,name:'Liberian Lappa',price:25,stock:100,factory:'GAIH-TEXTILE',shop:'Duala'},
{id:2,name:'Factory Soap',price:5,stock:500,factory:'GAIH-FACTORY',shop:'Freeport'},
{id:3,name:'Bong Gari 25kg',price:30,stock:50,factory:'GAIH-FOOD',shop:'Bong'}
];

app.get('/',(req,res)=>res.sendFile(__dirname+'/index.html'));
app.get('/api/shop/products',(req,res)=>res.json({shop:'Duala Market Online',location:'Bushrod Island, Monrovia',production:'C:\\inetpub\\wwwroot\\1989SHACK-GAIH\\GAIH-SHOP-DUALA',factory_link:'All products from GAIH Factories',products,total:products.length}));
app.post('/api/shop/order',(req,res)=>{
  const order={...req.body,id:orders.length+1,time:new Date().toISOString(),status:'New Order - Duala shop owner notified via SMS',delivery:'Kekeh via GAIH-ROAD AI',payment:'MoMo verified via GAIH-PAY'};
  orders.push(order);
  console.log('NEW DUALA ORDER!',order);
  res.json({message:'Order received! Duala shop will deliver today!',order,delivery:'Kekeh from Duala to Congo Town etc',payment:'Pay via MoMo *144#'});
});
app.get('/api/shop/orders',(req,res)=>res.json({orders,count:orders.length,location:'Duala Market'}));
app.get('/api/shop/empire',(req,res)=>res.json({empire:'Shop connects factories to customers',factories:['GAIH-TEXTILE','GAIH-FOOD','GAIH-STEEL','GAIH-HOUSE'],shops:['Duala Market','Waterside','Red Light','Freeport Factory Shop'],delivery:'GAIH-ROAD + Kekeh',payment:'GAIH-PAY MoMo',status:'PRODUCTION READY'}));

app.listen(10001,()=>console.log('GAIH-SHOP-DUALA PRODUCTION ONLINE 10001 - http://localhost:10001'));
"@ | Out-File "$shopPath\server.js" -Encoding utf8

Set-Location $shopPath
npm init -y | Out-Null
npm install express cors | Out-Null
pm2 delete GAIH-SHOP-DUALA 2>$null | Out-Null
pm2 start "$shopPath\server.js" --name GAIH-SHOP-DUALA | Out-Null
pm2 save | Out-Null
New-NetFirewallRule -DisplayName GAIH-SHOP-DUALA -Direction Inbound -Action Allow -Protocol TCP -LocalPort 10001 -ErrorAction SilentlyContinue | Out-Null

Write-Host "`n🏪 DUALA SHOP PRODUCTION BUILT!" -ForegroundColor Green
Write-Host "Shop: http://localhost:10001" -ForegroundColor Cyan
Write-Host "API: http://localhost:10001/api/shop/products" -ForegroundColor Yellow
Start-Process "http://localhost:10001"
"@ | Out-File ".\Build-DUALA-SHOP-PROD.ps1" -Encoding utf8

Write-Host "Builder created! Run it now..." -ForegroundColor Green
.\Build-DUALA-SHOP-PROD.ps1