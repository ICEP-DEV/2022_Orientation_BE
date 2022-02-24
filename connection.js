const express = require('express');
const mysql = require('mysql');
const app = express();

const mariadb = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'covid_complience_db'
})
mariadb.connect()

mariadb.query('SELECT 1 + 1 AS solution', function(err, rows, fields) {
    if (err) throw err
    console.log("Number of listeners => " + app.listenerCount())
    console.log("Server is ready")
})

module.exports = mariadb;