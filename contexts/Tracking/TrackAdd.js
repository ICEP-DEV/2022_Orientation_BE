const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../../connection');
const bodyParser = require('body-parser');

app.use(bodyParser.json());



//All a new activity upon event or requested
Router.post('/', async (req, res, next) => {


    if (Object.keys(req.body).length == 0) {
        res.send({
            error: true,
            code: "T001_POST",
            message: "body parameters were not found"
        })
        return
    }

    mariadb.promise().query(`SELECT id FROM student WHERE email = '${req.body.useremail}'`)
    .then((data)=>{
        
        if(!data[0][0])
        {
            res.send({
                error: true,
                code: "T002_SQL_POST",
                message: "Couldn't find related user's id",
            })
            return
        }
        if (data[0][0].id && req.body.activity) {
            mariadb.query(`INSERT INTO tracking VALUES( DEFAULT,${data[0][0].id},'${req.body.activity}',DEFAULT)`, (err, rows, fields) => {
                if (!err) {
                    res.send({
                        error: false,
                        data: rows,
                    })
                    return
                } else {
                    if (err.code == "ER_NO_REFERENCED_ROW_2") {
                        res.send({
                            error: true,
                            code: "T001_SQL_POST",
                            message: "User doesn't exist on the system",
                        })
                        return
                    }
                    res.send({
                        error: true,
                        code: "T002_SQL_POST",
                        message: "Failed to successfully excute the SQL statement",
                        sqlerror: err
                    })
                    return
                }
            });
        } else {
            res.send({
                error: true,
                code: "T002_POST",
                message: "activity or user_id element was not found as a body element"
            })
            return
        }
    })


    
});

module.exports = Router;