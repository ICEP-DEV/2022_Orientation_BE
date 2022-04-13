const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../../connection');
const bodyParser = require('body-parser');
app.use(bodyParser.json());

Router.get('/admin',(req, res, next) => {

    let surveyUser = [];

    mariadb.query(`SELECT id, studNum as StudentNo, firstname as Firstname, lastname as Lastname, email as Email FROM student`,async (err,outer_rows,fields)=>{

        if(err || outer_rows.length < 1)
        {
            res.send({
                error:true,
                message:"Error sql statement couldn't execute successfully",    
                code:"O001_POST_SQL"        
            })
            return;
        }
        for (let index = 0; index < outer_rows.length; index++) {
            await mariadb.promise().query(`SELECT  survey.answer,surveyquestion.question FROM survey,surveyquestion WHERE survey.question_id = surveyquestion.id AND survey.student_id = ${outer_rows[index].id}`)
            .then((data)=>{
                if(data[0][0])
                {
                    surveyUser[index] = 
                        {
                            Id : index,
                            Firstname : outer_rows[index].Firstname,
                            Lastname :  outer_rows[index].Lastname,
                            StudentNo : outer_rows[index].StudentNo,
                            Email : outer_rows[index].Email,
                            Survey : data[0]
                        }
                    
                }
                
            })  
        }

        res.send(surveyUser)
        
    })
})

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

    if(!req.query.useremail)
    {
        res.send({
            error:true,
            message:"Error expacted 'useremail' to retrieve user survey",
            code:"V002_GET"
        })
        return;
    }

    mariadb.query(`SELECT id FROM student WHERE email = '${req.query.useremail}'`,(err,outer_rows,fields)=>{

        if(err || outer_rows.length < 1)
        {
            res.send({
                error:true,
                message:"Error sql statement couldn't execute successfully",    
                code:"O001_POST_SQL"        
            })
            return;
        }

        mariadb.query(`SELECT question_id,answer FROM survey WHERE student_id = ${outer_rows[0].id}`,(err,rows,fields)=>{
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

    if(!req.body.useremail)
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

    mariadb.query(`SELECT id FROM student WHERE email = '${req.body.useremail}'`,(err,outer_rows,fields)=>{

        if(err || outer_rows.length < 1)
        {
            res.send({
                error:true,
                message:"Error sql statement couldn't execute successfully",    
                code:"O001_POST_SQL"        
            })
            return;
        }

        mariadb.query(`DELETE FROM survey WHERE student_id = ${outer_rows[0].id}`,(err,inner_rows,fields)=>{
            InsertAll(outer_rows[0].id)
        })

        

    })

    async function InsertRows(id)
    {
        rowsInserted = 0;
        for (let index = 0; index < req.body.survey.length; index++) 
        {
            try
            {
                await mariadb.promise().query(`INSERT INTO survey VALUES(DEFAULT,${id},${req.body.survey[index].question},'${req.body.survey[index].answer}')`)
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
    
    async function InsertAll(id)
    {
        await InsertRows(id).then(()=>{
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
    
    

    
    
});

module.exports = Router



























































