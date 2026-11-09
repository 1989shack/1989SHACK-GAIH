const http=require('http');
const users={'student1':{pass:'student123',role:'STUDENT',name:'Liberia Student'},'teacher1':{pass:'teacher123',role:'TEACHER',name:'Liberia Teacher'},'admin1':{pass:'admin123',role:'ADMIN',name:'Mrs. Sheriff - Admin'}};
http.createServer((req,res)=>{
if(req.url==='/login'){let b='';req.on('data',c=>b+=c);req.on('end',()=>{const p=new URLSearchParams(b);const u=users[p.get('user')];if(u&&u.pass===p.get('pass')){res.end('<h1>WELCOME '+u.role+' - '+u.name+'</h1><p>GAIHP School Portal - Monrovia - lifeinternationalschool.lr - stmathew.lr</p><a href=\"/\">Logout</a>')}else{res.end('<h1>Wrong Login</h1><a href=\"/\">Back</a>')}});return;}
res.end('<h1>GAIHP SCHOOL PORTAL - 1989SHACK</h1><p>Global Architecture Infrastructure Hosting Platform</p><p>Schools: lifeinternationalschool.lr | stmathew.lr | All Liberia Schools</p><form method=\"POST\" action=\"/login\">Username: <input name=\"user\" /><br><br>Password: <input type=\"password\" name=\"pass\" /><br><br><button>Login</button></form><p>Demo: student1 / teacher1 / admin1</p>');
}).listen(3001,()=>console.log('GAIH-SCHOOL REAL on 3001'));
