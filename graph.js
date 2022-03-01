//Module Importing
const express = require('express');
const mysql = require('mysql');
const app = express();
const bodyParser = require('body-parser');
const TestQuery_cnxt = require('./contexts/TestQuery')
const Registration_cnxt = require('./contexts/Registration')
const Login_cnxt = require("./contexts/Login")
const Student_cnxt = require("./contexts/Students")
const prompt = require('prompt-sync')();

app.use(bodyParser.json());


app.use(function(req, res, next) {
    //Header allowences of METHODS
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,Content-Type');
    res.setHeader('Access-Control-Allow-Credentials', true);
    next();
});

//context channelling
app.use('/TestQuery', TestQuery_cnxt);
app.use('/Registration', Registration_cnxt);
app.use('/Student', Student_cnxt);
app.use('/Login', Login_cnxt);

const PORT = 6900
app.listen(PORT, (e) => {
    console.log("********************************************************");
    console.log("*                                                      *");
    console.log("*                PORT is running on " + PORT + "               *");
    console.log("*                 http://localhost:6900                *");
    console.log("********************************************************");

});