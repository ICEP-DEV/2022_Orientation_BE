const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../connection');
const bodyParser = require('body-parser');
var CryptoJS = require("crypto-js");



app.use(bodyParser.json());


Router.post('/', (req, res, next) => {

    //console.log(req.body)
    if (Object.keys(req.body).length == 0) {
        res.send({
            error: true,
            code: "R001",
            message: "body parameters were not found"
        });
        return
    }

    if (!req.body.fname) {
        res.send({
            error: true,
            code: "R002",
            message: "first name was not found"
        });
        return
    }
    if (!req.body.lname) {
        res.send({
            error: true,
            code: "R002",
            message: "last name was not found"
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
    if (!req.body.studNum) {
        res.send({
            error: true,
            code: "R002",
            message: "student number was not found"
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
        mariadb.query(`INSERT INTO student VALUES ( DEFAULT,"${req.body.studNum}","${req.body.fname}","${req.body.lname}", "${req.body.email}", "${ciphertext}", "${0}");`, (err, rows, fields) => {
            if (!err) {
                res.send({
                    error: false,
                    data: rows
                });
                console.log("A student successfully registered")
                return
            } else {
                res.send({
                    error: true,
                    message: err,
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