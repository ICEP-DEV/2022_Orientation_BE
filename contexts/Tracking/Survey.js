const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../../connection');
const bodyParser = require('body-parser');
app.use(bodyParser.json());


Router.get('/',(req, res, next) => {
    if(Object.keys(req.query).length < 1)
    {
        res.send({
            error:true,
            message:"Error the request is expacted to have param or query element of 'user_id'",
            code:"V001_GET"
        })
        return;
    }

    if(!req.query.user_id)
    {
        res.send({
            error:true,
            message:"Error expacted 'user_id' to retrieve user survey",
            code:"V002_GET"
        })
        return;
    }

    mariadb.query(`SELECT question,answer FROM survey WHERE user_id = ${req.query.user_id}`,(err,rows,fields)=>{
        if(err)
        {
            res.send({
                error:true,
                code:"V001_GET_SQL",
                message:"Error sql statement couldn't execute successfully",
                sqlMessage:err,
            })
            return;
        }

        res.send({
            error:false,
            data:rows
        })
        return;
    })
})



Router.post('/', (req, res, next) => {

    if(Object.keys(req.body).length < 2)
    {
        res.send({
            error:true,
            message:"Error survey array and user_id elements are required",
            code:"V001_POST"
        })
        return;
    }

    if(!req.body.survey)
    {
        res.send({
            error:true,
            message:"Error couldn't find the survey array have at list one question and it's answer",
            code:"V002_POST"
        })
        return
    }

    if(!req.body.user_id)
    {
        res.send({
            error:true,
            message:"Error user_id element was expected on the body element of the request",
            code:"V003_POST"
        })
        return
    }

    if(!Array.isArray(req.body.survey))
    {
        res.send({
            error:true,
            message:"Error survey body element is expacted to be an array",
            code:"V004_POST"
        })
        return
    }

   
    let rowsInserted;
    let sqlErr;

    async function InsertRows()
    {
        rowsInserted = 0;
        for (let index = 0; index < req.body.survey.length; index++) 
        {
            try
            {
                await mariadb.promise().query(`INSERT INTO survey VALUES(DEFAULT,${req.body.user_id},${req.body.survey[index].question},'${req.body.survey[index].answer}')`)
                .then((data)=>{
                    if(data[0].affectedRows == 1) rowsInserted++
                })
                .catch((err)=>{
                    sqlErr = err.sql
                })
            }
            catch{} 
        }

    }
    
    async function InsertAll()
    {
        await InsertRows().then(()=>{
            if(rowsInserted == req.body.survey.length)
            {
                res.send({
                    error:false,
                    data:{affectedRows : rowsInserted}
                })
                return
            }
            else
            {
                res.send({
                    error:true,
                    code:"V001_POST_SQL",
                    message:"SQL staments were not able to successfully execute",
                    sqlMessage:sqlErr,
                })
                return
            }
        })
    }
    
    InsertAll()

    
    
});

module.exports = Router



























































