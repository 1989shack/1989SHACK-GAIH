const express=require('express');const app=express();app.use(express.json());
const factory={name:'GAIH-HOUSE',port:13013,desc:'House factory - Make bricks, build houses cheap',use:'Clay bricks, 3D printed houses',location:'Monrovia -> Africa',status:'EMPIRE WHEEL ONLINE',self_rebuild:true,factory_in_factory:true,empire:true,created:new Date().toISOString()};

app.get('/',(req,res)=>res.json(factory));
app.get('/api/gaih-house/status',(req,res)=>res.json({...factory,workers:Math.floor(Math.random()*100)+10,output:Math.floor(Math.random()*1000)+' units/day',power:'Solar+LEC',uptime:'99.9%'}));
app.post('/api/gaih-house/produce',(req,res)=>{res.json({produced:req.body.item||'goods',factory:'GAIH-HOUSE',by:'African hands',location:'Monrovia Freeport Factory',message:'Made in Liberia, for Africa!'});});
app.get('/api/gaih-house/africa',(req,res)=>res.json({deployments:['Monrovia','Freetown','Accra','Lagos','Abidjan','Conakry'],status:'Ready to deploy via SELF-WHEEL',how:'Copy folder + pm2 start'}));

app.listen(13013,()=>console.log('GAIH-HOUSE EMPIRE WHEEL ONLINE 13013 - House factory - Make bricks, build houses cheap'));
