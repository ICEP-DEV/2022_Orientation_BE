const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../../connection');
const bodyParser = require('body-parser');
var CryptoJS = require("crypto-js");

app.use(bodyParser.json());



Router.get('/', (req, res, next) => {

   
    mariadb.query(`SELECT * FROM campus`, (err, rows, fields) => {
        if (!err) {
            res.send({
                error: false,
                data: rows,
            })
            return
        } else {
            res.send({
                error: true,
                code: "M001_SQL",
                message: "SQL couldn't execute successfully execute",
                sqlMessage:err
            })
            return
        }
    });
});

module.exports = Router