const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../../connection');
const bodyParser = require('body-parser');



app.use(bodyParser.json());

Router.put('/', (req, res, next) => {

    if(Object.keys(req.body).length == 0)
    {
        res.send({
            error: true,
            code: "UV001",
            message: "No element was found on the body elements"
        })
        return
    }

    if(!req.body.id)
    {
        res.send({
            error: true,
            code: "UV002",
            message: "No id element was found on the body"
        })
        return
    }

    if(!req.body.tittle)
    {
        res.send({
            error: true,
            code: "UV003",
            message: "No tittle element was found on the body"
        })
        return
    }

    if(!req.body.category)
    {
        res.send({
            error: true,
            code: "UV004",
            message: "No category element was found on the body"
        })
        return
    }
   
    mariadb.query(`UPDATE videos SET tittle='${req.body.tittle}',category='${req.body.category}' WHERE id = ${req.body.id}`, (err, rows, fields) => {
        if (!err) {
            res.send({
                error: false,
                data: rows,
            })
            return
        } else {
            res.send({
                error: true,
                code: "UV001_SQL",
                message: "SQL couldn't execute successfully execute",
                sqlMessage:err
            })
            return
        }
    });
});





module.exports = Router