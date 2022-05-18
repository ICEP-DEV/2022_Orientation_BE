//Database establishment of connection
const mysql = require('mysql2');
const prompt = require('prompt-sync')();

const mariadb = mysql.createConnection({
    host: 'db-orientation-inst.cvqpj5ith2h1.us-east-1.rds.amazonaws.com',
    user: 'admin',
    password: 'icep2020',
    database: 'orientation_db_schema'
})
mariadb.connect()

mariadb.query('SELECT "test"', function(err, rows, fields) {
    if (err) {
        console.log(err.message)
        return
    }
    if (rows[0])
        if (rows[0].test == "test") {
            console.log("********************Server is ready********************")
            console.log("")
            console.log("System Log: ")
        }
})

module.exports = mariadb;
