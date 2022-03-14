//Module Importing
const express = require('express');
//const mysql = require('mysql');
const app = express();
const bodyParser = require('body-parser');
//const prompt = require('prompt-sync')();
const socket = require('socket.io')
const connection = require("./connection")
//Context file object
//Student
const TestQuery_cnxt = require('./contexts/TestQuery')
const Registration_cnxt = require('./contexts/Registration')
const Login_cnxt = require("./contexts/Login")
const Student_cnxt = require("./contexts/Students")
const Forgotten_cnxt = require("./contexts/Forgotten")
    //Admin
const RegistrationAdm_cnxt = require('./contexts/Register_Adm')
const LoginAdm_cnxt = require("./contexts/Login_Adm")

//common
const Stats_cnxt = require('./contexts/Stats')
const Track_cnxt = require('./contexts/Tracking')


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
app.use('/Forgotten',Forgotten_cnxt)

//context channelling Admin
app.use('/Registration_Admin', RegistrationAdm_cnxt);
app.use('/Login_Admin', LoginAdm_cnxt);

//context to common entities
app.use('/Stats', Stats_cnxt);
app.use('/Tracking', Track_cnxt)

const PORT = 6900
var server = app.listen(PORT, (e) => {
    console.log("********************************************************");
    console.log("* DB: localhost:3306 DBname:'orientation_db_schema'    *");
    console.log("*                PORT is running on " + PORT + "               *");
    console.log("*                 http://localhost:6900                *");
    console.log("********************************************************");

});



connectionCount = 0
/* Note for Shezi */

//Counting of current live (Realtime) users on the On the system
//Backend Code
var socketIO = socket(server);

//Connection of IOSocket
socketIO.on('connection', (socket) => {
    console.log(new Date() + " -> user connected** io-socket\b")
    connectionCount++;

    for (let index = 0; index < 4; index++) {
        console.log("\r"+index+"\r")
        
    }
    
    //Emttion of viewNumVisitors on connection of the client of IOSocket
    socketIO.emit('usercount',connectionCount)
    //Update the viewNumVisitors when client connection
    connection.query(`UPDATE stats SET viewNumVisitors = ${connectionCount}`,function(err, rows, fields){
        if(err)
        {
            console.log("Unknow err of sql execution "+ new Date()+" SQL-S_IO connection err")
        }
    })

    //Disconnection of IOSocket
    socket.on('disconnect', function(){
        console.log(new Date() + " -> user disconnected** io-socket")
        connectionCount--;

        //Emttion of viewNumVisitors for disconnection
        socketIO.emit('usercount',connectionCount)

        //Update the viewNumVisitors when client disconnect
        connection.query(`UPDATE stats SET viewNumVisitors = ${connectionCount}`,function(err, rows, fields){
            if(err)
            {
                console.log("Unknow err of sql execution "+ new Date()+" SQL-S_IO disconnect err")
            }
        })
    })
})


