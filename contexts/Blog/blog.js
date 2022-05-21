const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../../connection');
const bodyParser = require('body-parser');
const fs = require('fs');

app.use(bodyParser.json());


Router.get('/', (req, res, next) => {

    let field;

    if (Object.keys(req.query).length == 0) {
        res.send({
            error: true,
            code: "S001",
            message: "paramiter parameters were not found"
        })
        return
    }



    if (req.query.id) {
        if (req.query.id == "*") {
            mariadb.query('SELECT id, title, description, author, created_on, path, link,subTittle from blog', (err, rows) => {

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
            mariadb.query(`SELECT ${req.query.field} FROM blog`, (err, rows, fields) => {
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



    const { title, description,author, link, subtittle, id } = req.body

    mariadb.query(`UPDATE blog SET title = '${title}',subTittle = '${subtittle}',description = '${description}',author = '${author}', link = '${link}'  WHERE id = ${id}`, (err, rows) => {
        if (!err) {
            res.send({
                error: false,
                data: `one row was updated`
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