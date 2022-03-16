const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../../connection');
const bodyParser = require('body-parser');
const e = require('express');


app.use(bodyParser.json());

// Get Method For Students 
Router.get('/', (req, res, next) => {
    if (Object.keys(req.body).length == 0) {
        res.send({
            error: true,
            code: "C001_GET",
            message: "body parameters were not found"
        });
        return
    }

    if (req.body.id) {
        if (req.body.id == "*") {
            mariadb.query('SELECT * from student', (err, rows) => {
                if (!err) {
                    res.send({
                        error: false,
                        data: rows
                    });
                } else {
                    res.send({
                        error: true,
                        code: "C001_SQL_GET",
                        message: err
                    });
                    return
                }
            })
        } else {
            mariadb.query(`SELECT * FROM student WHERE id = ${req.body.id}`, (err, rows) => {
                if (!err) {
                    res.send({
                        error: false,
                        data: rows
                    })
                } else {
                    res.send({
                        error: true,
                        code: "C002_SQL_GET",
                        message: err
                    });
                    return
                }
            })
        }
    } else {
        res.send({
            error: true,
            code: "C002_GET",
            message: "Id was not recieved from body arguements"
        });
        return
    }
});

// Delete Method For Students
Router.delete('/', (req, res) => {
    if (Object.keys(req.body).length == 0) {
        res.send({
            error: true,
            code: "C001_DELETE",
            message: "body parameters were not found"
        });
        return
    }

    if (!req.body.id) {
        res.send({
            error: true,
            code: "C002_DELETE",
            message: "Id body parameters was not recieved"
        });
        return
    }

    if (req.body.id == "*") {
        //Delete All if body with element id is equal to * else
        mariadb.query(`DELETE FROM student `, (err, rows) => {
            if (!err) {
                res.send({
                    error: false,
                    message: `All Students have been deleted.`
                })
            } else {
                res.send({
                    error: true,
                    code: "C001_SQL_DELETE",
                    message: err
                });
                return
            }
        })
    } else {
        //delete the metioned id
        mariadb.query(`DELETE FROM student WHERE id = ${req.body.id}`, (err, rows) => {
            if (!err) {
                res.send({
                    error: false,
                    data: `Student with the student ID: ${req.body.id} has been deleted.`
                })
                return
            } else {
                res.send({
                    error: true,
                    code: "C002_SQL_DELETE",
                    message: err
                });
                return
            }
        })
    }

})

//Post Method For Student
Router.post('', (req, res) => {
    if (Object.keys(req.body).length == 0) {
        res.send({
            error: true,
            code: "C001_POST",
            message: "body parameters were not found"
        });
        return
    }
    const { studNum, firstname, lastname, email, password, isVerified } = req.body;
    if (studNum == null || firstname == null || lastname == null || email == null || password == null || isVerified == null) {
        res.send({
            error: true,
            message: "One or many of the requred body arguements is missing",
            code: "C002_POST"
        })
        return
    }
    mariadb.query(`INSERT INTO student VALUES(DEFAULT,'${studNum}','${firstname}','${lastname}','${email}','${password}',${isVerified} )`, (err, rows) => {
        if (!err) {
            res.send({
                error: false,
                data: `Student with the name: ${firstname} has been added.`
            })
            return
        } else {
            res.send({
                error: true,
                message: err,
                code: "C001_SQL_POST"
            })
            return
        }
    })
})

//Put Method For Student
Router.put('/', (req, res) => {

    if (Object.keys(req.body).length == 0) {
        res.send({
            error: true,
            code: "C001_PUT",
            message: "body parameters were not found"
        });
        return
    }

    const { id, studNum, firstname, lastname, email, password, isVerified } = req.body

    if (id == null || studNum == null || firstname == null || lastname == null || email == null || password == null || isVerified == null) {
        res.send({
            error: true,
            message: "One or many of the requred body arguements is missing",
            code: "C002_PUT"
        })
        return
    }

    mariadb.query('UPDATE student SET firstname = ?,lastname = ?, studNum = ?, email = ?, password = ?, isVerified = ? WHERE id = ?', [firstname, lastname, studNum, email, password, isVerified, id], (err, rows) => {
        if (!err) {
            res.send({
                error: false,
                data: `Student with the name: ${firstname} has been added.`
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
    })
})



module.exports = Router;