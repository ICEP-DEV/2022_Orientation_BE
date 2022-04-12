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
            message:"Error you have to pass field, value and useremail element to set a user's progress",    
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

Router.delete("/",(req,res,next)=>{

    if(Object.keys(req.query).length < 1)
    {
        res.send({
            error:true,
            message:"Error you have to pass useremail for the user to delete there progress",    
            code:"O001_DELETE"        
        })
        return;
    }

    if(!req.query.useremail)
    { 
        res.send({
            error:true,
            message:"Error you have to pass useremail for the user to delete there progress",    
            code:"O002_DELETE"        
        })
        return;
    }

    mariadb.query(`SELECT id FROM student WHERE email = '${req.query.useremail}'`,(outer_err,outer_rows,fields)=>{

        if(outer_err || !outer_rows[0].id)
        {
            res.send({
                error:true,
                message:"Error SQL statement for retriving user id is incorrect",    
                code:"O001_DELETE_SQL",     
                sqlMessage:outer_err
            })
            return;
        }

        if(req.query.survey)
        { 
            let query = `DELETE FROM Orientation WHERE student_id = ${outer_rows[0].id} AND field = 'Survey'`

            if(req.query.videos)
                query += ` OR field = 'Videos'`
                
            if(req.query.faculty)
                query += ` OR field = 'Faculty'`

            if(req.query.campus)
                query += ` OR field = 'Campus'`

            if(req.query.start)
                query += ` OR field = 'StartOrientation'`


            mariadb.query(query,(err,rows,fields)=>{

                if(err)
                {
                    res.send({
                        error:true,
                        message:"Error SQL statement for deleting from orientation id is incorrect",    
                        code:"O001_DELETE_SQL",     
                        sqlMessage:outer_err
                    })
                    return;
                }

                mariadb.query(`DELETE FROM survey WHERE student_id = ${outer_rows[0].id}`,(inner_err,inner_rows,fields)=>{
                    if(inner_err)
                    {
                        res.send({
                            error:true,
                            message:"Error SQL statement for deleting from orientation id is incorrect",    
                            code:"O002_DELETE_SQL",     
                            sqlMessage:outer_err
                        })
                        return;
                    }
                    res.send({
                        error:false,
                        message:"Delete Custome step",    
                
                    })
                    return;
                })
            })
        }
        else
        if(req.query.delete == "all")
        {
            
            mariadb.query(`DELETE FROM Orientation WHERE student_id = ${outer_rows[0].id}`,(err,rows,fields)=>{

                if(err)
                {
                    res.send({
                        error:true,
                        message:"Error SQL statement for deleting from orientation id is incorrect",    
                        code:"O003_DELETE_SQL",     
                        sqlMessage:outer_err
                    })
                    return;
                }

                mariadb.query(`DELETE FROM survey WHERE student_id = ${outer_rows[0].id}`,(inner_err,inner_rows,fields)=>{
                    if(inner_err)
                    {
                        res.send({
                            error:true,
                            message:"Error SQL statement for deleting from orientation id is incorrect",    
                            code:"O004_DELETE_SQL",     
                            sqlMessage:outer_err
                        })
                        return;
                    }
                    res.send({
                        error:false,
                        message:"Delete all step",    
                
                    })
                    return;
                })
            })

        }
        else
        {
            res.send({
                error:true,
                message:"Error didn't choose delete type",    
                code:"O005_DELETE_SQL",     
            })
            return;
        }
     

    })

})

module.exports = Router