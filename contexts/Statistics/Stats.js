const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../../connection');
const bodyParser = require('body-parser');
var CryptoJS = require("crypto-js");

app.use(bodyParser.json());



Router.post('/', (req, res, next) => {

    let field;

    if (Object.keys(req.body).length == 0) {
        res.send({
            error: true,
            code: "S001",
            message: "body parameters were not found"
        })
        return
    }


    if (req.body.field) {
        mariadb.query(`SELECT ${req.body.field} FROM stats`, (err, rows, fields) => {
            if (!err) {
                res.send({
                    error: false,
                    data: rows,
                })
                return
            } else {
                res.send({
                    error: true,
                    code: "S001_SQL",
                    message: "field element was not found as a body element"
                })
                return
            }
        });
    } else {
        res.send({
            error: true,
            code: "S002",
            message: "field element was not found as a body element"
        })
        return
    }



});

Router.put('/', (req, res) => {

    let field;
    let updateNum = 0;
  
    if (Object.keys(req.body).length == 0) {
        res.send({
            error: true,
            code: "C001_PUT",
            message: "body parameters were not found"
        });
        return
    }

    if (req.body.field) {
        mariadb.query(`UPDATE stats SET  ${req.body.field} = ${req.body.updateNum} WHERE id = 1`,(err, rows,fields) => {
            if (!err) {
                res.send({
                    error: false,
                    data: rows //`Column with the name: ${req.body.field} has been updated.`
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

module.exports = Router;