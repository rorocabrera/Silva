const mysql = require('mysql');

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'yosoy991',
    database: 'nomina',
})

db.connect((err) => {
    if (err) throw err;
    console.log('CONECTADO A LA BASE DE DATOS');
});

module.exports = db;