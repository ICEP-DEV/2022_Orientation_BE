const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../../connection');
const bodyParser = require('body-parser')


app.use(bodyParser.json());

Router.get('/', (req, res) => {
    mariadb.query('SELECT * FROM user', (err, rows, fields) => {
        if (!err) {
            res.send(rows)
            console.log(req.body)
            console.log("Router Get Request")
        } else {
            console.log(err)
        }
    })
});

Router.post('/', (req, res, next) => {
    mariadb.query("SELECT * From user", (err, rows, fields) => {
        if (!err) {
            res.send(rows);
            console.log("Rounter Post Request")
        } else {
            console.log(err);
        }
    })
});

module.exports = Router;