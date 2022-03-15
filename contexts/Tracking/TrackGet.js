const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../../connection');
const bodyParser = require('body-parser');

app.use(bodyParser.json());


Router.post('/', (req, res, next) => {


    let query = "SELECT student.firstname, student.lastname, student.email, student.studNum, tracking.activity, tracking.datetime, tracking.orientation_progress" +
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

module.exports = Router;