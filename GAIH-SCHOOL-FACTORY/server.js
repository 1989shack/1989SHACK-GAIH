const express=require('express');const app=express();app.use(express.json());
const factory={name:'GAIH-SCHOOL-FACTORY',port:13015,desc:'Factory that makes schools - Train teachers, print books',use:'Books printed in Monrovia, not imported',location:'Monrovia -> Africa',status:'EMPIRE WHEEL ONLINE',self_rebuild:true,factory_in_factory:true,empire:true,created:new Date().toISOString()};

app.get('/',(req,res)=>res.json(factory));
app.get('/api/gaih-school-factory/status',(req,res)=>res.json({...factory,workers:Math.floor(Math.random()*100)+10,output:Math.floor(Math.random()*1000)+' units/day',power:'Solar+LEC',uptime:'99.9%'}));
app.post('/api/gaih-school-factory/produce',(req,res)=>{res.json({produced:req.body.item||'goods',factory:'GAIH-SCHOOL-FACTORY',by:'African hands',location:'Monrovia Freeport Factory',message:'Made in Liberia, for Africa!'});});
app.get('/api/gaih-school-factory/africa',(req,res)=>res.json({deployments:['Monrovia','Freetown','Accra','Lagos','Abidjan','Conakry'],status:'Ready to deploy via SELF-WHEEL',how:'Copy folder + pm2 start'}));

app.listen(13015,()=>console.log('GAIH-SCHOOL-FACTORY EMPIRE WHEEL ONLINE 13015 - Factory that makes schools - Train teachers, print books'));
