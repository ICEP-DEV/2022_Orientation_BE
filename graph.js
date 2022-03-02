//Module Importing
const express = require('express');
const mysql = require('mysql');
const app = express();
const bodyParser = require('body-parser');
const prompt = require('prompt-sync')();

//Context file object
//Student
const TestQuery_cnxt = require('./contexts/TestQuery')
const Registration_cnxt = require('./contexts/Registration')
const Login_cnxt = require("./contexts/Login")
const Student_cnxt = require("./contexts/Students")
    //Admin
const RegistrationAdm_cnxt = require('./contexts/Register_Adm')
const LoginAdm_cnxt = require("./contexts/Login_Adm")


app.use(bodyParser.json());


app.use(function(req, res, next) {
    //Header allowences of METHODS
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,Content-Type');
    res.setHeader('Access-Control-Allow-Credentials', true);
    next();
});

//context channelling Student
app.use('/TestQuery', TestQuery_cnxt);
app.use('/Registration', Registration_cnxt);
app.use('/Student', Student_cnxt);
app.use('/Login', Login_cnxt);

//context channelling Admin
app.use('/Registration_Admin', RegistrationAdm_cnxt);
app.use('/Login_Admin', LoginAdm_cnxt);

const PORT = 6900
app.listen(PORT, (e) => {
    console.log("********************************************************");
    console.log("*                                                      *");
    console.log("*                PORT is running on " + PORT + "               *");
    console.log("*                 http://localhost:6900                *");
    console.log("********************************************************");

});