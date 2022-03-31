const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../../connection');
const bodyParser = require('body-parser');
var CryptoJS = require("crypto-js");

app.use(bodyParser.json());



Router.get('/', (req, res, next) => {

    
    if(Object.keys(req.query).length == 0)
    {
        res.send({
            error: true,
            code: "F001",
            message: "No element was found on the query elements"
        })
        return
    }

    if(!req.query.fac_id)
    {
        res.send({
            error: true,
            code: "F002",
            message: "No id element was found on the query"
        })
        return
    }
    let fullSurvey = []
    mariadb.query(`SELECT surveyquestion.id, surveyquestion.question FROM surveyquestion, que_fac WHERE surveyquestion.id = que_fac.id AND que_fac.fac_id = ${req.query.fac_id}  ORDER BY surveyquestion.id ASC`,async (err, rows, fields) =>{
        if (!err) {      
            for (let index = 0; index < rows.length; index++) {
                await mariadb.promise().query(`SELECT surveyanswer.id,surveyanswer.answer FROM ans_que,surveyanswer WHERE ans_que.ans_id = surveyanswer.id AND ans_que.que_id = ${rows[index].id}`)
                .then((data)=>{
                    fullSurvey[index] = {
                        question_id : rows[index].id,
                        question : rows[index].question,
                        possible_answer : data[0]
                    }
                })
            }
            res.send(
                {
                    error:false,
                    data : fullSurvey
                }
            )
            return
        } else {
            res.send({
                error: true,
                code: "F001_SQL",
                message: "SQL couldn't execute successfully execute",
                sqlMessage:err
            })
            return
        }
    })

})

module.exports = Router