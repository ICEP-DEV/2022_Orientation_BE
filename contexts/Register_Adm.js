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
            code: "R001_ADMIN",
            message: "body parameters were not found"
        });
        return
    }
    if (!req.body.password) {
        res.send({
            error: true,
            code: "R002_ADMIN",
            message: "password were not found"
        });
        return
    }
    if (!req.body.email) {
        res.send({
            error: true,
            code: "R002_ADMIN",
            message: "email was not found"
        });
        return
    }


    var ciphertext = CryptoJS.AES.encrypt(req.body.password, "123").toString();

    try {
        mariadb.query(`INSERT INTO admin VALUES ( DEFAULT, "${req.body.email}", "${ciphertext}");`, (err, rows, fields) => {
            if (!err) {
                res.send({
                    error: false,
                    data: rows
                });
                console.log(new Date() + " - A admin successfully registered " + req.body.email)
                return
            } else {
                res.send({
                    error: true,
                    message: err,
                    code: "R003_ADMIN"
                });
                return
            }
        })
    } catch (e) {
        console.log(e.code)
    }

});

module.exports = Router;