const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../../connection');
const bodyParser = require('body-parser');

app.use(bodyParser.json());

Router.get('/students', (req, res, next) => {

    if(Object.keys(req.query).length == 0)
    {
        res.send({
            error: true,
            code: "001_S",
            message: "No query phrase found"
        })
        return
    }

    if(!req.query.search)
    {
        res.send({
            error: true,
            code: "002_S",
            message: "No query phrase found"
        })
        return
    }

    let sql = `SELECT id,studNum,firstname,lastname,email,orientation_progress `
    +`FROM student `
    +`WHERE studNum LIKE '%${req.query.search}%' `
    +`OR firstname LIKE '%${req.query.search}%' `
    +`OR lastname LIKE '%${req.query.search}%' `
    +`OR email LIKE '%${req.query.search}%' `
    +`OR orientation_progress LIKE '%${req.query.search}%' `

    mariadb.query(sql,(err,rows,fields)=>{
        if(err) 
        {
            res.send({
                error: true,
                code: "SeaStudErr",
                message: err
            })
            return
        }
        
        res.send({
            error: false,
            data: rows
        })
        return
    })
});

Router.get('/videos', (req, res, next) => {

    if(Object.keys(req.query).length == 0)
    {
        res.send({
            error: true,
            code: "001_V",
            message: "No query phrase found"
        })
        return
    }

    if(!req.query.search)
    {
        res.send({
            error: true,
            code: "002_V",
            message: "No query phrase found"
        })
        return
    }

    let sql = `SELECT id,tittle,category,type,createdAt `
    +`FROM videos `
    +`WHERE tittle LIKE '%${req.query.search}%' `
    +`OR category LIKE '%${req.query.search}%' `

    mariadb.query(sql,(err,rows,fields)=>{
        if(err) 
        {
            res.send({
                error: true,
                code: "SeaVidErr",
                message: err
            })
            return
        }

        res.send({
            error: false,
            data: rows
        })
        return
    })
});

Router.get('/blogs', (req, res, next) => {

    if(Object.keys(req.query).length == 0)
    {
        res.send({
            error: true,
            code: "001_B",
            message: "No query phrase found"
        })
        return
    }

    if(!req.query.search)
    {
        res.send({
            error: true,
            code: "002_B",
            message: "No query phrase found"
        })
        return
    }

    let sql = `SELECT id,title,description,author,subTittle ` 
    +`FROM blog `
    +`WHERE title LIKE '%${req.query.search}%' `
    +`OR description LIKE '%${req.query.search}%' `
    +`OR author LIKE '%${req.query.search}%' `
    +`OR subTittle LIKE '%${req.query.search}%' `
    +`OR created_on LIKE '%${req.query.search}%' `

    mariadb.query(sql,(err,rows,fields)=>{
        if(err) 
        {
            res.send({
                error: true,
                code: "SeaBlogErr",
                message: err
            })
            return
        }

        res.send({
            error: false,
            data: rows
        })
        return
    })
});


module.exports = Router