//Module Importing
const express = require('express');
//const mysql = require('mysql');
const app = express();
const bodyParser = require('body-parser');
//const prompt = require('prompt-sync')();
const socket = require('socket.io')
const connection = require("./connection")
//Context file object
const cors = require('cors');
//----------------------------------------------------------------------------------Stock Libraries
//Student
//--Test
const TestQuery_cnxt = require("./contexts/Common/TestQuery")
const Student_cnxt = require("./contexts/Common/Students")
//--Auth
const Registration_cnxt = require('./contexts/Authentication/Registration')
const Login_cnxt = require("./contexts/Authentication/Login")
const Forgotten_cnxt = require("./contexts/Authentication/Forgotten")
//--Profile
const Profile_Update_cnxt = require("./contexts/Profile/Update")

//Blog
const Blog_cnxt = require('./contexts/Blog/blog')

//Admin
const RegistrationAdm_cnxt = require('./contexts/Authentication/Register_Adm')
const LoginAdm_cnxt = require("./contexts/Authentication/Login_Adm")
const LoginTrackAdm_cnxt = require('./contexts/Tracking/LoginsOverview')

// //common
//--Stats
const Stats_cnxt = require('./contexts/Statistics/Stats')
//--Track
const Track_Add_cnxt = require('./contexts/Tracking/TrackAdd')
const Track_Get_cnxt = require('./contexts/Tracking/TrackGet')
const Track_Prog_cnxt = require('./contexts/Tracking/Progress')
const Track_Survey_cnxt = require('./contexts/Tracking/Survey')
const Track_Orientation_cnxt = require('./contexts/Tracking/Orientation')
//Orientation
const AllCampus_cnxt = require("./contexts/Orientation/AllCampus")
const Faculty_cnxt = require("./contexts/Orientation/Faculty")
const Videos_cnxt = require("./contexts/Orientation/Video")
const SurvQuestion_cnxt = require("./contexts/Orientation/Questions")


//-----------------------------------------------------------------------------------Custome Libraries
//-----------------------------------------------------------------------------------Express Server Algorithms
app.use(bodyParser.json());
app.use(cors({origin: '*'}));


app.use(function(req, res, next) {
    //Header allowences of METHODS
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,Content-Type');
    res.setHeader('Access-Control-Allow-Credentials', true);
    next();
});

//context channelling Student
app.use('/Test/TestQuery', TestQuery_cnxt);
app.use('/Auth/Registration', Registration_cnxt);
app.use('/Stud/Student', Student_cnxt);
app.use('/Auth/Login', Login_cnxt);
app.use('/Auth/Forgotten',Forgotten_cnxt);
app.use('/Profile/Update',Profile_Update_cnxt);
app.use('/Orientation/Faculty',Faculty_cnxt)
app.use('/Orientation/Videos', Videos_cnxt)

//context channelling Admin
app.use('/Auth/Registration_Admin', RegistrationAdm_cnxt);
app.use('/Auth/Login_Admin', LoginAdm_cnxt);
app.use('/Track/LoginOverview',LoginTrackAdm_cnxt)

//context to common entities
app.use('/Stat/Stats', Stats_cnxt);
app.use('/Track/New', Track_Add_cnxt)
app.use('/Track/Query',Track_Get_cnxt)
app.use('/Track/Progress',Track_Prog_cnxt)
app.use('/Track/Survey',Track_Survey_cnxt)
app.use('/Track/Orientation',Track_Orientation_cnxt)
app.use('/Orientation/Campus', AllCampus_cnxt)
app.use('/Orientation/Question',SurvQuestion_cnxt)

//context to blog entities
app.use('/Blog/blog', Blog_cnxt);

//Publisize a folder
app.use(express.static('public')); 
app.use('/images', express.static('bin/images'));
app.use('/videos', express.static('bin/videos'));


const PORT = 6900
const server = app.listen(PORT, (e) => {
    console.log("********************************************************");
    console.log("* DB: localhost:3306 DBname:'orientation_db_schema'    *");
    console.log("*                PORT is running on " + PORT + "               *");
    console.log("*                 http://localhost:6900                *");
    console.log("********************************************************");

});

//------------------------------------------------------------------------------------------------------Socket IO Algorithms
//(Realtime) Socket For stats and more
//Backend Code
var socketIO = socket(server);
var studentSessions = 0;
//Connection of IOSocket
socketIO.on('connection', (socket) => {
    
   
    //------>Registered Users
    socket.on('RegisteredUsers_soc',(st_stream)=>{
        connection.query(`SELECT countUsers,survey FROM stats`,(err,rows,fields)=>{
            if(err)
            {
                console.log("Unknow err of sql execution "+ new Date()+" SQL-S_IO1 connection err")
                return
            }
            socketIO.emit('countStudents',rows[0].countUsers)
            socketIO.emit('countSurveys',rows[0].survey)
        })
    })
    
    //----->Visitors Users
    socket.on('Visitors_soc',(st_stream)=>{
        //Emttion of viewNumVisitors on connection of the client of IOSocket
        studentSessions++
        socketIO.emit('countVisitors',studentSessions)
        //Update the viewNumVisitors when client connection
        connection.query(`UPDATE stats SET viewNumVisitors = ${studentSessions}`,function(err, rows, fields){
            if(err)
            {
                console.log("Unknow err of sql execution "+ new Date()+" SQL-S_IO2 connection err")
                return
            }
        })

    })

    //Login Users Stats
    socket.on('LoggedInUsers_soc',(st_stream)=>{
        connection.query(`SELECT loggedin FROM stats`,(err,rows,field)=>{
            connection.query(`UPDATE stats SET loggedin = ${rows[0].loggedin + 1} `,(inerr,inrows,infields)=>{
                if(inerr || err)
                {
                    console.log("Unknow err of sql execution "+ new Date()+" SQL-S_IO1 connection err")
                    return
                }
                socketIO.emit('countLoggedIn',rows[0].loggedin+1)
            })
        })
    })

    //Logout Users Stats
    socket.on('LoggedOutUsers_soc',(st_stream)=>{
        connection.query(`SELECT loggedin FROM stats`,(err,rows,field)=>{
            connection.query(`UPDATE stats SET loggedin = ${rows[0].loggedin - 1} `,(inerr,inrows,infields)=>{
                if(inerr || err)
                {
                    console.log("Unknow err of sql execution "+ new Date()+" SQL-S_IO1 connection err")
                    return
                }
                socketIO.emit('countLoggedIn',rows[0].loggedin - 1)
            })
        })
    })

    //Survey Added Stats 
    socket.on("Add_Survey_soc",(st_stream)=>{
        connection.query(`SELECT student_id FROM survey GROUP BY student_id`,(err,rows,field)=>{
            connection.query(`UPDATE stats SET survey = ${rows.length} `,(inerr,inrows,infields)=>{
                if(inerr || err)
                {
                    console.log("Unknow err of sql execution "+ new Date()+" SQL-S_IO1 connection err")
                    return
                }
                socketIO.emit('countSurvey',rows.length)
            })
        })
    })

    //Survey Subtract Stats 
    socket.on("Sub_Survey_soc",(st_stream)=>{
        connection.query(`SELECT survey FROM stats`,(err,rows,field)=>{
            connection.query(`UPDATE stats SET survey = ${rows[0].survey - 1} `,(inerr,inrows,infields)=>{
                if(inerr || err)
                {
                    console.log("Unknow err of sql execution "+ new Date()+" SQL-S_IO1 connection err")
                    return
                }
                socketIO.emit('countSurvey',rows[0].survey - 1)
            })
        })
    })

    socket.on("LineGraph_update",(st_stream)=>{
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

        socketIO.emit('updateLine',datesRates)
        return
    
    })



    

    //Disconnection of IOSocket

    socket.on('disconnect', function(){
        //Emttion of viewNumVisitors for disconnection
        studentSessions--
        socketIO.emit('countVisitors',studentSessions)

        //Update the viewNumVisitors when client disconnect
        connection.query(`UPDATE stats SET viewNumVisitors = ${studentSessions}`,function(err, rows, fields){
            if(err)
            {
                console.log("Unknow err of sql execution "+ new Date()+" SQL-S_IO disconnect err")
            }
        })
    })
})


