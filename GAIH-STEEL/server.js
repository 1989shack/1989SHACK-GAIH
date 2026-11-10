const express=require('express');const app=express();app.use(express.json());
const factory={name:'GAIH-STEEL',port:13006,desc:'Small steel & welding - Build Kekeh, tools, roofs',use:'Welding shops in Duala market',location:'Monrovia -> Africa',status:'EMPIRE WHEEL ONLINE',self_rebuild:true,factory_in_factory:true,empire:true,created:new Date().toISOString()};

app.get('/',(req,res)=>res.json(factory));
app.get('/api/gaih-steel/status',(req,res)=>res.json({...factory,workers:Math.floor(Math.random()*100)+10,output:Math.floor(Math.random()*1000)+' units/day',power:'Solar+LEC',uptime:'99.9%'}));
app.post('/api/gaih-steel/produce',(req,res)=>{res.json({produced:req.body.item||'goods',factory:'GAIH-STEEL',by:'African hands',location:'Monrovia Freeport Factory',message:'Made in Liberia, for Africa!'});});
app.get('/api/gaih-steel/africa',(req,res)=>res.json({deployments:['Monrovia','Freetown','Accra','Lagos','Abidjan','Conakry'],status:'Ready to deploy via SELF-WHEEL',how:'Copy folder + pm2 start'}));

app.listen(13006,()=>console.log('GAIH-STEEL EMPIRE WHEEL ONLINE 13006 - Small steel & welding - Build Kekeh, tools, roofs'));
