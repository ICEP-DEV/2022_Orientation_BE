const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../connection');
const bodyParser = require('body-parser');
var CryptoJS = require("crypto-js");



app.use(bodyParser.json());


Router.post('/', (req, res, next) => {


    if (!req.body) {
        res.send({
            error: true,
            code: "R001",
            message: "body parameters were not found"
        });
        return
    }

    if (!req.body.names) {
        res.send({
            error: true,
            code: "R002",
            message: "Names were not found"
        });
        return
    }
    if (!req.body.password) {
        res.send({
            error: true,
            code: "R002",
            message: "password were not found"
        });
        return
    }
    if (!req.body.stnumber) {
        res.send({
            error: true,
            code: "R002",
            message: "student number was not found"
        });
        return
    }
    if (!req.body.phoneNum) {
        res.send({
            error: true,
            code: "R002",
            message: "phone number was not found"
        });
        return
    }
    if (!req.body.email) {
        res.send({
            error: true,
            code: "R002",
            message: "email was not found"
        });
        return
    }


    var ciphertext = CryptoJS.AES.encrypt(req.body.password, "123").toString();

    try {
        mariadb.query(`INSERT INTO user VALUES ( DEFAULT, "${req.body.names}", "${ciphertext}", "${req.body.phoneNum}","${req.body.stnumber}", "${req.body.email}", "${0}");`, (err, rows, fields) => {
            if (!err) {
                res.send(rows);
                console.log("A user successfully registered")
            } else {
                console.log(err.sqlMessage);
                res.send({
                    error: true,
                    message: err.sqlMessage,
                    code: "R003"
                });
                return
            }
        })
    } catch (e) {
        console.log(e.code)
    }

});

module.exports = Router;