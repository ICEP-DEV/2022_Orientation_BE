//PORT FOR THE API ENDPOINT________________________
const { SOCKETIO_PORT,DATABASE } = require('./globals')
//_________________________________________________
const express = require('express') 
const app = express() 
const connection = require("./connection")

const http = require('http').Server(app);

const socketIO = require('socket.io')(http,{
 cors: {
    origin: '*:*',
 }
})

//------------------------------------------------------------------------------------------------------Socket IO Algorithms


//Count of Students in a session
var studentSessions = 0;

//Connection of IOSocket
socketIO.on('connection', (socket) => {
    
   console.log("user_connct")
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
            console.log(rows)
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

    socket.on("LineGraph_update",async (st_stream)=>{
        let datesRates=[]

    for (let index = 0; index < 10; index++) {

       await connection.promise().query(`SELECT COUNT(activity) as rates FROM tracking WHERE DATE_FORMAT(datetime,"%M - %Y") = DATE_FORMAT(CURRENT_TIMESTAMP,"%M - %Y")  AND DATE_FORMAT(datetime,"%D") = (DATE_FORMAT(CURRENT_TIMESTAMP,"%D") - ${index}) AND activity = "Logged in";`)
            .then((data)=>{
                if(data[0])
                { 
                    if(data[0][0].rates || data[0][0].rates == 0)
                    {
                        if(index == 0) 
                        { 
                            data[0][0].rates++
                        }

                        datesRates[index] = data[0][0].rates
                    }
                }
            })
        }
        socketIO.emit('updateLine',JSON.stringify(datesRates))
        return
    
    })


    socket.on("VideoUploaded",async (st_stream)=>{
        connection.query("SELECT COUNT(id) as videos FROM videos",(err,rows,fields)=>{
            if(err) throw err
            socketIO.emit("VideosCount",rows[0].videos)
        })
        
    })

    socket.on("CampusSaved",(in_stream)=>{
        socketIO.emit("updatePie")
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

//Listening to the traffic
http.listen(SOCKETIO_PORT,(e)=>{
    console.log("********************************************************");
    console.log("* DB: "+DATABASE()+":3306 DBname:'orientation_db_schema'    *");
    console.log("*                Socket IO : by Shezi                  *");
    console.log("*                      PORT:   "+SOCKETIO_PORT+"                    *");
    console.log("********************************************************");
})
