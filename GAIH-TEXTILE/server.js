const express=require('express');const app=express();app.use(express.json());
const factory={name:'GAIH-TEXTILE',port:13007,desc:'Lappa factory - Make Liberian clothes, export',use:'Looms + printing, jobs for women',location:'Monrovia -> Africa',status:'EMPIRE WHEEL ONLINE',self_rebuild:true,factory_in_factory:true,empire:true,created:new Date().toISOString()};

app.get('/',(req,res)=>res.json(factory));
app.get('/api/gaih-textile/status',(req,res)=>res.json({...factory,workers:Math.floor(Math.random()*100)+10,output:Math.floor(Math.random()*1000)+' units/day',power:'Solar+LEC',uptime:'99.9%'}));
app.post('/api/gaih-textile/produce',(req,res)=>{res.json({produced:req.body.item||'goods',factory:'GAIH-TEXTILE',by:'African hands',location:'Monrovia Freeport Factory',message:'Made in Liberia, for Africa!'});});
app.get('/api/gaih-textile/africa',(req,res)=>res.json({deployments:['Monrovia','Freetown','Accra','Lagos','Abidjan','Conakry'],status:'Ready to deploy via SELF-WHEEL',how:'Copy folder + pm2 start'}));

app.listen(13007,()=>console.log('GAIH-TEXTILE EMPIRE WHEEL ONLINE 13007 - Lappa factory - Make Liberian clothes, export'));
