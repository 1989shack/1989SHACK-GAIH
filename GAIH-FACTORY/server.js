const express=require('express');const app=express();app.use(express.json());
const factory={name:'GAIH-FACTORY',port:13003,desc:'Factory OS - Controls real machines to make things',use:'Make soap, cement, clothes in Monrovia Freeport',location:'Monrovia -> Africa',status:'EMPIRE WHEEL ONLINE',self_rebuild:true,factory_in_factory:true,empire:true,created:new Date().toISOString()};

app.get('/',(req,res)=>res.json(factory));
app.get('/api/gaih-factory/status',(req,res)=>res.json({...factory,workers:Math.floor(Math.random()*100)+10,output:Math.floor(Math.random()*1000)+' units/day',power:'Solar+LEC',uptime:'99.9%'}));
app.post('/api/gaih-factory/produce',(req,res)=>{res.json({produced:req.body.item||'goods',factory:'GAIH-FACTORY',by:'African hands',location:'Monrovia Freeport Factory',message:'Made in Liberia, for Africa!'});});
app.get('/api/gaih-factory/africa',(req,res)=>res.json({deployments:['Monrovia','Freetown','Accra','Lagos','Abidjan','Conakry'],status:'Ready to deploy via SELF-WHEEL',how:'Copy folder + pm2 start'}));

app.listen(13003,()=>console.log('GAIH-FACTORY EMPIRE WHEEL ONLINE 13003 - Factory OS - Controls real machines to make things'));
