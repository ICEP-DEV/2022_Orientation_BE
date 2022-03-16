const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../../connection');
const bodyParser = require('body-parser');

app.use(bodyParser.json());



Router.post('/', (req, res, next) => {


    let query = "SELECT student.firstname, student.lastname, student.email, student.studNum, tracking.activity, tracking.datetime" +
        " FROM tracking, student" +
        " WHERE tracking.user_id = student.id"


    if (req.body.email) query += ` AND email = "${req.body.email}"`;


    if (req.body.firstname) query += ` AND firstname = "${req.body.firstname}"`;


    if (req.body.lastname) query += ` AND lastname = "${req.body.lastname}"`;


    if (req.body.studNum) query += ` AND studNum = "${req.body.studNum}"`;


    if (req.body.activity) query += ` AND activity = "${req.body.activity}"`;


    if (req.body.when == "lastest*" || req.body.when == "LASTEST*") {
        query += ` GROUP BY "tracking.user_id" DESC`;
    }

    if (req.body.when == "earliest*" || req.body.when == "EARLIEST*") {
        query += ` GROUP BY "tracking.user_id"`;
    }


    mariadb.query(query, (err, rows, fields) => {
        if (!err) {
            res.send({
                error: false,
                data: rows,
            })
            return
        } else {
            res.send({
                error: true,
                code: "T001_SQL_GET",
                message: "id element was not found as a body element",
                sqlerror: err
            })
            return
        }
    });
});
//All a new activity upon event or requested
Router.post('/', (req, res, next) => {


    if (Object.keys(req.body).length == 0) {
        res.send({
            error: true,
            code: "T001_POST",
            message: "body parameters were not found"
        })
        return
    }


    if (req.body.userid && req.body.activity) {
        mariadb.query(`INSERT INTO tracking VALUES( DEFAULT,'${req.body.userid}','${req.body.activity}',DEFAULT)`, (err, rows, fields) => {
            if (!err) {
                res.send({
                    error: false,
                    data: rows,
                })
                return
            } else {
                if (err.code == "ER_NO_REFERENCED_ROW_2") {
                    res.send({
                        error: true,
                        code: "T001_SQL_POST",
                        message: "User doesn't exist on the system",
                    })
                    return
                }
                res.send({
                    error: true,
                    code: "T002_SQL_POST",
                    message: "Failed to successfully excute the SQL statement",
                    sqlerror: err
                })
                return
            }
        });
    } else {
        res.send({
            error: true,
            code: "T002_POST",
            message: "activity or user_id element was not found as a body element"
        })
        return
    }
});

module.exports = Router;