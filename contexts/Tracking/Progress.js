const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../../connection');
const bodyParser = require('body-parser');

app.use(bodyParser.json());


Router.put('/', (req, res, next) => {
    if(!req.body.email)
    {
        res.send({
            error:true,
            code:"P001_PUT",
            message:"Error 'email' was not for on body parse"
        })
        return;
    }

    if(!req.body.progress)
    {
        res.send({
            error:true,
            code:"P002_PUT",
            message:"Error 'progress' was not for on body parse"
        })
        return;
    }

    mariadb.query(`UPDATE student SET orientation_progress = ${req.body.progress} WHERE email = '${req.body.email}'`,(err,rows,fields)=>{
        if(err)
        {
            res.send({
                error:true,
                code:"P001_PUT_SQL",
                message:"Error Update sql execution could't complete succefully",
                sqlMessage:err
            })
            return;
        }
        else
        {
            res.send({
                error:false,
                data:rows
            })
            return;
        }
    })
});


Router.get('/', (req, res, next) => {
    
    if(!req.query.useremail)
    {
        res.send({
            error:true,
            code:"P001_GET",
            message:"Error email was not for on params parse"
        })
        return;
    }

    mariadb.query(`SELECT orientation_progress FROM student WHERE email = '${req.query.useremail}'`,(err,rows,fields)=>{
        if(err)
        {
            res.send({
                error:true,
                code:"P001_SQL_GET",
                message:"Error on execution of the SQL",
                sqlMessage:err
            })
            return
        }
        else
        {
            res.send(
                {
                    error:false,
                    data:rows
                }
            )
            return
        }
    })
    

});

module.exports = Router