const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../../connection');
const bodyParser = require('body-parser');
var CryptoJS = require("crypto-js");

app.use(bodyParser.json());



Router.get('/', (req, res, next) => {

    if(Object.keys(req.query).length == 0)
    {
        res.send({
            error: true,
            code: "F001",
            message: "No element was found on the query elements"
        })
        return
    }

    if(!req.query.id)
    {
        res.send({
            error: true,
            code: "F002",
            message: "No id element was found on the query"
        })
        return
    }
   
    mariadb.query(`SELECT faculty.id, faculty.faculty_name FROM faculty,cam_fac WHERE cam_fac.fac_id = faculty.id AND cam_fac.cam_id = ${req.query.id}`, (err, rows, fields) => {
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