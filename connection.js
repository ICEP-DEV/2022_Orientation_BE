//Database establishment of connection V05MplwnzsxSUPdKVjVd
const mysql = require('mysql2');
const { DATABASE_HOSTNAME,USERNAME,PASSWORD } = require('./globals')

const mariadb = mysql.createPool({
    host: DATABASE_HOSTNAME,
    user: USERNAME,
    password: PASSWORD,
    database: 'orientation_db_schema'
})


mariadb.query('SELECT "test"', function(err, rows, fields) {
    if (err) {
        console.log(err.message)
        return
    }
    if (rows[0])
        if (rows[0].test == "test") {
            console.log("********************Server is ready********************")
        }
})

module.exports = mariadb;
