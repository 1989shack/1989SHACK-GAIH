const express=require('express');const app=express();app.use(express.json());
const factory={name:'GAIH-FOOD',port:13005,desc:'Food factory - Cassava to gari, rice mill, oil press',use:'Bong farms -> Monrovia market, no import',location:'Monrovia -> Africa',status:'EMPIRE WHEEL ONLINE',self_rebuild:true,factory_in_factory:true,empire:true,created:new Date().toISOString()};

app.get('/',(req,res)=>res.json(factory));
app.get('/api/gaih-food/status',(req,res)=>res.json({...factory,workers:Math.floor(Math.random()*100)+10,output:Math.floor(Math.random()*1000)+' units/day',power:'Solar+LEC',uptime:'99.9%'}));
app.post('/api/gaih-food/produce',(req,res)=>{res.json({produced:req.body.item||'goods',factory:'GAIH-FOOD',by:'African hands',location:'Monrovia Freeport Factory',message:'Made in Liberia, for Africa!'});});
app.get('/api/gaih-food/africa',(req,res)=>res.json({deployments:['Monrovia','Freetown','Accra','Lagos','Abidjan','Conakry'],status:'Ready to deploy via SELF-WHEEL',how:'Copy folder + pm2 start'}));

app.listen(13005,()=>console.log('GAIH-FOOD EMPIRE WHEEL ONLINE 13005 - Food factory - Cassava to gari, rice mill, oil press'));
