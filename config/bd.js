const mysql = require('mysql2');

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',        
  password: '',
  database: 'auth_project', 
});

db.connect((err) => {
  if (err) throw err;
  console.log('Connected to XAMPP MySQL database!');
});

module.exports = db;
