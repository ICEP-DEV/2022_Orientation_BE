const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../../connection');
const bodyParser = require('body-parser');
var CryptoJS = require("crypto-js");
app.use(bodyParser.json());



Router.post('/', (req, res, next) => {

    let email;
    let password;

    //Checking of body elements 
    if (Object.keys(req.body).length == 0) {
        res.send({
            error:true,
            message:"Body element were not found",
            code:"F001"
        })
        return
    }

    if(!req.body.email)
    {
        res.send({
            error:true,
            message:"Body element email was not found",
            code:"F002"
        })
        return
    }

    if(Object.keys(req.body).length == 1)
    {
        mariadb.query(`SELECT * FROM student WHERE email = "${req.body.email}"`, (err, rows, fields) => {
            if(err)
            {
                res.send({
                    error:true,
                    message:"SQL couldn't excute succefully",
                    code:"F001_SQL",
                    sqlMessage:err
                })
                return
            }
            else
            {
                if(Object.keys(rows).length > 0)
                {
                    res.send({
                        error:false,
                        data:rows
                    })
                    return
                }
                else
                {
                    res.send({
                        error:true,
                        message:"Email was not found",
                        code:"F003"
                    })
                    return
                }
            }
        
        })
    }

    if(Object.keys(req.body).length == 2)
    {
        if(!req.body.newPassword)
        {
            res.send({
                error:true,
                message:"New Password body element was not supplied",
                code:"F004"
            })
            return
        }
        var ciphertext = CryptoJS.AES.encrypt(req.body.newPassword, "123").toString();
        var sqlStatement = "UPDATE `student` SET `password` = '"+ciphertext+"' WHERE `email` = '"+req.body.email+"'";
        mariadb.query(sqlStatement, (err, rows, fields) => {
            if(err)
            {
                res.send(
                    {
                        code:"F002_SQL",
                        message:"SQL couldn't excute succefully",
                        error:true,
                        sqlMessage:err
                    }
                )
                return
            }

            if(Object.keys(rows).length > 0)
            {
                res.send(
                    {
                        error:false,
                        data:rows
                    }
                )
                return
            }

        });
    }
});

module.exports = Router;