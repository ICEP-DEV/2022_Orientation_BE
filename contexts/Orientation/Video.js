const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../../connection');
const bodyParser = require('body-parser');
var CryptoJS = require("crypto-js");

app.use(bodyParser.json());



 Router.get('/', (req, res, next)  => {

    if(Object.keys(req.query).length == 0)
    {
        res.send({
            error: true,
            code: "V001",
            message: "No element was found on the query elements"
        })
        return
    }

    if(!req.query.fac_id)
    {
        res.send({
            error: true,
            code: "V002",
            message: "No faculty id element was found on the query"
        })
        return
    }

    
   let fullVideosObj = []
    mariadb.query(`SELECT videos.category FROM fac_vid,videos WHERE fac_vid.vid_id = videos.id AND fac_vid.fac_id = ${req.query.fac_id} GROUP BY videos.category ORDER BY videos.id ASC;`, async (err, rows, fields) => {
        if (!err) {
            for (let index = 0; index < rows.length; index++) {
                await mariadb.promise().query(`SELECT  videos.id,videos.tittle,videos.path,videos.type,videos.createdAt FROM fac_vid,videos WHERE fac_vid.vid_id = videos.id AND videos.category = "${rows[index].category}" AND fac_vid.fac_id = ${req.query.fac_id} ORDER BY videos.id ASC;`)
                .then((data)=>{    
                    fullVideosObj[index] = {
                        category : rows[index].category,
                        content : data[0]
                    }
                })     
            }
            
            res.send({
                error: false,
                data: fullVideosObj
            })
            return
            

            return
        } else {
            res.send({
                error: true,
                code: "M001_SQL",
                message: "SQL couldn't execute successfully execute",
                sqlMessage:err
            })
            return
        }
    });  
});

module.exports = Router