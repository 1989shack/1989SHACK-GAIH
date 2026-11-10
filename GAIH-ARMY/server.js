const express=require('express');const app=express();app.use(express.json());
const factory={name:'GAIH-ARMY',port:13011,desc:'Drone factory - Farm drones, security drones',use:'Made in Liberia drones for farms',location:'Monrovia -> Africa',status:'EMPIRE WHEEL ONLINE',self_rebuild:true,factory_in_factory:true,empire:true,created:new Date().toISOString()};

app.get('/',(req,res)=>res.json(factory));
app.get('/api/gaih-army/status',(req,res)=>res.json({...factory,workers:Math.floor(Math.random()*100)+10,output:Math.floor(Math.random()*1000)+' units/day',power:'Solar+LEC',uptime:'99.9%'}));
app.post('/api/gaih-army/produce',(req,res)=>{res.json({produced:req.body.item||'goods',factory:'GAIH-ARMY',by:'African hands',location:'Monrovia Freeport Factory',message:'Made in Liberia, for Africa!'});});
app.get('/api/gaih-army/africa',(req,res)=>res.json({deployments:['Monrovia','Freetown','Accra','Lagos','Abidjan','Conakry'],status:'Ready to deploy via SELF-WHEEL',how:'Copy folder + pm2 start'}));

app.listen(13011,()=>console.log('GAIH-ARMY EMPIRE WHEEL ONLINE 13011 - Drone factory - Farm drones, security drones'));
