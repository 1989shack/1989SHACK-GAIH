const http = require('http');
const fs = require('fs');

const users = {
  "student1": { pass: "student123", role: "STUDENT", name: "Liberia Student" },
  "teacher1": { pass: "teacher123", role: "TEACHER", name: "Liberia Teacher" },
  "admin1": { pass: "admin123", role: "ADMIN", name: "Mrs. Sheriff - Admin" }
};

http.createServer((req, res) => {
  if (req.url === '/login') {
    let body = '';
    req.on('data', c => body += c);
    req.on('end', () => {
      const p = new URLSearchParams(body);
      const u = users[p.get('user')];
      if (u && u.pass === p.get('pass')) {
        res.end(`<h1>WELCOME ${u.role} - ${u.name}</h1><p>GAIHP School Portal - Monrovia Data Center</p><p><a href="/">Logout</a></p>`);
      } else {
        res.end(`<h1>Wrong Login - Try Again</h1><a href="/">Back</a>`);
      }
    });
    return;
  }
  res.end(`
    <h1>GAIHP SCHOOL PORTAL - 1989SHACK</h1>
    <p>Global Architecture Infrastructure Hosting Platform</p>
    <p>Location: Monrovia Data Center - Liberia - Africa - World</p>
    <form method="POST" action="/login">
      Username: <input name="user" /><br><br>
      Password: <input type="password" name="pass" /><br><br>
      <button>Login</button>
    </form>
    <p>Demo: student1 / teacher1 / admin1 - Ask Admin for real password</p>
  `);
}).listen(3001, () => console.log('GAIH-SCHOOL REAL connected on 3001'));