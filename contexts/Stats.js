const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../connection');
const bodyParser = require('body-parser');
app.use(bodyParser.json());



Router.get('/', (req, res, next) => {

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

module.exports = Router;