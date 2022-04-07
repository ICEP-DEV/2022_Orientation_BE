const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../../connection');
const bodyParser = require('body-parser');
var CryptoJS = require("crypto-js");

app.use(bodyParser.json());


Router.put('/', (req, res) => {

    let field;
    let updateName = "";
  
    if (Object.keys(req.body).length == 0) {
        res.send({
            error: true,
            code: "C001_PUT",
            message: "body parameters were not found"
        });
        return
    }
    const { id, firstname, lastname } = req.body

   /* if (id == null ||firstname == null || lastname == null ) {
        res.send({
            error: true,
            message: "One or many of the requred body arguements is missing",
            code: "C002_PUT"
        })
        return
    }*/

    if (req.body.field) {
        mariadb.query(`UPDATE student SET  ${req.body.field} = '${req.body.updateName}' WHERE id = ${req.body.id}`,(err, rows,fields) => {
            if (!err) {
                res.send({
                    error: false,
                    data: rows 
                })
                return
            } else {
                res.send({
                    error: true,
                    message: err,
                    code: "C001_SQL_PUT"
                })
                return
            }
        });
    } else {
                res.send({
                    error: true,
                    message: "One or many of the required body arguements is missing",
                    code: "C002_PUT"
                })
                return
            }
      
})

Router.get('/', (req, res, next) => {
    if (Object.keys(req.body).length == 0) {
        res.send({
            error: true,
            code: "C001_GET",
            message: "body parameters were not found"
        });
        return
    }

    if (req.body.id) {
        if (req.body.id == "*") {
            mariadb.query('SELECT studNum AS student_number, firstname, lastname, email from student', (err, rows) => {
                if (!err) {
                    res.send({
                        error: false,
                        data: rows
                    });
                } else {
                    res.send({
                        error: true,
                        code: "C001_SQL_GET",
                        message: err
                    });
                    return
                }
            })
        } else {
            mariadb.query(`SELECT studNum AS student_number, firstname, lastname, email FROM student WHERE id = ${req.body.id}`, (err, rows) => {
                if (!err) {
                    res.send({
                        error: false,
                        data: rows
                    })
                } else {
                    res.send({
                        error: true,
                        code: "C002_SQL_GET",
                        message: err
                    });
                    return
                }
            })
        }
    } else {
        res.send({
            error: true,
            code: "C002_GET",
            message: "Id was not recieved from body arguements"
        });
        return
    }
});


module.exports = Router;