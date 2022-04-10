const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../../connection');
const bodyParser = require('body-parser');

app.use(bodyParser.json());
//Getting User Orientation Progress

Router.get('/',(req,res,next)=>{   
    if(Object.keys(req.query).length < 1)
    {
        res.send({
            error:true,
            message:"Error expacted a user_id and [field] from the query or params elemnents",
            code:"O001_GET"
        })
        return
    }
    
    if(Object.keys(req.query).length == 1)
    {
        if(!req.query.useremail)
        {
            res.send({
                error:true,
                message:"Error expacted a useremail from the query or params elemnents",
                code:"O002_GET"
            })
            return
        }

        mariadb.query(`SELECT id FROM student WHERE email = '${req.query.useremail}'`,(err,rows,fields)=>{

                if(err || rows.length < 1)
                {
                    res.send({
                        error:true,
                        message:"Error sql statement couldn't execute successfully",    
                        code:"O001_GET_SQL"        
                    })
                    return;
                }

                
                mariadb.query(`SELECT field, value FROM orientation WHERE student_id = '${rows[0].id}'`,(err,rows,fields)=>{
                    if(err)
                    {
                        res.send({
                            error:true,
                            message:"Error sql statement couldn't execute successfully",
                            code:"O002_GET_SQL",
                            sqlMessage:err
                        })
                        return;
                    }
        
                    res.send({
                        error:false,
                        data:rows
                    })
                    return
                })

        })
        
    }
   
    if(Object.keys(req.query).length == 2)
    {
        if(!req.query.useremail)
        {
            res.send({
                error:true,
                message:"Error expacted a useremail from the query or params elemnents",
                code:"O003_GET"
            })
            return
        }

        if(!req.query.field)
        {
            res.send({
                error:true,
                message:"You can only have 'field' as your second element in your params or query",
                code:"O004_GET"
            })
            return
        }

        mariadb.query(`SELECT id FROM student WHERE email = '${req.query.useremail}'`,(err,rows,fields)=>{

            if(err || rows.length < 1)
            {
                res.send({
                    error:true,
                    message:"Error sql statement couldn't execute successfully",    
                    code:"O001_GET_SQL"        
                })
                return;
            }

            mariadb.query(`SELECT field, value FROM orientation WHERE student_id = ${rows[0].id} AND field = '${req.query.field}'`,(err,rows,fields)=>{
                if(err)
                {
                    res.send({
                        error:true,
                        message:"Error sql statement couldn't execute successfully",
                        code:"O002_GET_SQL",
                        sqlMessage:err
                    })
                    return;
                }

                res.send({
                    error:false,
                    data:rows
                })
                return
            })
        })
    }
    
})

Router.post('/',(req,res,next)=>{
    
    if(Object.keys(req.body).length < 1 || Object.keys(req.body).length > 3)
    {
        res.send({
            error:true,
            message:"Error you have to pass field, value and user_id element to set a user's progress",    
            code:"O001_POST"        
        })
        return;
    }

    if(!req.body.field)
    {
        res.send({
            error:true,
            message:"Error you have to pass field element to set a user's progress",    
            code:"O002_POST"        
        })
        return;
    }

    if(!req.body.value)
    {
        res.send({
            error:true,
            message:"Error you have to pass value element to set a user's progress",    
            code:"O003_POST"        
        })
        return;
    }

    if(!req.body.useremail)
    {
        res.send({
            error:true,
            message:"Error you have to pass useremail element to set a user's progress",    
            code:"O004_POST"        
        })
        return;
    }

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

        mariadb.query(`DELETE FROM orientation WHERE student_id = ${outer_rows[0].id} AND field = '${req.body.field}'`,(err,rows,fields)=>{

            mariadb.query(`INSERT INTO orientation VALUES(DEFAULT,${outer_rows[0].id},'${req.body.field}','${req.body.value}')`,(err,rows,fields)=>{
                if(err)
                {
                    res.send({
                        error:true,
                        message:"Error sql statement couldn't execute successfully",    
                        code:"O002_POST_SQL"        
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
})

module.exports = Router