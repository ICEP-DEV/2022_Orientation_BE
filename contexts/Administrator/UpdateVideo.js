const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../../connection');
const bodyParser = require('body-parser');
const fs = require('fs');
const { HOSTNAME } = require('./../../globals')

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



Router.delete('/', (req, res, next) => {

    if(Object.keys(req.query).length == 0)
    {
        res.send({
            error: true,
            code: "DV001",
            message: "No element was found on the query elements"
        })
        return
    }

    if(!req.query.id)
    {
        res.send({
            error: true,
            code: "DV002",
            message: "No id element was found on the query"
        })
        return
    }


    mariadb.query(`SELECT path FROM videos WHERE id = ${req.query.id}`,(outer_err, outer_rows,outer_fields)=>{
        if(outer_rows.length)
            mariadb.query(`DELETE FROM videos WHERE id = ${req.query.id}`, (err, rows, fields) => {

            fs.unlink("bin"+outer_rows[0].path.replace(HOSTNAME, ""),(inner_err)=>{

                if (err == null) 
                {
                    if(outer_err == null)
                    {
                        if(inner_err == null)
                        {
                            res.send({
                                error: false,
                                data: rows,
                            })
                            return
                        }
                        else
                        {
                            res.send({
                                error: true,
                                code: "UV001_SQL-inner_err",
                                message: "Couldn't complete the whole delete cycle",
                                sqlMessage:err,
                                sqlMessageOuter:inner_err,
                            })
                            return 
                        }
                    }
                    else
                    {
                        res.send({
                            error: true,
                            code: "UV001_SQL-outter_err",
                            message: "Couldn't complete the whole delete cycle",
                            sqlMessageOuter:outer_err,
                        })
                        return 
                    }    
                } else {
                    res.send({
                        error: true,
                        code: "UV001_SQL-err",
                        message: "Couldn't complete the whole delete cycle",
                        sqlMessage:err,
                    })
                    return
                }
            })

            });
        else
            res.send({
                error: true,
                code: "DV003",
                message: "Video wasn't found form the database",
            
            })
        return

    })
});


module.exports = Router