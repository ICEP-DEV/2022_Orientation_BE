const express = require('express');
const app = express();
const Router = express.Router();
const mariadb = require('../../connection');
const bodyParser = require('body-parser');

app.use(bodyParser.json());



Router.get('/',async (req, res, next) => {
    
    let datesRates=[]

    for (let index = 0; index < 10; index++) {

       await mariadb.promise().query(`SELECT COUNT(activity) as rates FROM tracking WHERE DATE_FORMAT(datetime,"%M - %Y") = DATE_FORMAT(CURRENT_TIMESTAMP,"%M - %Y")  AND DATE_FORMAT(datetime,"%D") = (DATE_FORMAT(CURRENT_TIMESTAMP,"%D") - ${index}) AND activity = "Logged in";`)
        .then((data)=>{
            if(data[0])
            { 
                if(data[0][0].rates || data[0][0].rates == 0)
                { 
                    datesRates[index] = data[0][0].rates
                }
            }
        })
    }

    res.send(
        { 
            error:false,
            data:datesRates
        }
    )
    return
    

});

module.exports = Router