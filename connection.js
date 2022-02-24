//Database establishment of connection
const mysql = require('mysql');
const prompt = require('prompt-sync')();

const mariadb = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'covid_complience_db'
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
        }
        //Stop the main thread making the API to stop listerning 

        // let command = prompt("For Help input -help : ")
        // if (command == "-help") {
        //     console.log("Help instructions")
        // }
})

module.exports = mariadb;