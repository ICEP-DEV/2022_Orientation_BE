const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../connection');
const bodyParser = require('body-parser');
const e = require('express');


app.use(bodyParser.json());

// Get Method For Students 
Router.get('/', (req, res, next) => {
    if (!req.body) {
        res.send({
            error: true,
            code: "C001",
            message: "body parameters were not found"
        });
        return
    }
    if (req.body.id) {
        if (req.body.id == "*") {
            mariadb.query('SELECT * from user', (err, rows) => {
                if (!err) {
                    res.send(rows)
                } else {
                    console.log(err)
                }
            })
        } else {
            mariadb.query(`SELECT * FROM user WHERE user_id = ${req.body.id}`, (err, rows) => {
                if (!err) {
                    res.send(rows)
                } else {
                    console.log(err)
                }
            })
        }
    }
});

// Delete Method For Students
Router.delete('/', (req, res) => {
    if (req.body.id == "*") {
        //Delete All if body with element id is equal to * else
        mariadb.query(`DELETE FROM user `, (err, rows) => {
            if (!err) {
                res.send(`All Students has been deleted.`)
            } else {
                console.log(err)
            }
        })
    } else {
        //delete the metioned id
        mariadb.query(`DELETE FROM user WHERE user_id = ${req.body.id}`, (err, rows) => {
            if (!err) {
                res.send(`Student with the student ID: ${req.body.id} has been deleted.`)
            } else {
                console.log(err)
            }
        })
    }

})

//Post Method For Student
Router.post('', (req, res) => {
    console.log(req.body)
    const { studNum, name, surname, email, password, phoneNumber } = req.body;
    //`user_id`, `firstname_lastname`, `password`, `phoneNumber`, `stNumber`, `email`, `isVerified`
    mariadb.query(`INSERT INTO user VALUES(DEFAULT,'${name +" "+ surname}','${password}','${phoneNumber}','${studNum}','${email}',${1} )`, (err, rows) => {
        if (!err) {
            res.send(`Student with the name: ${name} has been added.`)
        } else {
            console.log(err)
        }
    })
})

//Put Method For Student
Router.put('/', (req, res) => {
    const { id, studNum, name, surname, email, password } = req.body

    mariadb.query('UPDATE student SET name = ?,surname = ?, studNum = ?, email = ?, password = ? WHERE user_id = ?', [name, surname, studNum, email, password, id], (err, rows) => {
        if (!err) {
            res.send(`Student with the name: ${name} has been added.`)
        } else {
            console.log(err)
        }

    })

    console.log(req.body)
})



module.exports = Router;