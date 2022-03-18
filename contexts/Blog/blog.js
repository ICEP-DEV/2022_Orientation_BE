const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../../connection');
const bodyParser = require('body-parser');
var CryptoJS = require("crypto-js");

app.use(bodyParser.json());


//Post a blog
Router.post('', (req, res) => {

    

    if (Object.keys(req.body).length == 0) {
        res.send({
            error: true,
            code: "C001_POST",
            message: "body parameters were not found"
        });
        return
    }
    const { title, description, author, created_on} = req.body;
    if (title == null || description == null || author == null) {
        res.send({
            error: true,
            message: "One or many of the requred body arguements is missing",
            code: "C002_POST"
        })
        return
    }
    mariadb.query(`INSERT INTO blog VALUES(DEFAULT,'${title}','${description}','${author}',DEFAULT)`, (err, rows) => {
        if (!err) {
            res.send({
                error: false,
                data: `Blog with the Title name: ${title} has been added.`
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

Router.get('/', (req, res, next) => {

    let field;

    if (Object.keys(req.body).length == 0) {
        res.send({
            error: true,
            code: "S001",
            message: "body parameters were not found"
        })
        return
    }


    if (req.body.id) {
        if (req.body.id == "*") {
            mariadb.query('SELECT title, description, author, created_on from blog', (err, rows) => {
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
        }
        else {
            mariadb.query(`SELECT ${req.body.field} FROM blog`, (err, rows, fields) => {
                if (!err) {
                    res.send({
                        error: false,
                        data: rows,
                    })
                    return
                } else {
                    res.send({
                        error: true,
                        code: "S001_SQL",
                        message: "field element was not found as a body element"
                    })
                    return
                }
                
            });
            
        } 
    
    }else {
        res.send({
            error: true,
            code: "S002",
            message: "field element was not found as a body element"
        })
        return
    }


});

Router.put('/', (req, res) => {
    let field;
    let updateValue = "";

    if (Object.keys(req.body).length == 0) {
        res.send({
            error: true,
            code: "C001_PUT",
            message: "body parameters were not found"
        });
        return
    }

    const { title, description,author, id } = req.body

    mariadb.query(`UPDATE blog SET ${req.body.field} = '${req.body.updateValue}' WHERE id = ${req.body.id}`, (err, rows) => {
        if (!err) {
            res.send({
                error: false,
                data: `one column has been deleted.`
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

Router.delete('/', (req, res, next) => {

    let field;

    if (Object.keys(req.body).length == 0) {
        res.send({
            error: true,
            code: "S001",
            message: "body parameters were not found"
        })
        return
    }


    if (req.body.id) {
        if (req.body.id == "*") {
            mariadb.query('DELETE * from blog', (err, rows) => {
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
        }
        else {
            mariadb.query(`DELETE FROM blog WHERE id = ${req.body.id}`, (err, rows, fields) => {
                if (!err) {
                    res.send({
                        error: false,
                        data: rows,
                    })
                    return
                } else {
                    res.send({
                        error: true,
                        code: "S001_SQL",
                        message: "field element was not found as a body element"
                    })
                    return
                }
                
            });
            
        } 
    
    }else {
        res.send({
            error: true,
            code: "S002",
            message: "field element was not found as a body element"
        })
        return
    }


});

module.exports = Router;